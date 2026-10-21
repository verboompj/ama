# WP-001 — alternative evidence-plan proposal EP-r1

**21 October 2026 · PROPOSAL ONLY · ready for independent review, NOT approved.**

## 1. Acceptance, authority and fixed inputs

**ACCEPTED before technical work:** `assignments/F03-evidence-amendment.md`,
as narrowed by the current explicit user instruction. The user selected
“Prepare an alternative evidence plan for independent review”, not an amendment,
implementation, qualification, spending or deployment approval. Sole write ownership:
this file. Existing main design/cost remain **F03 r1 unchanged**; their release
blockers remain effective unless an exact amendment is genuinely approved.

Inputs: [S002 manifest](snapshots/S002/manifest.md), seven preserved copies and
eighteen immutable references; especially preserved `design.md` §§3–6/11,
`cost-estimate.md` §§2/6–8, `feasibility.md` **F04-r1** §§2/6–7,
security SEC01–12 and compliance CR01–13. Preserved context/documentation supply
scope and explanation, not approvals. S002 base:
`5ecf21c2e8333b83c176073b02fece55c9a16f62`; workload dependencies remain at
`01002b21e5c6cb57d391c685adcbc05f03885b38` as the manifest specifies.
The assignment/user report supplies corrective cycle 2's no-edit stop.

Required skills loaded/applied: `ama-context`, `ama-design-release`, `ama-handoff`;
AGENTS, team/operating guide, workload guidance, coordination, handoff, release
ownership/snapshot contract and design-release template read. S002 preservation
is accepted as supplied, **not independently rehashed here**: exposed tools do
not provide local Git-object extraction or hashing. Current policy/skill files
are authoring instructions, not substitute workload baselines. One current-design
matrix read was superseded by reading the same section from preserved S002;
the preserved copy governs this proposal. No moving lifecycle approval is inferred.

Classification **HIGH**, explicitly selected **`gpt-6.1-sol`**; actual runtime
**NOT VERIFIED** (no authoritative runtime-model field exposed). No switch,
fallback or onward delegation. Loop **`WP001-F03-AUTHOR`, cycle 3/5 consumed:
3 used / 2 remaining**; prior blockers, snapshots and other review budgets do not reset.

## 2. Requested decision and evidence limits

Propose **only a prerequisite/evidence split**, not an architecture replacement:
release-time specification remains mandatory; selected managed-default facts
would be established through a separately authorised **empty-foundation
qualification** before any application/demo admission or security acceptance.
No apps, business HTTPRoutes/backends, Foundry, ML, model/data jobs, claimant/case
data or new services. Foundation controllers, approved TLS-sync and bounded
platform-only test objects are not permission for business workloads.

Known: F04 verified useful published contracts but found material gaps. Public
guides establish reservation mechanics, supported customization boundaries and
managed in-place changes. They do **not** supply a full Kubernetes-1.36.4-bound
managed-add-on request/count/placement inventory or a managed app-routing minimum
TLS contract. **Those facts remain UNKNOWN.** Neither three users, raw CPU sums,
upstream Istio/Envoy defaults nor a future probe supplies today's pass.
The proposed runtime method yields scoped observations, not a vendor guarantee.

The requesting user, as target/risk/scope owner, must explicitly approve the exact
prerequisite change below against a frozen EP-r1 snapshot **after fresh independent
technical and security review**. That approval must acknowledge empirical-only TLS
assurance, automatic managed changes and the resulting hold/requalification duty.
It is distinct from later approval of the full revised design, actual plan, cost,
native exceptions, deployment and disruptive drills. If reviewers/owner require
a vendor-backed minimum-TLS guarantee rather than this observational path,
**BLOCKED: obtain that version-bound supported contract or commission a separately
reviewed design revision**. This proposal cannot manufacture it.

### Before / proposed after / earliest gate

