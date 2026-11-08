import assert from 'node:assert/strict';
import { test } from 'node:test';
import { spawnSync } from 'node:child_process';
import { readFileSync, readdirSync, mkdirSync, writeFileSync } from 'node:fs';
import { homedir } from 'node:os';
import { join } from 'node:path';
import { createHash, X509Certificate } from 'node:crypto';

const binary = join(homedir(), '.azure/bin/bicep');
const files = ['infra/main.bicep', ...readdirSync('infra/modules').filter(f => f.endsWith('.bicep')).sort().map(f => `infra/modules/${f}`)];
assert.equal(files.length, 10);
const commands = [];
const evidenceDir = process.env.AMA_IAC_EVIDENCE_DIR;
if (evidenceDir) mkdirSync(evidenceDir, { recursive: true });
function run(args, env = {}) {
  const result = spawnSync(binary, args, { encoding: 'utf8', maxBuffer: 128 * 1024 * 1024, env: { ...process.env, ...env } });
  commands.push({ args, exit: result.status, diagnostics: result.stderr });
  if (evidenceDir) writeFileSync(join(evidenceDir, 'author-commands.json'), JSON.stringify({ node: process.version, commands }, null, 2));
  assert.equal(result.status, 0, `${args.join(' ')}\n${result.stderr}`);
  return result.stdout;
}
const version = run(['--version']).trim();
run(['restore', '--pattern', 'infra/**/*.bicep']);
const templates = Object.fromEntries(files.map(file => [file, JSON.parse(run(['build', '--no-restore', '--stdout', file]))]));
run(['lint', '--no-restore', '--pattern', 'infra/**/*.bicep']);
function parameters(result) {
  const parsed = JSON.parse(result);
  const document = typeof parsed.parametersJson === 'string' ? JSON.parse(parsed.parametersJson) : parsed.parametersJson ?? parsed;
  return Object.fromEntries(Object.entries(document.parameters).map(([key, value]) => [key, value.value]));
}
const fixture = parameters(run(['build-params', '--no-restore', '--stdout', 'infra/tests/fixtures/poc.contract.bicepparam']));
const bindings = {
  AMA_TENANT_ID: fixture.tenantId,
  AMA_OPERATOR_PRINCIPAL_ID: fixture.operatorPrincipalId,
  AMA_OBSERVER_PRINCIPAL_ID: fixture.observerPrincipalId,
  AMA_OPERATOR_PRINCIPAL_TYPE: fixture.operatorPrincipalType,
  AMA_OBSERVER_PRINCIPAL_TYPE: fixture.observerPrincipalType,
  AMA_SSH_PUBLIC_KEY: fixture.sshPublicKey,
  AMA_ALERT_EMAIL: fixture.alertEmail,
  AMA_VPN_ROOTS_JSON: JSON.stringify(fixture.vpnRoots),
  AMA_VPN_REVOKED_CLIENTS_JSON: JSON.stringify(fixture.vpnRevokedClients),
  AMA_USER_NODE_COUNT: String(fixture.userNodeCount),
};
const environmentFixture = parameters(run(['build-params', '--no-restore', '--stdout', 'infra/environments/poc.bicepparam'], bindings));
if (evidenceDir) writeFileSync(join(evidenceDir, 'compiled-synthetic.json'), JSON.stringify({ templates, fixture }, null, 2));

