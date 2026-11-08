# WP-001 / F04 — bounded AKS and VPN gap options

**Revision F04-GO-r1 · 22 October 2026 · design evidence offered to the parent
coordinator / architect. Bounded research complete; NOT an integrated-design
feasibility PASS, security/design PASS, exception approval or release.**

## 1. Contract, fixed inputs and limits

**ACCEPTED before public technical execution:** `assignments/F04-gap-options.md`,
the user's current instruction, and the complete G001 input set. Sole write:
`delivery/releases/WP-001/feasibility-gap-options.md`. Lifecycle authority is the
current assignment and ledger, outside their own input hashes.

G001 manifest: `snapshots/G001/manifest.md`, SHA-256
`a248779e38f529455b07bde258d703a693f0f796928564ac3761bfd2eee46f68`.
Independently checked with **Node v25.8.1 / SHA-256 and `git show` object reads**:
**13/13 current source/copy pairs and 12/12 immutable dependencies PASS** against
the manifest; dependency working copies also equal their committed objects.
Commit: **`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`**. This consumes the existing
inputs, not a new snapshot or a new integrity objective.

The 13 preserved inputs are definition, context, decisions, design/cost r1,
F04-r1 feasibility, security/compliance requirements, EP-r2, its technical and
security reports, and the accepted framework/release protocol. Workload reads use
`snapshots/G001/files/<source-relative-path>`; moving main design/decisions were
not substituted. Unchanged module facts/defaults below explicitly rely on the
preserved **F04-r1**, not a new whole-estate verification. The accepted definition
governs the test-only direction; older statements of non-adoption in historical
reports do not reverse that direction or create exact exception approval.

Loaded AGENTS, delivery/team guidance and `ama-context`, `ama-avm-bicep`,
`ama-handoff`; read applicable handoff/routing/source and accepted snapshot rules.
Classification **HIGH**; assigned role default **gpt-6.1-sol**; actual runtime
model **NOT VERIFIED**, no authoritative model field exposed. No model switch,
additional model invocation or delegation was performed. No numerical AI-credit
or time ceiling supplied; no Azure expenditure.

**Loop `WP001-F04-AVM`, reserved attempt 3/5 consumed: 3 used / 2 remaining.**
Attempt 1 transport failure and attempt 2 F04-r1 remain historical. This is ONE
bounded compatibility/source check: one registry tag-list lookup per module,
then inspection of only its highest stable semantic-version candidate, which is
also the original pin. Source extraction corrections within that inspection did
not launch another module/version search, review or feasibility attempt.

## 2. Selected paths and bounded publication result

All new public accesses in this report: **2026-10-22**. Official MCR tag lists
returned 37 stable semantic-version AKS tags and 23 VPN tags. Highest stable
numeric tags were respectively **0.14.0** and **0.12.0**. Prerelease tags and all
historical versions were not searched for compatibility.

| Gap / exact published candidate inspected | Verified result | Selected proposal for architect integration |
|---|---|---|
| F04-01: `br/public:avm/res/container-service/managed-cluster:0.14.0` | Cluster API `2025-10-01`; published ingress object has only older webAppRouting enabled/DNS/NGINX wiring. No inputs/wiring for managed `gatewayAPI.installation` or `gatewayAPIImplementations.appRoutingIstio.mode` | **Native complete `Microsoft.ContainerService/managedClusters@2026-03-01`**, one cluster owner, replacing this top-level AVM invocation, subject to exact exception review/approval. Preserve the rest of the selected AKS contract (§3) |
| F04-02: `br/public:avm/res/network/virtual-network-gateway:0.12.0` | Gateway API `2025-01-01`; compiled configuration emits protocols/authentication types only through the AAD configuration object, which requires tenant/audience/issuer. Root-only path emits null protocols/types. Revocation input is one string / one generated revoked entry | **Native complete `Microsoft.Network/virtualNetworkGateways@2025-01-01`**, one gateway owner, replacing this AVM invocation; explicit certificate-only OpenVPN and full revoked array (§4) |

**No compatible alternative published pin was verified in the bounded check.**
This is not proof that every public version, prerelease or future version lacks
compatibility. No guessed future pin, floating `latest`, fork, deploymentScript,
fake AAD values or authentication widening is proposed.

