# WP-001 technical foundation design — r2

**8 November 2026 · F03 author integration COMPLETE · NOT RELEASED.**
This is an implementable design proposal, not an independent PASS, design release,
permission to generate Bicep, or permission to access Azure or spend money.
Paired cost revision: [cost-estimate.md](cost-estimate.md) r2.

## 1. Accepted assignment and fixed evidence

Accepted `assignments/F03-technical-poc.md` and the current user's direction before
technical work. Sole writes are this file and the estimate. The coordinator owns
the actual plan, lifecycle ledger and scope-direction record; those moving outputs
were neither inspected nor changed. Published architecture/documentation remains
documenter-owned; the older documentation is not an explanation of r2 yet.

Input manifest:
`/Users/verboompj/.copilot/session-state/ea45f1eb-0d29-42dc-af7f-f9f5959f94f5/files/T001-inputs/manifest.json`.
All workload reads used its `files/<source-relative-path>` copies. Supplied base:
`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`. The assigned parent operator reports
23/23 current preserved source/copy pairs verified, Node v25.8.1/SHA-256,
T001 integrity initial 1/5 PASS. This author checked coverage/location and read
the copies, but has no shell/hash capability and did not independently recompute
that integrity verdict. AGENTS, team guide, assignment and the `ama-context`,
`ama-design-release`, `ama-handoff` skills were read first.

Inputs include design/cost r1, F04-r1, completed **F04-GO-r1** (usable despite its
task transport error), SEC01–12, CR01–13, the working definition, EP-r2/method
reports and prospective accounting disposition. Their original bytes/reports
remain preserved. Their previous verdicts do not extend to r2.

Classification HIGH; requested/default model **gpt-6.1-sol**, no fallback.
Actual runtime model **unknown**, no authoritative model field exposed.
Stable loop **WP001-F03-AUTHOR, final cycle 5/5 consumed: 5 used, 0 remaining**.
This is one coherent integration, not a restarted loop or independent review.

## 2. What the technical PoC now means

Outcome: a new, isolated **ARM foundation**, followed by local build/contract
validation and, only with separate authority, a short empirical foundation
deployment. At most three approved human devices. Public/synthetic business data
only; no estate reuse. No application, farmer journey, Foundry, Search, Azure ML,
model endpoint/job, workflow, business database, messaging or dataset acquisition.

The current direction suspends regulatory/compliance acceptance campaigns for this
technical PoC. It does **not** erase applicable law, contracts, corporate policy,
inherited MFA, data protection for administrator/telemetry records, or safe-use
boundaries. Deferred checks are **NOT RUN / DEFERRED**, never PASS.

Retain AKS **Standard mode and paid Standard tier**, two explicit Linux VMSS
pools, Azure CNI Overlay/Cilium, OIDC/Workload Identity, NAP off; private API,
private ACR Premium, empty private Key Vault Standard, VPN/private DNS, Firewall
Standard and NAT on FirewallSubnet. Retain ARM enablement of managed Gateway API,
application-routing Istio, KEDA, Azure Policy and Secrets Store CSI. No claim that
enablement implements signature verification or delivers a private application.

### Explicit amendments proposed for exact human approval

| Change from r1 / older planning | r2 proposal and consequence |
|---|---|
| Gateway/TLS bootstrap and no-Route campaign inside WP-001 | **Defer all Kubernetes bootstrap to a separately released app/runtime stage.** Keep managed Gateway ARM enablement, but no Gateway, Route, Service, TLS-sync, secret, app zone/record or internal LB now. No listener exists or is tested. Unknown no-Route serving does not block generating an AKS ARM resource |
| Mandatory admission/signature-engine and managed-image exception campaign | Suspend custom signing/verifier/admission installation for infra1. Only AKS-managed components run. No authored app/probe images admitted by this release. Later runtime owner must select/pin packaging, scan/admission controls before deploying such workloads |
| Firewall DNS proxy mandatory in the working definition | Select **Azure-provided VNet/node DNS, Firewall proxy off**, HTTPS application-FQDN filtering plus the narrow Monitor service-tag rule below. No network-rule FQDN filtering and no claim of DNS-proxy inspection/exfiltration prevention. Private zones remain linked. This is an explicit supported alternative identified in F04, not a stealth DNS replacement |
| Strict guarantee that every nested dependency has no secure key outputs | Permit the pinned workspace AVM's documented `@secure()` key outputs internally, **unused and not forwarded**. No project output/log may expose keys; local-auth is disabled. Secure metadata is not a plaintext leak or proof of tenant-safe deployment-history handling. Targeted review must confirm this disposition |
| Full HA, retention/legal signatures, continuous managed-build observer and mandatory renewal/legacy TLS drills | Suspend as technical PoC qualification gates; preserve documents and findings. Retain supported service TLS, safe credential handling, bounded resource inventory, limited telemetry and authorised cleanup |
| Predeployment guaranteed vendor-managed request inventory | Measure allocatable/request/placement/endpoint behaviour after deployment. No invented vendor default inventory or guaranteed application-fit result |

**Irreducible current release conflict:** FND-05 and AGENTS still require
non-author review and triggered trust/identity/exposure/secrets specialist inputs.
The accepted regulated path also requires the dedicated five-pillar architecture
report. r2 does not silently relabel that path standard or delete those reviews.
Coordinator must route a bounded technical report plus targeted safety/security
and compliance-applicability dispositions (not a regulatory certification campaign).
If the existing acceptance path still demands full regulatory signatures, the
human must explicitly decide the scope/path conflict. An author cannot waive it.

## 3. Scopes, resources, ownership and graph

One future **subscription-scope `infra/main.bicep`** composes resource-group modules.
Bicep, not a workflow, orders resources. No independently replayed network “patch”
root, deploymentScript, Helm provider or partial managed-cluster PUT.

New project RGs: `rg-ama-poc-sec-platform`, `rg-ama-poc-sec-aks`.
AKS creates/owns `rg-ama-poc-sec-aksnodes`; never precreate or directly manage it.
Regional resources and deployment metadata: `swedencentral`. DNS zones/action
group/activity alert metadata are global where required.