| Criterion / finding | Before (still binding now) | Proposed after, only if explicitly adopted | Owner / evidence |
|---|---|---|---|
| AC03 / F04-03 | At `design-released`, actual platform requests must fit the budgets; approved workload envelope, system minimums and 18-vCPU quota arithmetic | **AC03-S**, `design-released`: fixed resource/cost bounds, inventory schema, owned non-managed pins, placement/reserve algorithm, test thresholds and residual uncertainty approved; managed unknowns explicitly listed, not passed. **AC03-L**, `locally-validated`: exact candidate assertions and all known requests/counts evaluated, no current configuration defect. **AC03-Q**, `operationally-verified` for empty foundation: observed complete inventory plus per-node fit, readiness and lifecycle qualification; mandatory predecessor to any app/demo admission | Requesting user owns targets; engineer supplies contracts; tester independently checks; architect conformance is author-side only |
| F04-06, TLS evidence only (AC02/06; linked AC10/15) | Design release requires evidence of a supported method/version guaranteeing Gateway TLS ≥1.2; later rejection probes also required | **TLS-S**, `design-released`: exact supported HTTPS/certificate workflow, private-only listener, no unsupported overrides, complete positive/negative tests and change/stop contract; explicitly accept observational rather than undocumented guaranteed minimum. **TLS-L**, `locally-validated`: inspect exact manifests/configuration and client-test prerequisites. **TLS-Q**, `operationally-verified`: actual tested managed build/configuration passes §6; required before security acceptance or app admission | Security reviewer assesses adequacy; requesting user owns residual-risk/target decision; tester produces independent observations |
| AC13/14, WV15–17 | Fresh context/identity/availability, authorised validation and inspected what-if at `deployment-ready` | Unchanged, applied specifically to the empty-foundation candidate; no runtime pass required merely to authorize its bounded qualification deployment | Human operator/change owner + tester |
| AC15–19, WV18–22 | Observed controls/recovery due at `operationally-verified` | Unchanged except explicitly including AC03-Q/TLS-Q. Empty-foundation qualification is a **subset**, not blanket completion of AC15–19 or package security acceptance | Tester and required specialist/human owners |
| All other findings/criteria | Full regulated release prerequisites | Unchanged; no implicit deferral or waiver, including F04-06 signature/admission half | Respective writers/reviewers and genuine human approvers |

This introduces no new repository lifecycle state. `locally-validated` would mean
static acceptance for this approved scope, **not** capacity-qualified, TLS-observed
or app-ready. Earlier known defects still block their current gate. Runtime checks
remain `NOT RUN`, not `PASS` or `NOT APPLICABLE`. Without approved amendment,
AC03/F04-03 and TLS F04-06 still block the original design release.

## 3. Approval and stage sequence (all future execution NOT RUN)

1. **Proposal review:** parent accepts stopped output, assigns tester/operator to
   preserve exact bytes plus S002/assignment dependencies. Fresh non-author
   infrastructure-tester and security-reviewer review the **same** preserved
   proposal for testability, false passes, hard-bound limitations and residual risk.
   Return findings through parent; no onward delegation by this author.
2. **Exact prerequisite decision:** requesting user approves/rejects the above
   criterion/gate split, its uncertainties and §4–6 thresholds. Parent records
   protected approval reference, scope and snapshot in ledger; reviewer acceptance
   is not owner approval. Missing approval leaves original blockers intact.
3. **Normal design release:** separately assigned architect integrates an adopted
   change into a new design revision. Resolve §7 first; engineer feasibility,
   dedicated independent **all-five-pillar architecture report**, security-design,
   compliance-design and affected privacy/legal inputs remain required. Coordinator
   supplies actual file/task/ownership/test plan, accepted by architect/writers.
   Obtain genuine fixed design/actual-plan/full-cost and applicable human approvals,
   including D-HA/D-MON/D-SEC, offer eligibility, credit, privacy/retention and recovery
   targets. Only then may authorised writers implement; no implementation now.
4. **Fixed local candidate:** tester preserves template/parameter/platform-manifest
   revisions and dependency pins; WV05–14, required candidate reviews, documentation
   and architect conformance must pass. Qualification plan records test tool
   versions/digests, methods, expected results, evidence paths and allowed mutations.
5. **Authenticated preflight:** separate validation authority; explicitly display
   and obtain human confirmation of exact tenant ID, subscription ID, cloud,
   Sweden Central location, operator object ID, activated role/conditions/MFA,
   deployment roots/scopes and candidate hashes. Actual IDs are **not supplied
   here**; absent/mismatched values block execution. Refresh exact patch/OS/SKU/zone,
   quota/usage, IPAM/names, offer/credit/funding and private client prerequisites.
   Authorised tester runs scope-correct validate and what-if (WV15–17); human inspects
   creates/modifies/deletes, RBAC and preview limitations. Any existing-estate change,
   hidden resource or unresolved preview blocks. No Azure calls in this task.