Both selected native APIs are published **non-preview API versions**. That does
not establish target-region/offer availability, every feature's support status,
or successful deployment. `gatewayAPI.installation='Standard'` selects the
managed Gateway API installation; it is neither AKS paid tier nor cluster mode.
`appRoutingIstio.mode='Enabled'` selects the sidecar-less app-routing controller,
not `serviceMeshProfile.mode='Istio'`. Standard-mode enablement is documented;
no Automatic/NGINX/service-mesh substitution is necessary.

### Published artifact identity

MCR OCI manifest and both compiled/source layers were downloaded in memory.
Layer SHA-256 values matched their advertised digests. Archived **`files/main.bicep`**
was compared to the exact version-tagged main source: each has exactly one
different line, the publisher's telemetry-version placeholder `-..--..-` replaced
with the published version. No other line differences. The compiled artifact,
not a tag name alone, confirms the gap.

| Candidate | OCI manifest SHA-256 | Compiled layer SHA-256 | Source archive SHA-256 |
|---|---|---|---|
| AKS 0.14.0 | `734fcf441835ae4c9b1540e6bc1fe2fba1f2713bc4280c87519df3045f577e33` | `22afa96bf8be6a9cae509cbcf31d87c73966f8e863799843415e8b40d23f0b82` | `775eca01f878c0e475068f7bbae6ca0781ee80657a8426de1c8b4199a7225cd4` |
| VPN 0.12.0 | `1600021aa8d2266412e9089cc9198cc50bc29098eeca5e6f2dacb8cce7e4cba7` | `d0200572f4ff269bbe1047c8fc91ce4b1206b1390389e19940d606527bda0d8f` | `4418a0d4a5c445bceb3f64d3d00c10cc8a87da5361bc443371c166661998c4f3` |

## 3. F04-01 native COMPLETE-cluster contract

This is a **design property/type inventory, not generated Bicep or a deployment
request**. Native ownership is a material implementation exception requiring
architect integration and the accepted regulated review/human approval path.
The API reference [A1] establishes these fields/types; [A2]/[A5] establish managed
controller enablement separately from legacy routing. F04-r1 §4 remains the
source for unchanged composition, grant and add-on facts.

### Ownership and dependencies

One future logical AKS composition owns the complete managed-cluster resource,
including **both explicit inline `agentPoolProfiles` entries** for this proposed
path. Do not also invoke the top-level cluster AVM, declare a second cluster,
or have a second agent-pool writer reassert the same pools. No read/merge/write
or two-field partial AKS PUT. Future updates remain complete desired-state
updates owned by that same composition, with autoscaler/count reconciliation
explicit in the accepted plan; do not reset a live autoscaled count casually.

Cluster prerequisites: new scopes; independently created control-plane/kubelet
identities; final node subnets/UDR; DNS zones/links; approved private registry/vault
interfaces; workspace; and completed pre-cluster networking, DNS, MI Operator and
AcrPull grants as specified in F04-r1. Use actual module outputs for dependencies.
For required grant/link completion not expressed by consumed data, retain a
specific ordering dependency, not just a constructed resource ID. Propagation
and private data-plane readiness remain later observed checks.