| Scope / owner boundary | Exact proposed resources / quantities |
|---|---|
| platform / identities | `id-ama-poc-sec-aks`, `id-ama-poc-sec-kubelet`: **2** user-assigned MIs; no TLS/app MI or FIC yet |
| platform / networking | `vnet-ama-poc-sec`; **7 exclusively child-owned subnets** below; `nsg-ama-poc-sec-system`, `nsg-ama-poc-sec-user`, `nsg-ama-poc-sec-ingress`; `rt-ama-poc-sec-aks` |
| platform / egress | `afwp-ama-poc-sec`, `afw-ama-poc-sec` Standard zone1; `nat-ama-poc-sec` Standard zone1; `pip-ama-poc-sec-{fw,nat,vpn}`: **3** Standard static regional IPv4s, FW/NAT zone1, VPN zones1/2/3 |
| platform / private access | `vgw-ama-poc-sec` VpnGw1AZ Generation1, active-standby certificate-only OpenVPN; `dnspr-ama-poc-sec`, inbound `inbound` at configured `10.83.2.68`; no outbound resolver/ruleset |
| platform / DNS | **3** zones: `privatelink.swedencentral.azmk8s.io`, `privatelink.azurecr.io`, `privatelink.vaultcore.azure.net`; link `link-ama-poc-sec` in each, registration false |
| platform / services | `acramapocsec001` Premium classic registry RBAC; `kv-ama-poc-sec-001` Standard RBAC, **empty**; two external PEs `pe-ama-poc-sec-acr`, `pe-ama-poc-sec-kv`, each zone-group `default`; group IDs `registry`, `vault` |
| platform / monitoring | `law-ama-poc-sec` PAYG Analytics, 31 days; `ag-ama-poc-sec-ops`, short name `amapoc`; log alerts `al-ama-poc-sec-node`, `al-ama-poc-sec-events`; activity alert `al-ama-poc-sec-failed-arm` |
| aks / compute | native complete `aks-ama-poc-sec`; inline pools `sys`, `usr`; native maintenance children `aksManagedAutoUpgradeSchedule`, `aksManagedNodeOSUpgradeSchedule` |
| aks / monitoring | DCR `MSCI-swedencentral-aks-ama-poc-sec`, cluster-extension DCRA `ContainerInsightsExtension`; native cluster diagnostic `diag-ama-poc-sec-aks` |
| platform / VPN diagnostics | native gateway-extension `diag-ama-poc-sec-vpn`; ACR/KV/Firewall diagnostics owned through their service AVM inputs |
| aksnodes / **AKS only** | VMSS, NICs, managed OS disks, API PE and supported generated add-on resources/identities. Baseline3 nodes/disks; steady max4; two-pool surge6. Managed names are not project fixed names |
| Kubernetes / **later runtime writer only** | Gateway/TLS-sync/policies/quotas/Routes/Services/probes: **0 authored objects now**. No app ILB/frontend/IP resource or app certificate |

Names are deterministic proposals, not globally reserved. Name collision or
corporate addressing conflict is a material parameter amendment, not a random
suffix/public alternative. Taggable project resources, cluster and both pools use
`environment=poc`, `workload=ama`, `workPackage=WP-001`, `owner=paverboo`,
`costCenter="10122"`. Untaggable subnets, links/zone groups, RBAC/diagnostic/DCRA/
maintenance children use named parent scope; no fictional tag inheritance.
AKS propagates supported cluster/pool tags to managed children; verify later,
do not mutate managed VMSS/PEs to “fix” them.

```text
main (subscription)
  -> two new RGs
  -> independent control-plane MI -> kubelet MI + MI Operator grant
  -> LAW / action group; PIPs -> NAT
  -> VNet (parent properties ONLY; no subnets input)
     -> exclusive early subnet child modules (FirewallSubnet includes NAT ID)
     -> zones + links and VNet/AKS-zone control-plane grants
     -> firewall policy -> firewall -> UDR -> exclusive final sys/usr subnets
     -> resolver / VPN (final subnet + PIP)
  -> ACR + AcrPull -> ACR PE/DNS; empty KV -> KV PE/DNS
  -> complete private AKS + both inline pools (final network/grants/workspace)
  -> maintenance + resource diagnostics + operator/observer grants
  -> DCR (LAW destination) -> DCRA (cluster scope)
  -> two log alerts + project-scoped failed-ARM alert
```

The VNet AVM **omits** its optional `subnets` input; do not pass `[]` as an inline
desired-state array or use its nested subnet deployments. Inspection of pin
0.10.2 shows parent properties contain no `subnets` property, and its optional
children are separate deployments. All seven subnets use pin0.2.0 exactly once.
Thus early subnet modules consume VNet/NAT, Firewall consumes the completed
FirewallSubnet, UDR consumes Firewall `privateIp`, and late node subnets consume
UDR/NSG outputs. No resource consumes its own descendant. Keep this ownership on
updates; no second parent/subnet author reasserts a conflicting subnet array.
Later what-if must verify a repeated root does not remove AKS/service-populated
subnet state. A detected destructive provider effect blocks replay; not a licence
for read/merge/write or unapproved workarounds.

## 4. Address, DNS, access and egress contract

| Purpose / child name | Fixed proposed address / association |
|---|---|
| VNet | `10.83.0.0/20`, IPv4; no peering, reused estate, hub attachment |
| `snet-aks-system` | `10.83.0.0/24`; system NSG + node UDR; defaultOutboundAccess=false at creation |
| `snet-aks-user` | `10.83.1.0/24`; user NSG + same UDR; defaultOutboundAccess=false |
| `snet-ingress` | `10.83.2.0/27`; ingress NSG, reserved future private frontend `10.83.2.10`, **not allocated now** |
| `snet-private-endpoints` | `10.83.2.32/27`; PE network policies Disabled; no NSG/UDR/service endpoint |
| `snet-dns-inbound` | `10.83.2.64/28`; dedicated delegation `Microsoft.Network/dnsResolvers`; configured static IP `10.83.2.68`; no NSG/UDR |
| `GatewaySubnet` | `10.83.3.0/27`; no NSG/UDR/NAT, BGP route propagation preserved |
| `AzureFirewallSubnet` | `10.83.4.0/26`; NAT association only, no NSG/default UDR |
| Overlay pods / services / cluster DNS | `172.25.0.0/20` / `172.26.0.0/24` / `172.26.0.10` |
| VPN clients | `172.27.83.0/27`, at most3 individually issued device certificates |

Local arithmetic shows the ranges disjoint and within VNet; external network/
home LAN/Docker/VPN overlap is **not checked**. Requesting user/network owner
approves allocation/overlap before exact design release.

