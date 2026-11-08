# WP-001 / F04 — ARM-only r2 feasibility and future-plan proposal

**8 November 2026 · bounded check COMPLETE · NOT RELEASED.**
Sole authored output: `delivery/releases/WP-001/feasibility-r2.md`.
This is feasibility evidence and an offered implementation-plan proposal, **not**
an approved development plan, certification, independent tester PASS, design
release, code-generation authority or Azure execution permission.

## 1. Accepted assignment, fixed revision and limits

Accepted `assignments/F04-r2-review.md` and the current user's bounded instruction
before technical execution. Workload evidence is exclusively the sixteen copies
listed in:

`/Users/verboompj/.copilot/session-state/ea45f1eb-0d29-42dc-af7f-f9f5959f94f5/files/R2-review-inputs/manifest.json`

Each workload path below means `R2-review-inputs/files/<source-relative-path>`,
not its moving repository counterpart. Manifest base:
`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`.
Key exact input identities:

| Input | SHA-256 |
|---|---|
| `delivery/releases/WP-001/design.md` r2 | `1f7afbb65e84b302f8930b2b2ed0669a5ae6a59e79b074ebd20b625bbd26c375` |
| `delivery/releases/WP-001/cost-estimate.md` r2 | `62e64af0052db55f424139fd8334e32bfea06f3af7c7fc7373436dfa35b9cf29` |
| `delivery/releases/WP-001/feasibility.md` F04-r1 | `89ba32acf754c081707ebcfc2252fd52b0e35f0dfd7059f3b7d531d2c2d29a76` |
| `delivery/releases/WP-001/feasibility-gap-options.md` F04-GO-r1 | `dd8862cce5c107032683a052bcf4a1e6dd187cb2fde4e92aa0d36573115e4e95` |

Node v25.8.1 independently verified **16/16 copied-file hashes PASS** against the
manifest. This consumes the assigned frozen set; it does not create a snapshot,
repeat the parent's source/copy comparison or extend its integrity verdict.
The parent reports source/copy equality and all authors stopped. Moving source
design/cost, coordinator records and concurrent tester output were not inspected.

Read AGENTS, team guide, assignment and `ama-context`, `ama-avm-bicep`,
`ama-handoff` as operating instructions. Read frozen r2 design/cost, direction,
decisions/context, prior feasibility/gap evidence and relevant frozen workload,
handoff, framework, preservation, baseline and historical requirement passages.
Historical requirements and findings remain evidence, not newly passed controls.

Classification **HIGH**; selected/assigned model **gpt-6.1-sol**; actual runtime
model **NOT VERIFIED**, no authoritative runtime-model field exposed. No model
switch, fallback, nested agent or certification assessment occurred. This role
authored the earlier F04 evidence: the tester's separate review, not this report,
supplies the assigned non-author technical judgment on r2.

Stable loop **WP001-F04-AVM, attempt 4/5 consumed: 4 used / 1 remaining**.
Attempts 1–3 and their results are unchanged. This is one bounded review, not a
reset or another AKS/VPN registry hunt. **WP001-F03-AUTHOR remains exhausted:
5/5 used, 0 remaining.** No sixth author correction is requested or authorised.

## 2. Result: technically feasible proposal, incomplete literal file contracts

**No newly established missing ARM/service capability blocks the selected
foundation.** The complete-native AKS/VPN choices, twenty retained AVM pins and
documented narrow extension resources admit a coherent Bicep implementation.
No alternative platform, public endpoint, runtime bootstrap or new paid service
is needed to express r2.

However, **r2 §6 is not yet an executable, accepted exact implementation
contract**: its logical module input inventory omits the workspace ID required
by some diagnostic owners, and leaves a cross-resource-group file scope
unresolved. The concrete proposals in §5 close these composition details without
changing topology or acceptance targets. Their acceptance belongs in the actual
plan; this report does not silently amend the frozen design.