| Native property path (under `properties` unless stated) | Type / proposed explicit disposition |
|---|---|
| Resource `name`, `location`, `tags` | string, string, string-valued map; preserve fixed proposed name/scopes/Sweden Central and approved tag dictionary; do not create node RG or invent new naming values |
| Resource `sku.name`, `sku.tier` | enums: **`Base`**, **`Standard`** (not `Automatic`, not default Free) |
| `supportPlan`, `kubernetesVersion`, `nodeResourceGroup` | strings: `KubernetesOfficial`, explicit approved full patch parameter (r1 proposal `1.36.4`, NOT availability-verified), fixed AKS-owned node-RG name |
| `nodeProvisioningProfile.mode` | enum **`Manual`**, NAP off; no Karpenter/default auto pools |
| Resource `identity.type`, `identity.userAssignedIdentities` | `UserAssigned`; map keyed by exactly the precreated control-plane MI ARM ID |
| `identityProfile.kubeletidentity` | object with `resourceId`, `clientId`, `objectId` strings from the precreated kubelet MI; no service-principal secret |
| `enableRBAC`, `disableLocalAccounts` | booleans **true/true** |
| `aadProfile` | object: `managed:bool=true`, `enableAzureRBAC:bool=true`, explicit approved `tenantID:string`; no legacy app IDs/secret; human operator/observer grants remain separate |
| `apiServerAccessProfile` | object: `enablePrivateCluster:bool=true`, `enablePrivateClusterPublicFQDN:bool=false`, `privateDNSZone:string=<custom zone ID>`, `enableVnetIntegration:bool=false`; no API-integration subnet or public-authorized-range substitute |
| `publicNetworkAccess` | enum **`Disabled`** |
| `networkProfile` | object: `networkPlugin='azure'`, `networkPluginMode='overlay'`, `networkDataplane='cilium'`, `networkPolicy='cilium'`, `ipFamilies:string[]=['IPv4']`, `loadBalancerSku='standard'`, `outboundType='userDefinedRouting'`; explicit `podCidr`, `serviceCidr`, `dnsServiceIP` strings from corrected address contract |
| Egress extras | Omit `natGatewayProfile`, public outbound `loadBalancerProfile`, static egress gateway and pod subnet allocation; no AKS-managed outbound PIP/NAT. NAT remains on FirewallSubnet |
| `oidcIssuerProfile.enabled`, `securityProfile.workloadIdentity.enabled` | booleans **true/true** |
| `ingressProfile.gatewayAPI.installation` | enum **`Standard`**; omission defaults Disabled [A1] |
| `ingressProfile.webAppRouting.gatewayAPIImplementations.appRoutingIstio.mode` | enum **`Enabled`** |
| Legacy webAppRouting switches | **Deliberately omit** `webAppRouting.enabled`, `nginx`, and `dnsZoneResourceIds` on this NEW cluster; do not set the older AVM routing switch true. Official CLI 2.86.0 create source separately sets enabled/NGINX only for legacy app routing, while the Istio enablement method sets only the new implementation field [A5]; official ARM example likewise uses only the two new Gateway settings [A2]. This is an evidenced omission, not an invented requirement to enable NGINX. Do not reuse this fresh-create reasoning to disable legacy routing on an existing cluster |
| `serviceMeshProfile` | Omit; do not enable the mesh add-on. [A2] says simultaneous enablement is unsupported |
| `workloadAutoScalerProfile.keda.enabled` | boolean **true** |
| `addonProfiles.azurepolicy.enabled` | boolean **true**; this alone does not verify signatures |
| `addonProfiles.azureKeyvaultSecretsProvider` | `enabled:bool=true`; `config` string map with `enableSecretRotation='true'` and explicit approved `rotationPollInterval`; no implicit vault grant to its generated identity |
| `addonProfiles.omsagent` | `enabled:bool=true`; `config` string map: `logAnalyticsWorkspaceResourceID=<workspace resource ID>`, **`useAADAuth='true'`**. Not AVM's legacy false default |
| Other add-ons/features | Omit/disable unused HTTP application routing, AGIC, OSM, Flux, AI toolchain, cost analysis, managed Prometheus/application auto-instrumentation, Defender integration and unused storage drivers according to F04-r1. Do not copy module-enabled defaults. Explicit `azureMonitorProfile.metrics.enabled:bool=false` if that profile is emitted |
| `autoUpgradeProfile` | object: `upgradeChannel='patch'`, `nodeOSUpgradeChannel='NodeImage'`; not AVM stable. Maintain both reviewed maintenance configurations as separate cluster children (F04-r1 verified API `2025-10-01`); actual windows still require design/plan reconciliation |
| `linuxProfile`, when supplied | `adminUsername:string`, `ssh.publicKeys[]` of `{keyData:string}` public keys only; no private key/password. Exact admin/public-key handling is a plan input, not permission to open SSH. No Windows profile |
| `storageProfile` | Explicit disabled disk/file/blob/snapshot CSI driver `enabled:bool` leaves where unused, per F04-r1; KV Secrets Store CSI is the separate enabled add-on above. No PVC/data-disk service added |

Both inline pool objects use **native names**, not AVM aliases:

| Native pool field | Type / common or per-pool value |
|---|---|
| `name`, `mode`, `vmSize` | strings/enums: `sys` / `System` / `Standard_D4as_v5`; `usr` / `User` / `Standard_D2as_v5` |
| `type`, `osType`, `osSKU`, `scaleSetPriority` | enums `VirtualMachineScaleSets`, `Linux`, `AzureLinux3`, `Regular` |
| `count`, `minCount`, `maxCount`, `enableAutoScaling` | int/int/int/bool: sys **2/2/2/true**; usr **1/1/2/true** |
| `vnetSubnetID` | string from the corresponding final subnet output; **not** AVM `vnetSubnetResourceId` |
| `availabilityZones`, `maxPods`, `enableNodePublicIP` | string[] `['1']`, int **50**, bool **false** |
| `osDiskType`, `osDiskSizeGB` | enum **`Managed`**, int **128**; no fabricated `osDiskSku` property. Actual P10 backing remains observed/cost reconciliation |
| `orchestratorVersion`, `tags` | explicit approved full patch string, approved string-valued tag map on each pool |
| `nodeTaints`, `nodeLabels` | string[] and string map; sys taint `CriticalAddonsOnly=true:NoSchedule`; usr no added system taint; retain reviewed placement labels |
| `upgradeSettings` | object: **`maxSurge:string='1'`**, not int/percentage; `drainTimeoutInMinutes:int`, `nodeSoakDurationInMinutes:int` explicitly chosen in accepted plan. API defaults 30/0 minutes and 10% surge are not approved operation bounds |
| Unused capacity features | No Spot, extra pools, GPU, host group, capacity reservation, ultra disks, snapshots or pod-subnet feature. Do not send read-only pool status back as desired state |

Native non-secret interface must preserve logical `resourceId`, name/location,
private control-plane FQDN, **`oidcIssuerUrl` from
`properties.oidcIssuerProfile.issuerURL`**, and only required identity IDs/add-on
identity metadata. Never obtain/export kubeconfig, tokens or credentials. Node
RG and pool IDs are derived from fixed scope/name contracts, not invented AVM
outputs or separate resources created by this report.

## 4. F04-02 native COMPLETE-VPN-gateway contract

One future network composition owns the **complete gateway** and its nested
P2S certificate/revocation inventory. Remove the VPN AVM invocation for this
resource; no second gateway, later fragment PUT or individual last-entry-only
revocation patch. The public ARM schema [V1] independently exposes protocols,
authentication types and both certificate arrays; [V2] documents certificate
OpenVPN support and individual thumbprint revocation. [V3] fixes the previously
unresolved SKU/generation pairing: **VpnGw1AZ is Generation1**.

| Native path | Type / explicit disposition |
|---|---|
| Resource name/location/tags | strings/string-valued map from existing proposed network inventory; one regional gateway |
| `properties.gatewayType`, `vpnType`, `vpnGatewayGeneration` | enums **`Vpn` / `RouteBased` / `Generation1`**; do not inherit AVM generation `None` |
| `properties.sku.name`, `.tier` | enum **`VpnGw1AZ`** for both |
| `properties.activeActive`, `enableBgp` | booleans **false/false** (active-standby, no BGP configuration) |
| `properties.ipConfigurations[]` | Exactly one object with stable `name:string`; `properties.privateIPAllocationMethod='Dynamic'`, `subnet.id:string=<GatewaySubnet output>`, `publicIPAddress.id:string=<existing dedicated VPN PIP module output>` |
| PIP / subnet dependencies | Standard static regional IPv4, approved zone-redundant settings, no extra PIP auto-created. GatewaySubnet `/27` or larger, no project NSG or `0.0.0.0/0` UDR; retain supported route propagation [V3/V4] |
| `properties.vpnClientConfiguration.vpnClientAddressPool.addressPrefixes` | string[] containing approved, non-overlapping VPN pool (r1 `172.27.83.0/27`); it is not a node/service/pod CIDR |
| `.vpnClientProtocols` | string[] **`['OpenVPN']`** only; no inferred SSTP/IKEv2 |
| `.vpnAuthenticationTypes` | string[] **`['Certificate']`** only; no AAD/RADIUS |
| `.vpnClientRootCertificates[]` | Full trusted-root array; each entry `name:string`, `properties.publicCertData:string` containing only continuous Base64 X.509 public `.cer` data, not a PEM private key/PFX/password. Begin with the approved single root; rotations retain all still-approved roots explicitly |
| `.vpnClientRevokedCertificates[]` | Full retained revocation array; each entry stable unique `name:string`, `properties.thumbprint:string` (continuous, spaces removed). Empty array only when approved inventory is genuinely empty; otherwise **all** revoked clients, not just the newest. Validate uniqueness and retention across ordinary gateway updates/rotations |
| AAD/RADIUS fields | Omit `aadTenant`, `aadAudience`, `aadIssuer`, radius servers/secrets and per-client policy groups. No fake values or added auth methods |
| Other gateway features | No S2S/VNet connections, NAT rules, local network gateway/default site, Virtual WAN/remote-VNet traffic, autoscale or custom full-tunnel route; set `allowVirtualWanTraffic=false`, `allowRemoteVnetTraffic=false` when emitted. Keep `disableIPSecReplayProtection=false`; no fabricated IPsec policy for OpenVPN |
| Diagnostics | Separately owned diagnostic extension referencing this gateway ID and the chosen workspace; preserve exact reviewed categories/retention/destination inventory from the future integrated monitoring contract, not a second collector |