VNet DNS is Azure-provided (`dnsServers` omitted); Firewall policy
`enableProxy=false`, `servers` omitted (Azure upstream). Node private AKS/ACR/KV
names resolve through linked zones. VPN client profile/device split DNS explicitly
uses resolver `10.83.2.68` over TCP/UDP53, routes `10.83.0.0/20` through OpenVPN,
and resolves service private CNAME chains for the three zones. No client route to
Overlay/service CIDRs, no full-tunnel Internet route, no direct client use of
`168.63.129.16`. Device DNS/secure-DNS conflict resolution is an authorised human
bootstrap task, not an ARM output guarantee.

Approved device -> encrypted VPN -> resolver/private AKS API443 -> Entra AKS RBAC.
ACR login **and regional layer/data endpoints** and KV URI use their PEs443;
zone groups own those records, AKS owns its API record/PE. No public fallback,
registry password, admin kubeconfig, command-invoke bypass or certificate-check
disablement. ARM/Entra management remains public HTTPS with inherited MFA/
activation, separate from private data-plane reachability. VPN certificate auth
is not MFA and does not grant AKS, ACR or vault permissions.

### Fixed firewall inventory (not “fill in current dependencies later”)

Sources for every collection: `10.83.0.0/24`, `10.83.1.0/24` (Overlay internet
traffic is node-SNATed). Rule group `rcg-ama-poc-sec-aks`, priority200:

| Collection / priority / action | Exact destination and protocol |
|---|---|
| `monitor-network` /100 /Allow, network | destination service tag `AzureMonitor`, TCP443 only. Documented Monitor network requirement; shared Azure Monitor reach, **not workspace-only** |
| `aks-platform` /200 /Allow, application | FQDN tag `AzureKubernetesService`, HTTPS443 only |
| `aks-explicit` /210 /Allow, application | `mcr.microsoft.com`, `*.data.mcr.microsoft.com`, `mcr-0001.mcr-msedge.net`, `management.azure.com`, `login.microsoftonline.com`, `packages.microsoft.com`, `acs-mirror.azureedge.net`, `packages.aks.azure.com`; HTTPS443 |
| `monitor-explicit` /220 /Allow, application | `*.ods.opinsights.azure.com`, `*.oms.opinsights.azure.com`, `dc.services.visualstudio.com`, `*.monitoring.azure.com`, `global.handler.control.monitor.azure.com`, `swedencentral.handler.control.monitor.azure.com`, `*.ingest.monitor.azure.com`; HTTPS443 |

No DNAT, generic Internet or `*.azure.com` allow, public-control-plane
UDP1194/TCP9000, NTP123 for these newly provisioned nodes, Ubuntu/Windows/GPU
rules, app/model/Copernicus egress, Prometheus metrics ingestion or Application
Insights autoinstrumentation endpoint. CSI accesses the private vault, not public
`vault.azure.net`. No FQDN network rules requiring DNS proxy. Policy threat
intelligence Deny; Policy Analytics, TLS decryption, IDPS/prescaling off.
Node UDR: `0.0.0.0/0`, VirtualAppliance, actual Firewall `privateIp`; BGP route
propagation not disabled. Firewall's NAT handles SNAT; keep its required own PIP.
Private VNet/PE traffic and Azure platform DNS/IMDS/fabric paths do not traverse
this default Internet route. No claim these are controlled by Firewall.

NSGs on both node subnets: retain Azure default VNet/LB/internal rules, no
unsupported intra-cluster blocking; add inbound TCP22 deny from Any priority4000.
Reserved ingress NSG allows VPN pool TCP443 priority100, denies other inbound
Any/Any priority4000 ahead of defaults. No frontend yet. No namespace policies
are authored now; later runtime writer must establish default-deny namespace
policies and resource quotas before admitting workloads. Cilium dataplane alone
is not a default-deny policy or host firewall.

Residuals needing targeted safety review: allowed shared service domains/tag are
not tenant/content allowlists; platform DNS bypasses inspection; managed add-ons
change independently; no app admission stack yet. These do not authorise arbitrary
workloads. Measure missing required dependencies later from provider errors/logs;
do not widen rules automatically. Material missing destinations return to the
coordinator for an approved design amendment; F03 author budget is exhausted.

## 5. Exact managed-cluster and VPN native contracts

F04-GO-r1 verified published AKS0.14.0 and VPN0.12.0 lack the chosen fields.
Use its narrow complete-native proposals, **not another compatibility hunt**.
Native exceptions require human approval of exact r2, as do extension gaps below.

### AKS — one owner, `Microsoft.ContainerService/managedClusters@2026-03-01`

| Property / type | Explicit selected value |
|---|---|
| sku.name/tier, supportPlan | `Base` / `Standard`, `KubernetesOfficial` |
| kubernetesVersion:string | **`1.36.4`** proposal; same explicit patch for both pools; no latest/default substitution |
| nodeProvisioningProfile.mode | `Manual` (NAP off) |
| identity | UserAssigned, map keyed only by control-plane MI resourceId |
| identityProfile.kubeletidentity | resourceId/clientId/objectId from kubelet MI outputs |
| nodeResourceGroup:string | `rg-ama-poc-sec-aksnodes` |
| enableRBAC / disableLocalAccounts | true / true |
| aadProfile | managed=true, enableAzureRBAC=true, tenantID=approved input |
| apiServerAccessProfile | enablePrivateCluster=true, enablePrivateClusterPublicFQDN=false, privateDNSZone=actual custom zone ID, enableVnetIntegration=false |
| publicNetworkAccess | Disabled |
| networkProfile | azure / overlay / cilium dataplane and policy, IPv4, standard LB SKU, userDefinedRouting; explicit podCidr/serviceCidr/dnsServiceIP above |
| oidcIssuerProfile.enabled / securityProfile.workloadIdentity.enabled | true / true |
| ingressProfile.gatewayAPI.installation | Standard |
| ingressProfile.webAppRouting.gatewayAPIImplementations.appRoutingIstio.mode | Enabled; **omit legacy enabled/nginx/dnsZoneResourceIds**, omit serviceMeshProfile |
| workloadAutoScalerProfile.keda.enabled | true |
| addonProfiles.azurepolicy.enabled | true; no tenant policy assignments created |
| addonProfiles.azureKeyvaultSecretsProvider | enabled=true, string config enableSecretRotation='true', rotationPollInterval='2m'; no granted secret or SecretProviderClass |
| addonProfiles.omsagent | enabled=true; string config logAnalyticsWorkspaceResourceID=LAW ID, useAADAuth='true' |
| autoUpgradeProfile | upgradeChannel=patch, nodeOSUpgradeChannel=NodeImage |
| storageProfile | disk/file/blob/snapshot CSI enabled=false individually; no PVC/data disk |
| unused features | no mesh/NGINX/AGIC/OSM/Flux/Defender/cost analysis/AI toolchain/managed Prometheus/autoinstrumentation; no NAT profile/outbound LB profile/static-egress/pod subnet |
| linuxProfile | adminUsername=`azureuser`; SSH public key input only; private keys/passwords prohibited, SSH network deny retained |

