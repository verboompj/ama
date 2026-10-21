# WP-001 foundation design — F03 draft r1

## 1. Assignment, authority and evidence boundary

**F03 ACCEPTED. Drafting complete; NOT RELEASED and NOT implementation authority.**
Author: azure-architect, 21 October 2026. Sole assigned outputs: this file and
[`cost-estimate.md`](cost-estimate.md). Lifecycle/approvals belong in the coordinator's
`ledger.md`, not in a frozen copy of this document. Human design, platform, network,
security, operations and budget target owner: **requesting user**, per FND-01.

Assigned baseline: **`01002b21e5c6cb57d391c685adcbc05f03885b38`**, paths in
`assignments/F03-design.md`: AGENTS, delivery contracts, maintained architecture
§§12–16/20, and historical WP-001 context/decisions/assessment/ledger. The local
main ref returned that commit. File tools cannot perform Git object extraction,
diff, hashing or worktree equality checks: baseline byte equality is **NOT VERIFIED**.
Current context/ledger execution edits are not revised approved technical inputs;
no current-ledger approval is inferred or used. Coordinator/tester must reconcile
the read paths to committed bytes when preserving inputs. Historical ledger is
referenced at the assigned commit, not read as a moving approval source.

Additional declared inputs, explicitly forwarded after writers stopped:
`security-requirements.md` SEC01–SEC12 and `compliance-requirements.md` CR01–CR13.
Their exact bytes must accompany the design snapshot. The coordinator clarified
that compliance requirements drafting is complete; authoritative legal/current-version
corroboration remains limited, not a compliance verdict or automatic foundation blocker.
Neither requirements file approves these proposed targets.