| ID / result / earliest gate | Actual finding and bounded disposition |
|---|---|
| **R2-F04-01 — FAIL, literal interface completeness; design-released/WV04** | `connectivity.bicep` owns Firewall AVM diagnostics and native VPN diagnostics; `services.bicep` owns ACR/KV AVM diagnostics. Neither §6 input list carries `workspaceResourceId`. These resource-group modules cannot consume a sibling module's output implicitly. Add a required `workspaceResourceId:string` input to both, wired from monitoring-base. The LAW is independent, so this adds no cycle. This is a concrete missing composition parameter, **not** unavailable diagnostics or a service redesign. |
| **R2-F04-02 — BLOCKED, exact file/scope plan; design-released/WV04** | `access-and-alerts.bicep` is described as “platform/aks scoped modules”, not one fixed deployment scope. Platform alerts and cluster role-assignment extensions cannot simply be declared together in one resource-group-scoped file targeting a cluster in the other RG. Fix actual file scopes/children as §5 proposes. No broad RG/subscription role grant is an acceptable shortcut. |
| **R2-F04-03 — planning requirement, not observed replay FAIL** | Fixed inline `usr.count=1` is a creation value, whereas an autoscaled live count can be 2. r2 explicitly recognises reconciliation but gives no update-parameter contract. The actual plan must distinguish creation from replay and bind the desired count to inspected state within approved bounds; never blindly reset it. See §4. No proof of safe replay exists without a candidate and later authorised preview. |
| **R2-F04-04 — planning precision, not missing ARM capability** | “ten named CIDR/IP strings” in AddressPlan is not an exact key inventory; §4 contains thirteen network CIDR/IP values including VNet, seven subnets, overlay, service, service DNS, VPN and resolver IP. Give every key an explicit name/type, and classify the reserved frontend separately. Also bind human principal types and deduplicate identical grants if operator and observer are the same principal. No new address or role is proposed. |
| **Release — BLOCKED, not this assignment execution** | There is no exact approved/released design and accepted actual plan. Required non-author/path-specific and targeted safety/applicability dispositions, exact human approval of amendments/native/preview/secure-output treatment, and network allocation remain pending. Coordinator routes decisions/escalation; do not send an automatic sixth F03 fix. |

The assignment is **complete despite these findings**. The inputs and tools
needed for this bounded check were present. The feasibility todo therefore
belongs in `done`, not `blocked`.

The user accepts a non-compliant technical PoC, not a compliance/security
certification campaign. Deferred TLS listener/admission/managed-image campaigns
are **not reopened as foundation-generation gates**. Supported foundation
service TLS, secret safety, no public fallback, narrow scopes and no
unrelated-estate deletion remain required. FND-05's recorded review path and
scope conflict need an explicit owner disposition; this engineer cannot waive
them or award regulatory PASS.

## 3. Contract and ownership check

### Exact retained module/version inventory

All references have prefix **`br/public:avm/res/`**. Publication/schema evidence
is inherited from frozen F04-r1 and F04-GO-r1; r2 documents its additional
version-tagged source inspections. No current registry re-verification or
upgrade is claimed.

| Pin | r2 contract/ownership to preserve |
|---|---|
| `resources/resource-group:0.4.4` | Subscription invocation; two new RGs only, names/location/tags, consume `resourceId`, `name`, `location`. AKS alone creates node RG. |
| `network/virtual-network:0.10.2` | Platform RG; VNet address only. Omit optional `subnets` and `dnsServers`, no second VNet owner/inline subnet array. |
| `network/virtual-network/subnet:0.2.0` | Seven exclusive child invocations at platform RG; exact prefixes, delegations, NAT/NSG/UDR associations; outputs drive consumers. |
| `network/network-security-group:0.5.4` | Three NSGs; exact rule properties, `flushConnection=false`. |
| `network/route-table:0.5.0` | One node UDR; `disableBgpRoutePropagation=false`; next hop consumes Firewall **`privateIp`**. |
| `network/public-ip-address:0.13.0` | Three existing-ID consumers; Standard/Regional/Static/IPv4; zones explicitly FW/NAT `['1']`, VPN `['1','2','3']`. |
| `network/nat-gateway:2.1.1` | `availabilityZone:int=1`, existing NAT PIP ID, timeout5; no generated extra PIP/prefix; FirewallSubnet only. |
| `network/firewall-policy:0.3.6` | Standard, proxy false, Azure DNS upstream omitted, threat intelligence Deny, analytics false; exact §4 collections, no broad destination input. |
| `network/azure-firewall:0.11.1` | Existing FW PIP, VNet and policy IDs; Standard/zone1; `privateIp`, not fabricated `firewallPrivateIp` AVM output. Service AVM owns its diagnostic extension. |
| `network/dns-resolver:0.5.8` | Resolver owns nested one inbound endpoint at static `10.83.2.68`, outbound array empty; endpoint output is name/ID, not observed IP. |
| `network/private-dns-zone:0.8.1` | Three global zones; nested links sole-owned, registration false; no authored app records or manually authored AKS/PE service records. |
| `network/private-endpoint:0.12.1` | Two external PEs and zone groups, target group IDs `registry`/`vault`. ACR/KV service `privateEndpoints` omitted; no duplicate PE writer. |
| `container-registry/registry:0.13.1` | Premium/classic `LegacyRegistryPermissions`, no admin/anonymous/public/bypass access; default deny, empty IP rules, data endpoints enabled, retention disabled, zone redundancy Disabled; no task/cache/replica/token resources. Main API remains `2025-06-01-preview`. |
| `key-vault/vault:0.14.2` | Standard, RBAC/private/default deny/None bypass, 7-day soft deletion and purge protection; deployment/template/disk switches false; empty vault. Consume **`uri`**, rename only at logical boundary. |
| `managed-identity/user-assigned-identity:0.6.0` | Two independent identities, no FIC. Outputs `resourceId`/`principalId`/`clientId`; fixed MI Operator assignment at kubelet identity. |
| `operational-insights/workspace:0.16.1` | PerGB2018; `dataRetention:int=31`, `dailyQuotaGb:string='1'`, public ingestion/query Enabled, local auth disabled, `forceCmkForQuery=false`; no export/solution/replication. Use only `resourceId` and `logAnalyticsWorkspaceId`. |
| `insights/data-collection-rule:0.11.0` | Required `dataCollectionRuleProperties` object, Linux branch, exact extension/streams/destination/dataFlow; does **not** create DCRA. |
| `insights/action-group:0.8.0` | Global/one protected email/common schema; short name `amapoc`; API `2024-10-01-preview`. |
| `insights/scheduled-query-rule:0.6.0` | Two platform-owned rules; input **`criterias`**, workspace scopes, actual cluster-ID query literal, exact windows/failing periods/actions; no dimensions, validation not skipped. API `2025-01-01-preview`. |
| `insights/activity-log-alert:0.4.2` | Global metadata, scopes exactly both project RG IDs, Administrative/Error, one action; no subscription default scope/export. |