6. **Separate qualification deployment authority:** human authorises exact fixed
   candidate, context, named operator/tester, approved hours/currency ceiling,
   resource bounds, platform bootstrap/test permissions, cleanup/recovery plan and
   expiry. Preview/design approval is not this permission. Deploy only that
   foundation; preserve actual deployment record. No pilot/application access.
7. **Qualification and disposition:** tester independently gathers §5/6 evidence
   against actual configuration; security reviewer assesses findings, human accepts
   scoped residual risk. Only successful **fixed-candidate** qualification permits
   consideration of later separately released app/demo admission. Required other
   foundation checks still apply; no certification or automatic next phase.

No current security acceptance is granted at any of these proposal steps.

## 4. Resource, cost, identity and data guardrails

Retain r1 inventory, scopes and ownership: two new project RGs
`rg-ama-poc-sec-platform` / `rg-ama-poc-sec-aks`; AKS alone owns
`rg-ama-poc-sec-aksnodes`. Only approved subscription bootstrap actions may create
RGs/grants; Contributor is not grant authority. Separate operator, observer,
publisher, cluster, kubelet, TLS and monitoring principals per corrected contracts;
no subscription Owner assumption, standing broad grants or direct VMSS repair.

| Guardrail | Exact proposed bound; no increase authorised |
|---|---|
| Compute | One AKS Standard/paid Standard cluster, proposed 1.36.4/AzureLinux3 only if freshly available; CNI Overlay/Cilium/WI, NAP off, zone 1. `sys`: D4as_v5, 2/2/2; `usr`: D2as_v5, 1/1/2. maxPods 50; no extra pools, VM, Spot, GPU or duplicate cluster |
| Counts | Initial 3 nodes/10 vCPU; maximum steady 4/12; maxSurge **one node per pool**, both-overlap ceiling 6/18 (sys ≤3, usr ≤3). At most six 128-GiB P10 OS disks including removal lag, no data disks/PVC/paid bursting. Serialize maintenance; confirm no other pool replacement/surge mechanism adds nodes |
| Quota | Historical total-region20 and DASv5-family20 are independent constraints, not additive or current reservations. Fresh available headroom must cover full18 in **each** after other usage/reservations, preserving the planned2-vCPU margin at limit20. No request for a quota increase or other subscription compute consuming this reserved envelope |
| Network/service count | r1 only: one VNet, three NSGs, one UDR table, Firewall Standard+policy, NAT on FirewallSubnet, three PIPs, one VpnGw1AZ, resolver inbound1/outbound0, four private zones, ACR Premium1, KV Standard1, two customer PEs plus AKS-managed API PE, one private LB/frontend. No public app listener, domain purchase, jump host or new service |
| Other billable scope | Existing LAW/DCR/association/action group/four log-alert series only; no second collector, Prometheus/Grafana/App Insights/Sentinel/export service. Keep ACR ≤20 GB; logs ≤20 GB/month and workspace daily cap1 GB as proposed, retention31d subject to required corrections/approval; caps do not guarantee cost or audit completeness |
| Time/cost | **Zero incremental budget request.** Qualification consumes, not supplements, r1 allowances **only if later approved**: within198 monthly AKS running hours under the demo scenario, extra usr-node ≤24 node-hours/month, two surge nodes ≤8 node-pair-hours/month (each ≤8h), priced extra allowance USD5.604/month. Reserve actual remaining allowances before each stage. Existing recommended USD2,030/month demo envelope is **unapproved**, not a hard cap; no new price/credit claim |

Before execution, budget owner must provide an exact approved currency ceiling,
remaining funded amount/usable credit, start/end time and residual-service funding.
**These values are UNKNOWN and block execution**; adopting this proposal does not
fill them. Use remaining r1 allowances, actual charges/accrual estimates and an
owner-approved shutdown/cleanup reserve; no threshold means no start. An operation
whose worst-case cost cannot fit the remaining funded allowance must not start.
Billing delay, budget alerts and a workspace cap are not hard spend enforcement.
If a genuinely hard currency cap is mandatory and no supported mechanism can
ensure it, stop for owner decision, not a fabricated safeguard.