Both **inline** agentPoolProfiles (no second agent-pool resource writer):

| Native pool field | sys | usr |
|---|---|---|
| mode / vmSize | System / Standard_D4as_v5 | User / Standard_D2as_v5 |
| type / osType / osSKU / scaleSetPriority | VirtualMachineScaleSets / Linux / AzureLinux3 / Regular | same |
| count / minCount / maxCount / enableAutoScaling | 2 /2 /2 /true | 1 /1 /2 /true |
| vnetSubnetID | final sys subnet output | final usr subnet output |
| availabilityZones / maxPods / enableNodePublicIP | ['1'] /50 /false | same |
| osDiskType / osDiskSizeGB | Managed /128 | same |
| nodeTaints / nodeLabels | ['CriticalAddonsOnly=true:NoSchedule'] / {workload:'system'} | [] / {workload:'user'} |
| orchestratorVersion / tags | explicit patch / agreed tags | same |
| upgradeSettings | maxSurge:string='1', drainTimeoutInMinutes:int=30, nodeSoakDurationInMinutes:int=5 | same |

There is no native `osDiskSku` input. Cost conservatively assumes P10 Premium_LRS
backing; observed disk SKU must reconcile that assumption. No Spot/GPU/reservation/
host group/extra pool. Normal total10vCPU, max12, simultaneous pool surge18,
3/4/6 nodes/disks. Overlay16 per-node /24 blocks cover six. Historical regional
and DASv5 quotas20 are separate limits, not40; fresh quota/availability still due.

Maintenance children API `2025-10-01`: each uses maintenanceWindow with
schedule.weekly intervalWeeks=1/dayOfWeek=Saturday, durationHours=4,
utcOffset='+00:00', startTime='06:00', no notAllowedDates. These windows are
planning preferences, not a guarantee against managed/security updates.
Live autoscaled count must not be casually reset by replaying an initial-count
template; future updates require inspected what-if and count reconciliation.

### VPN — one owner, `Microsoft.Network/virtualNetworkGateways@2025-01-01`

Complete resource properties: gatewayType=Vpn, vpnType=RouteBased,
vpnGatewayGeneration=Generation1, sku.name/tier=VpnGw1AZ,
activeActive=false, enableBgp=false, disableIPSecReplayProtection=false,
allowVirtualWanTraffic=false, allowRemoteVnetTraffic=false.
Exactly one ipConfigurations entry `default`: privateIPAllocationMethod=Dynamic,
subnet.id=GatewaySubnet output, publicIPAddress.id=dedicated VPN PIP output.

vpnClientConfiguration: vpnClientAddressPool.addressPrefixes=['172.27.83.0/27'],
vpnClientProtocols=['OpenVPN'], vpnAuthenticationTypes=['Certificate'].
Trusted roots are a full typed array of `{name:string,publicCertData:string}`,
mapped to each native entry's properties.publicCertData (continuous Base64 X.509
public CER only). Revocations are a full array of `{name:string,thumbprint:string}`,
mapped to properties.thumbprint; unique names/thumbprints, retain **all** revoked
clients on each update. No fake AAD/RADIUS/SSTP/IKEv2, S2S/VNet connection, BGP,
NAT rule, local gateway or credential output.

Requesting user holds encrypted offline CA/client private keys and issuance/
revocation inventory; public roots/SSH keys are the only certificate/key inputs.
At most three individually revocable devices. Proposed client certificate validity
90 days, manual expiry review before access; no renewal test campaign. Root/key
generation, VPN profile installation and revocation are separately authorised
human operations. An expired/revoked/unknown client is not allowed by “PoC”.

## 6. Future files, pins, defaults and typed interfaces

These are **future files**, not generated infrastructure or an accepted actual
implementation plan. Coordinator records the actual scoped plan before release.
Bicep engineer owns all infrastructure files and author-side contract tests;
tester owns independent acceptance files. No app/ML writer work is initiated.

| Future file / scope | Required logical inputs -> nonsecret outputs |
|---|---|
| `infra/main.bicep` / subscription | approved context/parameters below -> `foundation:FoundationInterfacesV2` |
| `infra/environments/poc.bicepparam` | fixed public configuration only; protected-context nonsecret IDs/contacts supplied locally, no sample credentials |
| `infra/modules/connectivity.bicep` / platform RG | location/tags, controlPlanePrincipalId:string, AddressPlan, VpnRoot[], RevokedClient[] -> vnetId:string, subnetIds:SubnetIds, zoneIds:ZoneIds, firewallPrivateIp:string, natPublicIp:string, vpnGatewayId:string, vpnPublicIp:string, dnsResolverId:string, dnsInboundConfiguredIp:string |
| `infra/modules/services.bicep` / platform RG | location/tags, tenantId:string, peSubnetId:string, acrZoneId:string, vaultZoneId:string, kubeletPrincipalId:string -> registryId:string, loginServer:string, vaultId:string, vaultUri:string, privateEndpointIds:string[] |
| `infra/modules/identities.bicep` / platform RG | location/tags -> controlPlane and kubelet each {resourceId:string,principalId:string,clientId:string}; MI Operator grant is on kubelet using independently created control-plane principal |
| `infra/modules/monitoring-base.bicep` / platform RG | location/tags, observerPrincipalId:string, alertEmail:string -> workspaceResourceId:string, workspaceGuid:string, actionGroupId:string |
| `infra/modules/aks.bicep` / aks RG | location/tags, tenantId:string, version:string, sshPublicKey:string, SubnetIds, aksZoneId:string, MI objects, workspaceResourceId:string -> resourceId:string, name:string, privateFqdn:string, oidcIssuerUrl:string, nodeResourceGroupId:string, poolIds:string[], controlPlanePrincipalId:string |
| `infra/modules/monitoring-cluster.bicep` / aks RG | clusterId:string, workspaceResourceId:string, location/tags -> dcrId:string, associationId:string; no separate cluster update |
| `infra/modules/access-and-alerts.bicep` / platform/aks scoped modules | clusterId:string, workspaceResourceId:string, actionGroupId:string, operatorPrincipalId:string, observerPrincipalId:string -> roleAssignmentIds:string[], alertIds:string[]; extension ownership scoped to actual targets |
| `infra/tests/contracts.test.*` / author local tests | compiled templates + synthetic nonsecret parameter fixture -> local assertions/results; runner/tool pin accepted in actual plan |
| `tests/acceptance/wp001-*` / tester | independent fixed-candidate assertions and later observations, exact commands/runner in tester-owned plan |