Set `enableTelemetry=false` wherever the direct pin supports it. Do not rewrite
published nested artifacts or suppress diagnostics to pretend every transitive
default was authored locally. All service diagnostic inputs must explicitly
select categories, workspace destination and metrics disposition; leaving
optional metric defaults unexamined is not an accepted plan.

### Native APIs, property types and non-secret outputs

* **AKS `Microsoft.ContainerService/managedClusters@2026-03-01`**: one complete
  owner in AKS RG. Preserve Base/Standard, Manual, private custom-zone API/no
  public FQDN, UserAssigned identity map keyed by actual control-plane ARM ID,
  kubelet identity metadata, managed Entra/Azure RBAC, disabled local accounts,
  Overlay/Cilium/IPv4/UDR, OIDC/WI and r2's exact managed Gateway API fields.
  `gatewayAPI.installation='Standard'` and
  `gatewayAPIImplementations.appRoutingIstio.mode='Enabled'` are separate from
  paid tier and cluster mode. Omit legacy routing/NGINX/mesh fields.
* Both pools are **inline `agentPoolProfiles`**, `sys`/`usr`, not second child
  resource declarations. Native `vnetSubnetID` takes final subnet output;
  zone strings, count/min/max/maxPods/disk size are integers where specified,
  autoscaling/node-public-IP switches booleans; `maxSurge` is string **`'1'`**,
  drain30/soak5 integers. Preserve exact patch `1.36.4` on cluster and pools,
  Linux/AzureLinux3/VMSS/Regular, Managed128GiB, sys taint and labels, all tags.
  There is **no `osDiskSku` property**; P10 is a cost assumption, observed later.
* Add-on config values `useAADAuth`, secret rotation and poll interval are
  **strings**, not booleans in a native config map. Preserve enabled Policy,
  CSI, KEDA and monitoring; disable unused storage drivers and other r2
  exclusions. Enabled managed controllers are not authored Kubernetes objects,
  a TLS listener or verified admission policies.
* **Maintenance `managedClusters/maintenanceConfigurations@2025-10-01`**:
  two exact named children, weekly Saturday interval1, four-hour UTC06:00
  windows. Names and scheduling are supported configuration, not assurances
  that critical managed updates only occur there.
* **VPN `Microsoft.Network/virtualNetworkGateways@2025-01-01`**: one complete
  owner in platform RG; VpnGw1AZ/Generation1/RouteBased/active-standby, one
  `default` IP configuration consuming final GatewaySubnet and existing PIP.
  Explicit arrays `['OpenVPN']`/`['Certificate']`; full roots and revocations
  mapped under each entry's native `properties`, not AVM alias names.
  Roots contain public Base64 X.509 CER only, revocations unique stable names
  and thumbprints; no AAD/RADIUS fields, secrets, connection or second writer.