Private VPN-connected approved devices only; resolve/reach private API, Gateway,
ACR login **and data** endpoints and KV; no public fallback, hosted runner or
`command invoke` bypass. Preserve reviewed DNS/firewall rules and MFA. TLS secrets
via approved private KV workflow; no keys, kubeconfig, tokens or private CA material
in evidence. Operator IPs/IDs/telemetry are protected data even for this empty stage;
privacy basis, notice, minimization, readers and retention must be approved first.
Store redacted metadata and protected evidence references, not complete secret-bearing
manifests/logs. No claimant/case, parcel, app/demo, training or scoring inputs.

**Stop/start caveat:** Learn explicitly says startup node counts may initially lie
outside autoscaler bounds. The table is an acceptance ceiling, **not proof of an
enforced restart ceiling**. Before authorising a restart drill, engineer/tester must
establish a supported, reviewed method bounding startup at sys2/usr≤2 (≤4/12),
with no concurrent surge. No such method is established here. Absent it, restart
qualification is **BLOCKED**, and app admission remains held; monitoring an overrun
after allocation is not prevention. Do not lower shared subscription quotas, disable
security webhooks, or assume min/max proves the bound. Upgrade qualification similarly
requires the effective worst-case bound, including replacement/deletion lag.

## 5. Capacity evidence and acceptance protocol

Engineer owns inventory contract; tester owns independent collection/bin-packing
and observations. For **every** selected managed and non-managed component record:
actual AKS patch/node image/kernel/OS, add-on/controller image version and digest,
namespace/owner, Deployment/DaemonSet/Job kind, replicas/HPA min/max, strategy surge/
unavailable, PDB, node selectors/taints/tolerations/affinity/topology, scheduling
priority, container requests/limits, init containers, restartable init-sidecars,
injected sidecars, pod overhead, ephemeral storage and pod-slot consumption.

Include CoreDNS, metrics, Cilium agents/operator, kube-proxy **if present**,
CSI driver/provider, WI webhook, AMA/controllers, Policy/Gatekeeper audit/controllers,
KEDA operator/metrics/webhooks, istiod, gateway proxies, TLS-sync, verifier/admission
and all bootstrap/probe pods. Count DaemonSets on **every eligible sys and usr
node**, including surge nodes; do not omit injected containers or count absent ones.
Zero/missing requests are not evidence of zero demand: require supported explicit
requests or an independently reviewed conservative bound; otherwise **BLOCKED**.

Per-node method, for CPU, memory, ephemeral storage and pod slots:

* Capture actual `capacity`, `allocatable`, effective kube/system reservations,
  eviction thresholds and OS use; reconcile with official guidance, not raw SKU sums.
  No preview reservation changes are proposed.
* Retain r1 planning floors sys1 CPU/3 GiB and usr0.4 CPU/2 GiB per node.
  For CPU/memory, usable request budget is **min(observed allocatable,
  observed capacity minus that floor)**. This avoids subtracting OS reservations
  twice; DaemonSet/pod requests are separately charged **once**, not hidden in reserve.
  If measured OS/eviction needs exceed the floor, the smaller actual budget governs.
* Compute effective pod requests with selected-version scheduler semantics:
  all regular containers + concurrent restartable sidecars, maximum applicable
  init phase versus steady phase, plus pod overhead. Do not merely sum regular
  containers or ignore init concurrency. Verify supported tooling/formula against
  the observed version; missing semantics block the calculation.
* Demonstrate an actual feasible placement on each eligible node under all hard
  constraints, maxPods50 and allocatable storage/eviction headroom. Require request
  sum ≤usable budget on **each** node; no aggregate-only pass or reliance on priority
  evicting another required component. Report allocatable, requests and residuals.
  Positive residual storage/eviction headroom is mandatory; its approved numerical
  safety margin is **not supplied in r1** and must be fixed before qualification.
* Keep sys-hosted aggregate platform requests ≤4 CPU/10 GiB; **all** usr-hosted
  requests, including node agents/proxies/TLS-sync/probes, ≤1.5 CPU/4.5 GiB at one
  node and ≤3 CPU/9 GiB at two. Future apps consume only independently demonstrated
  residual capacity within those same caps; no illustrative app allocation is proof.
  Gateway and istiod HPA2–2/PDB1 require supported effective configuration verification;
  default istiod max5 cannot be silently ignored during bootstrap.