Root inputs: `tenantId:string`, `operatorPrincipalId:string`,
`observerPrincipalId:string`, `sshPublicKey:string`, `alertEmail:string`,
`vpnRoots:VpnRoot[]`, `vpnRevokedClients:RevokedClient[]` (default[] only for
genuinely empty approved revocation inventory). No real GUID, key or contact is
invented. Approved context file remains protected, not committed with identities/
contacts unnecessarily. `location:string='swedencentral'`,
`kubernetesVersion:string='1.36.4'`, fixed names/address/tags above are selected
configuration; changes are not unreviewed variants. No public/private flag,
disableSafety switch, reuse ID or arbitrary roleAssignment array.

Types: AddressPlan contains only the ten named CIDR/IP strings in §4;
SubnetIds contains system/user/ingress/privateEndpoints/dnsInbound/gateway/firewall
strings; ZoneIds contains aks/acr/vault strings; VpnRoot and RevokedClient as §5.
FoundationInterfacesV2 contains only RG IDs, cluster/pool/node-RG IDs, vnet/
subnet/zone/PE IDs, registry login server, vault URI, privateFqdn, exact OIDC issuer,
identity IDs, workspace/DCR/action-group IDs and configured resolver IP.
Never outputs kubeconfig, connection strings, keys, tokens, private certificates,
workspace secure outputs or VPN profile. Configured resolver IP is **not an
observed address**. AKS issuer is actual properties.oidcIssuerProfile.issuerURL;
private FQDN actual properties.privateFQDN; node RG/pool IDs derived from approved
scope/names, not claimed AVM outputs.

### Pinned published modules to retain

Every reference below has prefix **`br/public:avm/res/`**. F04-r1 verifies published
contracts; F04-GO-r1 supplies native gap proposals. This author did not repeat OCI
downloads/version selection. Logical boundaries group real ownership, not one
pass-through wrapper per resource.

| Path:version | Explicit defaults/consumer decisions |
|---|---|
| resources/resource-group:0.4.4 | two RGs only; API2025-04-01 |
| network/virtual-network:0.10.2 | API2025-05-01; addressPrefixes fixed, subnets omitted, dnsServers omitted, no peering/DDoS/encryption/IPAM/locks |
| network/virtual-network/subnet:0.2.0 | API2025-05-01; all7 exclusive children; exact associations/delegation above, no serviceEndpoints |
| network/network-security-group:0.5.4 | API2025-09-01; securityRules above, flushConnection=false |
| network/route-table:0.5.0 | API2024-07-01; default route actual firewall privateIp, disableBgpRoutePropagation=false |
| network/public-ip-address:0.13.0 | API2025-01-01; Standard/Regional/Static/IPv4; zones overridden explicitly |
| network/nat-gateway:2.1.1 | API2025-05-01; natGatewaySku=Standard, availabilityZone:int=1, publicIpResourceIds=[NAT PIP], idleTimeoutInMinutes=5; no auto-created PIP/prefix |
| network/firewall-policy:0.3.6 | API2024-10-01; tier Standard, proxy off, threatIntelMode Deny, exact collections §4, insightsIsEnabled=false; no base policy/analytics |
| network/azure-firewall:0.11.1 | API2025-05-01; azureSkuTier Standard, virtualNetworkResourceId, existing publicIPResourceID, firewallPolicyId, zones['1']; consume **privateIp**, no extra PIP/management NIC |
| network/dns-resolver:0.5.8 | API2025-05-01; one static inbound endpoint and outboundEndpoints=[]; output inboundEndpointsObject gives names/IDs, **not IP** |
| network/private-dns-zone:0.8.1 | zones/records2020-06-01, links2024-06-01; three links, registration false, no app record |
| network/private-endpoint:0.12.1 | API2025-05-01; external sole owner of2 PEs/groups; service AVM privateEndpoints omitted |
| container-registry/registry:0.13.1 | main **2025-06-01-preview**; acrSku Premium; roleAssignmentMode LegacyRegistryPermissions; acrAdminUserEnabled/anonymousPullEnabled=false; publicNetworkAccess Disabled, networkRuleBypassOptions None, networkRuleSetDefaultAction Deny, networkRuleSetIpRules=[]; dataEndpointEnabled=true, retentionPolicyStatus=disabled (retain digest artifacts until explicit cleanup), zoneRedundancy=Disabled; export/quarantine/trust/softDelete policy disabled, no replicas/tasks/cache/tokens/CMK |
| key-vault/vault:0.14.2 | API2026-02-01; sku standard, enableRbacAuthorization=true, public Disabled, networkAcls bypass None/default Deny/empty IP+VNet rules; softDeleteRetentionInDays=7, purge protection true; enableVaultForDeployment/TemplateDeployment/DiskEncryption=false; no secrets/keys/certificates; consume **uri**, expose logical vaultUri |
| managed-identity/user-assigned-identity:0.6.0 | API2024-11-30; two independent MIs, no FIC |
| operational-insights/workspace:0.16.1 | API2025-07-01; PerGB2018, dataRetention=31, dailyQuotaGb:string='1', ingestion/query Enabled, features.disableLocalAuth=true, forceCmkForQuery=false; no Sentinel/export/replication/linked storage/gallery solution. Consume resourceId/logAnalyticsWorkspaceId only; secure key outputs unused |
| insights/data-collection-rule:0.11.0 | API2024-03-11; dataCollectionRuleProperties kind Linux, exact ContainerInsights extension below |
| insights/action-group:0.8.0 | **2024-10-01-preview**, global; one protected email receiver/common schema, no SMS/voice/webhook |
| insights/scheduled-query-rule:0.6.0 | **2025-01-01-preview**; two rules, criterias (not criteria input), scopes=[workspaceId], skipQueryValidation=false |
| insights/activity-log-alert:0.4.2 | API2020-10-01, global; scopes exactly two new RG IDs, Administrative/Error conditions; no subscription-wide default |