* **DCRA `Microsoft.Insights/dataCollectionRuleAssociations@2023-03-11`**:
  extension scoped to existing cluster, name `ContainerInsightsExtension`,
  `dataCollectionRuleId:string` from DCR output; no DCE association.
* **Diagnostics `Microsoft.Insights/diagnosticSettings@2021-05-01-preview`**:
  separate extension owners at native AKS and VPN; no generic subscription
  diagnostic-setting AVM. ACR/KV/Firewall diagnostic extensions stay owned
  through their service AVM inputs.
* **Cluster RBAC `Microsoft.Authorization/roleAssignments@2022-04-01`**:
  extension at cluster, fixed built-in role definitions, deterministic
  scope/principal/role assignment names and explicit principal type.
  Service AVM role inputs own the other retained grants.

Logical outputs use actual `properties.privateFQDN` and
`properties.oidcIssuerProfile.issuerURL`. Derive node-RG ID at subscription scope
and pool IDs beneath cluster from approved names; do not create those derived
resources. Resolver configuration is labelled configured, never observed.
Identity **principalId** is the object ID for RBAC/kubelet objectId, **clientId**
is not an RBAC principal, and **resourceId** is not either.

No kubeconfig, token, connection string, private key, VPN client profile or
workspace key may be forwarded to project outputs/tests/logs. The pinned
workspace's documented secure key outputs are a real transitive behaviour:
r2 proposes explicit acceptance of unused secure nested outputs, not removal
of `listKeys` from the published artifact or proof of deployment-history safety.
Approval/targeted review of that exception remains pending; plaintext leakage
is not waived.

## 4. Graph, collection and desired-state safety

**Graph feasibility PASS for the stated composition, not compiled proof.**
Root creates two RGs; independent identities and LAW/action group precede their
consumers. Connectivity creates VNet parent without subnets, then five early
exclusive subnet children. NAT precedes FirewallSubnet; Firewall consumes its
completion, UDR consumes Firewall private IP, and two final node subnets consume
UDR/NSGs. DNS zones/links and VNet/AKS-zone/control-plane grants complete before
cluster. Kubelet MI Operator grant completes in identities; AcrPull completes in
services. ACR/KV PEs consume final PE subnet and zones. AKS consumes final
network, identity and LAW outputs. DCR consumes LAW and DCRA consumes cluster/DCR.
There is no Firewall-IP-to-parent-DNS back edge, TLS FIC, partial cluster PUT or
runtime bootstrapping edge.

A constructed VNet/subnet/zone ID alone cannot order its child deployment or
role/link completion. Output arrays/objects exported after nested invocations
provide module completion dependencies; retain narrowly justified `dependsOn`
for prerequisites without consumed data (e.g. completed DNS/identity grants,
ACR access and PE completion before the private-cluster stage). Do not use broad
manual dependencies as a substitute for real output wiring. RBAC propagation
and DNS readiness remain later observations.

**Collection contract coverage PASS at proposal level.** One Linux DCR,
ContainerInsights extension, 1m cadence, namespace filtering Off/empty list,
individual streams in both source and dataFlow:
KubeNodeInventory, KubePodInventory, KubeEvents, KubeMonAgentEvents and Perf,
each with `Microsoft-` prefix. Destination `ciworkspace` consumes LAW ID.
No default group stream, ContainerLog/V2 stream, DCE, AMPLS, duplicate DCRA,
CLI onboarding or cluster “patch” is required. Retained
`enableContainerLogV2=true` does not itself add stdout collection without its
stream. Native managed-agent enablement uses AAD authentication; no legacy
workspace keys or gratuitous Monitoring Metrics Publisher grant.

The named AKS/ACR/KV/VPN categories and alert query shapes are covered by the
preserved evidence/r2 source register, not tested against live resources here.
One narrow new public check resolved a genuine r2-versus-prior-evidence question:
prior F04 emphasised structured Firewall categories, whereas r2 selects legacy
`AzureFirewallApplicationRule`/`AzureFirewallNetworkRule`. Official supported
logs explicitly lists **both legacy categories and AzureDiagnostics table**.
They are not invented/unsupported merely because structured alternatives exist.
Preserve legacy table semantics; do not silently substitute AZFW categories,
claim resource-specific tables for these logs, or widen to allLogs.

**Replay safety is NOT VERIFIED.** Static ownership is coherent but cannot prove
provider reconciliation of service-populated subnets or autoscaled pool counts:

1. Every root update must keep VNet parent subnet property omitted and the same
   seven child owners. No inline array, second subnet declaration, read/merge/
   write, Complete-mode cleanup, deployment stack or unrelated estate target.
2. Plan explicit `systemNodeCount:int=2` and `userNodeCount:int=1` creation
   values; allowed update values remain sys2 and usr1–2. A replay parameter
   snapshot must carry the approved reconciled count, not an unexamined initial
   value. This is not a request for a second pool writer or invented ARM runtime
   read expression. Any live lookup needs separate read authority.
3. Retain full VPN root/revocation arrays on every update. Local contracts test
   duplicate/reordered/multiple revoked clients and ensure no last-entry-only
   mapping or ordinary update silently clears them.
4. Retain stable names and role-assignment deduplication. Repeating the same
   `(scope, principal, role)` tuple must not create competing writers if the
   same human holds operator and observer duties.
5. Local compiled assertions can prove these authored semantics. Later scoped
   validation/what-if must inspect exact repeated-root effects, subnet retained
   service state, count changes and unexpected deletions/replacements. Unsupported
   preview analysis is a limitation, not safety PASS. A destructive effect or
   required property conflict stops the operator and is escalated.

Local arithmetic **PASS**: seven prefixes are disjoint and contained in
`10.83.0.0/20`; overlay/service/VPN ranges disjoint; resolver/service-DNS IPs
belong to their selected ranges; overlay yields16 per-node /24 blocks versus
six maximum planned nodes. vCPU totals10/12/18 agree with design/cost.
External/home/device/corporate overlap is **NOT RUN**.

Cost formula arithmetic **PASS for displayed scenarios**, not a fresh price
audit: retained rate `1.9575786529680363`/h, transition reserve
`5.6039452054794525`; short/extended fixed167.83/396.07, with usage/reserve/20%
216.87/503.47; monthly fixed1837.83 and total2299.66; stopped fixed1429.03.
These reproduce r2. Most rates remain October observations; actual allocation,
offer entitlement, disk backing, funding, billable managed extras and stop-time
fee remain later checks. No campaign duration or spend ceiling was approved here.

## 5. Concrete future implementer plan offered to coordinator

**Proposal only.** Coordinator owns `development-plan.md`; architect and
implementer must accept actual files/contracts, dependencies, parameter and
validation inventories before release. These filenames and parameter details
are offered for that acceptance, not created here. Scope/type corrections below
must be recorded; if their acceptance would require an exhausted author revision,
escalate rather than edit the frozen design or launch a sixth F03 attempt.

| Exact proposed future file / scope | Ownership, required contract and checks |
|---|---|
| `infra/main.bicep` / subscription | Two resource-group AVMs and composition. Fixed names/region/tags; required protected-context inputs; output only `FoundationInterfacesV2`. Explicit output-derived ordering; WV05/08–13. |
| `infra/environments/poc.bicepparam` | Actual sole environment variant linked to main; public constants plus locally supplied approved nonsecret context. No real principal/contact/public-key inventory committed unnecessarily; WV06. |
| `infra/modules/identities.bicep` / platform RG | Two UAMIs plus kubelet-scope MI Operator through its AVM input, control-plane principal obtained from independent first invocation. Two typed identity objects; WV08/11. |
| `infra/modules/monitoring-base.bicep` / platform RG | LAW/action group and workspace-scoped observer Reader via workspace AVM; inputs location/tags/observer ID **and type**/protected email. Outputs LAW resource ID, workspace GUID, action-group ID. No dependency on cluster; WV08/09/11/12. |
| `infra/modules/connectivity.bicep` / platform RG | Exact networking/DNS/VPN owners described above. Add required **workspaceResourceId:string** to r2 input list. Input control-plane principal, AddressPlan, roots/revocations; output typed subnet/zone IDs and declared network interfaces; WV08–12. |
| `infra/modules/services.bicep` / platform RG | ACR/AcrPull, empty KV, external PEs and groups. Add required **workspaceResourceId:string**. Other inputs tenant/PE-subnet/zone IDs and kubelet principal. Output resource IDs, actual loginServer/uri, PE IDs; WV08–12. |
| `infra/modules/aks.bicep` / AKS RG | Complete native cluster/inline pools, both maintenance children and native AKS diagnostics. Required location/tags/tenant/patch/SSH public key/final subnets/custom AKS zone/identity objects/LAW ID; add bounded creation/replay count inputs. Actual nonsecret outputs and derived child IDs; WV05/08–13. |
| `infra/modules/monitoring-cluster.bicep` / AKS RG | Exact DCR AVM and cluster-extension native DCRA only. Required cluster ID/LAW ID/location/tags; output DCR/association IDs; WV08/09/11/12. |
| `infra/modules/access-and-alerts.bicep` / **subscription orchestrator** | Resolve r2's mixed-scope placeholder: consume both RG names, cluster/LAW/action-group IDs, operator/observer IDs and types; invoke the next two children at actual RG scopes. No subscription role grants/resources; return only role/alert IDs. |
| `infra/modules/cluster-access.bicep` / AKS RG | Existing-cluster reference and native cluster-scope grants for deduplicated operator/observer Cluster User + AKS RBAC Reader pairs. Explicit scope/type/definition GUIDs; WV08/11. |
| `infra/modules/platform-alerts.bicep` / platform RG | Two pinned scheduled-query rules + pinned activity alert; existing workspace/cluster IDs may be cross-RG query scopes, not cross-RG resource declarations. Activity scopes both project RG IDs, action-group ID; WV08/09/12. |
| `infra/tests/contracts.test.mjs` / author-side local runner | Node built-in test runner, no new package dependency; compile using the installed pinned Bicep executable with stdout captured **in memory**. Inspect source pins and recursively compiled templates, evaluate the supported nonsecret parameter expressions against fixtures and assert exact controls. Unresolved expressions fail/explicitly block, never count as verified. |
| `infra/tests/fixtures/poc.contract.bicepparam` / synthetic test input | Linked to same main; deterministic fictitious valid-format GUIDs/contact and valid-format public-only SSH/CER fixtures, no private material and no live context. Negative/replay fixture variants can be constructed in memory by runner; not extra deployable environments. |