Required scenario evidence: initial sys2/usr1; permitted steady sys2/usr2; supported
bootstrap peak **before** customization; all managed HPA/Deployment/DaemonSet rollout
maxima; one-pool-at-a-time drain with surviving-node fit/PDB, returning surge and
both-surges18-vCPU contingency; separately authorised bounded stop/start and upgrade.
Compute exact peak **pod/container counts** from each observed strategy/max value,
including terminating pods retaining requests and disk/IP cleanup lag. Those counts
are **UNKNOWN now** and must not be replaced with “two replicas” or “six nodes”.
Unsupported bootstrap/managed placement or peak exceeding bounds stops the stage.
No forced drain, admission bypass or HA assertion for two proxies on one usr node.

Proposed runtime acceptance, requiring owner/reviewer approval: after bootstrap
and after each authorised transition, all required nodes/controllers/replicas Ready
within30 minutes; then30 continuous minutes with zero required unschedulable pods,
OOMKills, pressure/eviction events or unexpected restarts; every per-node/cap/peak
test above passes. These are qualification thresholds, not promised service SLOs.
Thirty-minute startup observation begins after the documented15–30-minute stop
settling interval. Exact upgrade/drain/recovery deadlines and storage safety margin
remain **UNKNOWN**; owner/tester must set them in the approved actual plan before
those operations. No timeout retry, extra node or relaxed reserve follows a failure.
A supported target upgrade patch must be independently selected/reviewed before
any upgrade drill; it is not invented here.

## 6. TLS ≥1.2: exact proposed observation contract