Dependencies are final GatewaySubnet and dedicated PIP outputs. The composition
may expose only gateway ID/name and the existing PIP's public address if required;
do not generate/export VPN client profiles, certificates with private material,
keys or connection credentials as ARM outputs.

The human CA/device owner retains private keys and the protected issuance/
revocation register. Each of the at most three approved devices gets a unique
certificate; replacing a device must not erase previous revocations. This public
contract does not prove revocation latency, disconnect existing sessions, bind
actual device source IPs, establish MFA or approve the certificate-only risk.
Those remain explicit operation/security/campaign duties.

## 5. Integration instructions — F04-07/08, not new research of every pin

Consume preserved F04-r1's unchanged verified pins/inventory; do not upgrade the
other modules merely because the two resources above become native.

| Integration point | Exact instruction / ownership |
|---|---|
| Key Vault | Consume AVM vault **`uri`**, optionally rename at composition boundary to logical `vaultUri`; do not request nonexistent `vaultUri` from the AVM |
| Firewall / UDR | Consume firewall **`privateIp`**, optionally expose logical `firewallPrivateIp`; route nextHopIpAddress and corrected node DNS consumers use that data dependency |
| Cluster / federation | Native cluster returns logical **`oidcIssuerUrl`** from actual issuerURL. Preserve exact issuer, subject `system:serviceaccount:ama-ingress:tls-sync`, audience `api://AzureADTokenExchange`; do not synthesize issuer from cluster name |
| Node group / pools / resolver | Derive node-RG/pool IDs from approved parent/name contracts; AKS alone creates node RG. Resolver AVM returns endpoint name/ID, **not inbound IP**: return approved static-IP configuration distinctly from later observed IP |
| Subnet cycle | Base VNet creates only early firewall/NAT, gateway, resolver, PE/ingress subnets; Firewall depends on VNet, UDR on Firewall privateIp, then standalone **`br/public:avm/res/network/virtual-network/subnet:0.2.0`** creates final node subnets with UDR/NSG. This child pin/API `2025-05-01` is inherited verified evidence from F04-r1, not newly rechecked |
| Firewall DNS cycle | Accepted definition requires consistent node/VNet Firewall DNS proxy use. Do not feed Firewall privateIp back into the VNet module that Firewall requires. Keep base VNet creation independent; late node-subnet ownership solves UDR, **not automatically VNet-level DNS**. Architect must fix a single authoritative, supported VNet DNS finalization/ownership contract and readiness ordering; no unverified subnet-level `dnsServers` field or blind parent VNet overwrite is proposed here |
| Federation cycle | Precreate TLS MI without embedded issuer-dependent FIC. Cluster then standalone **`br/public:avm/res/managed-identity/user-assigned-identity/federated-identity-credential:0.2.0`**, API `2024-11-30`, with `userAssignedIdentityName`, name, issuer/subject strings, `audiences:array`. Inherited F04-r1 pin. Cluster must not depend on that FIC-containing identity deployment |
| Post-cluster identities / RBAC | Generated monitoring/CSI identity grants, if genuinely needed, use returned principal IDs in separately owned narrow assignments. Pre-cluster MI Operator/network/DNS/AcrPull grants stay before cluster. No cluster↔workspace/identity grant cycle; no blanket vault grant to CSI MI |
| Monitoring | One DCR and DCRA authority; AAD-authenticated Container Insights. Do not enable CLI auto-created default DCR beside separately managed collection. F04-r1's interval/table/Activity Log export issues remain unresolved, not closed by native cluster ownership |