Common types can initially be declared in their owning files with matching
typed root/module contracts, avoiding a new shared file/import feature dependency.
If a shared types file or Bicep configuration is desired, enumerate and authorise
it in the actual plan rather than write outside the accepted inventory.

### Exact parameter/type requirements to settle in that plan

* `tenantId`, `operatorPrincipalId`, `observerPrincipalId`: required strings with
  valid GUID syntax; explicit `operatorPrincipalType`/`observerPrincipalType`
  constrained to approved human User/Group alternatives, no default
  ServicePrincipal assumption or invented actual identity. All MIs use
  ServicePrincipal explicitly. Built-in role-definition IDs come from frozen
  F04-r1 §7; no arbitrary role-definition/scope input.
* `sshPublicKey:string`: required public-only OpenSSH key; admin `azureuser`,
  inbound22 denied. `alertEmail:string`: protected actual receiver, common alert
  schema, no public identity/contact fixtures copied from operations.
* `vpnRoots:VpnRoot[]`: required nonempty approved full inventory, each
  `{name:string,publicCertData:string}` public CER. `vpnRevokedClients:
  RevokedClient[]`: `{name:string,thumbprint:string}`, default empty **only**
  for genuinely empty approved inventory; unique names/thumbprints checked.
* `location:string='swedencentral'`, `kubernetesVersion:string='1.36.4'`:
  selected exact configuration, no latest/public/reuse/bypass switches. Creation/
  replay counts as §4, no expanded min/max or SKU alternatives.
* `AddressPlan`: thirteen explicit string keys proposed as `vnetCidr`,
  `systemSubnetCidr`, `userSubnetCidr`, `ingressSubnetCidr`,
  `privateEndpointsSubnetCidr`, `dnsInboundSubnetCidr`, `gatewaySubnetCidr`,
  `firewallSubnetCidr`, `podCidr`, `serviceCidr`, `dnsServiceIp`,
  `vpnClientCidr`, `dnsInboundConfiguredIp`, using r2 §4 values exactly.
  Reserved `10.83.2.10` stays documented, unallocated and not a frontend resource.
* `SubnetIds`: system/user/ingress/privateEndpoints/dnsInbound/gateway/firewall
  string keys. `ZoneIds`: aks/acr/vault string keys. Each identity object:
  resourceId/principalId/clientId strings. Tags are approved string-valued map,
  including `costCenter='10122'`, not numeric10122.
* `FoundationInterfacesV2`: approved RG/cluster/pool/node-RG/network/zone/PE/
  identity/LAW/DCR/action-group IDs, actual loginServer/vaultUri/privateFqdn/
  issuer and configured resolver IP only. Do not dump an AVM outputs object.
  Root outputs must not forward secure workspace outputs, hidden credentials
  or protected human contacts.

### Smallest local command inventory — future execution, NOT RUN now