Set `enableTelemetry=false` where supported on every direct AVM invocation.
Pinned nested dependencies remain the published artifact; don't fork silently.
Not used: AKS/VPN top-level AVMs, generic subscription diagnostic-setting AVM,
budget AVM, FIC module, standalone resolver child (nested owner already exists),
subscription/RG-wide RBAC substitute, internal LB module.

Other narrow native exceptions: DCRA
`Microsoft.Insights/dataCollectionRuleAssociations@2023-03-11` at existing cluster;
role-assignment extensions `Microsoft.Authorization/roleAssignments@2022-04-01`
for native cluster roles; resource diagnostics
`Microsoft.Insights/diagnosticSettings@2021-05-01-preview` at native AKS/VPN.
Use service AVM `roleAssignments`/`diagnosticSettings` elsewhere. No second
collector or cluster PUT. Actual published preview APIs above are proposed
accepted for this disposable technical experiment, **not approved or certified**;
targeted support/policy review and human approval still required.

## 7. Identities, telemetry and minimum safe operations

| Principal | Exact role/scope and responsibility |
|---|---|
| Authorised human bootstrap/operator (requesting user; effective principal later) | existing approved RG-create authority at subscription and constrained RBAC administration for **new RGs only**, not newly created standing subscription Owner. Contributor on new project RGs for deployment; no direct node-VMSS repair |
| Control-plane MI | Network Contributor at dedicated VNet; Private DNS Zone Contributor at AKS zone; Managed Identity Operator at kubelet MI. Complete these grants/links before AKS |
| Kubelet MI | AcrPull at this ACR; no push, vault, model/data rights |
| Operator principal | AKS Cluster User Role + AKS RBAC Reader at cluster for private authenticated node/pod observations. Cluster Admin is **not granted by infra1**; later bootstrap requires separately approved time-bounded grant |
| Observer principal | same cluster credential-retrieval/Reader pair plus Log Analytics Reader at workspace; no secret values, mutation or continuous raw-manifest guarantee |
| Monitoring | current official guidance: Container Insights uses cluster MI; **no Monitoring Metrics Publisher grant required** with useAADAuth=true. Do not add the retired legacy role or workspace-key authentication |
| Image publisher / certificate custodian / workload MI | no foundation data-plane write/secret/federation grant; later runtime stage defines these before use |

RoleAssignments are fixed built-in role names above, mapped to their official role
definition IDs by the writer and independently asserted; no arbitrary custom-role
input/broader scope accepted. Names are role contracts, not assertions that actual
permissions/PIM/MFA or RBAC propagation exist. Read-only private observation needs
both Azure credential retrieval and Kubernetes reader permissions.

### One Container Insights collection owner

monitoring-cluster owns one DCR in AKS RG, and one DCRA at cluster. DCR kind=Linux;
dataSources.extensions has one `ContainerInsightsExtension`, extensionName
`ContainerInsights`; extensionSettings.dataCollectionSettings:
interval='1m', namespaceFilteringMode='Off', namespaces=[], enableContainerLogV2=true.
Selected **individual streams**, identically in extension and one dataFlow:
Microsoft-KubeNodeInventory, Microsoft-KubePodInventory, Microsoft-KubeEvents,
Microsoft-KubeMonAgentEvents, Microsoft-Perf. Destination logAnalytics name
`ciworkspace`, workspaceResourceId actual LAW output; dataFlows destinations
['ciworkspace'], no transform. Tables: KubeNodeInventory, KubePodInventory,
KubeEvents, KubeMonAgentEvents, Perf. No default group stream, ContainerLog/V2
stdout, syslog, high-scale/Retina, Prometheus, DCE/AMPLS or duplicate onboarding.
One interval applies to inventory/performance; events are event-driven, not a
separate fabricated sampling interval. The retained enableContainerLogV2 setting
does not collect stdout when its stream is absent.

Managed monitoring ARM enablement references the workspace; DCR need not modify
AKS. Do not run CLI/portal auto-onboarding or the sample's partial cluster update,
which would introduce a second writer/default collector. DCRA
properties.dataCollectionRuleId=actual DCR ID; no endpoint association.

Diagnostics to same LAW, destination type Dedicated where supported:
AKS `kube-audit-admin`, `cluster-autoscaler`;
ACR `ContainerRegistryLoginEvents`, `ContainerRegistryRepositoryEvents`;
KV `AuditEvent`; Firewall `AzureFirewallApplicationRule`,
`AzureFirewallNetworkRule`; VPN `GatewayDiagnosticLog`, `P2SDiagnosticLog`.
No allLogs default, DNS-proxy log, controller/debug/request-body campaign or
subscription Activity Log export. AKS resource-specific logs use AKSAuditAdmin/
AKSControlPlane; legacy named Firewall/VPN categories remain AzureDiagnostics;
ACR/KV use their resource-specific service tables. A category unsupported in the
actual target must be reported, not silently replaced with allLogs.
Native Activity Log remains platform-retained90 days; inspect only project events.
No claimed RG filter on subscription diagnostic export; none is deployed.

Two log alert contracts (KQL below is a proposed query, **not executed**):

* Node: PT5M evaluation/PT10M window, Count >0, failing periods2 of2, severity2.
  Latest inventory per node whose status is not Ready; not a no-data detector.
  Query substitutes the actual cluster ARM ID as a nonsecret literal:
  `KubeNodeInventory | where TimeGenerated > ago(10m) | where _ResourceId =~ '<clusterId>' | summarize arg_max(TimeGenerated, Status) by Computer | where Status !~ 'Ready'`.
* Events: PT5M/PT10M, Count >0, failing periods1 of1, severity2:
  `KubeEvents | where TimeGenerated > ago(10m) | where _ResourceId =~ '<clusterId>' | where KubeEventType == 'Warning' and Reason in ('FailedScheduling','Failed','BackOff','FailedMount') | project TimeGenerated, Reason`.
* Both: enabled=true, autoMitigate=true, actions.actionGroups=[actual actionGroupId],
  no dimensions/fanout, skipQueryValidation=false. Query/category validation is
  later Azure work; local fixture/schema tests establish only authored semantics.