Learn documentation search/fetch tools **are exposed in this specialist session**
(unlike the parent's reported inventory) and were used successfully. Official public
HTML and anonymous Retail Prices API retrieval supplement them. No silent MCP
fallback/evidence pass; failed/empty retrievals are described in §12 and the estimate.
No Azure account/resource queries, models, data services, delegation, infrastructure,
workflow, browser window, commit or deployment was performed.

Author loop **WP001-F03-AUTHOR: cycle 1/5 consumed; 1 used / 4 remaining**.
This includes the requirements integrations and final author checks; no separate
non-author verdict or reset. F02-DISCOVERY remains 2 used / 3 remaining, untouched.

## 2. Bounded capability and fixed recommendation for approval

Provide an isolated, nonproduction, Sweden Central AKS foundation for a future
public/synthetic demonstrator, maximum three users. No reuse/modification of the
non-empty existing estate. Foundation resources only; business applications,
Foundry deployments, ML workspaces/compute/endpoints, Search, business stores,
evidence ingestion/messaging, acquisition/training/scoring and treasury are excluded.

**Recommend one fixed proposal:**

* AKS Standard mode **and Standard paid tier**, explicit Linux system/user VMSS
  pools, CNI Overlay/Cilium, OIDC/Workload Identity, managed identities, NAP disabled.
* Private Link-based AKS API with public API/FQDN disabled; private ACR Premium
  and Key Vault Standard, public network access disabled and bypass disabled.
* Dedicated VNet, P2S `VpnGw1AZ` route-based OpenVPN gateway, three individually
  revocable client certificates, managed DNS Private Resolver inbound endpoint.
  No jump VM, Bastion, hosted runner or corporate network assumed.
* Private application Gateway API frontend; private CA and private DNS name,
  explicitly installed trust on the three approved devices. No purchased domain.
* Azure Firewall Standard, single-zone, FQDN-aware default-deny egress;
  NAT Gateway Standard on **AzureFirewallSubnet**, not directly on AKS subnets.
  AKS outbound type **`userDefinedRouting`**, not `userAssignedNATGateway`.
* Two 4-vCPU system nodes and initially one 2-vCPU user node; user autoscaler
  maximum two. See resource-envelope derivation, not user-count sizing, in §5.
* Container Insights/Log Analytics plus actionable alerts. Reduced monitoring and
  reduced end-to-end HA are explicit **HUMAN APPROVAL REQUIRED** departures (§10).

The firewall is deliberately expensive relative to demo compute. It is selected
instead of pretending NAT, NSGs or an ingress controller provide destination
filtering. The estimate exposes the full private-access/controlled-egress premium.
If the owner cannot fund it, return a revised design for a reviewed effective
egress alternative; do not remove enforcement or open the application publicly.

### Exposure alternatives considered, not deployable parameter variants

| Boundary | Selected private proposal | Restricted-public alternative and reason not selected |
|---|---|---|
| AKS API | Private endpoint, custom zone, public FQDN off; VPN operator route + Entra authorisation | Standard tier public API with default-deny authorised stable `/32` operator/runner egress ranges; no unrestricted fallback. Reduces API DNS/endpoint work, but no approved stable client addresses exist and VPN/DNS are still necessary for private application audience. Does not eliminate access infrastructure costs |
| ACR | Premium; one registry PE with login and regional data IPs/records; public disabled; kubelet `AcrPull` | Restricted-public ACR also requires Premium for IP network rules; default deny, NAT/operator approved stable addresses, no trusted-service bypass, managed-identity pulls. Saves PE/zone charges only, adds exposure/rule drift; Basic/Standard public registry is not an equivalent restricted-public option |
| User route | P2S VPN, private DNS resolution, internal LB, trusted private-name TLS | Corporate S2S/ExpressRoute or connected management host could work, but none exists/has approval. Public app with IP rules fails the accepted private-network-only audience |

API network access, ARM access, Kubernetes permissions and app authorisation are
four different controls. A VPN user receives no Kubernetes or registry role by
virtue of the tunnel. Private reachability is not authentication.

## 3. Resource scopes, names, quantities and dependency graph

Proposed subscription-scope composition creates exactly these project RGs:

1. **`rg-ama-poc-sec-platform`** — network, identity, registry, vault, monitoring.
2. **`rg-ama-poc-sec-aks`** — AKS managed cluster and explicit node-pool children.
3. **`rg-ama-poc-sec-aksnodes`** — named AKS node RG, **created/owned by AKS**;
   never precreate it or manage its VMSS/disks/endpoint directly.

Region for all regional resources and deployment metadata: **`swedencentral`**.
DNS zones are global resources; Entra/control-plane/support are not region-pinned
by this property. No existing RG references as deployment targets.

| Scope | Proposed name / resource | Fixed quantity / SKU / property |
|---|---|---|
| platform | `vnet-ama-poc-sec` | 1 VNet; IPv4 only, address table below |
| platform | `nsg-ama-poc-sec-system`, `nsg-ama-poc-sec-user`, `nsg-ama-poc-sec-ingress` | 3 project NSGs; required AKS internal traffic preserved |
| platform | `rt-ama-poc-sec-aks` | 1 route table linked to both node subnets; default route to firewall private IP |
| platform | `afw-ama-poc-sec`, `afwp-ama-poc-sec` | 1 Azure Firewall Standard, zone 1; 1 Standard policy, no prescaling, no Policy Analytics |
| platform | `nat-ama-poc-sec` | 1 NAT Standard, zone 1, 1 IPv4, attached only to firewall subnet |
| platform | `pip-ama-poc-sec-nat`, `pip-ama-poc-sec-fw`, `pip-ama-poc-sec-vpn` | 3 Standard static regional IPv4s; NAT/FW zone 1, VPN zone-redundant |
| platform | `vgw-ama-poc-sec` | 1 VpnGw1AZ active-standby gateway, OpenVPN certificate auth; 0 S2S connections |
| platform | `dnspr-ama-poc-sec`, inbound `inbound` | 1 resolver, 1 inbound endpoint; **0 outbound endpoints/rulesets** |
| platform | DNS zones | 4: `privatelink.swedencentral.azmk8s.io`, `privatelink.azurecr.io`, `privatelink.vaultcore.azure.net`, `ama-poc.internal`; 1 link per zone to VNet, registration off |
| platform | `acramapocsec001` | 1 ACR Premium, classic registry RBAC mode, admin off, no anonymous access, no geo-replica/tasks/connected registry |
| platform | `kv-ama-poc-sec-001` | 1 vault Standard, RBAC, public/bypass off, soft-delete 7 days and purge protection on |
| platform | `pe-ama-poc-sec-acr`, `pe-ama-poc-sec-kv` | 2 customer PEs + NICs + DNS zone groups; ACR group `registry`, KV group `vault` |
| platform | `id-ama-poc-sec-aks`, `id-ama-poc-sec-kubelet`, `id-ama-poc-sec-tls` | 3 user-assigned MIs; TLS identity federated only to the sync service account |
| platform | `law-ama-poc-sec`, `dcr-ama-poc-sec-containers` | 1 PAYG Analytics workspace, 31-day retention; 1 Container Insights DCR/association; no commitment |
| platform | `ag-ama-poc-sec-ops`, alert rules `al-ama-poc-sec-{health,audit,restart,egress}` | 1 email action group, 4 five-minute log alert rules; service-health/activity alerts, budget notification; no SMS/web tests |
| aks | `aks-ama-poc-sec` | 1 Standard cluster; proposed Kubernetes **1.36.4**, `KubernetesOfficial`, `AzureLinux3`; patch/OS compatibility remains feasibility prerequisite |
| aks | `sys`, `usr` | 2 node pools; details §5, cluster autoscaler explicit; KEDA and Azure Policy add-ons; CSI provider; managed Gateway API + application routing Istio, **not NGINX** |
| aksnodes, AKS owned | VMSS/NICs/OS disks; API PE | Normal 3 VMs/3 P10 disks, steady maximum 4, two-pool surge maximum 6; 1 AKS-managed API PE; AKS generated child names |
| aksnodes, Kubernetes owned | internal Standard LB | 1 internal LB frontend `10.83.2.10`, HTTPS forwarding rule plus managed probe; no outbound rule or public frontend |
| Kubernetes platform bootstrap | `ama-ingress`, `ama-demo`, managed system namespaces | Foundation Gateway + TLS-sync and policy baseline only; no business HTTPRoute, app or ML workload |

Registry/vault names above are exact proposals, **not checked/reserved globally**.
A collision requires a documented name revision and coordinated input/cost
reconciliation, not a random runtime suffix. Other child names are deterministic
from their parent or AKS-managed as stated. AVMs may create additional supported
monitoring identities/associations; feasibility must inventory these, not hide
billable defaults. Monitoring/add-on MIs carry zero service-instance charge.

Dependency order (ARM and data-plane readiness are different):

```text
confirmed human bootstrap authority
  -> new RGs -> VNet/subnets + DNS zones/links + MIs
  -> IPs/NAT -> Firewall policy/firewall -> node UDR
  -> VPN + resolver -> operator tunnel/DNS readiness
  -> ACR/KV + PEs/DNS -> scoped RBAC grants/propagation
  -> AKS private API + pools + diagnostics/add-ons
  -> operator private API access
  -> separately authorised platform Kubernetes bootstrap
     (policies, Gateway customisation, TLS sync/secret, internal Gateway)
  -> tester synthetic probes; business app HTTPRoute remains later
```

ARM is nontransactional. Partial provisioning is not automatic rollback. Plan
must distinguish infrastructure owner operations from Kubernetes bootstrap,
certificate installation and image promotion. No pipeline is included.

## 4. Network, DNS, TLS and enforceable egress

### Address contract — all values PROPOSED, not allocated

| Purpose / subnet | CIDR / value | Use / capacity |
|---|---|---|
| VNet | `10.83.0.0/20` | No peering or corporate attachment |
| `snet-aks-system` | `10.83.0.0/24` | sys VMSS plus AKS API PE; Azure reserves 5 addresses |
| `snet-aks-user` | `10.83.1.0/24` | usr VMSS |
| `snet-ingress` | `10.83.2.0/27` | ILB static `10.83.2.10` |
| `snet-private-endpoints` | `10.83.2.32/27` | ACR login/data IPs, KV; future endpoint headroom only |
| `snet-dns-inbound` | `10.83.2.64/28` | Dedicated, delegated `Microsoft.Network/dnsResolvers`, static inbound `10.83.2.68` |
| `GatewaySubnet` | `10.83.3.0/27` | Gateway only; no NSG/default UDR |
| `AzureFirewallSubnet` | `10.83.4.0/26` | Firewall + NAT association; no project NSG/default UDR |
| Future reservation | `10.83.5.0/24` | Unallocated space; no services/subnet deployment now |
| Overlay pods | `172.25.0.0/20` | 16 per-node `/24` blocks; 6-node worst case fits |
| Cluster services / DNS | `172.26.0.0/24` / `172.26.0.10` | Disjoint from pod/VNet/client ranges |
| VPN client pool | `172.27.83.0/27` | At most 3 issued client identities; no VM addressing |

Author arithmetic: subnets are inside VNet and mutually disjoint; pod, service,
VPN and VNet ranges are disjoint. **External overlap not checked**: network owner
must compare corporate/peered/remote workstation/home LAN, Docker/Kubernetes,
VPN routes and future platform IPAM before design release. No external “no
overlap” claim from this arithmetic. A conflict changes this revision.

### Real client and operator paths

```text
approved device + individual VPN certificate
  -> Internet encrypted OpenVPN tunnel -> VpnGw1AZ -> POC VNet
     -> DNS Private Resolver 10.83.2.68:53 TCP/UDP
        -> linked app/AKS/ACR/KV private zones
     -> user HTTPS: portal.ama-poc.internal -> 10.83.2.10 -> Gateway -> later app
     -> authorised operator only: private AKS API:443 + Entra/RBAC
     -> authorised image pusher only: ACR login + regional layer endpoint:443

operator -> public ARM/Entra HTTPS with approved MFA/activation
           (does not require or confer Kubernetes API connectivity)
```

VNet DNS stays Azure-provided for nodes; VPN client profile explicitly sets
resolver inbound IP and the four private suffixes (including public ACR login/data
CNAME resolution). OS-specific split-DNS/routing is a tested bootstrap deliverable,
not assumed to follow automatically from a PE. Do not send VPN clients directly
to `168.63.129.16`. Route the VNet CIDR to the tunnel; do not route overlay/service
CIDRs or all internet traffic there. Disable conflicting browser secure-DNS
bypass for private suffixes through approved device configuration.

ACR zone group must create **both** login and Sweden Central data/layer records;
AKS nodes and the VPN-connected image-push device must resolve/reach both. No
ACR Tasks or public hosted runner workaround. KV is similarly private. AKS manages
its API A record in the custom zone; stop/start can recreate PE/change API IP.

Foundation bootstrap owner, later explicitly assigned through coordinator:
Bicep engineer for ARM/add-on enablement, platform Kubernetes bootstrap writer
(Bicep engineer only if separately assigned) for Gateway/policy objects; application
writer for future HTTPRoutes/auth. Internal Gateway annotations must select the
ingress subnet and static IP **before** creation: official default is external.
HTTPS listener only, allowedRoutes limited to `ama-demo`; no public HTTP listener.
Gateway API resource/HPA/PDB customisation must be verified against supported allow
lists by feasibility, not patched behind managed-controller reconciliation.

Private DNS `ama-poc.internal`, hostname `portal.ama-poc.internal`, 90-day
private-CA-signed leaf with hostname SAN; 1-year offline root. Requesting user
operates CA and securely installs public root into OS/browser trust on exactly
three approved devices. Root private key remains encrypted offline, never Git/ARM
output/cluster. Separate 90-day client-auth VPN certificates; revoke individually
on loss/offboarding and reissue before expiry. Certificate tunnel authentication
is **not MFA**: security owner must approve this bounded device/trust arrangement;
it does not waive inherited MFA for ARM/AKS writes.

TLS leaf private material imported through private KV data plane by approved human;
CSI sync Deployment (not standalone Pod) under `ama-ingress/tls-sync` reads only
that secret, produces namespaced Kubernetes TLS Secret for Gateway certificateRef.
Renew at day 60, alerts at 30/14/7 days remaining, verify rotation from each device;
revoke root/leaf and rotate all trust on compromise. No public CA, ACME, registrar,
managed HSM or automated paid certificate-renewal service. HTTPS minimum TLS 1.2
on Gateway and supported service properties; enforce TLS on operator/API/ACR/KV
paths, never routine `--insecure` or disabled verification. Gateway-to-later-app
hop is HTTP within Cilium-isolated namespace for synthetic demo only: explicit
security approval; later sensitive workloads must revisit east-west encryption.

### Egress and segmentation contract (SEC07)

Both node subnet route tables: `0.0.0.0/0 -> VirtualAppliance` at discovered firewall
private IP output. No node public IPs/default outbound access/NAT attachment/direct
LB egress. Firewall internet output uses attached NAT public IP; retain firewall's
required own Standard public IP, no DNAT rule. Firewall and NAT both zone 1:
Standard NAT is not zone redundant; do not claim end-to-end zone redundancy.

| Source / destination | Allowed path / enforcement |
|---|---|
| Nodes/add-ons -> required AKS dependencies | Firewall application HTTPS rules with `AzureKubernetesService` FQDN tag; explicit currently documented add-on/OS/identity/monitoring dependencies. Private API path stays private, platform DNS TCP/UDP53 retained |
| Nodes -> Entra/token, MAR images, approved AzureLinux3 package/update endpoints | Firewall per-purpose HTTPS FQDN rules derived from current AKS outbound dependency table and OS/add-on guidance; **no generic `*.azure.com`/Internet allow**. Required service tags only where documented; no blanket all-port AzureCloud rule |
| Nodes -> ACR/KV | Private IPs:443, DNS links/zone groups, RBAC; no public fallback |
| Nodes/agents -> regional Log Analytics ingestion | Approved workspace DCE/ingestion FQDNs over HTTPS via firewall; no AMPLS in this proposal. Authenticated public telemetry endpoints are a disclosed trust boundary, not private data stores |
| Demo pods -> external internet | Namespace default-deny ingress/egress; allow DNS to CoreDNS and only released internal dependencies; no direct internet/model/Copernicus routes |
| VPN clients -> app, API, ACR/KV, resolver | Private routing, NSG where supported, Entra/data-plane RBAC; app audience has no credential entitlement to management endpoints. AKS API cannot use authorised-IP ranges as a substitute for identity on private clusters |
| Other RFC1918/Internet/lateral workload traffic | Denied unless explicitly above; no broad VNet lateral allowance in workload policy. Preserve supported intra-node/AKS system traffic, never blanket NSG-deny internal AKS subnet traffic |

Firewall policy is allowlist with default deny, threat-intelligence deny, DNS proxy
on (upstream Azure DNS), node DNS resolution tested against policy requirements.
Node configuration, managed add-ons and private-service routes cannot be fully
controlled by namespace policy: do not claim Cilium restricts host processes.
No NSG on GatewaySubnet/firewall/resolver managed subnet unless current official
support and reviewed requirement justify it. Private endpoint network-policy settings
must follow reviewed AVM/service support; enforcement is not assumed from NSG presence.

Network owner approves the **exact resolved FQDN/protocol/rule inventory** in the
implementation plan at design release. Authoritative dependency tables are linked
in §12; a tag alone is not the entire add-on inventory. Test an approved dependency
and a harmless nonallowlisted HTTPS destination after deployment; failure closed,
not fallback to direct internet. Platform owner reviews rule changes monthly and
before upgrades. No public DNS exfiltration protection/TLS decryption/IDPS claimed:
Firewall Standard can restrict FQDNs but cannot distinguish benign from malicious
use of an allowed service. Residual shared-service destination risk requires owner
disposition; no arbitrary URL/content approval inferred.

## 5. Capacity: platform minimum plus bounded proposed demo envelope

**No measured application/background workload exists.** Three users is a population,
not concurrency/throughput evidence. This proposes an intentionally small synthetic
envelope to be approved and later tested, not production sizing or approved SLO.
Sampled D4/D8 discovery listings were not a candidate shortlist or sizing basis.

Current official system-pool guidance requires Linux, at least two nodes, a
4-vCPU/4-GB minimum VM SKU and at least 30 pods/node; recommends three nodes.
That support floor, separation of critical add-ons and explicit platform headroom
drive the system pool. D4as_v5 has 4 vCPU/16 GiB; D2as_v5 user node has 2 vCPU/8 GiB.
Both CPU-only, no local temporary disk: explicit managed OS disks, no ephemeral-OS
assumption. Feasibility must validate supported AKS SKU/OS/patch and actual add-on
requests against these budgets; sampled availability is not that evidence.

| Pool | Fixed proposal | Requests/headroom and scaling |
|---|---|---|
| `sys` | System Linux AzureLinux3, Standard_D4as_v5; initial/min/max **2/2/2**, zone 1, maxPods 50; `CriticalAddonsOnly=true:NoSchedule` | Raw 8 CPU/32 GiB. Reserve proposed 1 CPU/3 GiB per node for OS/kubelet/eviction/DaemonSet uncertainty: planning envelope 6 CPU/26 GiB. Cap aggregate platform requests at **4 CPU/10 GiB**, including CoreDNS, Cilium, metrics, CSI, AMA, Gatekeeper/KEDA and 2 istiod replicas. At least 2 CPU/16 GiB remaining planning margin; actual allocatable and request inventory must supersede assumptions before release |
| `usr` | User Linux AzureLinux3, Standard_D2as_v5; initial/min/max **1/1/2**, zone 1, maxPods 50 | Raw 2 CPU/8 GiB per node. Reserve 0.4 CPU/2 GiB for OS/node agents -> planning 1.6 CPU/6 GiB. Initial total user-pod requests capped **1.5 CPU/4.5 GiB**, including gateway and TLS-sync. Two-node max **3 CPU/9 GiB** requests |

Illustrative initial pod allocation (not apps being installed here):

| Component | Replicas / CPU request each / memory each | Aggregate |
|---|---|---|
| Managed gateway proxies | 2 / 250m / 512 MiB | 500m / 1 GiB |
| TLS-sync | 1 / 50m / 128 MiB | 50m / 128 MiB |
| Future demo API/UI | 1 / 400m / 1 GiB | 400m / 1 GiB |
| Future synthetic background worker | 1 / 250m / 1 GiB | 250m / 1 GiB |
| Explicit bootstrap/rollout margin | budget 300m / 1.375 GiB | total **1500m / 4.5 GiB** |

Gatekeeper constraints, namespace ResourceQuota/LimitRange and actual pod inventory
must enforce requests and sensible limits (initial aggregate limits proposed
2 CPU/5.5 GiB), ephemeral storage 10 GiB/user pod, no PVC, GPU, privileged containers,
host networking/hostPath or unapproved registry/digests in demo namespace.
Managed-system exemptions are enumerated, not blanket workload bypasses.
Actual managed gateway/istiod/AMA defaults may exceed assumptions: feasibility
must inventory them and identify supported customisation. If they do not fit,
return a new design/cost revision, not disable monitoring or co-locate apps on sys.

Gateway HPA min/max 2/2, PDB minAvailable 1; istiod HPA min/max 2/2 (not default 5).
Future API HPA 1–2 at 60% requested CPU plus application in-flight signal; worker
KEDA 0–1, synthetic queue concurrency 1; no real queue provisioned. Whole-user
namespace quota **includes** maximum replicas, rollout and probes; test max
requests fit 2 nodes. Topology spread/anti-affinity preferences across hostnames,
not hard zone spread; initially gateway replicas share one user node.

**Quota arithmetic, both total regional and DASv5-family, not additive quotas:**

* Initial: `2*4 + 1*2 = 10 vCPU`, 3 nodes.
* Autoscaler maxima: `2*4 + 2*2 = 12 vCPU`, 4 nodes.
* Each pool `maxSurge=1` **node**, not percentage; budget both surges concurrently:
  `(2+1)*4 + (2+1)*2 = 18 vCPU`, 6 nodes, 6 P10 OS disks.
* Observed F02 total regional **20**, DASv5 **20**, usage 0 at observation.
  Worst case leaves **2 vCPU** in each, not 22 or 40. No other subscription
  compute may consume that reserved envelope. No blue/green duplicate cluster,
  extra system pool, manual resize, GPU or parallel ML job within this budget.
* VPN/firewall/resolver are service-managed capacity, not project VMSS vCPUs;
  separate service quotas/availability still need confirmation. No hidden operator VM.

Provision only two system nodes (official minimum, below three-node recommendation).
Cluster autoscaler is enabled with sys bound 2–2 and usr 1–2; no NAP/Spot. Serial
pool maintenance preferred despite concurrent-surge budget. Kubernetes pod rollout
does not consume vCPU unless it triggers a bounded extra node. maxPods 50 >=30;
Overlay allocates `/24` per node independent of maxPods: 6 of 16 blocks consumed.
Node/IP/quota limits include restart/upgrade overlap and disk removal lag.

**Proposed later demo evaluation:** max 3 simultaneous synthetic sessions, <=1
request/second aggregate, one background task at a time, <=1 MiB request payload,
no raster/model execution. Proposed p95 <=2 seconds for a synthetic local no-model
endpoint, errors <1% over 15 minutes, no OOM and no unschedulable pods at quota.
Not a model latency promise, business threshold or measured capacity.
Requesting user must accept/replace this envelope; application writer supplies
actual requests/limits and tester supplies independent load evidence in its later
package. Foundation checks validate empty-platform capacity/request inventory.

## 6. Identity, RBAC, bootstrap and supply chain

All principal IDs/tenant/subscription IDs are **required typed secure-context
inputs**, no invented IDs. Proposed Entra groups `ama-poc-platform-operators`,
`ama-poc-observers`, `ama-poc-image-publishers`; requesting user approves exact
membership/creation and protected object-ID references. Group names are not grants.

| Principal | Role / exact proposed scope / purpose |
|---|---|
| Human initial bootstrap | Temporary RG-creation authority at selected subscription and Role Based Access Control Administrator with constrained assignment conditions at **new project RGs only**; separate actual identity/activation/MFA approval required. Never infer Owner from F02 actions. No standing subscription-wide grant proposed |
| Infrastructure author/deployer (human, no pipeline identity) | Contributor on the two project RGs only; does not include role-assignment rights. AKS creates node RG; do not grant author direct VMSS mutation rights |
| Operator group | Azure Kubernetes Service Cluster User Role on **cluster resource** for credential retrieval; AKS RBAC Cluster Admin on **cluster resource** for time-bounded platform bootstrap/incident operations. Normal app author role later at namespace only; local accounts disabled |
| Observer group | AKS RBAC Reader on cluster; Log Analytics Reader on workspace; no secrets access or ARM mutation |
| Cluster MI `id-...-aks` | Network Contributor on dedicated POC VNet (AKS custom-private-DNS linking/network control requirement), Private DNS Zone Contributor on **AKS private zone only**, Managed Identity Operator on kubelet MI only; no subscription role |
| Kubelet MI | `AcrPull` at **this ACR** in classic RBAC mode; no push, no admin credentials; no business-data rights |
| Image publisher group | `AcrPush` at **this ACR**, approved digest/provenance only; connected VPN device builds locally, no ACR Tasks or cloud runner |
| TLS-sync MI | Key Vault Secrets User at **leaf TLS secret scope**; no CA root, vault management or other secrets. Federated issuer = actual AKS OIDC issuer, subject **`system:serviceaccount:ama-ingress:tls-sync`**, audience **`api://AzureADTokenExchange`** |
| Human certificate custodian | Temporary Key Vault Secrets Officer at vault for import/rotation (dedicated TLS-only vault); separate grant approval/revoke after operation. No resource-deployment output of certificate private material |
| Monitoring/add-on managed identity | Monitoring Metrics Publisher/DCR-required supported access only at matching DCR/workspace scope as verified by AVM/AKS integration; never reuse operator/kubelet identity for application access |

Cluster MI VNet role is intentionally broader than subnet-only because official
custom private-DNS linking requires it. It is still the isolated POC VNet, not
corporate network; feasibility must verify which additional ILB/subnet role
actions are necessary. Prefer supported minimum roles, document actual actions/
dataActions in feasibility for every selected definition and exact grantor.
KV/ACR data roles and AKS Kubernetes roles are distinct from Contributor.

Bootstrap is human operated after separate authorisation: confirm actual context/
MFA/PIM/conditions, create only project RGs/identities/network; apply approved narrow
grants; wait for RBAC propagation and PE/DNS readiness; connect VPN, retrieve
Entra user kubeconfig (no admin credential); install reviewed platform manifests.
Document who can mutate service accounts, federation, Gateway config and policies.
Human emergency path is authorised ARM repair/start plus VPN recovery and
time-bound Entra role activation. No permanent public API, local-admin kubeconfig,
`command invoke` bypass or break-glass credential stored in Git. A failed route/
MFA policy is an incident/change request, not permission to bypass enforcement.

Signed/scanned image gate remains baseline: future packaging uses immutable image
digest, build/source provenance and signature verification at admission. Proposed
threshold: no unaccepted critical/high exploitable findings, scans refreshed within
7 days of promotion; security owner approves interpretation and timed exceptions
(maximum proposed 7 days). Platform writer must select exact reviewed signing/
verification tooling and pins in plan, with no paid third-party service assumed;
no default permit while that mechanism is unresolved. Azure Policy/Gatekeeper
deny GPU/privileged/unapproved images plus custom signature policy is an explicit
feasibility item; Azure Policy is **not claimed** to perform every signature check.
No pipeline/signing key/cloud workload is created by this draft.

## 7. Typed composition and future interfaces — no implementation generated

Proposed future subscription root `infra/main.bicep` with environment
`infra/environments/poc.bicepparam`; logical module names here are boundaries only.
No verified version claim. Engineer must return exact published AVM pins/source/
parameter/output/default review before WV03. Native-resource exception needs
documented gap and design amendment, not a silently guessed version.

| Logical boundary | Typed inputs (required unless fixed above) | Non-secret outputs / dependencies | Candidate published AVM paths to verify |
|---|---|---|---|
| organisation | `location:string`, `tags:object`, fixed RG names | `platformRgId:string`, `aksRgId:string` | `avm/res/resources/resource-group` |
| connectivity | `addressPlan:object` containing CIDR strings; `vpnRootPublicCertificate:string`; `tags:object`; approved FQDN rule objects `{name:string,sourceCidrs:string[],targetFqdns:string[],protocols:object[]}` | subnet IDs, `firewallPrivateIp:string`, `natPublicIp:string`, `vpnGatewayId:string`, `dnsInboundIp:string`, zone ID map | `avm/res/network/{virtual-network,network-security-group,route-table,public-ip-address,nat-gateway,azure-firewall,firewall-policy,virtual-network-gateway,dns-resolver,private-dns-zone}` |
| trust/registry | `subnetId:string`, `zoneIds:object`, `tenantId:string`, tags | `registryId:string`, `loginServer:string`, `vaultId:string`, `vaultUri:string`, PE IDs; **no keys/tokens** | `avm/res/container-registry/registry`, `avm/res/key-vault/vault`, `avm/res/network/private-endpoint` |
| identities/grants | principal resource IDs/object IDs as `string`, role assignments `{principalId:string,principalType:string,roleDefinitionId:string,scope:string}[]`; federation `{issuer:string,subject:string,audiences:string[]}[]` | cluster/kubelet/TLS identity IDs and client IDs, no credentials | `avm/res/managed-identity/user-assigned-identity`; AVM resource RBAC contracts; standalone RBAC gap to verify |
| observability | `workspaceRetentionDays:int=31`, `dailyCapGb:int=1`, diagnostics map, `alertRecipient:string` supplied protected, tags | workspace ID, DCR IDs, action group ID | `avm/res/operational-insights/workspace`, `avm/res/insights/{data-collection-rule,action-group,scheduled-query-rule}`; verify exact catalogue support |
| cluster/pools | network/identity IDs, `kubernetesVersion:string='1.36.4'`, pool specs `{name:string,vmSize:string,count:int,minCount:int,maxCount:int,maxSurge:string,maxPods:int,zones:string[],osSku:string}[]`, Entra group IDs, workspace ID, tags | cluster ID/private FQDN/OIDC issuer/node RG ID, pool IDs, no kubeconfigs | `avm/res/container-service/managed-cluster`; verify pool/add-on Gateway API support and conditional gaps |
| Kubernetes bootstrap (separate from ARM graph) | `clusterId:string`, private FQDN, namespace/Gateway config, certificate **reference**, pinned image/policy inventory | Gateway private IP/readiness, accepted policy inventory; never Secret contents | No claim that an AVM implements Kubernetes manifests; separate scoped writer/plan |

Only the selected configuration is proposed for release; “private/public” flags are
not unreviewed environment variants. AVM pinning is per module, not an unbounded
latest reference. Critical feasibility gaps: current Gateway API ARM properties
(official example uses `2026-03-01`), managed Gateway/istiod request customisation,
AzureLinux3/1.36.4, UDR/FW/NAT sequencing, custom API zone, federated identity at
secret scope, signature enforcement, node-resource tag coverage and diagnostics.
CLI 2.84.0 observed in F02 is **below** current Gateway API guide prerequisite
2.86.0. An approved tool-update plan or verified equivalent supported Bicep/REST
path is required; no installation/update executed.

Future interface contracts (schema proposal `FoundationInterfaces/v1`; app/ML
owners must accept their own contracts before later release):

* Network: `vnetId:string`, `privateEndpointSubnetId:string`, approved zone-link
  ownership; later endpoint modules own their records and cost. No service pre-grants.
* Workload federation: `issuer:string`, namespace/service-account exact subject,
  audience above; distinct per-service MI, no shared cluster administrator identity.
* EU model interface: `{endpointUri:string,deployment:string,apiVersion:string,
  processingBoundary:'EURegional'|'EUDataZone',identityResourceId:string}`.
  Endpoint/model/geography availability and budget are later decisions; no Global
  personal/case processing, no service deployment or model call here.
* ML scoring interface: `{contractVersion:string,modelVersion:string,
  inputManifestUri:string,inputManifestSha256:string,asOfUtc:string,
  identityResourceId:string,correlationId:string}` -> `{resultManifestUri:string,
  resultSha256:string,status:'completed'|'abstained'|'failed'}`. Public-data lineage,
  cutoffs/cohorts/evaluation thresholds are ML-writer/domain-owner work, not invented.
* Application/event/tool contracts retain quarantine/clean/pinned manifest,
  idempotency, per-object authorisation, human adverse decisions and separate treasury.
  Future app writer owns schema/version, ML writer owns scoring/lineage. Requesting
  user is current human target owner and must name competent domain/legal owners
  before that scope. Independent AI01–AI06/ML01–ML08 evidence remains required later;
  these checks are NOT APPLICABLE to this foundation's delivered code, not “passed”.

## 8. Monitoring, privacy, retention and audit integrity

Proposal: one Sweden Central Log Analytics workspace with Container Insights
Analytics tables, 31-day retention, collection DCR and no full-body/debug logs.
Daily 1 GB cap is a warning/safety backstop, **not a hard bill cap**: collection may
overshoot and cap may omit incident evidence. Proposed 20 GB/month log envelope
and alert on 0.75 GB/day; preserve security-relevant audit over verbose stdout.
Review actual volume every demo day. No application/AI traces exist yet.

| Signal/source | Proposed collection/destination and response |
|---|---|
| AKS control-plane | `kube-audit-admin`, `kube-apiserver`, `kube-controller-manager`, `kube-scheduler`, `cluster-autoscaler`, `guard` where supported -> LAW, resource-specific tables. No blanket full `kube-audit` request payloads; redact credentials/identifiers and review category schema |
| Containers/nodes | ContainerLogV2 error/warn and selected ingress/access logs, KubeEvents, KubePodInventory, node/container performance -> LAW via AMA/DCR; inventory 5-minute, performance 1-minute proposal; restrict namespaces/streams without suppressing security events |
| ACR / KV | ContainerRegistryLoginEvents/RepositoryEvents; KV AuditEvent -> same LAW; exact regional categories verified by plan, no inventing unavailable category names |
| Firewall / VPN | Structured firewall application/network deny/allow and DNS-proxy diagnostics; GatewayDiagnosticLog, TunnelDiagnosticLog, P2SDiagnosticLog -> LAW, exact category/PII support verified. Resolver query logs not assumed; resolution probes plus firewall DNS failures supply DNS evidence |
| ARM/RBAC/policy | Platform Activity Log retained by service 90 days; scoped project create/update/delete/role/policy events exported to LAW for correlation; do not export unrelated estate inventory |
| Alerts, 4 rules | Health: node NotReady/collection gap >10 min when expected running; audit: any role/admin/firewall-rule or forbidden admission change; restart: >3 restarts/10 min or pending >5 min; egress: >10 denies/5 min or required-endpoint failures. Five-minute evaluation; requesting user action group via protected email parameter |
| Separate operational checks | CA/leaf/VPN expiry 30/14/7-day review, daily ingestion/cost review, subscription service-health notice, start/stop suppression log and post-start test signal. Baseline alert logic/queries belong in actual plan before implementation |

Managed Prometheus/Grafana are **not** deployed in this fixed proposal;
Application Insights/OpenTelemetry service collection is deferred with applications.
This is a baseline-stack departure, not equivalence; see §10. Azure Monitor/LAW
public authenticated ingestion/query endpoints are explicitly allowed via firewall;
no claim of private telemetry network or complete EU support isolation.

Current data flows include operator/group IDs, IPs, certificate subjects, security
events, email recipients, support records and accepted owner tag; public/synthetic
business data does not anonymise these. No claimant records, personal photos, case
IDs or secrets in logs/tags/prompts/alerts. Keep telemetry read access on workspace,
no demo-user access; operators cannot routinely purge/export logs. Reader and
configuration-changing roles separated where possible; single human owner retains
ultimate admin ability, so this is **not tamper-proof WORM**.

Proposed retention schedule, requiring privacy/legal owner justification:
operational/security LAW 31 days; platform Activity Log 90-day service retention;
approval/manifests/provenance in protected owner-controlled evidence store for
90 days after POC closure; client certificates max 90 days, immediate revocation
on offboarding; TLS private material rotate/revoke and KV recoverable deleted
secrets 7 days; no persistent demo state, disk snapshots or external data acquired.
No statutory POC WORM requirement established by CR06. Protected approvals,
fixed snapshots/hashes, immutable service Activity Log and restricted deletion are
proportionate proposed audit integrity; not CAP/AI production evidence compliance.

**Owner packet due before release:** requesting user identifies actual operating/
contracting entity and competent privacy/legal adviser (not inferred DPO), controller/
Microsoft processor/recipient responsibilities, purposes and lawful basis for admin/
telemetry/support/contact processing, administrator notice and applicable DPA/
Product Terms; reviews destinations/support/access/transfers and retention schedule.
Sweden Central hosts regional resources, but Entra/ARM, MAR, OS updates, global
DNS/control plane, email and Microsoft support may be global/EU+EFTA or subject to
exceptions. No “all processing EU” conclusion. Corporate IPAM/DNS/egress constraints
and actual Hungarian cybersecurity applicability need explicit screening, not an
assumption that the fictional agency is a real NIS2 entity.

Rights/hold/deletion procedure: owner receives request through protected channel,
verifies identity, inventories LAW/exports/support copies/certificates, obtains
competent lawful-retention/hold disposition, restricts access, performs authorised
selective deletion only where supported and records what platform retention cannot
delete. Resource removal is not proof Microsoft deletes all support/platform records.
On incident: operational owner isolates/revokes device/session/MI bindings, retains
approved evidence, contacts security/privacy/legal owner to assess breach/notification
and provider support; no statutory deadline/certification invented here.
CR10/11/13 CAP/AI/accessibility/eID specifics are future workload applicability,
not empty-foundation legal release conditions. Legal version/source corroboration
limits from compliance requirements must remain visible in independent review.

## 9. Operations, recovery, upgrades, tags and lifecycle

Proposed operator hours: 22 days/month, 09:00–17:00 **Europe/Budapest**, plus one
hour/day startup/maintenance allowance = **198 charged cluster hours**. These are
not approved hours/timezone. Compare full 730-hour month and stopped residual in
estimate. Human manual ARM start/stop only; no scheduler/workflow.

Start: confirm approved scope/MFA/offer balance, private VPN/DNS, firewall and
routes; start AKS; wait Running plus Ready nodes/pods/PE/DNS/identity/registry pull/
TLS/egress/monitor signal; only then announce availability. Budget 60-minute
pre-demo window, not guaranteed startup SLA; allocation after deallocation is
not reserved. Validate resumed node count against quota/min/max; AKS startup can
temporarily restore counts before autoscaler converges.

Stop: notify users, reject new work/drain, no standalone pods, wait managed jobs,
check PDB/webhooks do not block drain, record diagnostic/time/status and confirm
Stopped. Wait **15–30 minutes** before any restart per official guide. AKS state
preserved up to 12 months, not backup. Cert/token age continues; API PE/IP may
change/recreate in first pool subnet. No direct private endpoint edits.
Firewall/VPN/NAT/resolver/ACR/disks/IPs/LB/DNS/logs remain funded; **only AKS stopping**
is assumed in demo scenario. No firewall deallocation or daily VPN rebuild claimed.

Proposed recovery: manual rebuild from exact reviewed IaC, locked image/policy
digests, approved parameter manifest and owner-held certificate recovery materials;
revoke/reissue lost credentials. RTO **one working day**, RPO for reconstructible
foundation configuration **last approved revision**, no business data/PVC RPO.
Configuration approvals/checks retained outside cluster. KV protects leaf recovery,
ACR retains <=20 GB approved images; offline public-root+encrypted signing materials
are owner responsibility. No AKS Backup, storage account, paid backup product or
disk snapshots configured. Regional loss/offer exhaustion/zone failure can exceed
target; owner acceptance required. Drills later need separate authority.

Kubernetes 1.36.4/AzureLinux3 is proposed, not “default/latest”. Feasibility checks
support lifecycle, add-on compatibility and version pin; availability rechecked
before deployment. Never AzureLinux2 (retired; image removal imminent). Proposed
weekly maintenance Saturday 06:00–10:00 UTC, monthly owner patch review, node OS
NodeImage automatic security maintenance in approved window; Kubernetes patch
channel with minor upgrades manually reviewed one minor at a time. Add-on managed
Istio upgrades can occur with AKS releases; record impact and retest TLS/Gateway.
Start cluster in window if stopped; unsupported/out-of-window forced remediation
escalates. maxSurge one node per pool, drain timeout 30 min/soak 5 min proposed;
user PDB/rollout constraints tested not assumed. Downgrade not a rollback plan:
if upgrade fails, stop affected rollout, restore last compatible application,
escalate/rebuild approved cluster if necessary, never duplicate beyond quota.

Accepted tags explicitly applied to all taggable project RGs/resources:
`environment=poc`, `workload=ama`, `workPackage=WP-001`, `owner=paverboo`,
`costCenter="10122"` (string). Apply AKS cluster tags **and both pool tags**:
cluster tags cover node RG/cluster-associated resources, pool tags cover VMSS/
instances/disks/NICs as supported. Future StorageClass-created resources require
explicit supported tags (no PVC now); Gateway-created LB uses supported service
tag annotation. Per-resource inventory must include managed API PE/NSG/LB/
identities and auto-generated child names. Subnets, role assignments, diagnostic
settings, federated credentials and some child resources do not support independent
tags: name parent/scope and record service-specific exceptions in feasibility.
Do not “fix” AKS-managed children directly or assume RG inheritance.

Proposal: 30-day initial lifecycle review after deployment; expiry/review date set
by owner before deployment (not silently perpetual). No CanNotDelete lock on node
RG or VMSS that breaks scale/upgrade; proposed protection is least privilege,
purge-protected KV and explicit human cleanup approval. Cleanup: retain approved
evidence per schedule/hold; revoke VPN/client/group/federation/roles; remove
Kubernetes frontend, delete AKS through its owner, verify AKS-managed RG cleanup;
delete only project platform resources with approved dependency order; remove
offline trust/profile and prove residual resource/billing inventory. Never target
pre-existing estate or issue cleanup now.

## 10. All-five-pillar author assessment and approval decisions

This table is **author-side design reasoning**, not the tester's regulated
five-pillar architecture-review report.

| Pillar | Proposed measurable requirement / control | Trade-off / evidence / target owner |
|---|---|---|
| Reliability | two system nodes; bounded surge18<=20; rebuild <=1 working day to last approved config; tested stop/start readiness | **HUMAN APPROVAL REQUIRED D-HA:** single-zone pools/FW/NAT, one initial user node, no zone spread/end-to-end HA or backup service, below three-system-node recommendation. PDB cannot protect against user-node/zone loss. Manual rebuild direction does not approve this deviation. Requesting user approves scope/expiry; tester recovery evidence later |
| Security | no public app/API/ACR/KV, narrow identities, signed/scanned images, private trust, allowlisted firewall egress; prohibited paths denied | Costs/access complexity and certificate device custody; VPN cert alone not MFA; public authenticated monitoring and in-VNet HTTP hop are explicit residuals **D-SEC** for human security owner. Test allowed/denied flows, no bypass claims |
| Cost Optimization | complete per-meter USD quantities; 198h proposal versus730h, <=20GB logs, bounded autoscale and surge; review costs daily | Firewall/private DNS/VPN remain expensive when stopped. No approved ceiling/credit. Budget owner accepts full estimate, offer conditions and affordability; budget alert isn't cap |
| Operational Excellence | named human operator, version/policy/image pins, 31-day actionable logs, four alerts, recoverable approvals, upgrade/start/stop/incident procedures | **HUMAN APPROVAL REQUIRED D-MON:** no managed Prometheus/Grafana now, App Insights/OTel deferred with apps. Container Insights/LAW is not full baseline parity or statutory retention. Owner approves monitoring/retention/hold/deletion and time-bound deviation |
| Performance Efficiency | platform <=4CPU/10GiB requests; initial usr<=1.5CPU/4.5GiB; autoscale max2; proposed synthetic 3 sessions/1RPS/15-min target | Not measured/approved business demand, no ML/raster/model load; actual add-on footprint and support-floor suitability need feasibility. User approves demo envelope; app/ML writers later supply own contracts/requests; tester independent evidence |

Other **design-release owner decisions required**, not accepted defaults:
Sweden Central topology/exact names/address plan and external overlap; API/ACR
selection; VPN/private CA/device permissions/trust/renewal and emergency procedures;
Firewall+NAT and resolved dependency rules; bootstrap principals/groups/grant scopes/
MFA/corporate policy feasibility; pod/maintenance/recovery/retention/lifecycle
targets; privacy/entity/support/transfers applicability; current VS offer individual/
team/demo eligibility, service exclusions/credit and complete cost approval.
Requesting user must confirm competent legal/procurement delegation as needed.
Every deviation approval must identify scope/reason/compensating controls/expiry
against the preserved revision, not this draft's existence.

## 11. Acceptance matrix and release handoff

All checks below **NOT RUN** as independent evidence unless explicitly described
as author inspection. No future execution check blocks this draft merely because
it is later; all missing design-gate feasibility/review/approval still blocks release.

| ID | Requirement / expected evidence | Earliest required gate | Method / target owner; evidence producer |
|---|---|---|---|
| AC01 | Complete fixed inventory/diagrams/contracts, SEC01–12 and CR01–13 dispositions, input equality and preserved snapshot | design-released | WV01; user/architect; tester manifest and diagram syntax evidence |
| AC02 | Exact AVM pins/defaults cover resources including Gateway/OS/UDR/RBAC/tags; no unapproved native gap or unpriced additions | design-released | WV03; architect; Bicep engineer feasibility |
| AC03 | Actual platform requests fit budgets; approved proposed workload envelope; sys minimum2/4vCPU/maxPods>=30; total+family worst18<=20 | design-released | WV01–03; user; engineer request inventory/quota arithmetic, tester independent assessment |
| AC04 | External CIDR overlap/corporate network/DNS/egress/identity constraints disposition; exact FQDN rules and bootstrap authority matrix | design-released | WV01/03/04; user network/security owner; engineer+security inputs |
| AC05 | All-five-pillar independent architecture report, security-design and compliance-design dispositions; legal source limits explicit, no certification | design-released | WV02/03; user risk/legal owner; tester/security/compliance |
| AC06 | Reviewed actual implementation plan accepted by architect/writers; exact files, sequencing, tool prerequisite, tests and policy/image-signing enforcement pins | design-released | WV04; coordinator with architect/engineer acceptance |
| AC07 | Genuine fixed design/plan/cost approval incl D-HA/D-MON/D-SEC, hours/budget, offer/credit/procurement/privacy/entity/retention decisions | design-released | user protected approval reference in coordinator ledger, not an agent PASS |
| AC08 | Every Bicep/root/parameter build and warning disposition; exact pins/contracts and no secrets in code/output | locally-validated | WV05–08/11; user platform owner; engineer author checks + tester |
| AC09 | Names and accepted string-valued tags across project+AKS-managed inventory, per-service exceptions | locally-validated | WV09; user; tester resolved-template assertions |
| AC10 | API private/publicFQDN off/local accounts off; ACR/KV public+bypass off, PE/DNS wiring; internal-only Gateway before creation | locally-validated | WV10–12; user security owner; tester compiled-template/manifests |
| AC11 | OIDC/WI federation tuple and roles exact; NAP off, CNI Overlay/Cilium, pools/quotas/surge/PDB/HPA/admission/diagnostics per design | locally-validated | WV11–14; architect conformance, tester + specialist candidate dispositions |
| AC12 | Matching private-client/bootstrap/start-stop/recovery/upgrade/cleanup runbooks and documenter-owned publication | locally-validated | WV14; user operations; documenter, architect accepts technical meaning |
| AC13 | Fresh exact context/MFA/authority, quota/AKS SKU/version/zone/service availability including D2as_v5, IPAM/names/credit refresh, test identities/devices/certs ready | deployment-ready | WV15; user operator; tester under separate authority |
| AC14 | Authorised validate and inspected what-if; no existing estate changes, no hidden resources or quota overrun; actual cost/offer acceptance still valid | deployment-ready | WV16/17; user change authority; tester/engineer |
| AC15 | Private VPN -> DNS -> trusted HTTPS with hostname; public app denied; private API operator allowed and unauthorised role denied separately | operationally-verified | WV18–20; user; tester three-device safe probes, no TLS bypass |
| AC16 | ACR login+regional data resolve privately and real digest pull succeeds via kubelet MI; unauthorised push/pull denied; KV/TLS secret scope effective | operationally-verified | WV20/21; user security owner; tester |
| AC17 | Required egress allowed, harmless nonallowlisted egress denied; no direct route bypass; pod isolation and workload federation positive/negative | operationally-verified | WV20/21; user network/security owner; tester |
| AC18 | Approved test signal reaches LAW and email, security changes detectable, collection/retention/reads match schedule, actual cost tracking | operationally-verified | WV21/22; user operations/privacy/budget; tester |
| AC19 | Separately approved stop/start/rebuild drill, recovered DNS/PE/IP/TLS/MI/pull/egress/monitoring and elapsed target evidence; platform schedulable within budgets | operationally-verified | WV22; user operations; tester; later demo app load evaluated in app package |

SEC mapping: 01->AC01/09; 02–04->AC04/10/15; 05–06->AC04/11/13/16;
07->AC04/10/17; 08->AC10/16; 09->AC07/11/18; 10->AC02/06/11;
11->AC07/12/19; 12->AC01/06. CR01->AC01; CR02–06->AC05/07/12/18;
CR07->AC01/06; CR08–09->AC07/13/14/18; CR10–11/13->§7 future interfaces;
CR12->AC05/07. This is design traceability, not specialist approval.

**Release decision: WITHHELD.** Required AVM feasibility, preserved inputs, fresh
non-author five-pillar/security/compliance review, actual plan and human approval
are absent. Architect does not issue their verdicts. Parent coordinator is next
owner: preserve stopped files with tester/authorised snapshot producer, integrate
requirements, obtain F04 feasibility and independent regulated reviews, then actual
plan/owner decisions. Changes require new draft revision and existing loop counter.
No implementation recipient may consume r1 as a released design.

## 12. Official research record and author checks

All retrieved **21 October 2026**, public generic technical terms only. Current
documentation informs proposal, not Azure allocation/feature availability or costs
for this offer. No versions of AVMs fabricated.

| Source | Decision/evidence and limitation |
|---|---|
| [AKS baseline Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/reference-architectures/containers/aks/baseline-aks) | Isolation, private access, IPAM and five-pillar baseline; not a POC bill/SLA |
| [System pools](https://learn.microsoft.com/en-us/azure/aks/use-system-pools), [Dasv5 specs](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes/general-purpose/dasv5-series), [AKS limits](https://learn.microsoft.com/en-us/azure/aks/quotas-skus-regions) | Support minima and CPU/RAM, not sampled-size sizing/allocation guarantee |
| [Overlay configuration](https://learn.microsoft.com/en-us/azure/aks/azure-cni-overlay) | Explicit overlay/IPv4 and OS retirement warning; overlay overview linked therein governs `/24` planning |
| [Private cluster](https://learn.microsoft.com/en-us/azure/aks/private-clusters) | Custom zone/UAMI roles, public-FQDN disabling, PE/DNS/connectivity separation |
| [ACR private endpoints](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-private-endpoints) | Premium/private access, login/data endpoints and hosted-agent limitations |
| [Gateway API app routing](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api), [customisation](https://learn.microsoft.com/en-us/azure/aks/istio-gateway-api), [TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls) | Current managed ingress (August/October2026 updates), CLI>=2.86, external default, HPA/PDB customisation/CSI reference. No copied example deployment executed |
| [VPN certificate auth](https://learn.microsoft.com/en-us/azure/vpn-gateway/point-to-site-certificate-gateway), [VPN DNS troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/azure/vpn-gateway/vpn-gateway-troubleshoot-vpn-point-to-site-connection-problems) | Per-client revocation, private resolver route/profile dependency; no corporate connectivity assumed |
| [AKS egress dependencies](https://learn.microsoft.com/en-us/azure/aks/outbound-rules-control-egress), [Firewall enforcement](https://learn.microsoft.com/en-us/azure/aks/limit-egress-traffic), [NAT+Firewall](https://learn.microsoft.com/en-us/azure/firewall/integrate-with-nat-gateway) | FQDN rules/UDR; NAT on firewall subnet; Standard NAT not zone-redundant. New StandardV2 tutorial not silently applied to Standard design |
| [Stop/start](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster), [AKS tags](https://learn.microsoft.com/en-us/azure/aks/use-tags) | Capacity/IP/state caveats; distinct cluster/pool/managed-resource propagation |
| [AVM catalogue](https://azure.github.io/Azure-Verified-Modules/indexes/bicep/bicep-resource-modules/) | Candidate module discovery only; exact pins/contracts deferred to engineer |
| [Retail API](https://learn.microsoft.com/en-us/rest/api/cost-management/retail-prices/azure-retail-prices), [pricing observations](cost-estimate.md) | Unauthenticated USD per-meter estimates, not actual VS terms/eligibility |

Some guessed documentation URLs returned 404 (old VPN troubleshooting, overlay
configuration, node-resource-group and Azure Monitor pricing paths); no evidence
inferred from them. Correct public documentation/search-derived pages supplied
the cited replacements where available. Oversized tool outputs were read in
relevant ranges/searches, not asserted fully reviewed. No downloaded repo sources
or private values sent to public research.

Author checks this cycle: **PASS (author inspection only)** for assigned-output
scope, accepted-vs-proposed separation, internal address arithmetic, quota18<=20,
resource-to-cost crosswalk, all-five-pillar coverage, staged criteria and requirement
traceability. **NOT RUN:** Git object equality/hash/diff, Markdown/Mermaid parser,
executable arithmetic, AVM/version/API feasibility, effective controls, independent
reviews and Azure/live checks. Text flow diagrams avoid an unverified Mermaid
syntax claim. No implementation build expected at this drafting gate.
SQL/task-store tool is unavailable; parent must mark `wp001-design` **done** for
completed draft deliverables (with release blocked on stated decisions/evidence),
or flag a newly discovered genuine drafting/evidence defect. No task state written
outside ownership; author has stopped writing both outputs for preservation.