Critical defaults and dispositions to carry into the architect's exact contracts:

| Dependency / preserved pin | Required disposition, based on F04-r1 |
|---|---|
| ACR `0.13.1` | Main API **`2025-06-01-preview`**; Premium, classic RBAC, admin/anonymous/public off, bypass None/default Deny. Explicitly decide data endpoint (default false), zone redundancy (default Enabled), retention (default enabled/15d), including artifact/provenance retention. No automatic preview acceptance |
| Key Vault `0.14.2` | API `2026-02-01`; override premium/90d/all three deployment-enablement defaults: Standard, soft-delete7d/purge protection true, RBAC true, public disabled, bypass None/default Deny, deployment/template/disk-encryption switches false. Public TLS material is not permission to output private key material |
| LAW `0.16.1` | API `2025-07-01`; explicit `dataRetention:int=31`, **`dailyQuotaGb:string='1'`**, local auth disabled and disclosed public ingestion/query settings; not retention365/unlimited `'-1'`. Explicitly disposition `forceCmkForQuery` default true; it is not evidence of a CMK deployment |
| LAW secure outputs | This pin contains **two `@secure()` listKeys outputs**. Do not consume/re-export them. Secure output is not plaintext leakage, but an absolute no-credential-output-at-any-depth requirement is still unmet. No alternative LAW pin/native exception was researched or selected here: require exact reviewed output-policy disposition or separately verified alternative before release |
| Alerts | Action group `0.8.0` API **`2024-10-01-preview`**; scheduled-query rule `0.6.0` API **`2025-01-01-preview`**. Explicit supported preview/risk disposition, correct global metadata scope and real queries; no `skipQueryValidation` bypass to manufacture success |
| AKS native replacement | Explicit paid Standard/Base/Manual, patch/NodeImage, AAD monitoring, private settings, managed Gateway fields and deliberate legacy omission as §3; preserve chosen unused-feature disabling rather than copying AVM defaults. Native ownership does not remove supported maintenance/diagnostics obligations |
| Network defaults | Explicit PIP zones, Standard/static/IP family, NAT idle timeout (F04-r1 default5m), firewall proxy/upstream/threat-intelligence settings, private-zone registration off and no extra PIPs/endpoints. No implicit resource/tag inheritance |

No plaintext or secure credential output was queried/executed. The future plan
must enumerate every applicable WV05–WV14 assertion, warnings and exception.
No linter suppression, acceptance rewrite or newly selected secret-producing
alternative is part of this report.

## 6. Private HTTPS and no-business-Route disposition

**Verified supported building blocks, not a proof of no-Route serving:**

- [A2] supports Standard-mode managed Gateway enablement and `approuting-istio`,
  separate from mesh. Its example defaults to an **external** LB; it explicitly
  links the supported internal-LB annotation contract in [A4].
- [A4] establishes `Gateway.spec.infrastructure.annotations` for
  `service.beta.kubernetes.io/azure-load-balancer-internal='true'` and
  `service.beta.kubernetes.io/azure-load-balancer-internal-subnet=<ingress subnet>`.
  F04-r1 already requires an approved supported static-IP annotation contract
  before creation; this report does not invent another one or permit a transient
  public listener.
- [A3] directly documents the app-routing manual workflow: SecretProviderClass,
  mounted CSI volume and synced `kubernetes.io/tls` Secret with `tls.crt`/`tls.key`;
  `Gateway` API v1, class `approuting-istio`, HTTPS/443, exact hostname,
  `tls.mode='Terminate'`, same-namespace `certificateRefs.name`, restricted
  `allowedRoutes` selector. Two separate PEM Key Vault secrets are documented
  as one complete encoding option. Keep a persistent scoped TLS-sync Deployment,
  reviewed WI binding and secret-specific RBAC instead of copying the sample's
  ten-second Pod, node-MI authentication, broad grants or mutable sample image.