* Failed-ARM activity alert: scopes=[platformRgId,aksRgId], conditions category
  Administrative and level Error, enabled=true, common-schema email action.
  No subscription-wide health/privacy claim. Broader service health watched
  manually by owner; no extra resource provisioned.

Requesting user is response owner: review costs/ingestion and recent inventory at
campaign start/end and daily if extended; missing telemetry is NOT RUN/defect,
not healthy. Proposed live target: inventory visible within15 min after stable
cluster readiness, email receiver test within15 min; record actual latency.
Manually note/suppress expected stopped-state noise with authorised alert changes;
no automatic “expectedRunning” registry or continuous observer framework.
LAW cap1GB/day can overshoot/drop data and does not cap spend. Retention31 days,
no extension/export/WORM/backup service. Protected local minimised campaign
summary proposed retention30 days then owner review/deletion unless lawful hold.
Administrator IDs/IPs/contacts/telemetry remain restricted, never public fixtures.

### Capacity and lifecycle — empirical, not a compliance campaign

Managed requests/replicas/builds are unknown until provisioning. Proposed
technical observation: within30 minutes after AKS reports Succeeded/Running,
3 intended nodes Ready and managed pods Running/Ready (completed Jobs allowed);
then 30 minutes stable with no OOM, pressure or unschedulable managed pods.
Record actual allocatable, effective requests (init/sidecars/DaemonSets), eligible
placements, pod slots, OS-disk usage and resource counts. No guessed CPU reserve
or platform request cap4CPU/10GiB carried from r1. No app capacity threshold.
If the footprint does not fit, the observation FAILS; do not enlarge or remove
controls automatically. Autoscale/upgrade bounds are configuration, not a vendor
guarantee of transient inventory.

Baseline target is one contiguous finite campaign, **not daily stop/start**.
Stopping AKS can leave network, registry, disks/telemetry billing. Reallocation
is not assured; API PE/IP/DNS may change. Stop/start, upgrade and rebuild drills
are deferred, optional separately authorised engineering work—not a mandatory
TLS qualification sequence. No production SLO/RTO/RPO approved. Configuration
is reconstructible from released IaC/parameters; no business state/PVC backup
claim. A future manual rebuild must be separately costed/approved if needed.

Cleanup requires actual owner authority: retain minimised approved evidence,
revoke device access, delete AKS through managed owner, confirm managed RG cleanup,
then remove only new platform resources and relevant role assignments; remove
device VPN/trust materials. Never delete estate, disable policy, purge vault
early or assume RG deletion erases Microsoft/platform records. Purge-protected
vault name remains unavailable during soft-delete retention; plan residual checks
and retained LAW charges, no fiction of zero cost at AKS stop.

## 8. Minimal acceptance matrix and finding dispositions

All targets below are **proposed for human approval**; all executable checks are
currently NOT RUN. “Author integrated” is not a reviewer finding closure.

| ID / earliest gate | Criterion / exact evidence | Responsible next owner / WV |
|---|---|---|
| T01 / design-released | fixed r2 design/cost snapshot; full graph/types/defaults/exclusions; F04 native exceptions and §2 amendments explicitly approved; external address allocation/overlap disposition | tester preservation/non-author report, targeted specialists, requesting user; WV01–03 |
| T02 / design-released | actual file/dependency/test plan accepted by architect/writer; required dedicated five-pillar report and targeted safety/applicability dispositions; genuine human exact-revision approval | coordinator/assigned reviewers/user; WV02–04 |
| T03 / locally-validated | restore exact pins; build root and typed parameter fixture; lint with classified warnings; no floating versions/duplicate resource owners/cycles; no insecure values or project secret outputs | bicep author, independent tester; WV05–08/11 |
| T04 / locally-validated | compiled graph asserts two RGs, private AKS/ACR/KV; complete AKS/VPN contracts, pools/NAP/WI/Cilium, seven child subnets, firewall/NAT/UDR/DNS, three zones/two customer PEs, no app/LB/bootstrap/FIC/business services | tester; WV09–13 |
| T05 / locally-validated | exact grants/scopes/tag exceptions; DCR streams/DCRA scope/categories/queries/default overrides; secure nested output unused; matching docs and author conformance | tester/safety reviewers/documenter/architect; WV08–14 |
| T06 / deployment-ready | confirmed real target/identity/MFA/permissions/offer/funding/expiry; fresh full patch1.36.4/AzureLinux3/SKU/zone/service/quotas/names; external network/device permission; public rates refreshed or owner accepts uncertainty | authorised user/operator, tester; WV15 |
| T07 / deployment-ready | authorised validate + inspected what-if of exact root/params, including reapply ownership effects; no old-estate modifications/deletions; approved finite hours/spend/closure and exact deployment authority | tester/user; WV16–17 |
| T08 / operationally-verified | actual deployment/resource record; private API trusted TLS≥1.2+Entra read path over VPN; ACR login/layer+KV private DNS/reachability; no public fallback or unintended app frontend | tester/authorised operator; WV18–20 applicable foundation subset |
| T09 / operationally-verified | empirical readiness/stability/capacity observations §7; current MI/DCR association/data arrival; action group test received; record category/query/latency failures honestly | tester/operations user; WV20–21 |
| T10 / operationally-verified | funded campaign ends; authorised cleanup or named funded retention decision; residual inventory/cost record and protected evidence limitations | operator/tester/budget user; scoped WV22 |

Later Azure checks T06–10 do not block local candidate solely for being later.
Known design/compiled contract defects still block their current gates. No actual
GUIDs, paid offer guarantee or runtime manifest inventory is invented for T01.
No regulatory compliance verdict, model/app test, app TLS certificate/listener,
SSLv3/1.0/1.1 proof, renewal test, perpetual managed build qualification, HA drill
or raw managed-manifest guarantee is awarded by these criteria.

