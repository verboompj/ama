# WP-001 / F04 — published AVM feasibility, attempt 2

**Revision F04-r1; 21 October 2026. Overall: BLOCKED. Design feasibility only;
NOT implementation authority, design approval, or an independent review.**

## 1. Acceptance, inputs and execution boundary

- **ACCEPTED** the assignment `assignments/F04-feasibility.md`, including
  **Resumed Invocation**, before technical execution. Accepted fixed input:
  [S001 manifest](snapshots/S001/manifest.md), its five preserved files, and its
  sixteen Git-object dependencies at
  `01002b21e5c6cb57d391c685adcbc05f03885b38`. Independent SHA-256 verification:
  **21/21 PASS**. The parent's reported working-source equality is not substituted
  for those Git-object reads. No frozen file was edited.
- Current operational routing policy was read from `AGENTS.md` and
  `docs/delivery/agents-and-skills.md`; current HEAD:
  `5ecf21c2e8333b83c176073b02fece55c9a16f62`. This changes routing, not S001's
  workload inputs. Loaded `ama-context`, `ama-avm-bicep`, `ama-handoff`, the team
  guide, and relevant fixed workload/handoff/coordination contracts.
- Classification **HIGH**; chosen model **`gpt-6.1-sol`**; actual runtime model
  **NOT VERIFIED**: no authoritative runtime-model field is exposed. No fallback,
  model switching, onward delegation or independent reviewer invocation occurred.
  Provider/account enablement, credits and actual inference charge are unknown.
- Loop **`WP001-F04-AVM`**, **attempt 2 consumed; 2 used / 3 remaining of 5**,
  including the prior runtime failure. This is one bounded execution, not a reset
  or a sequence of review retries. Publication/source research subrequests and
  their failures below are part of this execution.
- Sole authored path: **`delivery/releases/WP-001/feasibility.md`**. Other dirty and
  untracked files were already present and left alone. No Bicep, parameter files,
  Kubernetes manifests, pipelines, Azure commands, authenticated queries,
  validation/what-if, browser, deployment, commit or push was performed.
- Public requests contained only generic service/module names, public versions
  and official URLs. No repository text, private identifiers, certificates,
  credentials or account information was uploaded.

## 2. Executive disposition and architect correction queue

Published modules cover much of the foundation, but **S001 cannot be accepted as
an implementable, completely specified AVM composition yet**. A published pin is
not a finding that all the design's requirements work with that pin.

| Finding | Disposition / earliest gate | Exact correction for architect, through coordinator |
| --- | --- | --- |
| F04-01: managed Gateway API enablement missing from AKS AVM | **FAIL**, AC02/WV03, design release | Published managed-cluster `0.14.0` uses cluster API `2025-10-01`; no general `ingressProfile` input and no `gatewayAPI` / `gatewayAPIImplementations.appRoutingIstio` contract. `serviceMeshProfile` is a different add-on. Select a verified future published AVM exposing the required fields, or explicitly approve a material native AKS ownership exception. Do not silently turn on NGINX, the mesh add-on, or Automatic. Do not declare the same cluster twice or treat a partial ARM PUT as a safe patch. |
| F04-02: certificate-only OpenVPN and revocation inventory | **FAIL**, AC02/04 | VPN AVM `0.12.0` emits `vpnClientProtocols` only when `vpnClientAadConfiguration` is supplied; that object requires AAD tenant/audience/issuer. With only `clientRootCertData`, protocols/authentication types are null, not explicit OpenVPN/Certificate. It exposes only **one** revoked thumbprint, insufficient to retain multiple revoked clients. Request an approved native gateway resource exception or a verified corrected published module. Do not populate fake AAD fields or widen authentication merely to satisfy its type. |
| F04-03: platform request inventory and scheduling | **BLOCKED**, AC03 | The exact managed add-on pod CPU/memory requests, counts, per-node DaemonSets and placement for the selected AKS patch are not published by the inspected AVM contracts or established by the guides. The assumed system reserve and 4 CPU/10 GiB cap are not verified. Obtain a version-bound authoritative manifest/default inventory and placement evidence; otherwise revise the release prerequisite/design with genuine owner/reviewer agreement. Do not label an unmeasured envelope as supported capacity. |
| F04-04: egress rules and DNS enforcement | **BLOCKED**, AC04 | Replace references to “current dependencies” with a reviewed destination/protocol/source inventory for the selected OS, monitoring, Policy, KEDA, CSI, WI and ingress. Resolve the node Azure-provided DNS versus Firewall DNS proxy discrepancy (§5). No firewall rule set was invented here. |
| F04-05: monitoring ownership, collection and export | **BLOCKED**, AC02/04/06 | Specify AAD-authenticated monitoring, one authoritative DCR/DCRA owner, actual table destinations, collection intervals, redaction and alert queries. A single Container Insights collection frequency does not establish separate inventory 5m/performance 1m collection. Subscription Activity Log export is not a resource-group-filtered diagnostic setting (§7). |
| F04-06: signature/admission and TLS enforcement | **BLOCKED**, AC02/06 | No exact signing/verifier/admission tool, version, trust policy, exception inventory or request footprint is fixed. Gatekeeper enablement alone does not implement signature verification. The supported method/version guaranteeing the Gateway TLS minimum must be evidenced; arbitrary Istio CRDs/EnvoyFilter are not supported by the chosen app-routing controller. |
| F04-07: dependency/output contracts | **FAIL for literal proposed contracts**, AC02/06 | Correct `vaultUri` to consume AVM `uri`, firewall private IP to consume `privateIp`, AKS issuer to consume `oidcIssuerUrl`; do not invent node-RG/pool-ID or resolver-IP AVM outputs. Split subnet and federation ownership to avoid cycles (§4). |
| F04-08: defaults and preview APIs | **BLOCKED pending explicit design disposition**, AC02/07 | Record ACR preview API and retention/zone defaults; override Key Vault premium/90-day/deployment-enabled defaults, workspace 365-day/unlimited-cap defaults, and AKS stable-upgrade/legacy-monitoring defaults. Secure workspace key outputs exist in the dependency; resolve compatibility with the strict no-credential-output contract (§7), without misreporting them as plaintext leaks. |
| F04-09: exact regional patch/SKU/zone allocation | **NOT RUN**, AC13/WV15 later; exact patch evidence **not established** now | Public OS support includes AzureLinux3 with Kubernetes 1.36. This does not establish `1.36.4`, D2as/D4as, or zone/offer availability in the target context. Obtain approved fresh availability evidence at the appropriate later gate; do not assert that public schema acceptance proves deployability. |

These are findings for the architect, not unilateral design changes. D-HA, D-MON,
D-SEC, private-only access, explicit pools, Cilium, WI, NAP disabled, no estate
reuse, EU processing interfaces and the existing cost/approval boundaries remain
unchanged. More nodes, services or changed SKUs require design/cost reconciliation.

## 3. Publication evidence and proposed pin/contract inventory

### Evidence method and how to replay it