// This evaluator covers authored ARM expressions, not Azure runtime behaviour.
// Unsupported functions fail closed rather than becoming passing proxy checks.
function parse(expression) {
  const tokens = expression.match(/'(?:''|[^'])*'|-?\d+(?:\.\d+)?|[a-z_][a-z_0-9]*|[()[\].,]/gi) ?? [];
  let i = 0;
  function value() {
    const token = tokens[i++];
    let node;
    if (token?.startsWith("'")) node = { literal: token.slice(1, -1).replaceAll("''", "'") };
    else if (/^-?\d/.test(token)) node = { literal: Number(token) };
    else {
      assert.equal(tokens[i++], '(', `Unsupported ARM syntax: ${expression}`);
      const args = [];
      while (tokens[i] !== ')') {
        args.push(value());
        if (tokens[i] !== ',') break;
        i++;
      }
      assert.equal(tokens[i++], ')');
      node = { call: token.toLowerCase(), args };
    }
    while (tokens[i] === '.' || tokens[i] === '[') {
      if (tokens[i++] === '.') node = { base: node, key: { literal: tokens[i++] } };
      else {
        node = { base: node, key: value() };
        assert.equal(tokens[i++], ']');
      }
    }
    return node;
  }
  const result = value();
  assert.equal(i, tokens.length, `Incomplete ARM parse: ${expression}`);
  return result;
}
const syntax = new Map();
const subscription = { subscriptionId: 'aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa', tenantId: fixture.tenantId, id: '/subscriptions/aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa' };
function resourcePath(scope, type, names) {
  if (type.toLowerCase() === 'microsoft.resources/resourcegroups') return `${subscription.id}/resourceGroups/${names[0]}`;
  const [provider, ...types] = type.split('/');
  const pieces = names.flatMap(name => String(name).split('/'));
  return `${scope}/providers/${provider}/${types.map((type, index) => `${type}/${pieces[index]}`).join('/')}`;
}
function guid(...values) {
  const namespace = Buffer.from('11fb06fb712d4ddd98c7e71bbd588830', 'hex');
  const hash = createHash('sha1').update(namespace).update(values.join('-')).digest().subarray(0, 16);
  hash[6] = (hash[6] & 15) | 80;
  hash[8] = (hash[8] & 63) | 128;
  const hex = hash.toString('hex');
  return `${hex.slice(0, 8)}-${hex.slice(8, 12)}-${hex.slice(12, 16)}-${hex.slice(16, 20)}-${hex.slice(20)}`;
}
function evaluate(template, inputs = {}, rg = 'rg-ama-poc-sec-platform', all = []) {
  const scope = `${subscription.id}/resourceGroups/${rg}`;
  const params = { ...Object.fromEntries(Object.entries(template.parameters ?? {}).map(([k, p]) => [k, p.defaultValue ?? null])), ...inputs };
  const definitions = Object.entries(template.resources ?? {}).map(([symbol, body]) => ({ symbol, body }));
  const instances = new Map();
  const variableCache = new Map();
  const active = new Set();
  function ev(value, copies = {}, lambdas = {}) {
    if (Array.isArray(value)) return value.map(v => ev(v, copies, lambdas));
    if (value && typeof value === 'object') {
      const result = Object.fromEntries(Object.entries(value).filter(([k]) => k !== 'copy').map(([k, v]) => [k, ev(v, copies, lambdas)]));
      for (const copy of value.copy ?? []) result[copy.name] = Array.from({ length: ev(copy.count, copies, lambdas) }, (_, i) => ev(copy.input, { ...copies, [copy.name]: i }, lambdas));
      return result;
    }
    if (typeof value !== 'string' || !value.startsWith('[') || !value.endsWith(']')) return value;
    if (!syntax.has(value)) syntax.set(value, parse(value.slice(1, -1)));
    return ast(syntax.get(value), copies, lambdas);
  }
  function ast(node, copies, lambdas) {
    if ('literal' in node) return node.literal;
    if (node.base) return ast(node.base, copies, lambdas)?.[ast(node.key, copies, lambdas)];
    const get = n => ast(node.args[n], copies, lambdas);
    if (node.call === 'if') return get(0) ? get(1) : get(2);
    if (node.call === 'and') return node.args.every((_, i) => get(i));
    if (node.call === 'or') return node.args.some((_, i) => get(i));
    if (node.call === 'coalesce') {
      for (let i = 0; i < node.args.length; i++) { const v = get(i); if (v !== null && v !== undefined) return v; }
      return null;
    }
    if (node.call === 'lambda') {
      const names = node.args.slice(0, -1).map(n => ast(n, copies, lambdas));
      return (...values) => ast(node.args.at(-1), copies, { ...lambdas, ...Object.fromEntries(names.map((n, i) => [n, values[i]])) });
    }
    const args = node.args.map((_, i) => get(i));
    const [a, b, c] = args;
    switch (node.call) {
      case 'parameters': return ev(params[a], copies, lambdas);
      case 'variables': {
        const key = `${a}:${JSON.stringify(copies)}`;
        if (!variableCache.has(key)) variableCache.set(key, ev(template.variables[a], copies, lambdas));
        return variableCache.get(key);
      }
      case 'lambdavariables': return lambdas[a];
      case 'copyindex': return (copies[a ?? 'default'] ?? 0) + (typeof a === 'number' ? a : b ?? 0);
      case 'subscription': return subscription;
      case 'resourcegroup': return { id: scope, name: rg, location: 'swedencentral' };
      case 'deployment': return { name: 'synthetic-local', location: 'swedencentral', properties: { templateLink: { uri: 'https://synthetic.invalid/' } } };
      case 'environment': return { suffixes: { acrLoginServer: 'azurecr.io', keyvaultDns: '.vault.azure.net', azureDatalakeStoreFileSystem: 'azuredatalakestore.net', storage: 'core.windows.net' } };
      case 'resourceid': return resourcePath(scope, a, args.slice(1));
      case 'subscriptionresourceid': return resourcePath(subscription.id, a, args.slice(1));
      case 'extensionresourceid': return resourcePath(a, b, args.slice(2));
      case 'tenantresourceid': return resourcePath('', a, args.slice(1));
      case 'reference': return reference(a);
      case 'array': return Array.isArray(a) ? a : [a];
      case 'true': return true;
      case 'false': return false;
      case 'null': return null;
      case 'equals': return JSON.stringify(a) === JSON.stringify(b);
      case 'not': return !a;
      case 'empty': return a == null || (typeof a === 'object' ? Object.keys(a).length === 0 : a.length === 0);
      case 'contains': return Array.isArray(a) || typeof a === 'string' ? a.includes(b) : b in (a ?? {});
      case 'startswith': return a.startsWith(b);
      case 'tryget': return args.slice(1).reduce((v, key) => v?.[key], a) ?? null;
      case 'length': return a.length ?? Object.keys(a).length;
      case 'range': return Array.from({ length: b }, (_, i) => a + i);
      case 'map': return a.map(b);
      case 'filter': return a.filter(b);
      case 'flatten': return a.flat();
      case 'reduce': return a.reduce(c, b);
      case 'toobject': return Object.fromEntries(a.map(v => [b(v), c ? c(v) : v]));
      case 'items': return Object.entries(a).sort().map(([key, value]) => ({ key, value }));
      case 'objectkeys': return Object.keys(a);
      case 'createarray': return args;
      case 'createobject': return Object.fromEntries(args.filter((_, i) => i % 2 === 0).map((v, i) => [v, args[2 * i + 1]]));
      case 'union': return Array.isArray(a) ? [...new Set(args.flat())] : Object.assign({}, ...args);
      case 'shallowmerge': return Object.assign({}, ...a);
      case 'concat': return Array.isArray(a) ? args.flat() : args.join('');
      case 'format': return a.replace(/\{(\d+)(?::[^}]+)?\}/g, (_, n) => args[Number(n) + 1]);
      case 'split': return a.split(b);
      case 'join': return a.join(b);
      case 'last': return a.at(-1);
      case 'first': return a[0];
      case 'tolower': return a.toLowerCase();
      case 'toupper': return a.toUpperCase();
      case 'replace': return a.replaceAll(b, c);
      case 'trim': return a.trim();
      case 'take': return a.slice(0, b);
      case 'skip': return a.slice(b);
      case 'substring': return a.slice(b, c === undefined ? undefined : b + c);
      case 'string': return typeof a === 'string' ? a : JSON.stringify(a);
      case 'int': return Number(a);
      case 'bool': return typeof a === 'string' ? a.toLowerCase() === 'true' : Boolean(a);
      case 'json': return JSON.parse(a);
      case 'guid': return guid(...args);
      case 'uniquestring': return createHash('sha256').update(args.join('-')).digest('hex').slice(0, 13);
      case 'add': return a + b;
      case 'sub': return a - b;
      case 'mul': return a * b;
      case 'mod': return a % b;
      case 'greater': return a > b;
      case 'greaterorequals': return a >= b;
      case 'less': return a < b;
      case 'lessorequals': return a <= b;
      case 'fail': throw new Error(`ARM failure: ${a}`);
      default: throw new Error(`BLOCKED: unsupported ARM function ${node.call}`);
    }
  }
  function resolve(definition, index = 0) {
    const { symbol, body } = definition;
    const key = `${symbol}[${index}]`;
    if (instances.has(key)) return instances.get(key);
    assert(!active.has(key), `Resource cycle at ${key}`);
    active.add(key);
    const copies = { default: index, [body.copy?.name ?? symbol]: index };
    if (body.condition !== undefined && !ev(body.condition, copies)) {
      active.delete(key);
      instances.set(key, null);
      return null;
    }
    const name = ev(body.name, copies);
    const extensionScope = body.scope ? ev(body.scope, copies) : scope;
    if (body.type === 'Microsoft.Resources/deployments') {
      const childParams = Object.fromEntries(Object.entries(body.properties.parameters ?? {}).map(([k, p]) => [k, ev(p.value, copies)]));
      const childRg = body.resourceGroup ? ev(body.resourceGroup, copies) : rg;
      const child = evaluate(body.properties.template, childParams, childRg, all);
      const result = { name, outputs: Object.fromEntries(Object.entries(child.outputs).map(([k, value]) => [k, { value }])) };
      instances.set(key, result);
      active.delete(key);
      return result;
    }
    const id = resourcePath(extensionScope, body.type, [name]);
    const result = { ...ev(Object.fromEntries(Object.entries(body).filter(([k]) => !['copy', 'condition', 'properties'].includes(k))), copies), id, name, properties: ev(body.properties ?? {}, copies) };
    const attributes = {
      principalId: guid(id, 'principal'), clientId: guid(id, 'client'),
      tenantId: subscription.tenantId, loginServer: `${name}.azurecr.io`,
      customerId: guid(id, 'workspace'), vaultUri: `https://${name}.vault.azure.net/`,
      privateFQDN: `${name}.synthetic.invalid`, issuerURL: 'https://issuer.synthetic.invalid/',
      ipAddress: '192.0.2.1',
    };
    result.properties = { ...attributes, ...result.properties };
    if (body.type === 'Microsoft.Network/azureFirewalls') result.properties.ipConfigurations[0].properties.privateIPAddress = '10.83.4.4';
    if (body.type === 'Microsoft.ContainerService/managedClusters') result.properties.oidcIssuerProfile.issuerURL = attributes.issuerURL;
    if (body.type === 'Microsoft.KeyVault/vaults') result.properties.vaultUri = attributes.vaultUri;
    instances.set(key, result);
    active.delete(key);
    all.push(result);
    return result;
  }
  function reference(key) {
    const match = String(key).match(/^(.*)\[(\d+)\]$/);
    const definition = definitions.find(d => d.symbol === (match?.[1] ?? key));
    if (definition) {
      const value = resolve(definition, Number(match?.[2] ?? 0));
      return value?.outputs ? value : value?.properties;
    }
    for (const d of definitions) {
      const count = d.body.copy ? ev(d.body.copy.count) : 1;
      for (let i = 0; i < count; i++) {
        const copies = { default: i, [d.body.copy?.name ?? d.symbol]: i };
        if (ev(d.body.name, copies) === key) {
          const value = resolve(d, i);
          return value?.outputs ? value : value?.properties;
        }
      }
    }
    const found = all.find(r => r.id.toLowerCase() === String(key).toLowerCase());
    assert(found, `BLOCKED: unresolved reference ${key}`);
    return found.properties;
  }
  for (const definition of definitions) {
    const count = definition.body.copy ? ev(definition.body.copy.count) : 1;
    for (let i = 0; i < count; i++) resolve(definition, i);
  }
  const outputs = Object.fromEntries(Object.entries(template.outputs ?? {}).filter(([, o]) => {
    const type = o.type ?? template.definitions?.[o.$ref?.split('/').at(-1)]?.type;
    assert(type, 'BLOCKED: unresolved output schema');
    return !['securestring', 'secureobject'].includes(type.toLowerCase());
  }).map(([k, o]) => [k, ev(o.value)]));
  return { resources: all, outputs };
}