| Preserved finding / requirement | r2 author disposition (reviewer closure NOT claimed) / later owner |
|---|---|
| F04-01/02 | integrate verified **complete-native** AKS2026-03-01/VPN2025-01-01; retained Gateway ARM fields/certificate arrays; exact exception approval pending |
| F04-03 | remove vendor-inventory guarantee/guessed request caps; T04 local known configuration, T09 measured platform fitness; tester owns actual results |
| F04-04 | fixed §4 destinations and single Azure-DNS/application-rule story; material DNS amendment approval + targeted review pending; live endpoint/egress observations later |
| F04-05 | single DCR/DCRA, exact streams/interval/queries/categories, no subscription export, current MI authentication; tester validates real tables/query behaviour later |
| F04-06 / SEC10 signature engine | DEFER custom signature/admission campaign; managed enablement only, no authored workloads. Later runtime writer/security owner selects/pins controls before app/probe admission |
| F04-06 Gateway minimum / SEC03 | supported service TLS≥1.2 retained; Gateway listener/CA/CSI sync/renewal/legacy tests DEFERRED to app/runtime release. No unknown no-Route contract blocks infra1 |
| F04-07 | consume vault **uri**, Firewall **privateIp**, actual native issuerURL; derive node/pool IDs; resolver IP explicitly configured; exclusive subnet children; no premature FIC |
| F04-08 | explicit ACR/KV/LAW/add-on/default/preview dispositions §6, secure nested key output unused; targeted review/human acceptance pending |
| F04-09 | NOT RUN later target availability, not schema proof |
| EP-r2 N-01/N-02/N-03 | continuous observer/fresh-final-TLS/legacy attribution campaign **suspended** in infra1; preserve method/report. Runtime owner/tester revisits only if that later test scope is selected |
| EP-r2 N-04 | no authored probe Job, so old probe-containment test DEFERRED; actual future probe still requires finite deadline/no retry/least privilege and authorised sources |
| EP-r2 N-05 | retain procedural separation/single-human and historical-only limits. No independent or continuing-use assurance from author or one campaign |
| SEC01/02/04–08/12 | retained minimum estate/data/private management/least privilege/WI/credential/egress/scope controls; application authentication/federation/namespaces remain later, not silently satisfied |
| SEC09/11, D-MON/D-HA | reduced actionable telemetry/manual closure; no HA/production retention/recovery campaign. Requesting user must approve material baseline deviations; ordinary safe operations remain |
| CR01/05/07 | retain bounded data/identity/scope and safe fixture handling; no public personal/credential material |
| CR02–04/06/08–09/12 | regulatory signature/control acceptance campaign DEFERRED as requested; retain unresolved real privacy/entity/contract applicability. Actual processing permission, inherited policy and funded offer authority still must exist before use. No legal exemption or account eligibility declared |
| CR10/11/13; AI01–06/ML01–08 | future CAP/AI/accessibility/eID/app/model obligations preserved; NOT APPLICABLE to delivered ARM-only foundation, not PASS for later workloads |

## 9. Five-pillar author assessment and release handoff

| Pillar | Measurable technical target / trade-off |
|---|---|
| Reliability | three-node readiness/stability observed30+30min, bounded config/rebuild inputs; single-zone sys2/usr1, FW/NAT1 means no end-to-end HA/SLA or approved recovery deadline |
| Security | private management/data planes, no secret outputs/auth fallback/estate changes, fixed roles/egress; shared-domain/DNS/managed-change/certificate-device residuals require targeted review, not blanket certification |
| Cost Optimization | full selected footprint + finite campaign/closure/residual formula; no daily-stop savings promise/credit deduction; hours/budget/rates approved separately |
| Operational Excellence | one collector, two actionable log alerts, project failed-ARM notification, current MI auth, named human daily/closure duties; no full observability stack/continuous manifest observer |
| Performance Efficiency | 10/12/18vCPU configuration and live allocatable/scheduling evidence, no invented reserve or app-fit SLO; missing capacity causes technical FAIL/stop, not automatic resize |

This table is author reasoning, **not** the required dedicated non-author report.
Release is **BLOCKED**, integration delivery is complete. Remaining design-release
work is concrete: parent/tester preserve these stopped outputs; independent bounded
technical/five-pillar and targeted safety/applicability checks on those exact bytes;
resolve scope/path and explicit amendments/native/preview/output dispositions;
confirm network allocation; accept the actual implementation/test plan; requesting
user approves exact design/plan/cost assumptions. No regulatory acceptance campaign
is proposed. Real binding obligations/policy conflicts cannot be agent-waived.

Then parent routes **Bicep next**, confined to §6 ARM files and T03–05, against the
actual immutable released revision. Private application/runtime bootstrap and ML
are separate later packages; their writers own service-account/FIC, image, event/
tool/scoring/data contracts and independent evaluation with named human targets.
No broad future grant/resource reuse promised. Author-side conformance remains a
later architect artifact, not fabricated now.

### Source/check limitations

Public generic-only Learn search/fetch succeeded on 8 November2026:
[AKS Architecture Center baseline](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/containers/aks/baseline-aks),
[AKS outbound requirements](https://learn.microsoft.com/en-us/azure/aks/outbound-rules-control-egress),
[Firewall egress](https://learn.microsoft.com/en-us/azure/aks/limit-egress-traffic),
[monitoring/DCR streams](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-data-collection-configure),
[current identity roles](https://learn.microsoft.com/en-us/azure/aks/use-managed-identity),
[retired monitoring authentication](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-authentication),
[DCRA2023-03-11](https://learn.microsoft.com/en-us/azure/templates/microsoft.insights/2023-03-11/datacollectionruleassociations).
Learn sample search grounded proposed KQL in Container Insights examples.
Large fetched pages were inspected in relevant ranges, not claimed read end-to-end.
Official public template `aka.ms/aks-enable-monitoring-msi-onboarding-template-file`
was read for DCR shape/association and no-DCE conditions; its partial cluster update
was **not adopted**. Exact version-tagged AVM source inspections additionally
confirmed VNet/subnet exclusive child ownership, ACR overrides, LAW parameters and
Firewall policy DNS inputs. Complete AKS/VPN schema evidence remains F04-GO-r1's
fixed verified input, not a new service availability claim.

Price source limitations are in the paired estimate. No new legal research/
certification, OCI compatibility hunt, Azure/auth/validate/what-if/deploy, browser,
model/data job, build/test runner, nested agent, commit or push. No independent
PASS. No output hash or immutable r2 snapshot invented.

**Stopped writing after final F03 cycle5/5.** Parent owns preservation, required
checks, approval/sequence recording and escalation of any remaining defect. No
sixth correction, rename or reset authorised. SQL unavailable in this session:
intended todo update is `UPDATE todos SET status='done' WHERE id='wp001-integrate-feasibility';`
(completed author integration, not downstream release).