Use the r1-proposed private HTTPS listener `portal.ama-poc.internal:443`, internal
`10.83.2.10`, proposed90-day private-CA leaf and three VPN-connected devices,
only after the trust arrangement and exact devices are approved and deployed.
None exists as observed evidence here. Resolve actual address privately and verify
no unintended public frontend.
No business HTTPRoute/backend is needed: TLS handshake followed, where needed,
by a **HEAD /** request with no body, credentials, cookies, query string or
personal identifiers; no redirects followed. Record status/headers metadata only;
a documented non-routed404 may be expected, but an HTTP200 is not TLS proof.

Evidence binds time/region/cluster resource reference and deployment hash to actual
control-plane patch, node image, GatewayClass/controller image digests, istiod and
each proxy image digest/pod identity, effective Gateway/configuration hashes and
certificate public fingerprint/serial/SAN/issuer/validity. App-routing is upgraded
in place, **not a selectable `asm-*` revision**. “Tested managed revision” means
that observed build/digest set, not a fabricated pin or upstream guarantee.

Tester records client/crypto library versions, trust store fingerprint, exact
protocol restrictions, SNI/hostname, clock and network location. From **each of
three approved devices**, repeat every applicable positive/negative case3 times:

| Test | Required result / interpretation |
|---|---|
| Force TLS1.2 only, correct SNI/name and approved CA | 3/3 handshakes succeed per device; negotiated protocol exactly1.2, valid chain/SAN/time, no verification bypass. Safe HEAD reaches the intended Gateway |
| TLS1.3-only and ordinary modern negotiation | Record supported/not supported and negotiated version; every success must be≥1.2. TLS1.3 is not a new mandatory minimum or an assumed capability; a1.3-only rejection cannot substitute for the required1.2 success |
| Force TLS1.0 only; separately1.1 only | 0 successful handshakes in each case; no HTTP exchange. Client must actually emit that protocol's ClientHello (verify with safe local fixture/capability evidence). Local crypto-policy refusal, DNS failure, timeout or generic connection error is **inconclusive**, not server rejection |
| Correct endpoint but wrong verification hostname; separately trust store lacking approved CA | Client verification fails before HTTP, no insecure retry. Keep SNI correct when isolating hostname verification from server routing; an absent listener alone is not certificate-verification evidence |
| Public certificate chain validity | Verify SAN exact name, trusted chain, server-auth use, valid notBefore/notAfter against trusted UTC clock; no expired/untrusted acceptance. Offline revalidation of the same public chain just outside validity bounds must reject. This is explicitly **offline client evidence**, not an observed expired-server test |
| Renewal/reload and trust lifecycle | Under separately approved certificate-change test, rotate through the selected supported private workflow, record new public fingerprint served by every proxy, rerun protocol/name/trust cases. Exact reload deadline and expiry-alert delivery targets must be fixed before this mutation; absent targets block that part |
| Outside VPN/unapproved device | No public app frontend/reachability; authorised safe external connection attempt cannot reach service. Routing denial alone is not TLS rejection and does not pass the protocol cases |

Verify all active proxy replicas, not just repeated LB selection: use approved
internal per-replica observation/probe access with same SNI/trust and no new public
endpoint, plus LB path from each device. If not possible, coverage is incomplete,
not a pass. No penetration test, body upload, secret capture or service weakening.
No tls.options minimum override, arbitrary Istio CRD/EnvoyFilter or NGINX replacement
is assumed. Existing supported service TLS properties on other paths remain
mandatory; this method changes only the specified managed-Gateway evidence.

**Any TLS<1.2 success, wrong/expired/untrusted certificate acceptance, missing
replica coverage, inconclusive negative test or changed build blocks qualification.**
Stop probes, maintain the application admission hold; authorised operator isolates
the private listener if needed under the preapproved containment plan. No HTTP/
public/insecure fallback. Restore only supported approved certificate/configuration
or rebuild a reviewed candidate; otherwise return to design. Do not claim an
ability to pin or roll back a managed build that the service does not expose.

Invalidate affected evidence and repeat qualification after AKS/add-on/proxy/node
upgrade, controller rollout, HPA/placement/resource change, Gateway/Secret/CA/SAN/
trust-store/CSI change, DNS/LB/network change, restart/rebuild or security regression.
Before any app admission/use, compare current digests/configuration to the qualified
record. Managed automatic changes can occur between observations; reviewers/owner
must accept a credible detection-and-hold operating contract before release.
If it cannot prevent use of an unqualified build, **BLOCKED**, not continuous TLS
assurance by periodic tests. No new monitoring product/spend is selected here.

## 7. Unchanged mandatory design-release blockers and failure path

F04-01/02/04/05/07/08 and signature/admission F04-06 **remain unresolved**.
Require verified contracts or explicit proposed native exceptions, independent
review and genuine human approval before design release:

* **01:** supported managed Gateway enablement; one authoritative complete AKS
  resource owner, never duplicate owners or a partial PUT treated as a patch.
* **02:** certificate-only OpenVPN and complete multiple-client revocation
  inventory; no fake AAD values or silent authentication broadening.
* **04:** exact OS/add-on/identity/monitoring egress inventory and resolved
  node-DNS/firewall-proxy enforcement; no generic open-egress shortcut.
* **05:** AAD monitoring, single DCR/DCRA owner, supported cadence/filter/table/
  alert contracts, activity-export scope/privacy/cost disposition; no duplicate collector.
* **07:** correct real module outputs and subnet/federation ownership/dependencies;
  no invented output or cycle-breaking unsupported field.
* **08:** explicit preview/default decisions (ACR, KV, LAW, AKS), retention and secure
  nested-key-output disposition; “secure” is not plaintext and not an automatic waiver.
* **06 supply chain:** exact signing/verifier/admission tool/chart/image versions
  and digests, publisher/key or identity/issuer trust roots, signature/provenance
  policy, registry/digest allowlist, scan thresholds/freshness, failurePolicy and
  namespace/resource scope, requests/counts/egress and installation owner.
  Unsigned/tampered/untrusted/wrong-identity/digest images and unavailable verifier
  must deny as specified; positive trusted digest must admit. Enumerate every
  managed/bootstrap exception with exact scope, reason, owner, expiry and checks;
  no wildcard workload bypass or permit-on-error. Bootstrap circularity/stop-start
  webhook interactions need a verified bounded contract, not disabling fail-closed
  admission. These are **design contracts now**, executable evidence later.

Capacity/peak/budget failure: stop further qualification and deny app/demo admission;
preserve redacted evidence and return through coordinator to architect/engineer.
Sizing/control changes require a **new design/cost revision and approvals**; never
unapproved scale, extra spend, omitted agents or weakened admission/TLS.
Deployment is nontransactional: no automatic cleanup/rollback assumed. Named human
operator uses only preapproved stop/isolation/cleanup permissions on new scope;
if absent or ineffective, escalate incident and obtain explicit authority.
Residual firewall/VPN/resolver/registry/disks/log charges continue when AKS stops.

## 8. Quality, sources and actual author checks / return

Affected five-pillar trade-offs for later full regulated review: reliability
accepts qualification/recovery holds and no restart-capacity guarantee; security
retains private TLS/admission but observational managed TLS risk needs owner decision;
cost uses existing allowances only and incurs residual charges; operational
excellence requires immutable evidence/change detection and accountable containment;
performance requires per-node effective requests and measured empty-platform health,
not application throughput. This paragraph is **not** the required independent
five-pillar report or compliance review.

Official public technical research accessed **2026-10-21**, through exposed Learn
search/fetch tools, using generic technical queries only:

| Source | Supported use / limitation |
|---|---|
| [Application routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api) | Supported customization allowlist, gateway/control-plane HPA, in-place/automatic upgrades, logging and lack of EnvoyFilter support. Does not establish full1.36.4 inventory or minimum-TLS guarantee |
| [Manual Gateway TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls) | KV/CSI → Kubernetes Secret → HTTPS listener/certificateRef pattern; not exact WI/encoding grant contract or minimum protocol evidence. Sample apps/commands not executed or copied as infrastructure |
| [Node reservations](https://learn.microsoft.com/en-us/azure/aks/node-resource-reservations) | Allocatable differs from capacity; CPU/memory/eviction and OS reservations. Not complete add-on request or per-node fit evidence |
| [System pools](https://learn.microsoft.com/en-us/azure/aks/use-system-pools) | Minimum2 nodes,4-vCPU SKU,≥30 pods; recommendation3 nodes. Support floor does not prove proposed capacity |
| [Stop/start](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster) | VMSS/NAP restrictions, API PE/IP changes, lost standalone pods, startup outside autoscaler bounds and webhook interactions. Do not adopt its permit-on-error suggestion |
| [Upgrade guidance](https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster) | Surge/quota/subnet/drain/PDB considerations, not evidence of actual bounded target behavior |

Fetch of guessed `app-routing-gateway-api-configuration` URL failed (404/network);
no claim relies on it. Relevant content came from the main routing/TLS pages.
No repeat23-module AVM research, public upload of repository text/identifiers,
legal re-verification, Azure calls, browser, infrastructure/Kubernetes/workflow
generation, qualification execution, model/data job, delegation, commit or push.

| Actual author check | Result and limit |
|---|---|
| Assignment, skills, S002 coverage and relevant preserved findings inspected | **PASS**, author-side source/coverage inspection; independent byte/hash verification **NOT RUN** |
| Before/after gates, approval separation and unchanged blocker traceability | **PASS**, author-side document inspection only; no independent verdict |
| Guardrail arithmetic | **PASS**, manual:2×4+1×2=10;2×4+2×2=12;3×4+3×2=18;20−18=2. Availability, effective enforcement and schedulability **NOT RUN** |
| Capacity/TLS plan completeness | **PASS for a reviewable proposal**, not a technical control pass; numerical storage/lifecycle/cost/context prerequisites remain explicit blockers before execution |
| Static implementation, Azure validate/what-if, deployment, runtime/recovery/TLS tests | **NOT RUN**, outside authority; no qualification/security acceptance claimed |
| Fresh independent technical/security review and exact owner prerequisite-change approval | **NOT RUN**, parent must freeze/supply proposal first |
| Output hash / Git worktree equality | **NOT VERIFIED**, no hashing/Git execution tool exposed; revision **EP-r1**, parent/tester must produce snapshot/hash before review |

**Return to coordinator:** usable proposal delivered; current design release remains
blocked. SQL tool is not exposed: intended todo update **`wp001-evidence-amendment`
→ `done`**, meaning proposal preparation only, not amendment approval or blocker
resolution. Parent owns SQL, snapshot, handoffs, ledger and review assignments.
Author loop remains **3/5 used,2 remaining**. **Stopped writing** this sole output;
no further phase or other write is authorised by this return.