Available direct binary verified here: **Bicep CLI0.43.8
(`310735909d`)**, `/Users/verboompj/.azure/bin/bicep`. It is not on PATH;
`az` exists but **no Azure/az command was executed**. Its native help confirms
restore/build/lint/build-params and stdout/no-restore flags. Use this direct
binary or an explicitly accepted equivalent version; no install/update here.
The existing CLI2.84/2.86 managed-Gateway CLI distinction is not an ARM/Bicep
build prerequisite: this proposal uses no Gateway CLI bootstrap.

From repository root, after release and candidate creation:

```text
/Users/verboompj/.azure/bin/bicep --version
/Users/verboompj/.azure/bin/bicep restore --pattern 'infra/**/*.bicep'
/Users/verboompj/.azure/bin/bicep build --no-restore --stdout <each inventoried .bicep file>
/Users/verboompj/.azure/bin/bicep lint --no-restore --pattern 'infra/**/*.bicep'
/Users/verboompj/.azure/bin/bicep build-params --no-restore --stdout infra/tests/fixtures/poc.contract.bicepparam
/Users/verboompj/.azure/bin/bicep build-params --no-restore --stdout infra/environments/poc.bicepparam
node --test infra/tests/contracts.test.mjs
```

`<each inventoried .bicep file>` means main plus all nine module files listed
above: **ten Bicep files**, not just reachable root compilation. The actual
runner/assignment must enumerate them rather than treating that notation as a
shell command. Restore contacts public registry/cache only; builds use
`--no-restore` after that bounded restore. Capture generated JSON and diagnostic
streams in memory, not source-tree generated files or dumped protected parameter
values. If approved evidence files are later needed, the plan names safe paths
and owners. Actual environment compilation requires its approved locally supplied
values; synthetic fixture success cannot substitute for it.

Build exit0 does not dispose warnings. Record every compiler/linter diagnostic
with file/location/rule and all command versions/exit statuses; classify and
resolve or obtain a scoped genuine disposition. No linter-rule suppression,
warning concealment or unrelated configuration rewrite to manufacture success.

### Explicit author/tester assertion inventory

| WV / r2 target | Small local assertion set for the actual plan |
|---|---|
| WV05–07 / T03 | Ten Bicep files restore/build; environment and synthetic parameter inventories compile; separate lint/diagnostic disposition. Missing tool/value or unresolved schema warning is not PASS. |
| WV08 / T03–05 | Exactly20 retained pins, approved native APIs only, explicit resource-group/extension scopes, output types/actual field names, no cycles/partial PUT/duplicate subnet/pool/PE/DCR owners. Recursively inspect transitive compiled modules/defaults. |
| WV09 / T04–05 | Exact §3 names/counts and five tags on all supported taggable resources including cluster/both pools; enumerate untaggable child exceptions. Do not assert inheritance or modify AKS-owned VMSS/NIC/API PE/node RG. |
| WV10 / T04 | AKS private custom DNS/public disabled/no public FQDN, ACR/KV public disabled/default deny/no bypass, two external PE group IDs/zone groups and three private-zone links. PE presence alone is insufficient. |
| WV11 / T03–05 | Two UAMIs, correct identity object/client/resource IDs, OIDC/WI/Entra RBAC/local-account disablement; exact fixed role tuples/scopes/principal types/deduplication; no FIC/app/vault secret grants. No project credentials/output/key references; explicitly inspect accepted secure LAW transitive exception. |
| WV12 / T04–05 | Exact CIDRs/delegation/NAT associations/UDR/private DNS/NSG and bounded Firewall sources/FQDNs/tag/HTTPS rules, no proxy claim/Internet widenings. Fixed TLS service disposition; no invented Gateway TLS object/property. Diagnostics precise LAW/categories/metrics destination semantics; DCR five streams/no stdout, one DCRA; alert queries/windows/actions/scopes. |
| WV13 / T04 | Base/Standard/Manual, two native inline pools/exact SKUs/patch/OS/zones/count bounds/taints/maxPods/Managed128, surge string1/drain30/soak5, exact maintenance/add-on/storage exclusions. Assert zero authored Kubernetes/app/LB/frontend/ML/Foundry/Search/business services or deploymentScripts. AI/ML quality is out of this foundation, not passed. |
| WV14 / T05 | Candidate revision tied to released contracts, tester/specialist dispositions and architect conformance, documentation-agent reconciliation and explicit pending live checks. Author tests cannot self-award this gate. |