- The new guide recommends an automated DNS/KV integration, but explicitly
  retains manual TLS. **No switch to automation, extra identities or DNS writer**
  is selected. F04-r1's cert-object versus secrets-only grant warning remains.

**UNKNOWN: supported certificate-serving HTTPS behavior with ZERO application
Routes/backends on this managed controller.** [A3] creates a TLS Gateway and then
an HTTPRoute before waiting/testing; [A2] also tests with a Route/application.
Neither establishes that a no-Route listener is programmed with its certificate,
nor a guaranteed handshake-only/no-content response. A separate Gateway object
and certificateRef are not proof of that runtime contract. The same inspected
official sources do not establish a supported minimum-TLS control either.

Architect/tester must retain this exact current design-contract evidence gap:
obtain authoritative managed-controller no-Route behavior/support evidence, or
return a scoped design decision to the owner. **Do not install a business Route,
sample backend, mesh, EnvoyFilter or another controller to make the test pass.**
The EP-r2 test-only method review does not establish this missing product contract
or authorize lowering TLS acceptance. Minimum-TLS empirical deviation and
N-01–N-05 still need their exact design/plan and owner dispositions.

## 7. Checks, source register and remaining gates

| Check / result | Actual method and limitation |
|---|---|
| Input acceptance / **PASS** | Exact G001 coverage and all recorded hashes independently verified; no reliance-only claim or source replacement |
| Bounded publication / **PASS for inspected identities** | Anonymous Node fetch of two MCR tag lists; OCI manifests requested with `Accept: application/vnd.oci.image.manifest.v1+json`; SHA-256 of downloaded compiled/source layers; `tar -tzf -` / `tar -xzOf - files/main.bicep` in memory; tagged main sources and READMEs retrieved HTTP200 |
| Candidate compatibility / **FAIL for each selected AVM's exact gap** | Inspected compiled ingress/P2S emission and typed source inputs. No exhaustive all-version absence claim |
| Native API expressibility / **PASS for listed schema fields only** | Microsoft Learn search and full API/guidance fetches; API/controller/legacy distinction corroborated with official CLI **source text only**, never CLI execution |
| Extraction diagnostics / **recorded, not suppressed** | First compiled pass filtered the wrong media-type label; later script assumed iterable resources rather than dictionary-form resources, then encountered a type-reference object without properties. Guarded traversal completed. Initial archive selection picked AKS's child main, and guessed placeholder normalization did not match; final exact `files/main.bicep` comparison found the one real publisher substitution per module. First local doc heading extraction missed CRLF; normalized extraction succeeded. These were tooling/extraction corrections, not compatibility passes or extra version hunts |
| No-Route HTTPS / **BLOCKED: UNKNOWN** | Sources do not establish no-Route certificate serving. Private frontend/TLS object syntax alone is not a passing observation |
| Whole integrated feasibility/security/design / **NOT RUN** | Outside this limited assignment; F04-03/04/05/06/08 and scoped F04-07 remainder are not silently closed |
| Restore/build/lint, parameter/WV05–14 execution / **NOT RUN** | No released candidate or infrastructure generation assigned; no tool install or candidate artifact produced |
| Azure/auth/resource, validate/what-if, deployment, live tests / **NOT RUN** | Prohibited in this assignment; public schemas prove neither deployability nor observed controls |

### Exact public source URLs (accessed 2026-10-22)

Registry source construction below is literal: substitute the exact P/V pair,
not a private identifier.