function validateInputs(p) {
  const guidPattern = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  for (const key of ['tenantId', 'operatorPrincipalId', 'observerPrincipalId']) assert.match(p[key], guidPattern);
  for (const key of ['operatorPrincipalType', 'observerPrincipalType']) assert(['User', 'Group'].includes(p[key]));
  if (p.operatorPrincipalId.toLowerCase() === p.observerPrincipalId.toLowerCase()) assert.equal(p.operatorPrincipalType, p.observerPrincipalType);
  assert.equal(p.systemNodeCount, 2);
  assert([1, 2].includes(p.userNodeCount));
  assert(p.vpnRoots.length > 0);
  const names = new Set();
  const thumbprints = new Set();
  for (const root of p.vpnRoots) {
    assert.match(root.publicCertData, /^[A-Za-z0-9+/]+={0,2}$/);
    assert.equal(new X509Certificate(Buffer.from(root.publicCertData, 'base64')).subject, 'CN=synthetic.invalid');
    assert(!names.has(root.name.toLowerCase()));
    names.add(root.name.toLowerCase());
  }
  for (const client of p.vpnRevokedClients) {
    assert.match(client.thumbprint, /^[0-9a-f]{40}$/i);
    assert(!names.has(client.name.toLowerCase()));
    assert(!thumbprints.has(client.thumbprint.toLowerCase()));
    names.add(client.name.toLowerCase());
    thumbprints.add(client.thumbprint.toLowerCase());
  }
  const [kind, encoded] = p.sshPublicKey.split(' ');
  assert.equal(kind, 'ssh-ed25519');
  const publicKey = Buffer.from(encoded, 'base64');
  assert.equal(publicKey.readUInt32BE(0), 11);
  assert.equal(publicKey.subarray(4, 15).toString(), kind);
  assert.equal(publicKey.readUInt32BE(15), 32);
  assert.equal(publicKey.length, 51);
}