Tester owns its separate `tests/acceptance/wp001-*` inventory, test-plan and
evidence, not this engineer. Coordinator should obtain those exact files/
commands/owners in the accepted actual plan; no tester output was read here.
Documentation agent owns matching setup/interfaces/safety/runbooks and
state-labelled diagrams. Pipelines, ML jobs and app packaging remain separately
assigned writer work.

## 6. Checks actually executed, evidence and pending observations

| Check | Actual result / limit |
|---|---|
| Accepted-input integrity | **PASS**, Node/SHA-25616/16 frozen copies against manifest; parent live-source equality not recomputed. |
| Frozen design/pin/native/type/graph inspection | **COMPLETE with findings** above. Inherited publication/API facts, not new restore/compile or current module research. |
| Narrow official Firewall category check | **PASS** for public support/table facts only; Learn search then complete supported-logs page fetch, 8 November2026. No private source text sent. |
| Address/capacity/cost arithmetic | **PASS** using Python `ipaddress`/arithmetic, exit0; no external addressing/pricing/current quota evidence. |
| Local tools | **PASS availability inspection**: Node25.8.1, standalone Bicep0.43.8/help, repository HEAD equals supplied base; pre-existing dirty/untracked worktree observed and left alone. `sqlite3` binary exists but no authorised task-store connection/path/API was supplied. |
| Read diagnostics | Two initial additional range reads accidentally omitted `R2-review-inputs` in the path and returned file-not-found; corrected reads used the frozen paths. No moving workload source was substituted. One Learn search response exceeded inline size; inspected its returned tool-managed temporary result, then fetched the specific official page. No diagnostics hidden. |
| Candidate restore/build/lint/parameter/contract checks | **NOT RUN**: no authorised candidate/code exists; this assignment prohibits infrastructure generation. Available Bicep does not establish candidate success. |
| WV15–17 target availability/authenticated validation/replay what-if | **NOT RUN**, later separate scoped authority. No az command, login, account query or ARM validation. |
| WV18–22 deployment/private endpoint/TLS/RBAC/data arrival/alerts/platform fitness/closure | **NOT RUN**, later actual deployment and observation authority. Not prerequisites for completing this report. |
| Security/compliance certification and old blanket app-TLS/admission campaign | **NOT RUN / DEFERRED** under technical-PoC direction, no certification claim or finding converted to PASS. Targeted actual safety/applicability dispositions remain separate. |

Verified public source newly accessed:
[Supported logs for Microsoft.Network/azureFirewalls](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/supported-logs/microsoft-network-azurefirewalls-logs).
Inherited exact native schema/publication references and artifact digests are in
frozen F04-GO-r1 §§2–4/8; AVM parameters/defaults/role definitions and original
official technical register are in frozen F04-r1 §§3–8. Frozen r2 §9 records its
8 November DCRA/monitoring/VNet/subnet source checks; these are producer evidence,
not newly re-fetched or independently hashed official artifacts here.

Future availability/observations must establish actual full patch, AzureLinux3,
SKU/zone/services/offer/quota/names/network overlap; private API/registry login
and layer/vault DNS/TLS/access; real MI/DCR/DCRA collection and query validation;
node/add-on placement/requests/stability; exact managed resources/billing and
authorised closure. Unknowns do not license a fallback, broader grant, extra
resource, allocation retry loop or secret exposure. No live availability
observation is invented from public schemas, prices or historic quota20.

## 7. Offered handoff and stop

**Recipient:** coordinator, then infrastructure-tester, required scoped
specialists and documentation agent. Candidate evidence path is this report;
input revision is the exact manifest/copy hash set above. Coordinator arranges
tester-produced preservation of this stopped output, records its exact hash
and actual plan/approval decisions, and routes findings/escalation. No frozen
input or parallel tester report was edited. No release or recipient acceptance
is self-awarded.

Requested next action: accept/dispose the precise composition-plan proposals,
complete bounded required reviews/owner decisions against r2, and establish the
exact approved package/plan before assigning Bicep generation. If a material
defect needs a design change beyond plan acceptance, **escalate the exhausted
F03 author path**, not a sixth correction or renamed/reset loop.

**Stopped writing. WP001-F04-AVM4/5 consumed, 4 used / 1 remaining.**
No Bicep/parameters/manifests/workflows, Azure/auth/browser/model/data jobs,
nested agents, deployment, commit or push were performed. All other repository
and frozen paths remain read-only for this assignment.

Task-store SQL is **unavailable**, notwithstanding the installed sqlite3
executable: no task database interface/authorised target was provided. Intended
update only, **not applied**:

`UPDATE todos SET status='done' WHERE id='wp001-avm-feasibility';`