| Reference | URL / use |
|---|---|
| R-AKS tags | https://mcr.microsoft.com/v2/bicep/avm/res/container-service/managed-cluster/tags/list |
| R-VPN tags | https://mcr.microsoft.com/v2/bicep/avm/res/network/virtual-network-gateway/tags/list |
| R-AKS manifest | https://mcr.microsoft.com/v2/bicep/avm/res/container-service/managed-cluster/manifests/0.14.0 |
| R-VPN manifest | https://mcr.microsoft.com/v2/bicep/avm/res/network/virtual-network-gateway/manifests/0.12.0 |
| R layers | `https://mcr.microsoft.com/v2/bicep/avm/res/<P>/blobs/sha256:<layer hash in §2>`; P is `container-service/managed-cluster` or `network/virtual-network-gateway` |
| S-AKS main / README | https://raw.githubusercontent.com/Azure/bicep-registry-modules/avm/res/container-service/managed-cluster/0.14.0/avm/res/container-service/managed-cluster/main.bicep ; same directory `README.md` |
| S-VPN main / README | https://raw.githubusercontent.com/Azure/bicep-registry-modules/avm/res/network/virtual-network-gateway/0.12.0/avm/res/network/virtual-network-gateway/main.bicep ; same directory `README.md` |
| A1 | https://learn.microsoft.com/en-us/azure/templates/microsoft.containerservice/2026-03-01/managedclusters — typed full cluster, pools, ingress and identity contracts |
| A2 | https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api — Standard-mode enablement, limitations, managed lifecycle and official ARM-field example |
| A3 | https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls — supported manual TLS workflow; example includes HTTPRoute |
| A4 | https://learn.microsoft.com/en-us/azure/aks/istio-gateway-api — annotation/customization contract linked by A2, not authority to replace controller with mesh |
| A5 | https://raw.githubusercontent.com/Azure/azure-cli/azure-cli-2.86.0/src/azure-cli/azure/cli/command_modules/acs/managed_cluster_decorator.py — create methods `set_up_ingress_web_app_routing` and `set_up_ingress_profile_app_routing_istio`, lines 7727–7781 |
| V1 | https://learn.microsoft.com/en-us/azure/templates/microsoft.network/2025-01-01/virtualnetworkgateways — complete gateway/P2S arrays and typed fields |
| V2 | https://learn.microsoft.com/en-us/azure/vpn-gateway/point-to-site-certificate-gateway — OpenVPN certificate/client matrix, public root encoding and selective thumbprint revocation |
| V3 | https://learn.microsoft.com/en-us/azure/vpn-gateway/about-gateway-skus — VpnGw1AZ Generation1/OpenVPN and Standard PIP requirements |
| V4 | https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpn-gateway-settings — GatewaySubnet constraints and active-standby distinction |

Only generic public technical terms/URLs were sent. No repository contents,
work-package identifiers, private IDs, credentials or certificate data were
disclosed externally. Public sources were available; no access-failure blocker.
Learn content and GitHub documentation may evolve; OCI digests above bind the
inspected publication. Tool-managed temporary outputs are not repository evidence
snapshots and were not manually written as additional deliverables.

### Remaining ownership / stop

1. **Architect via parent:** integrate/justify these two exact complete-resource
   exceptions, resource ownership and preserved contracts; resolve no-Route HTTPS,
   consistent Firewall DNS/VNet ownership, monitoring/export, signing/admission,
   defaults/preview/secure-output policy and the remaining integrated design/cost
   findings. This bounded report is usable input, not all WD-02 work declared PASS.
2. **Coordinator/tester:** preserve this exact stopped candidate with its inputs
   under a valid assignment; route the later complete-design technical/five-pillar,
   security/compliance reviews and documentation reconciliation. Do not substitute
   this author report for non-author findings or launch another loop implicitly.
3. **Release prerequisites:** actual file/contract/dependency/validation inventory
   in accepted `development-plan.md`, required independent reviews and genuine
   exact design/plan/full-cost/native-exception approvals. Existing F04 findings
   remain open until properly integrated and independently dispositioned.
4. **Later gates, not blockers to this public research:** target full patch/SKU/
   zones/offer/quota/IPAM confirmation; actual managed footprint and capacity/
   lifecycle observations; actual campaign principal/device bindings, funded
   ceiling, window/UTC expiry and final risk acknowledgement; authorised validation/
   what-if and separate deployment/test authority. None is claimed complete.

**Handoff offered:** parent coordinator → architect integration, with subsequent
tester/specialist/documentation routing owned by parent. No reviewer launched.
Writer stopped after this report and author checks; no frozen input altered.
No infrastructure, parameters, Kubernetes/workflow artifacts, Azure writes,
browser, external repository disclosure, delegation, commit or push.

SQL execution is unavailable in this tool set. **Intended, NOT applied:**
`UPDATE todos SET status='done' WHERE id='wp001-avm-gap-options';`
This marks completion of the bounded evidence report, not release readiness.
Carry **WP001-F04-AVM: 3/5 used, 2 remaining**; no further attempt reserved here.