const effective = evaluate(templates['infra/main.bicep'], fixture);
const byType = type => effective.resources.filter(r => r.type === type);
test('compiled private foundation has single owners, exact private exposure and no application resources', () => {
  assert.equal(byType('Microsoft.Resources/resourceGroups').length, 2);
  assert.equal(byType('Microsoft.Network/virtualNetworks').length, 1);
  assert.equal(byType('Microsoft.Network/virtualNetworks/subnets').length, 7);
  assert.equal(byType('Microsoft.Network/publicIPAddresses').length, 3);
  assert.equal(byType('Microsoft.Network/privateDnsZones').length, 3);
  assert.equal(byType('Microsoft.Network/privateEndpoints').length, 2);
  const cluster = byType('Microsoft.ContainerService/managedClusters')[0];
  assert.equal(byType(cluster.type).length, 1);
  assert.equal(cluster.properties.publicNetworkAccess, 'Disabled');
  assert.equal(cluster.properties.disableLocalAccounts, true);
  assert.equal(cluster.properties.apiServerAccessProfile.enablePrivateCluster, true);
  assert.equal(cluster.properties.nodeProvisioningProfile.mode, 'Manual');
  assert.equal(cluster.properties.agentPoolProfiles.length, 2);
  assert.deepEqual(cluster.properties.agentPoolProfiles.map(p => [p.name, p.count, p.minCount, p.maxCount, p.upgradeSettings.maxSurge]), [['sys', 2, 2, 2, '1'], ['usr', 1, 1, 2, '1']]);
  for (const type of ['Microsoft.ContainerRegistry/registries', 'Microsoft.KeyVault/vaults']) {
    const r = byType(type)[0];
    assert.equal(r.properties.publicNetworkAccess, 'Disabled');
    assert.equal(type.includes('registries') ? r.properties.networkRuleSet.defaultAction : r.properties.networkAcls.defaultAction, 'Deny');
  }
  assert(!effective.resources.some(r => /deploymentScripts|federatedIdentityCredentials|MachineLearningServices|CognitiveServices|loadBalancers|connections$/.test(r.type)));
});
test('effective DNS, firewall, diagnostics, DCR and native alert mappings preserve the released contracts', () => {
  const subnets = byType('Microsoft.Network/virtualNetworks/subnets');
  assert.equal(subnets.filter(s => s.properties.natGateway?.id).length, 1);
  assert(subnets.find(s => s.properties.natGateway?.id).name.endsWith('/AzureFirewallSubnet'));
  assert(!byType('Microsoft.Network/virtualNetworks')[0].properties.subnets);
  assert(!byType('Microsoft.Network/virtualNetworks')[0].properties.dhcpOptions?.dnsServers?.length);
  const route = byType('Microsoft.Network/routeTables')[0].properties.routes[0].properties;
  assert.equal(route.nextHopType, 'VirtualAppliance');
  assert.equal(route.nextHopIpAddress, '10.83.4.4');
  assert.equal(byType('Microsoft.Network/privateDnsZones/virtualNetworkLinks').length, 3);
  for (const link of byType('Microsoft.Network/privateDnsZones/virtualNetworkLinks')) assert.equal(link.properties.registrationEnabled, false);
  for (const diag of byType('Microsoft.Insights/diagnosticSettings')) {
    assert.equal(diag.properties.workspaceId, effective.outputs.foundation.workspaceResourceId);
    assert.deepEqual(diag.properties.metrics, []);
    assert(!diag.properties.logs.some(log => log.categoryGroup));
  }
  const dcr = byType('Microsoft.Insights/dataCollectionRules')[0].properties;
  assert.equal(dcr.dataFlows[0].streams.length, 5);
  assert.deepEqual(dcr.dataFlows[0].streams, dcr.dataSources.extensions[0].streams);
  assert(!dcr.dataFlows[0].streams.some(s => s.includes('ContainerLog')));
  const alerts = byType('Microsoft.Insights/scheduledQueryRules');
  assert.equal(alerts.length, 2);
  for (const alert of alerts) {
    assert.deepEqual(alert.properties.actions.actionGroups, [effective.outputs.foundation.actionGroupId]);
    assert.equal(alert.properties.skipQueryValidation, false);
    assert(alert.properties.criteria.allOf[0].query.includes(effective.outputs.foundation.clusterId));
  }
  assert.deepEqual(byType('Microsoft.Insights/activityLogAlerts')[0].properties.scopes, [effective.outputs.foundation.platformRgId, effective.outputs.foundation.aksRgId]);
});
test('synthetic bindings parse public-only material; invalid identity/count/revocation inputs fail', () => {
  validateInputs(fixture);
  for (const key of Object.keys(environmentFixture)) assert.deepEqual(environmentFixture[key], fixture[key]);
  for (const change of [
    { operatorPrincipalType: 'ServicePrincipal' }, { userNodeCount: 3 }, { systemNodeCount: 1 },
    { observerPrincipalId: fixture.operatorPrincipalId }, { vpnRoots: [] },
    { vpnRoots: [{ ...fixture.vpnRoots[0], publicCertData: 'MIIAAAAA' }] },
    { vpnRoots: [...fixture.vpnRoots, fixture.vpnRoots[0]] },
    { vpnRevokedClients: [{ name: 'revoked', thumbprint: 'not-a-thumbprint' }] },
  ]) assert.throws(() => validateInputs({ ...fixture, ...change }));
});
test('same-principal/reordered grant tuples and pool replay are stable in effective compiled resources', () => {
  const module = templates['infra/modules/cluster-access.bicep'];
  const common = { ...fixture, clusterId: effective.outputs.foundation.clusterId };
  const distinct = evaluate(module, common).resources;
  const reversed = evaluate(module, { ...common, operatorPrincipalId: fixture.observerPrincipalId, observerPrincipalId: fixture.operatorPrincipalId, operatorPrincipalType: fixture.observerPrincipalType, observerPrincipalType: fixture.operatorPrincipalType }).resources;
  assert.equal(distinct.length, 4);
  assert.deepEqual(distinct.map(r => r.name).sort(), reversed.map(r => r.name).sort());
  const same = evaluate(module, { ...common, observerPrincipalId: fixture.operatorPrincipalId, observerPrincipalType: fixture.operatorPrincipalType }).resources;
  assert.equal(same.length, 2);
  const replay = evaluate(templates['infra/main.bicep'], { ...fixture, userNodeCount: 2 });
  assert.equal(replay.resources.find(r => r.type === 'Microsoft.ContainerService/managedClusters').properties.agentPoolProfiles[1].count, 2);
  const revocations = [{ name: 'old-device', thumbprint: 'A'.repeat(40) }, { name: 'older-device', thumbprint: 'B'.repeat(40) }];
  const revoked = evaluate(templates['infra/main.bicep'], { ...fixture, vpnRevokedClients: revocations }).resources.find(r => r.type === 'Microsoft.Network/virtualNetworkGateways');
  assert.deepEqual(revoked.properties.vpnClientConfiguration.vpnClientRevokedCertificates.map(r => r.properties.thumbprint), revocations.map(r => r.thumbprint));
});
test('root output whitelist excludes secrets and effective grants retain only the seven fixed roles', () => {
  assert.deepEqual(Object.keys(templates['infra/main.bicep'].outputs), ['foundation']);
  assert.deepEqual(Object.keys(effective.outputs.foundation).sort(), [
    'platformRgId', 'aksRgId', 'clusterId', 'poolIds', 'nodeResourceGroupId', 'vnetId', 'subnetIds', 'zoneIds', 'privateEndpointIds',
    'registryId', 'loginServer', 'vaultId', 'vaultUri', 'privateFqdn', 'oidcIssuerUrl', 'controlPlane', 'kubelet',
    'workspaceResourceId', 'workspaceGuid', 'dcrId', 'actionGroupId', 'dnsInboundConfiguredIp',
  ].sort());
  assert(!/listKeys|listCredentials|SharedKey|password|kubeconfig/.test(JSON.stringify(effective.outputs)));
  const roles = new Set(effective.resources.filter(r => r.type === 'Microsoft.Authorization/roleAssignments').map(r => r.properties.roleDefinitionId.split('/').at(-1)));
  assert.deepEqual([...roles].sort(), ['4d97b98b-1d4f-4787-a291-c67834d212e7', 'b12aa53e-6015-4669-85d0-8515ebb3ae7f', 'f1a07417-d97a-45cb-824c-7a7467783830', '7f951dda-4ed3-4680-a7ca-43fe172d538d', '4abbcc35-e782-43d8-92c5-2d3f1bd2253f', '7f6c6a51-bcf8-42ba-9220-52d62157d7db', '73c42c96-874c-492b-b04d-ab87d138a893'].sort());
  for (const grant of effective.resources.filter(r => r.type === 'Microsoft.Authorization/roleAssignments')) assert(!grant.scope?.endsWith('rg-ama-poc-sec-platform'));
  for (const file of [...files, 'infra/environments/poc.bicepparam', 'infra/tests/fixtures/poc.contract.bicepparam']) assert(!/-----BEGIN|PRIVATE KEY/.test(readFileSync(file, 'utf8')));
});

if (process.env.AMA_IAC_EVIDENCE_DIR) {
  const dir = process.env.AMA_IAC_EVIDENCE_DIR;
  mkdirSync(dir, { recursive: true });
  writeFileSync(join(dir, 'author-commands.json'), JSON.stringify({ version, node: process.version, commands, environmentBinding: 'synthetic only; actual protected variant NOT RUN' }, null, 2));
  writeFileSync(join(dir, 'compiled-synthetic.json'), JSON.stringify({ templates, fixture, effective }, null, 2));
}