All public source access in this report: **2026-10-21**. Discovery used the
[official Bicep resource index](https://azure.github.io/Azure-Verified-Modules/indexes/bicep/bicep-resource-modules/).
For module path `P` and version `V` in the table:

- Exact proposed reference is **`br/public:avm/res/P:V`**, not `latest`.
- Registry tag list: `https://mcr.microsoft.com/v2/bicep/avm/res/P/tags/list`.
- Published OCI manifest: `https://mcr.microsoft.com/v2/bicep/avm/res/P/manifests/V`,
  requested with `Accept: application/vnd.oci.image.manifest.v1+json`.
- Published layers: `https://mcr.microsoft.com/v2/bicep/avm/res/P/blobs/<digest>`.
  Inspected compiled parameters, outputs, nested resource API versions and source
  archive. No artifact was deployed or restored into the repository.
- Each row links the exact version-tagged source directory; `main.bicep` and
  `README.md` are the source and parameter/output/example documentation there.
  READMEs/examples were retrieved; relevant contracts were inspected, not every
  example claimed reviewed. The compiled artifact is authoritative where a
  service/default capability claim matters.
- For the 23 top-level modules below, source-archive SHA-256 verification passed,
  and the published main source equals its version-tagged source after replacing
  only the publisher's telemetry-version placeholder with `V`. Initial raw
  byte comparisons were false because of that substitution; they were **not**
  reported as equality. No other normalization was needed for these 23.
- Optional nullable compiled parameters have no `defaultValue`; that does **not**
  make them required. Contracts below distinguish required inputs from selected
  explicit overrides. All types/settings are feasibility descriptions, not
  generated infrastructure.

**PASS in this table means published-contract coverage of that row's stated
subset only. It does not waive the cross-resource blockers above.**

| P : V — exact published source | Needed inputs/properties and non-secret outputs | Subset disposition / API and default caveats |
| --- | --- | --- |
| [resources/resource-group : 0.4.4](https://github.com/Azure/bicep-registry-modules/tree/avm/res/resources/resource-group/0.4.4/avm/res/resources/resource-group) | `name:string`, `location:string`, `tags:object`; outputs `resourceId`, `name`, `location` | **PASS** for two project RGs at subscription scope. API `2025-04-01`. Do not instantiate the AKS node RG. |
| [network/virtual-network : 0.10.2](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/virtual-network/0.10.2/avm/res/network/virtual-network) | `addressPrefixes:string[]`, `subnets[]`, `dnsServers:string[]`, tags; outputs `resourceId`, `subnetNames`, `subnetResourceIds` | **PASS**, API `2025-05-01`. Use standalone late node subnets to avoid FW/UDR cycle. No peering, encryption product or DDoS plan silently added. |
| [network/network-security-group : 0.5.4](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/network-security-group/0.5.4/avm/res/network/network-security-group) | `securityRules[]` with name and rule properties: priority, direction, access, protocol, ports and source/destination prefixes; output `resourceId` | **PASS**, API `2025-09-01`. Three NSGs supported. `flushConnection=false` by default. Preserve required node/LB health traffic; NSG creation does not establish the missing approved rule inventory. |
| [network/route-table : 0.5.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/route-table/0.5.0/avm/res/network/route-table) | `routes[]`: name, `addressPrefix`, `nextHopType`, `nextHopIpAddress`; `disableBgpRoutePropagation`; output `resourceId` | **PASS**, API `2024-07-01`; route `0.0.0.0/0`, `VirtualAppliance`, firewall `privateIp`. Associate only with node subnets. |
| [network/public-ip-address : 0.13.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/public-ip-address/0.13.0/avm/res/network/public-ip-address) | `skuName='Standard'`, `skuTier='Regional'`, `publicIPAllocationMethod='Static'`, `publicIPAddressVersion='IPv4'`, `availabilityZones:string[]`; outputs `resourceId`, `ipAddress` | **PASS**, API `2025-01-01`. Default zones are `['1','2','3']`: explicitly use zone 1 for NAT/FW and approved zone-redundant VPN PIP settings. Exactly three PIPs; reuse their IDs below. |
| [network/nat-gateway : 2.1.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/nat-gateway/2.1.1/avm/res/network/nat-gateway) | `natGatewaySku='Standard'`, `availabilityZone:int=1`, `publicIpResourceIds:string[]`; output `resourceId` | **PASS**, API `2025-05-01`. Avoid optional `publicIPAddresses` / prefixes that create additional resources. Default idle timeout 5m must be recorded. Only FirewallSubnet attachment. |
| [network/azure-firewall : 0.11.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/azure-firewall/0.11.1/avm/res/network/azure-firewall) | `azureSkuTier='Standard'`, `virtualNetworkResourceId`, `publicIPResourceID`, `availabilityZones=['1']`, `firewallPolicyId`, diagnostics; outputs `resourceId`, **`privateIp`** | **PASS for resource**, API `2025-05-01`; **BLOCKED for effective rule inventory**. Supply existing PIP ID or module may create its own. No extra management NIC, hub, prescaling or DNAT. |
| [network/firewall-policy : 0.3.6](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/firewall-policy/0.3.6/avm/res/network/firewall-policy) | `tier='Standard'`, `enableProxy=true`, `servers[]`, `threatIntelMode='Deny'`, `ruleCollectionGroups[]` (priority and Filter collections/application or network rules); output `resourceId` | **PASS for schema**, policy/rule-group API `2024-10-01`. `insightsIsEnabled=false`, proxy default false. No IDPS/TLS decryption or Policy Analytics assumed. DNS consumer contract still unresolved. |
| [network/virtual-network-gateway : 0.12.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/virtual-network-gateway/0.12.0/avm/res/network/virtual-network-gateway) | `gatewayType='Vpn'`, `skuName='VpnGw1AZ'`, `vpnType='RouteBased'`, `clusterSettings.clusterMode='activePassiveNoBgp'`, VNet ID, `existingPrimaryPublicIPResourceId`, client pool/root public cert; outputs `resourceId`, `activeActive`, `primaryPublicIpAddress` | **FAIL for exact P2S contract**, F04-02. API `2025-01-01`. Explicit supported generation still needs the chosen SKU pairing in the approved plan; no extra S2S connection. |
| [network/dns-resolver : 0.5.8](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/dns-resolver/0.5.8/avm/res/network/dns-resolver) | VNet ID; `inboundEndpoints[]`: name, subnet ID, `privateIpAllocationMethod='Static'`, `privateIpAddress`; `outboundEndpoints=[]`; outputs `resourceId`, `inboundEndpointsObject[]` containing name/ID only | **PASS**, resolver/endpoint API `2025-05-01`. No output exposing inbound IP: composition must return the approved static parameter, then verify observed IP later. Do not add outbound endpoint/ruleset. |
| [network/private-dns-zone : 0.8.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/private-dns-zone/0.8.1/avm/res/network/private-dns-zone) | `name`, `location='global'`, `virtualNetworkLinks[]` with VNet ID and `registrationEnabled=false`; `a[]` for app static-IP record; output `resourceId` | **PASS**, zones/records `2020-06-01`, VNet links `2024-06-01`. Four zones. AKS owns API records; PE zone groups own ACR/KV records. |
| [network/private-endpoint : 0.12.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/private-endpoint/0.12.1/avm/res/network/private-endpoint) | `subnetResourceId`, `privateLinkServiceConnections[]` with target ID/group IDs; `privateDnsZoneGroup.privateDnsZoneGroupConfigs[]` with zone ID; output `resourceId`, `networkInterfaceResourceIds`, `customDnsConfigs`, `groupId` | **PASS**, endpoint/zone-group API `2025-05-01`. Groups `registry` and `vault`; one ACR endpoint can contain multiple IPs. Do not also create the same PEs through service modules. No AKS API PE created by this module. |
| [container-registry/registry : 0.13.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/container-registry/registry/0.13.1/avm/res/container-registry/registry) | `acrSku='Premium'`, `roleAssignmentMode='LegacyRegistryPermissions'`, `acrAdminUserEnabled=false`, `anonymousPullEnabled=false`, `publicNetworkAccess='Disabled'`, `networkRuleBypassOptions='None'`, default deny, explicit data endpoint/retention/zone settings; outputs `resourceId`, `loginServer`, `privateEndpoints[]` | **PASS for private/classic RBAC schema; BLOCKED for defaults/preview disposition**. Main registry is **`2025-06-01-preview`**, despite some children using `2025-11-01`. Defaults: trusted AzureServices bypass, retention enabled/15 days, zone redundancy Enabled, dataEndpointEnabled false. No implicit cache/tasks/replica/CMK. Review purge of untagged digest artifacts against provenance/retention before adopting defaults. |
| [key-vault/vault : 0.14.2](https://github.com/Azure/bicep-registry-modules/tree/avm/res/key-vault/vault/0.14.2/avm/res/key-vault/vault) | `sku='standard'`, RBAC true, public disabled, `networkAcls` bypass None/default Deny, soft-delete 7d/purge protection true; three `enableVaultFor...` deployment/template/disk-encryption switches false; outputs `resourceId`, **`uri`** | **PASS for vault**, API `2026-02-01`. Defaults are premium, 90d and all three deployment switches true: not the proposal. No ARM secret values; offline CA/import remains human data-plane work. Secret-scope RBAC/certificate encoding needs §6 correction. |
| [managed-identity/user-assigned-identity : 0.6.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/managed-identity/user-assigned-identity/0.6.0/avm/res/managed-identity/user-assigned-identity) | Three identities: name/location/tags; outputs `resourceId`, `principalId`, `clientId`; optional `federatedIdentityCredentials[]` | **PASS**, identity/FIC API `2024-11-30`. Do not embed a cluster-issuer-dependent FIC in a module the cluster itself depends on; use standalone child below. |
| [operational-insights/workspace : 0.16.1](https://github.com/Azure/bicep-registry-modules/tree/avm/res/operational-insights/workspace/0.16.1/avm/res/operational-insights/workspace) | `skuName='PerGB2018'`, **`dataRetention=31`**, **`dailyQuotaGb='1'` (string)**, public ingestion/query explicitly Enabled, `features.disableLocalAuth=true`, no Sentinel/export/replication; use only `resourceId`, `logAnalyticsWorkspaceId` | **PASS for workspace settings; BLOCKED for strict output policy disposition**. Main API `2025-07-01`. Defaults retention365/cap'-1'. Two built-in `@secure()` outputs call listKeys; see §7. `forceCmkForQuery` default true must be reviewed explicitly, not treated as proof of a provisioned CMK. |
| [insights/data-collection-rule : 0.11.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/insights/data-collection-rule/0.11.0/avm/res/insights/data-collection-rule) | Required **`dataCollectionRuleProperties`** discriminated object: kind, extension data source, ContainerInsights extension settings, selected streams, LAW destination and dataFlows; outputs `resourceId`, `immutableId`, `endpoints` | **PASS for DCR schema; BLOCKED for exact collection/ownership**, API `2024-03-11`. It does **not** create the cluster DCRA. Do not assume `kind='All'` is a literal resource kind; module omits kind for that branch. |
| [insights/action-group : 0.8.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/insights/action-group/0.8.0/avm/res/insights/action-group) | `name`, `groupShortName`, protected `emailReceivers[]` with common alert schema; output `resourceId` | **PASS**, API **`2024-10-01-preview`**, default location global. No SMS/voice/webhook extras; record global metadata/notification boundary rather than claim all resources Sweden Central. |
| [insights/scheduled-query-rule : 0.6.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/insights/scheduled-query-rule/0.6.0/avm/res/insights/scheduled-query-rule) | `scopes[]`, `evaluationFrequency='PT5M'`, `windowSize`, **`criterias`** object (`allOf` query/operator/aggregation/threshold/failing periods), `actions.actionGroups[]`, severity, enabled; output `resourceId` | **PASS for schema; BLOCKED for four exact queries**, API **`2025-01-01-preview`**. Keep `skipQueryValidation=false`; no dimensions/fanout assumed. Future query validation is not performed now. |
| [insights/activity-log-alert : 0.4.2](https://github.com/Azure/bicep-registry-modules/tree/avm/res/insights/activity-log-alert/0.4.2/avm/res/insights/activity-log-alert) | `scopes[]`, `conditions[]`, `actions[]`, enabled; output `resourceId` | **PASS**, API `2020-10-01`, default global. Default scope is subscription: replace with reviewed project scoping where supported; ServiceHealth scoping is a separate decision, not an assumed RG-only event stream. |
| [insights/diagnostic-setting : 0.1.4](https://github.com/Azure/bicep-registry-modules/tree/avm/res/insights/diagnostic-setting/0.1.4/avm/res/insights/diagnostic-setting) | `workspaceResourceId`, `logCategoriesAndGroups[]`, optional metrics and destination type; output `resourceId` | **PASS for subscription Activity Log export schema; FAIL for assumed RG source filter**. Subscription-scoped `2021-05-01-preview`; resource diagnostics use each owning AVM's `diagnosticSettings`, not this module for arbitrary scope. |
| [consumption/budget : 0.3.8](https://github.com/Azure/bicep-registry-modules/tree/avm/res/consumption/budget/0.3.8/avm/res/consumption/budget) | `amount:int`, category/reset period/start/end, `thresholds[]`, protected contacts/action groups, `resourceGroupFilter[]` or explicit filter; output `resourceId` | **PASS for proposed budget notification**, subscription API `2023-11-01`. Numeric amount/period/eligibility not approved; no default threshold set is approval and no hard spending cap. |
| [container-service/managed-cluster : 0.14.0](https://github.com/Azure/bicep-registry-modules/tree/avm/res/container-service/managed-cluster/0.14.0/avm/res/container-service/managed-cluster) | See §4 for exact pools/network/identity/add-on inputs; outputs `resourceId`, `controlPlaneFQDN`, `oidcIssuerUrl`, kubelet identity IDs, OMS/CSI add-on identity IDs, `addonProfiles` | **FAIL for full selected design**, F04-01/03/05. Cluster/pools/maintenance API `2025-10-01`. No node RG ID or pool ID outputs. No credentials outputs. Default stable Kubernetes upgrade channel is not the proposed patch channel. |

### Published child modules and standalone RBAC restrictions

The following additional tags and compiled contracts were retrieved successfully.
These are separate publications, **not the parent's version reused as a child pin**.

| Exact reference / source | Contract and ownership |
| --- | --- |
| [`br/public:avm/res/network/virtual-network/subnet:0.2.0`](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/virtual-network/subnet/0.2.0/avm/res/network/virtual-network/subnet) | `virtualNetworkName`, name, addressPrefix(es), NSG/route/NAT resource IDs, delegation, `defaultOutboundAccess`, PE policies. Outputs name/resourceId/addressPrefix(es). Published API `2025-05-01`. Suitable for late node subnets after FW/UDR. |
| [`br/public:avm/res/managed-identity/user-assigned-identity/federated-identity-credential:0.2.0`](https://github.com/Azure/bicep-registry-modules/tree/avm/res/managed-identity/user-assigned-identity/federated-identity-credential/0.2.0/avm/res/managed-identity/user-assigned-identity/federated-identity-credential) | `userAssignedIdentityName`, name, `issuer:string`, `subject:string`, `audiences:array`; outputs name/resourceId. API `2024-11-30`. Bind TLS identity after cluster issuer exists. |
| [`br/public:avm/res/network/dns-resolver/inbound-endpoint:0.1.0`](https://github.com/Azure/bicep-registry-modules/tree/avm/res/network/dns-resolver/inbound-endpoint/0.1.0/avm/res/network/dns-resolver/inbound-endpoint) | Optional alternative to nested endpoint, not an additional endpoint: resolver name, subnet ID, privateIpAddress/allocation method; outputs name/resourceId, **not IP**. Use one owner only. |
| [`br/public:avm/res/authorization/role-assignment/rg-scope:0.1.1`](https://github.com/Azure/bicep-registry-modules/tree/avm/res/authorization/role-assignment/rg-scope/0.1.1/avm/res/authorization/role-assignment/rg-scope) | Required `principalId`, `roleDefinitionIdOrName`; optional principalType/name/condition/conditionVersion2.0. Outputs name/resourceId/scope. **Scope is RG**, not arbitrary resource. Applicable only to approved RG grants. |
| [`br/public:avm/res/authorization/role-assignment/sub-scope:0.1.1`](https://github.com/Azure/bicep-registry-modules/tree/avm/res/authorization/role-assignment/sub-scope/0.1.1/avm/res/authorization/role-assignment/sub-scope) | Verified publication for exclusion: same basic contract but **subscription scope**. Not a substitute for secret, VNet, MI, ACR or cluster scope; do not use to broaden grants. |

The guessed unscoped `authorization/role-assignment` registry path returned 404;
the index led to the actual scoped publications above. A guessed
`insights/data-collection-rule-association` path returned 404 and had no matching
resource-index entry. A small native **DCRA extension** on the existing cluster
(`Microsoft.Insights/dataCollectionRuleAssociations`, API to be fixed in the
approved plan) is a documented candidate gap, not infrastructure authored here.
Use AVM `roleAssignments` at the resource being granted whenever possible. For
post-cluster or existing-secret grants that cannot be placed there without a
cycle or secret-value creation, a small native `Microsoft.Authorization/roleAssignments@2022-04-01`
at that exact existing resource is the appropriate proposed exception. Approval
and an explicit file/contract inventory remain required.

## 4. AKS, outputs and acyclic composition

The published AKS module supports the following **subset** without a native gap:

- Standard mode is explicit VMSS pools with `skuName='Base'`, `skuTier='Standard'`,
  `supportPlan='KubernetesOfficial'`, not Automatic. Set
  `nodeProvisioningProfile.mode='Manual'` (NAP disabled).
- `networkPlugin='azure'`, `networkDataplane='cilium'`, overlay/policy Cilium,
  IPv4, pod/service CIDRs and DNS IP. Source forces overlay and Cilium policy
  when dataplane is Cilium. `outboundType='userDefinedRouting'` causes
  `loadBalancerProfile` to be omitted; **do not** use userAssignedNATGateway
  or generate an LB public outbound IP as a workaround.
- `apiServerAccessProfile.enablePrivateCluster=true`,
  `enablePrivateClusterPublicFQDN=false`, custom `privateDNSZone` ID,
  `publicNetworkAccess='Disabled'`. Do not enable API VNet integration, which is
  a different design. `disableLocalAccounts=true`, `enableRBAC=true`;
  `aadProfile` must explicitly enable managed Entra and **Azure RBAC**.
- `managedIdentities.userAssignedResourceIds[]` for control plane;
  `identityProfile.kubeletidentity` with precreated kubelet resourceId/clientId/
  objectId. Grant MI Operator and networking/DNS roles **before** cluster.
- Initial system pool is `primaryAgentPoolProfiles[]`; user pool can be
  `agentPools[]`. Pool fields are **`osSKU`**, **`vnetSubnetResourceId`**,
  **`nodeTaints`**, `availabilityZones`, `orchestratorVersion`, `osDiskType`,
  `osDiskSizeGB`, `enableAutoScaling`, `minCount`, `maxCount`, `maxPods`,
  `upgradeSettings` and tags; S001's logical `osSku/zones/maxSurge` object
  requires explicit translation, not a literal AVM pass-through.
- Use VMSS, regular priority, Linux/AzureLinux3, Managed/128-GiB OS disk, no node
  public IP, sys2–2/usr1–2, maxPods50, zone1 and reviewed system taint.
  Upgrade settings support `maxSurge='1'`, drainTimeoutInMinutes and
  nodeSoakDurationInMinutes. No AVM pool `osDiskSku='Premium_LRS'` parameter
  was found: do not invent it. Verify actual AKS-managed P10 backing later.
- Explicit patch and NodeImage upgrade channels plus both maintenance
  configurations, not AVM's `stable` default. Public OS guidance supports
  AzureLinux3 on 1.28–1.36: a future move beyond 1.36 needs an OS review.
- `enableOidcIssuerProfile=true`,
  `securityProfile.workloadIdentity.enabled=true`,
  `workloadAutoScalerProfile.keda.enabled=true`,
  `azurePolicyEnabled=true`, CSI secret provider enabled and rotation enabled.
  Cost analysis, AGIC, OSM, Flux, AI toolchain, managed Prometheus and unused
  disk/file/blob/snapshot CSI features must not be enabled accidentally.
- Container Insights: set `omsAgentEnabled=true`,
  **`omsAgentUseAADAuth=true`** and the actual workspace ID. Its default false
  is not acceptable with workspace local auth disabled.

**Correct sequencing and ownership, not code:**

1. RGs → independent MIs, workspace, PIPs/NAT, policy → VNet base plus
   FirewallSubnet (already attached to NAT), VPN/resolver/PE/ingress subnets.
2. Firewall uses the VNet output; UDR uses firewall `privateIp`.
   Create node subnets separately using published subnet child modules and UDR
   output. Do not make the entire VNet module depend on a route table which
   depends on its own firewall. Each subnet has one authoritative writer; avoid
   a later parent call reasserting conflicting subnet settings.
3. DNS zones/links and precreated identity grants → private ACR/KV PEs →
   cluster with explicit pools. Merely constructing resource ID strings does
   not prove grant, zone-link or UDR completion; retain output dependencies or
   explicit dependencies for real prerequisites that have no consumed output.
4. Cluster `oidcIssuerUrl` → standalone TLS FIC. Keep TLS identity creation
   independent of its FIC. Do not wire a module containing issuer-dependent
   federation back into cluster inputs.
5. Monitoring add-on identities exist after cluster; any genuinely required
   post-cluster grants use that returned principal and separate narrow ownership,
   not a workspace/cluster mutual dependency. Resource-grant completion does not
   prove propagation; private DNS, grants and token exchange need readiness probes.
6. Separately authorised platform Kubernetes bootstrap follows private API access.
   No ARM deploymentScript, Helm release, or Kubernetes object is proposed as an
   implicit fix for missing AVM properties.

Outputs: wrap `uri` as logical vaultUri, `privateIp` as firewallPrivateIp, and
`oidcIssuerUrl` as issuer. `controlPlaneFQDN` selects privateFQDN in private mode.
Node RG ID and pool IDs are not module outputs: derive from the fixed scope/name
contract or an approved read-only resource reference, and verify later. Resolver
inbound output is name/ID only: expose the approved static IP as configuration,
not a fabricated observed value. No kubeconfig/key output is needed.

## 5. Networking, egress, DNS, tiers and service restrictions

**Supported topology, not tested deployment:** Standard NAT attached only to
AzureFirewallSubnet, zone1 Firewall/NAT, node UDR to firewall, no firewall-subnet
default UDR, no vWAN. The official NAT/Firewall guide explicitly confirms this
path and requires no extra UDR between Firewall and NAT. Standard NAT is not
zone redundant. NAT supplies SNAT, not destination enforcement.

Private AKS custom-zone guidance requires a **user-assigned** cluster MI with
Private DNS Zone Contributor on its AKS zone and Network Contributor on the
VNet. The VNet-scoped grant covers ingress-subnet/LB network operations within
this VNet; do not grant rights on other networks. AKS owns its API PE, node RG,
VMSS, disks and managed LB; no AVM is proposed to manage those children directly.
Private cluster API endpoint may move at start; DNS records are not fixed-IP
bootstrap inputs.

ACR Private Link requires **Premium**. Use classic
`LegacyRegistryPermissions` for AcrPull/AcrPush; these grants are not equivalent
to repository ABAC roles. Login and regional data endpoint resolution must both
be covered by the zone group and tested from nodes and the image-push device.
Use the actual `loginServer` output; do not assume a reconstructed hostname
captures every service naming option. Key Vault Standard supports private endpoint/
RBAC/secrets; Premium is not necessary for the proposed imported TLS material.
Neither service gets trusted-service bypass or a public fallback.

Resolver inbound dedicated /28 delegation to `Microsoft.Network/dnsResolvers`
and static address are representable. VNet links have registration disabled.
VPN split DNS/client routes/trust installation are client bootstrap contracts,
not ARM zone-link behavior. Never point VPN clients directly at Azure's
`168.63.129.16`; the configured inbound resolver is their destination.

**DNS defect requiring an explicit choice:** S001 leaves node DNS Azure-provided
but enables the Firewall DNS proxy and proposes evidence from proxy failures.
That setting does not put node DNS through the proxy. If network-rule FQDN
filtering needs proxy-consistent resolution, use an approved node/VNet DNS path
through the firewall, preserving linked private-zone resolution through its
upstream; otherwise explicitly keep Azure DNS and constrain the filtering/evidence
claim to what the chosen HTTPS application rules actually provide. Do not switch
VNet DNS silently: this affects AKS bootstrap, zone resolution and client tests.

The official AKS outbound table distinguishes public versus private cluster
dependencies. For example, public-control-plane tunnel ports UDP1194/TCP9000
are not automatically required for this private API topology. Base HTTPS/MAR
dependencies include Microsoft Container Registry and its data/CDN endpoints;
OS update, identity, monitoring, Policy and other add-ons add destinations.
`AzureKubernetesService` FQDN tag is useful but not the entire reviewed allowlist.
No generic Internet/`*.azure.com` allow, broad AzureCloud/all-port rule, or fake
exact endpoint list has been supplied. Private API/ACR/KV paths stay private.
The selected namespace policies must independently constrain pods; host/node
egress is not proven by Cilium namespace policy.

Network address arithmetic and 18-vCPU surge arithmetic are internally coherent:
16 overlay /24 node blocks cover six nodes; `3*4 + 3*2 = 18` vCPU, below the
reported 20 total/family quota, not additive quotas. **PASS for arithmetic only.**
Public documentation and the historical observation are not current allocation,
external IPAM, inherited-policy or name-availability checks.

## 6. Gateway API, TLS and add-on capacity contract

### Exact supported controller/tooling subset

- Chosen implementation: **application routing Gateway API**, GatewayClass
  **`approuting-istio`**, not mesh class `istio`, not managed NGINX.
  Both app-routing Gateway and mesh add-on cannot be enabled simultaneously.
  Self-managed Gateway API CRDs are unsupported for this app-routing path.
- For Kubernetes **1.36.x**, the official managed **standard** Gateway API
  bundle is **v1.5.1**. `Gateway` / later `HTTPRoute` use
  `gateway.networking.k8s.io/v1`. The bundle is AKS-managed and follows minor
  Kubernetes upgrades; do not independently Helm-pin/replace it.
- Official CLI workflow requires **Azure CLI >=2.86.0**. S001's observed
  2.84.0 is below that prerequisite. No Azure command, including version query,
  was run here. An approved tooling update and recorded Bicep/kubectl/kubelogin
  versions belong in the plan; no such installs were authorised here.
- Official ARM **`2026-03-01`** schema and guide expose
  `properties.ingressProfile.gatewayAPI.installation='Standard'` and
  `properties.ingressProfile.webAppRouting.gatewayAPIImplementations.appRoutingIstio.mode='Enabled'`.
  This is evidence of the service API, **not** evidence that AVM0.14.0 supports it.
  The exact additional webAppRouting/NGINX-disable fields and single resource
  ownership must be fixed in any approved native contract; don't enable NGINX
  through AVM's older `webApplicationRoutingEnabled` switch as a substitute.
- `istiod` default HPA is min2/max5/CPU80%; the app-routing guide explicitly
  permits HPA edits, with minimum not below2. The proposed2–2 is representable.
- Gateway generated Deployment/Service/HPA/PDB customization uses the official
  ConfigMap allowlist. Permitted leaves include container resource requests/limits,
  nodeSelector/tolerations/affinity/topologySpreadConstraints, HPA min/max
  (min>=2), and PDB minAvailable. Set gateway2–2/PDB1 via that supported mechanism,
  not unsupported edits to reconciled children.
- Set `Gateway.spec.infrastructure.annotations` for internal LB and ingress
  subnet before creation; static IPv4 and service tags must use the supported
  Azure LB annotation contract in the plan. Default is **external**.
  Use an HTTPS listener, exact hostname, same-namespace certificate Secret and
  allowedRoutes namespace selector for the approved demo namespace. No business
  HTTPRoute is installed in this package.
- No request/body size limits, Lua, rate limiting, egress management or arbitrary
  EnvoyFilter/Istio CRD support is supplied by this controller. The proposed
  <=1MiB application envelope must later be enforced by the application if
  required; it is not a supported ingress body-limit property.
- App-routing gateway access logging is enabled by default; its format/provider
  is not customizable using Istio Telemetry API. Review actual fields and
  collection minimization before claiming redacted request logging.
- The inspected allowlist does not establish a Gateway minimum-TLS-version
  override. **BLOCKED** for a fully evidenced TLS>=1.2 guarantee on the selected
  managed revision: obtain the authoritative default/supported control contract
  and require later rejection probes for TLS1.0/1.1. Do not invent tls.options,
  switch controllers or install EnvoyFilter to manufacture a pass.

### Certificate and federation correction

The manual CSI-to-Kubernetes-Secret workflow is supported; use a persistent
Deployment mounting the SecretProviderClass, not the guide's short-lived sample
Pod. A single scoped identity/federation can remain as proposed. Fix the **encoding
and object contract** before release:

- Either two PEM secrets (certificate/key) with two explicitly scoped secret
  grants, **or** one imported certificate's secret representation with a documented
  extraction/sync mapping producing both `tls.crt` and `tls.key`.
- A pure `objectType: secret` read uses Key Vault Secrets User. A separate
  `objectType: cert` read must not be assumed to work with a secrets-only role.
  The guide's mixed objectType example is not proof that a single secret-scope
  Secrets User grant covers certificate operations.
- Preserve exact issuer from `oidcIssuerUrl`, subject
  `system:serviceaccount:ama-ingress:tls-sync`, audience
  `api://AzureADTokenExchange`, service-account client-ID binding and
  `azure.workload.identity/use` pod label. Do not use the sample's node-MI
  authentication as fallback; do not grant the automatically created CSI MI
  blanket vault access.
- Plan mounts, sync lifecycle, autorotation/poll interval, immutable image
  digest, renew/reload proof and who can mutate the service account/Secret/
  ConfigMap. The sync image/tool pin and accepted trust operation are not fixed.
  Root/private material is never an ARM output or Git artifact.

### Required request inventory — explicitly incomplete

| Component | Established count/settings | CPU/memory request evidence / disposition |
| --- | --- | --- |
| App-routing istiod | HPA default2–5, supported proposed2–2 | Actual managed container requests, placement and taint tolerance **BLOCKED**, not inferred from upstream Istio samples. |
| Gateway proxy | Supported HPA2–2/PDB1; resource override leaves allowed | 250m/512Mi each is a **proposal that can be expressed**, not verified selected-revision defaults or measured adequacy. Both proxies initially on one user node; no HA claim. |
| TLS-sync | Proposed Deployment1,50m/128Mi | No pinned reviewed image/SPC encoding or tested runtime footprint. **BLOCKED**. |
| CoreDNS, metrics-server, Cilium and kube-proxy/replacement components | AKS-managed; presence/count depends on selected AKS/network revision | Exact manifests, requests, per-node vs replicated counts and placement **NOT VERIFIED**. Do not double-count an absent kube-proxy or omit Cilium agents/operator. |
| CSI driver/provider, WI webhook | Enabled/required by selected features; CSI provider creates an additional managed identity | DaemonSet footprint on **both** pools plus webhook/controller replicas/requests **NOT VERIFIED**. No data-plane grants implied for auto-created identity. |
| AMA/Container Insights | AAD-auth monitoring selected | Per-node agents plus replica/controller footprint and ConfigMap settings **NOT VERIFIED**. |
| Azure Policy/Gatekeeper | Add-on enabled, version defaultv2 | Audit/controller replicas, requests, placement and admission-policy overhead **NOT VERIFIED**. Enabling add-on is not installing every desired constraint. |
| KEDA | workloadAutoScalerProfile.keda enabled | Operator/metrics/webhook counts, requests, placement **NOT VERIFIED**. No queue infrastructure or ScaledObject delivered here. |
| Signing/verifier/admission extensions and bootstrap/probes | Not selected/pinned | Missing inventory, requests, firewall destinations and exception scope **BLOCKED**. No extra product selected. |

Aggregate CPU/RAM totals and per-node bin-packing **cannot be calculated honestly**
from those missing rows. Account DaemonSets on usr as well as sys, allocatable
and eviction reserves, topology/taints, maxPods, all containers/init containers,
max HPA/rollout/PDB constraints, surge nodes and stop/start behavior. Do not
reuse “4 CPU/10 GiB” as evidence of its own satisfaction.

## 7. Monitoring, diagnostics, tags and RBAC semantics

### Monitoring and diagnostic corrections

1. LAW AVM exposes two **secure** shared-key outputs, annotated `@secure()` in
   source and secure output types in its compiled artifact. No key was queried
   or printed here. Do not export/reference those outputs from composition.
   If “no credential outputs anywhere in nested deployments” is the literal
   acceptance requirement, this pin does not meet it: architect must resolve a
   documented module exception/alternative, not hide the outputs. Secure is
   materially different from plaintext; this report alleges no credential leak.
2. Container Insights needs explicit AAD auth, correct DCR extension/streams/
   dataFlows/destination, and a cluster DCRA. The AVM DCR is not an association.
   Choose one owner; avoid a separately created default monitoring DCR plus a
   second duplicate stream collector. The official workflow can auto-create
   default collection configuration; CLI bootstrap defaults are not an inventory
   of what this Bicep composition will create.
3. The official collection-frequency setting is **one 1m–30m frequency** for
   the selected inventory/performance collection. Separate inventory5m/perf1m
   is not established by one default DCR. Fix the design to one supported
   cadence or supply a verified split-stream contract. Error/warn-only stdout
   requires a real supported filter/transformation and review of available
   ContainerLogV2 fields; not every process emits a trustworthy severity.
4. Resource diagnostic categories are not universally separate tables. Fix alert
   queries to actual schemas; do not blanket claim every category lands in a
   resource-specific table simply by selecting Dedicated destination mode.
5. Subscription Activity Log export has categories/destinations but **no RG source
   filter** in the inspected diagnostic-setting contract. S001's “export scoped
   project events, not unrelated estate inventory” is not met by a subscription
   diagnostic setting. Either approve/minimize the broader export, or explicitly
   select/review a supported alternative and its scope/cost. Workspace query
   filters do not prevent collection. No new ingestion service is selected here.
6. Four log alerts need real KQL, windows/failing periods, expected-running/
   stop-start suppression logic, action group and secret-safe test signal.
   Health/expiry/role-change assertions cannot rely on absent streams. A budget
   alert, daily cap and log alert do not enforce a hard currency ceiling.

Verified official category inventory (public service support, not observed
target-resource categories):

| Resource | Supported named signals / exact correction |
| --- | --- |
| AKS | `kube-audit-admin`, `kube-apiserver`, `kube-controller-manager`, `kube-scheduler`, `cluster-autoscaler`, `guard` are published. Keep full `kube-audit` out as proposed. The current supported-logs page maps these to AzureDiagnostics; reconcile with resource-specific audit/control-plane documentation before freezing queries. No automatic payload redaction claim. |
| ACR | `ContainerRegistryLoginEvents`, **`ContainerRegistryRepositoryEvents`**, not a guessed bare RepositoryEvents name. |
| Key Vault | `AuditEvent`; audit may contain operator identifiers. |
| Firewall | Structured `AZFWApplicationRule`, `AZFWNetworkRule`, `AZFWDnsQuery`, `AZFWThreatIntel`; DNS evidence exists only for traffic using proxy. Do not enable aggregation/IDPS/flow-trace extras by blanket allLogs and pretend no cost/feature change. |
| VPN | `GatewayDiagnosticLog`, `TunnelDiagnosticLog`, `P2SDiagnosticLog` exist; IKE/Route logs are additional explicit choices, not assumed free of identifiers. |
| Resolver / NAT / NSG / PIPs / PE / LB | No invented universal “allLogs” diagnostic setting. Record exact supported metrics/logs or probes per resource in the plan; actual supported-category discovery and effective alert tests remain later. Resolver query-log support for the exact SKU was not established here. |

Use each owning module's `diagnosticSettings[]` with named enabled categories,
workspace ID and deliberate destination type. Retention is LAW/table retention,
not a fictional diagnostic-setting retention control that expires LAW tables.

Tags: preserve the five approved string-valued tags, explicitly on RGs and
taggable resources. AKS cluster tags and pool tags are different inputs; node RG/
VMSS/disks/NIC/LB propagation needs per-service assertions, not RG inheritance.
Gateway Service tags need the supported LB annotation; auto-created add-on MIs,
API PE and service-managed resources need an applicability/exception inventory.
Role assignments, FICs, DCRAs, subnet children, diagnostics and DNS record children
cannot all be given arbitrary top-level tags. Never mutate AKS-owned children to
force a superficial WV09 pass.

### Roles: verified public definitions and scope consequences

Official built-in definition pages were retrieved and their JSON permissions
inspected. IDs below are public role-definition GUIDs, not private principals.
All roles have empty notDataActions; except where noted, notActions and dataActions
are empty. Grantor is the **separately approved human bootstrap identity** with
conditional RBAC assignment authority at the exact grant scope; its actual identity,
condition tuple, activation and ability to grant each row remain **NOT RUN**.

| Principal / exact scope | Role ID / verified permission consequence |
| --- | --- |
| Kubelet / ACR | AcrPull `7f951dda-4ed3-4680-a7ca-43fe172d538d`: action `Microsoft.ContainerRegistry/registries/pull/read`; no push. Valid for selected classic mode. |
| Publisher group / ACR | AcrPush `8311e382-0749-4cb8-b61a-304f252e45ec`: pull/read plus push/write. Not scan/signature/admission proof. |
| Operator / cluster; observer also needs credential retrieval | AKS Cluster User `4abbcc35-e782-43d8-92c5-2d3f1bd2253f`: managedClusters/read and listClusterUserCredential/action. **Add this role for the observer group too** if it must obtain kubeconfig; AKS RBAC Reader alone lacks credential retrieval. Private connectivity remains separate. |
| Temporary operator / cluster | AKS RBAC Cluster Admin `b1ff04bb-8a4e-4dc4-8eb5-8693973ce19b`: dataActions `Microsoft.ContainerService/managedClusters/*`; ARM authorization/subscription/RG read and user-credential retrieval. Broad Kubernetes privilege, not Contributor on ARM resources. |
| Observer / cluster | AKS RBAC Reader `7f6c6a51-bcf8-42ba-9220-52d62157d7db`: read dataActions for listed workloads, pods/events/configmaps/services/namespaces/etc.; no secrets read and no writes. The published enumeration, not a fabricated `*/read` data wildcard, governs new API kinds; do not assume Gateway CRD visibility without testing. |
| Cluster MI / dedicated VNet | Network Contributor `4d97b98b-1d4f-4787-a291-c67834d212e7`: `Microsoft.Network/*`, authorization read, alertRules/deployments/support operations and resource-health/RG reads. Broad networking control **within VNet scope**, not subscription. |
| Cluster MI / AKS private zone | Private DNS Zone Contributor `b12aa53e-6015-4669-85d0-8515ebb3ae7f`: privateDnsZones/*, privateDnsOperationResults/*, privateDnsOperationStatuses/*, VNet read/join, authorization/RG read and alertRules/deployments/support operations. No grant on ACR/KV zones implied. |
| Cluster MI / kubelet MI | Managed Identity Operator `f1a07417-d97a-45cb-824c-7a7467783830`: userAssignedIdentities `*/read`, `*/assign/action`, authorization read, alertRules/deployments/support and RG read. It is not permission to create arbitrary federated credentials on other identities. |
| TLS-sync / exact selected TLS secret(s) | Key Vault Secrets User `4633458b-17de-408a-b874-0445c86b69e6`: dataActions secrets/getSecret/action and secrets/readMetadata/action; actions empty. Does not confer certificate-object access. |
| Temporary custodian / dedicated vault | Key Vault Secrets Officer `b86a8fe4-44ce-4948-aee5-eccb2c155cd7`: dataActions `Microsoft.KeyVault/vaults/secrets/*`; management read, name-availability/location/operation/deleted-vault reads plus common read/support/deployment/alert actions. This **does not authorize importing a certificate object**. If that encoding is chosen, approve the appropriate certificate role separately rather than silently broadening to Administrator. |
| Observer / LAW | Log Analytics Reader `73c42c96-874c-492b-b04d-ab87d138a893`: actions `*/read`, analytics/query/action, search/action, Support/*; notAction sharedKeys/read; dataAction **workspaces/jobs/export/action**. S001 must not describe this role as “no export”; approve that capability or choose an approved custom reader. |
| Monitoring identity / specifically justified DCR | Monitoring Metrics Publisher `3913510d-42f4-4e42-8a64-420c390055eb`: dataActions Insights/Metrics/Write and Telemetry/Write; register/action, Support/* and RG read. Do **not** assign generically to every add-on MI. Exact Container Insights auth/grant requirements for chosen DCR ownership still need fixing. |
| Author/deployer / two project RGs | Contributor `b24988ac-6180-42a0-ab88-20f7382dd24c`: actions `*` minus Authorization writes/deletes/elevate, Blueprint assignment writes/deletes, gallery share, Purview consent writes/deletes, deployment-stack deny-setting management, subscription cancel/enable; no dataActions. Not role-assignment authority. |
| Bootstrap grantor / approved new RGs | RBAC Administrator `f58310d9-a9f6-439a-9e8d-f62e7b41a168`: roleAssignments/write/delete, `*/read`, Support/*; no dataActions. Constrain conditions, duration and principal/role scope explicitly; no subscription Owner inferred. Creating the RGs still needs separate approved subscription-level authority. |

Role existence is not effective access, inherited deny/ABAC conditions, PIM/MFA
confirmation, service readiness or assignment propagation. Those checks require
later scoped authorisation.

## 8. Official technical source register

Access date for every entry: **21 October 2026**. Live pages are not immutable
versions; exact API/module versions above bind the source claims. No sovereign/
EU-only processing, service allocation or legal approval is inferred from a URL.

| Source | Evidence used |
| --- | --- |
| [Managed Gateway API](https://learn.microsoft.com/en-us/azure/aks/managed-gateway-api) | standard bundle1.5.1 for1.36, AKS-managed CRDs, CLI>=2.86 |
| [App-routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api) | class/controller, exact service enablement example, external default, HPA, customization/support restrictions |
| [ManagedCluster ARM2026-03-01](https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/2026-03-01/managedclusters) | ingressProfile Gateway installation/implementation property schema |
| [Gateway customization allowlist](https://learn.microsoft.com/en-us/azure/aks/istio-gateway-api#configmap-customizations) | Deployment resources/placement, Service annotations, HPA/PDB allowed fields; not approval to switch to mesh |
| [Manual app-routing TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls), [CSI identity access](https://learn.microsoft.com/en-us/azure/aks/csi-secrets-store-identity-access) | TLS secret sync/object type and WI access requirements; samples not installed |
| [OS support](https://learn.microsoft.com/en-us/azure/aks/upgrade-os-version), [AKS supported versions](https://learn.microsoft.com/en-us/azure/aks/supported-kubernetes-versions) | AzureLinux3 range; public release calendar not exact regional patch allocation |
| [Private AKS](https://learn.microsoft.com/en-us/azure/aks/private-clusters) | custom zone/UAMI roles and connectivity |
| [AKS egress table](https://learn.microsoft.com/en-us/azure/aks/outbound-rules-control-egress), [Firewall/AKS](https://learn.microsoft.com/en-us/azure/aks/limit-egress-traffic), [NAT/Firewall](https://learn.microsoft.com/en-us/azure/firewall/integrate-with-nat-gateway) | private/public prerequisites, FQDN tag limits and NAT-on-firewall-subnet supported topology |
| [Container Insights onboarding/collection](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-data-collection-configure) | collection presets, frequency, table groups, identity and DCR ownership prerequisites |
| [AKS log categories](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-containerservice-managedclusters-logs), [ACR categories](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-containerregistry-registries-logs), [KV categories](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-keyvault-vaults-logs) | exact supported category names and table/cost cautions |
| [Firewall categories](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-network-azurefirewalls-logs), [VPN categories](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-network-virtualnetworkgateways-logs) | exact structured/legacy signals and optional high-volume categories |
| [Container roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/containers), [network roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/networking), [identity roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/identity) | inspected built-in JSON action/dataAction definitions |
| [Security roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/security), [monitor roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/monitor), [privileged roles](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/privileged) | secret/certificate distinction, Reader export capability, grantor/Contributor limitations |
| [AKS stop/start](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster) | VMSS-only/NAP exclusion, API PE recreation/IP change, webhook/PDB risks and restart node-count caveat |

**Additional lifecycle correction:** the stop/start guide warns that initial
restart node count may not obey autoscaler min/max until scaling converges.
Therefore S001's “bounded counts” must not be claimed to guarantee every transient
start count from the autoscaler settings alone. Include an approved startup
observation/quota guard and recovery escalation. Scope signature/admission
webhooks to avoid blocking AKS-managed cluster-scoped resources during stop/start;
do not weaken security failure policy globally just to make stop succeed.

## 9. Checks, failures, handoff and stopped-writing record

| Check / gate | Actual result |
| --- | --- |
| Assignment acceptance, required skills, immutable inputs | **PASS**; 21 hashes verified using Python SHA-256 and `git show <base>:<path>`, exit0. Current routing HEAD read using `git rev-parse HEAD`; no worktree-source substitution. |
| Publication tags and compiled contracts | **PASS for enumerated existing artifacts only**; anonymous MCR tag lists/manifests/layers and official tagged READMEs/source retrieved. Manifest digests for AKS/VPN/LAW respectively: `734fcf441835ae4c9b1540e6bc1fe2fba1f2713bc4280c87519df3045f577e33`, `1600021aa8d2266412e9089cc9198cc50bc29098eeca5e6f2dacb8cce7e4cba7`, `2d18e9aff611d162e9a1f32f8a430fc46c81ee1791816bbe9b3860a7f392d651` (all SHA-256). 23 top-level source comparisons pass after publisher telemetry substitution only. |
| Exact AVM complete-design coverage, AC02/WV03 | **FAIL/BLOCKED** by §2 findings; no overall feasibility PASS. Child publications checked separately; no blanket assertion that every transitive module is independently reviewed/restored. |
| AC03 complete add-on request/placement evidence | **BLOCKED**, §6. Published contract and customization support are not request inventory. |
| AC04 dependency/rule/grantor inventory | **BLOCKED**; exact corrections supplied, owner decisions and missing destinations/conditions remain. |
| Native exceptions | **BLOCKED pending architect disposition**: material AKS/VPN ownership gaps, narrow DCRA/post-cluster or secret RBAC gaps. No native resources generated. |
| Local restore/build/lint/WV05–14 execution | **NOT RUN**, appropriately later and no infrastructure generated. No linter rule was added/suppressed. Upstream AVM sources contain their own existing suppressions; source inspection is not a clean-lint result for a future candidate. |
| Azure/WV15–22, regional availability, effective DNS/RBAC/TLS/monitoring and independent reviews | **NOT RUN**, forbidden/unauthorised or later. No live PASS and no F02 read extrapolated to writes. |
| Markdown/report scope and final SHA-256 | Author-side local inspection only; exact final hash supplied to parent after final write. Output is an uncommitted file on HEAD above, not a committed candidate revision. Tester must preserve the final bytes before review. |
| SQL todo update | **BLOCKED: no SQL/task-store tool or authorised task database connection is exposed**. No task database was guessed, created or edited through filesystem access. Parent must execute the exact statement below through its task-store tool. |

Actual research/tool diagnostics, retained rather than suppressed:

- Initial discovery of `.agents` failed because that directory does not exist;
  required skills were loaded from the actual `.github/skills` paths.
- Two guessed registry names returned404 as described in §3; actual scoped RBAC
  publications were then discovered from the official index.
- One source-inspection script exited1 with404 after omitting the OCI Accept
  header; subsequent explicitly headered artifact retrieval/tagged source inspection
  established the contracts. No failed request was counted as successful evidence.
- The first generic compiled-resource walker stopped on a DCR language construct
  (`'str' object has no attribute 'get'`); DCR main source and later source archive
  retrieval were inspected successfully. That walker is not a build/test PASS.
- The first Container Insights fetch used a wrong `/azure/monitor/...` path and
  failed; the correct `/azure/azure-monitor/...` page was retrieved. Managed Identity
  Operator was absent from the security-role page and was retrieved from identity
  roles instead. Neither initial absence was treated as absence of the feature.
- Oversized tool outputs were examined in selected ranges/extractions; not all
  content of every retrieved page is claimed reviewed.

**Required parent task update (not executed here):**

`UPDATE todos SET status='blocked',description='WP-001 F04 attempt2: 2/5 used, 3 remaining. Published AKS0.14.0 lacks managed Gateway API contract; VPN0.12.0 lacks explicit certificate-only OpenVPN/multi-revocation contract; exact managed add-on requests, egress/DNS, monitoring and TLS/signature evidence unresolved. SQL update unavailable in specialist runtime.' WHERE id='wp001-avm-feasibility';`

**Handoff:** bicep-engineer → parent coordinator → architect for genuine
integration, then separately assigned tester/security/compliance reviewers and
documentation agent on one preserved complete design/plan revision. Candidate
path is this report only; no implementation candidate exists. Architect must
resolve §2 findings and reconcile costs/resources/defaults; this report does not
edit S001, ledger, assignments, handoffs or acceptance criteria. Missing evidence
cannot be converted into a PASS or silently deferred past its existing design gate.

**Writer-stopped acknowledgement:** authoring of this report is complete for
attempt2; **stopped writing**. Only read-only hash/scope verification and return
to parent follow. No further research/review attempt, approval or next phase is
authorised by this handoff.
