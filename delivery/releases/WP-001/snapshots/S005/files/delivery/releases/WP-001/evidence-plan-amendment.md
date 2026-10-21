# WP-001 — alternative evidence-plan proposal EP-r2

**21 October 2026 · CORRECTIVE PROPOSAL ONLY · offered for independent review,
NOT approved, NOT a release, NOT a continuing-use assurance claim.**

## 1. Acceptance, authority and fixed inputs

**ACCEPTED before technical work:** `assignments/F03-revise-evidence-amendment.md`
and the current user's bounded correction instruction, under the same authority
to prepare an alternative evidence plan for independent review. This is not
authority to approve a changed requirement, implement, qualify, spend or deploy.
Sole write ownership: this file as **EP-r2**. Main design/cost remain **F03 r1
unchanged**, including their original release blockers.

Fixed inputs: [S004 manifest](snapshots/S004/manifest.md), thirteen preserved
copies and eighteen immutable references; especially preserved EP-r1, both FAIL
review reports and their assignments, `design.md` §§3–6/11,
`cost-estimate.md` §§2/6–8, `feasibility.md` **F04-r1** §§2/6–7,
security SEC01–12 and compliance CR01–13. Preserved context/documentation supply
scope and explanation, not approvals. S004 base:
`5ecf21c2e8333b83c176073b02fece55c9a16f62`; workload dependencies remain at
`01002b21e5c6cb57d391c685adcbc05f03885b38` as the manifest specifies.
Prior attempts remain charged; no snapshot or revision resets any loop.

Required skills loaded/applied: `ama-context`, `ama-design-release`, `ama-handoff`;
AGENTS, team/operating guide, workload guidance, coordination, handoff, release
ownership/snapshot contract and design-release template read. The parent's just
verified **13 source/copy hashes + 18 immutable references** and S004 coverage
are accepted as supplied, **not independently rehashed here**: exposed tools
provide no local shell/hash/Git-object execution. Current policy/skill files are
authoring instructions, not replacement workload baselines. The moving output
was read only to establish the edit target; S004 governs workload interpretation.
No moving lifecycle approval is inferred.

Classification **HIGH**, explicitly selected **`gpt-6.1-sol`**; actual runtime
**NOT VERIFIED** (no authoritative runtime-model field exposed). No switch,
fallback or onward delegation. Loop **`WP001-F03-AUTHOR`, reserved cycle 4/5
consumed: 4 used / 1 remaining**. This is one coherent corrective revision,
not ten separate research/review attempts. Independent loops remain
`WP001-EP-TECH` and `WP001-EP-SEC`, each 1/5 consumed on EP-r1; only the parent
can reserve their attempt 2 and record dispositions.

## 2. Requested decision and evidence limits

Propose a prerequisite/evidence split **and an explicit narrower assurance/use
scope**, not an architecture replacement. EP-r1's implied prevention of all use
of unqualified automatic managed builds is withdrawn from the proposed method;
it is **not** satisfied by a digest comparison or an observation interval.
No supported atomic pre-change/traffic-hold mechanism has been established within
these bounds. Maintenance windows/release tracking help scheduling, not prevention.

**Proposed scope is strictly an empty-foundation test campaign:** no business
HTTPRoute or other application Route, app/backend, demo, business client session,
application-admission permission, Foundry/ML/data/model job or new service.
Platform controllers/TLS-sync and specifically approved test objects alone are
eligible. A successful campaign records only the stated probes, paths, observed
identities and times. It authorises **no subsequent traffic or app admission**,
not even immediately after the final digest check. The standing business-use
hold is never lifted by TLS-Q or AC03-Q.

Known: F04 verified useful published contracts but found material gaps. Public
guides establish reservation mechanics, supported customization boundaries and
managed in-place changes. They do **not** supply a full Kubernetes-1.36.4-bound
managed-add-on request/count/placement inventory or a managed app-routing minimum
TLS contract. **Those facts remain UNKNOWN.** Neither three users, raw CPU sums,
upstream Istio/Envoy defaults nor a future probe supplies today's pass.
The proposed runtime method yields scoped observations, not a vendor guarantee.

Only the requesting user, retaining the actual FND-01 target/risk/scope roles,
can specifically adopt this narrower claim against a frozen EP-r2 **after the
same independent technical/security reviewers assess it**. No second real human
approver is invented. This author neither requests that approval now nor records
it as granted. Parent routes any later decision.

**Exact residual-risk decision proposed for that later record:** “For this
identified empty-foundation campaign, until its named UTC expiry, accept empirical
TLS observations of bounded synthetic probes only, including the possibility that
an automatically changed or unobserved managed build processes a probe and that
an in-flight probe continues until closed. Accept the client/path and observation
limits in §§6.1–6.5. Do not accept TLS below 1.2 as a passing result, continuing-use
assurance, business sessions, application admission, or use of this record as a
later application release. Retain the independent network business-use hold,
no-route/no-app boundary and expiry/containment duties.” Record exact revision,
reason, scope, owner, compensating controls and UTC expiry; no evergreen waiver.
Rejecting or omitting this decision leaves **all original criteria binding**.
If zero unqualified-build probe exposure or a vendor-backed minimum guarantee is
required, this path is **BLOCKED** pending that supported contract or a separately
authorised/reviewed design choice; this document offers no undefined future hook.

### Before / proposed after / earliest gate

| Criterion / finding | Before (still binding now) | Proposed after, only if explicitly adopted | Owner / evidence |
|---|---|---|---|
| AC03 / F04-03; WV01–04/13/22 | At `design-released`, actual platform requests fit budgets; approved workload envelope, system minimums and 18-vCPU arithmetic | **AC03-S**, `design-released`: fixed bounds, schema, owned pins, placement algorithm and thresholds approved; managed unknowns enumerated, not passed. **AC03-L**, `locally-validated`: exact static candidate/known requests pass. **AC03-Q**, `operationally-verified`: §5 complete observed per-node/peak/lifecycle record for the empty campaign only; no future workload-fit or app permission | User targets; engineer contracts; tester independent evidence |
| F04-06 TLS evidence; AC02/06/10/15; **WV12/WV19** | Design gate: supported method/version guaranteeing Gateway TLS ≥1.2. WV12 local: supported settings meet approved minimum ≥1.2. WV19 live: intended endpoint/TLS observations | **TLS-S**, `design-released`: supported private HTTPS/certificate workflow, exact test-only boundary, §6 method and explicit owner-approved narrow deviation from the Gateway guarantee/WV12 evidence obligation. **TLS-L/WV12**, `locally-validated`: supported exposed settings, certificate wiring, isolation, admission, client controls, test matrix and plan assertions; absence of supported managed minimum remains an explicitly approved limitation, never “minimum enforced PASS”. Other services' supported TLS properties unchanged. **TLS-Q/WV19**, `operationally-verified`: mandatory final §6 record, labelled test-only sampled observations, not continuing minimum enforcement or blanket WV19 application acceptance | User specifically owns narrowed assurance/WV12 decision; tester evidence; security reviewer adequacy |
| AC13/14, WV15–17 | Fresh context/identity/availability, authorised validation and inspected what-if at `deployment-ready` | Unchanged, applied specifically to the empty-foundation candidate; no runtime pass required merely to authorize its bounded qualification deployment | Human operator/change owner + tester |
| AC15–19, WV18–22 | Observed controls/recovery due at `operationally-verified` | Retain other controls; AC15 ingress evidence limited explicitly to approved probes, AC19 revalidation ends with final TLS-Q after all lifecycle tests. Empty campaign is a subset, not blanket completion/security acceptance or application access | Tester and existing specialist/human owners |
| EP-r1 proposed “before app admission/use” comparison | Promises no unqualified managed build use; no supported atomic mechanism supplied | Replace **only if adopted** with permanent no-business-use boundary, independent probe-path hold, finite probe campaign and expiring historical observations (§6); no continuing guarantee | User scope/risk decision; both independent reviewers |
| All other findings/criteria | Full regulated release prerequisites | Unchanged; no implicit deferral or waiver, including F04-06 signature/admission half | Respective writers/reviewers and genuine human approvers |

This introduces no new repository lifecycle state. `locally-validated` would mean
static acceptance for this proposed scope, **not** capacity-qualified, TLS-observed
or app-ready. Even a campaign pass is not app-ready. Earlier defects still block.
Runtime checks remain `NOT RUN`, not `PASS` or `NOT APPLICABLE`. Without approved amendment,
AC03/F04-03 and TLS F04-06 still block the original design release.

## 3. Approval and stage sequence (all future execution NOT RUN)

1. **Proposal review:** parent accepts stopped output, assigns tester/operator to
   preserve exact EP-r2 bytes plus S004/current-assignment dependencies. Same non-author
   infrastructure-tester and security-reviewer review the **same** preserved
   proposal for testability, false passes, hard-bound limitations and residual risk.
   Return findings through parent for attempt 2 of their existing loops; no onward
   delegation or reviewer invocation by this author. Findings are not closed here.
2. **Exact prerequisite decision:** requesting user approves/rejects the above
   criterion/gate split, **narrowed assurance/no-app scope and exact residual risk**,
   its uncertainties and §4–6 thresholds. Parent records
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
   resource bounds, platform bootstrap/test permissions, §6.5 containment/restore
   authority and UTC expiry. Preview/design approval is not this permission.
   Deploy only that foundation with §6.1 business-use hold already in force;
   preserve actual deployment record. No pilot/application access.
7. **Qualification and disposition:** tester independently gathers §5/6 evidence
   against actual configuration; security reviewer assesses findings, human accepts
   scoped residual risk through the parent. Final TLS-Q follows renewal and the
   last authorised lifecycle transition, then close probe access and remove test
   trust/objects. Successful qualification yields a **closed historical test-only
   record**, never app/demo admission. A later application release must independently
   resolve the managed-change/continuing-use requirement or obtain a new explicit
   reviewed scope/risk decision; it cannot inherit this deviation as app permission.
   Required other foundation checks still apply; no automatic next phase.

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

Private VPN-connected approved devices only for device probes; the bounded admitted
in-cluster probe in §6.2 supplies separate per-replica coverage. Resolve/reach private API, Gateway,
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
qualification is **BLOCKED**, and business use remains prohibited; monitoring an overrun
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

## 6. TLS ≥1.2: proposed finite, test-only observation contract

All execution below is **NOT RUN** and separately authorised later. No
tls.options minimum override, unsupported Istio CRD/EnvoyFilter, fixed managed
revision, patch hook, NGINX replacement or perfect observer is assumed.

### 6.1 Boundary, independent hold and ordering

Use only r1's proposed private listener `portal.ama-poc.internal:443`,
`10.83.2.10`, 90-day private-CA leaf and three specifically approved devices.
No business Route or backend is installed, including “temporary” test applications.
No port80 redirect listener, public fallback or app credentials. A programmed
HTTPS listener must serve the chain without a Route: establish supported method
feasibility at TLS-S/design-plan review, inspect at TLS-L, observe at TLS-Q.
If the implementation cannot
do so, **BLOCKED at that prerequisite**; do not add an app/HTTPRoute as workaround.

The hold is an ordered **scope/access boundary**, not a managed-change interlock:

1. Before listener creation, operator installs reviewed rules on the existing
   customer-owned NSGs protecting the Gateway's existing node/backend ingress
   path. Deny new TCP443 probe traffic from the VPN client pool by default;
   during a scheduled test admit only the three approved VPN source addresses.
   Deny other unnecessary client sources too; inspect all VNet/peering/VPN and
   service exposure paths rather than treating the VPN-pool deny as universal.
   Preserve AKS inter-node/Overlay and Azure LB health requirements. Inventory the
   effective LB frontend-to-backend/node-port mapping, original client source
   behaviour and rule priorities; protect the actual translated destination ports,
   not an assumed NSG attachment to a frontend. Same-VNet default allow must not
   override the specific deny. No new subnet/NSG/service or managed-child edit.
   Engineer supplies exact effective-rule assertions in the actual plan; tester
   verifies allowed/denied paths before protocol testing. If that existing-path
   enforcement cannot be demonstrated, do not open the campaign.
2. Independently, no routine app publisher receives Route/app-create/admission
   rights; the released test object/digest allowlist excludes business workloads.
   Bootstrap operator's exceptional power is time-bound and audited, not proof
   against that operator or the ultimate human owner. Existing Cilium pod policy
   denies unnecessary paths; only the bounded probe identity may reach selected
   gateway pods on their actual TLS target port. No default namespace exception.
3. Activate §6.5 authorities and evidence observer **before** temporary device
   allowance or probe Job start. Verify zero business Routes/apps and no prior
   probe sessions. Test-only traffic is permitted even though the managed build
   has not yet been qualified; that exposure is exactly the proposed §2 decision.
4. Run the finite matrix, close each connection, then terminate all probe
   processes/Jobs and close the temporary source allowance. Confirm both client
   socket closure and denied fresh connections; remove probe access/trust at
   campaign end. Record incomplete teardown as a failure/incident, not success.

NSGs are an independent **new-connection** lever outside Kubernetes and the proxy.
Changing a rule **does not terminate existing flows**. Client-side process/socket
termination and probe Job deletion address known test sessions; API deletion or
role revocation alone is not proof of instantaneous termination. No business
sessions exist to drain. If a process/connection cannot be accounted for, leave
new traffic denied, preserve the uncertainty and invoke §6.5; never label a
session-free state verified solely from an NSG update.

Proposed probe bound: sequential cases, one connection per source, no more than
four concurrent connections across three devices plus one pod; each attempt
ends within10 seconds, no retries except the three specified independent repeats.
Only TLS handshakes and, where needed, **HEAD /** without body, query, cookies,
tokens, identifiers or redirect following. No resumption/session tickets reused,
0-RTT, keepalive or long-lived/streaming session. Non-routed status metadata may
be recorded; 200 is not TLS proof and an unexpected routed response fails isolation.
Targets/bounds are proposed, not approved demand/SLOs.

### 6.2 Real per-replica coverage under Overlay

VPN clients cannot route directly to Overlay pod IPs [R2]. Chosen method is a
**single bounded nonprivileged in-cluster probe Job** in a dedicated test
namespace, using an approved signed digest, with no service exposure. It connects
directly to each active gateway pod's Overlay IP/actual TLS container port from
inside the cluster, with **the same hostname SNI and CA/hostname verification**.
Explicit target-IP-to-pod-UID mapping prevents LB selection from being called
replica coverage. Include every active/serving endpoint, even if not Ready;
unknown/terminating endpoints during collection invalidate the set.

Probe security: non-root, read-only root filesystem, no privilege escalation,
all capabilities dropped, no hostNetwork/hostPID/hostPath, no device mounts,
no packet-sniffing privilege, no Azure identity, no service-account token
automount, no API/secret/registry-write/Key Vault permission. Its finite input
is the approved public trust bundle, target list and matrix hash supplied by
the operator, not API discovery credentials. Egress permits only selected
gateway namespace/pod selectors and actual TLS port; local loopback fixture
needs no external egress. No internet downloads or wildcard probe destinations.
Use supported selector policies, not Cilium `ipBlock` for pod/node IPs [R3].
Host-network/node identities have policy limitations and are not eligible probes;
required platform traffic is separately inventoried, not claimed blocked by a
pod selector. Verify both permitted probe and denied unrelated pod paths.
Requests, limits, init/fixture footprint and rollout overlap count in §5 budgets.
No extra node or parallel Job. Tester reads only that test namespace's pod status
and bounded result logs; operator alone creates/deletes the reviewed Job.

Use existing Entra/Azure RBAC Reader observation plus approved namespace-limited
read access for results, with no exec, attach, port-forward, impersonation,
role-binding edit or cluster-admin granted to the probe/tester. Kubernetes RBAC
`get/list/watch` of pods and `get` of `pods/log` are the relevant Kubernetes
operations where that authorizer is applicable; they are **not invented Azure
data-action names**. Actual Azure-RBAC-backed role definition/scope must be
verified in the release/plan, not inferred from Kubernetes verbs. If allowed
Reader access cannot retrieve safe results, specify/review an exact scoped
supported read role before execution; never give Writer/cluster-admin to make
the test work. No human-to-pod tunnel or command-invoke bypass is required.

Required coverage is **both**: every matrix case3 times on **each of the three
devices through VPN/DNS/private LB**, and3 times on **each serving replica from
the admitted pod client**. Record pod and device client/library hashes separately.
This does **not** prove each real device traversed each replica or that pod-path
results validate VPN/LB policy. That coverage limitation is part of the proposed
§2 decision; if device-by-replica equivalence is required, stop for a separately
reviewed supported access method, not a direct VPN-to-overlay assumption.

### 6.3 Clients, local positive controls and protocol/certificate matrix

Before full design release, engineer/tester identify actual tool/library/build
hashes, image digests, source/vendor provenance, signatures and scan disposition
for modern clients, isolated legacy client/fixture, probe and TLS-sync objects.
No `latest`, mutable tag, example-image trust or claimed pin supplied by this
document. Test/bootstrap objects follow §7's fail-closed digest/signature policy
**or an individually named reviewed human-approved exception with scope/expiry**;
“test-only” is never an admission bypass. Any bootstrap dependency cycle must be
resolved before full release, not by permit-on-error or temporary wildcard.

Legacy-capable client and local server fixture run in approved disposable,
unprivileged sandboxes on each device, and locally within the probe sandbox.
Use an owner-approved verified package/image/build, no unknown downloaded binary.
Fixture listens only on loopback, uses a synthetic certificate/key unrelated to
the Gateway CA and no data. First validate with external access denied. For each
of SSLv3, TLS1.0 and TLS1.1, the **same client build, protocol/cipher parameters**
must complete a handshake against the loopback fixture at exactly that protocol
before and after the target series. Local crypto exceptions are process/sandbox
scoped and approved; never lower device-wide crypto policy or the Gateway.
During target probes allow only that endpoint/port; do not expose the vulnerable
fixture externally. Destroy sandbox/fixture keys at completion.

If SSLv3-capable contained software is unavailable/forbidden, label SSLv3
**BLOCKED/inconclusive**, not N/A or an inferred rejection. Same for TLS1.0/1.1.
Exact approved client availability is a future release prerequisite, not a claim
that any modern library supports these protocols.

| Case,3 repeats per required client/target | Acceptance / interpretation |
|---|---|
| TLS1.2 only; correct SNI, hostname and CA | 3/3 verified handshakes, protocol exactly1.2; valid chain, exact SAN, server-auth purpose, trusted UTC time; safe HEAD if used. No verification bypass |
| Ordinary modern negotiation; TLS1.3 only | Every success ≥1.2. Record1.3 support/rejection separately;1.3 is not a new mandatory minimum and cannot replace1.2 success |
| SSLv3, TLS1.0, TLS1.1 separately | Zero completed handshakes; no HTTP. Local positive controls and actual emitted target ClientHello required. A peer-origin alert or TCP close/reset after that ClientHello, no ServerHello/handshake success, with adjacent same-path1.2 success, is acceptable **observed rejection**, not proof of protocol-specific reason |
| Correct SNI with wrong verification hostname; then without approved CA | Client chain/hostname verification fails before HTTP; no insecure retry. These isolate client validation, not a missing-listener response |
| Wrong SNI and separately absent SNI | No accepted authenticated connection for the intended name/no routed content. Record alert/close or presented public default chain; fail unexpected usable/default identity. Distinguish this server selection test from wrong client verification hostname |
| Chain validity | Record public fingerprint/serial/SAN/issuer/notBefore/notAfter and exact-name/purpose validation. Offline verification just before/after validity fails; label offline, not a live expired-server test |
| Cipher / ALPN | Record negotiated cipher, key exchange where exposed, compression and ALPN on every success. Offer h2/http1.1 separately where client supports them; record selection/absence, no assumed required h2. Owner/security-approved cipher allowlist and prohibited-cipher offers fixed before full release; each offered prohibited suite must fail with capable-client control. TLS1.2 alone does not prove cipher strength |
| Private/no-public scope | Inspect deployed Gateway/Service/LB frontend/PIP association, API/ACR/KV public-access settings, effective NSG/route/DNS and Route inventory. Inspect actual records, not declarations alone. Separately authorised non-VPN/unapproved-source new-connection negatives are supplementary; failure to route to RFC1918 is not proof of no public frontend |
| Renewal/reload/expiry alerts | **Mandatory for TLS-Q**, not optional: exercise supported approved KV/CSI workflow and new leaf, see new public fingerprint on every replica and device path; prove approved expiry/reload alert and delivery targets, then repeat full matrix. Exact reload/alert deadlines fixed by owner/tester before release/mutation; absent targets block the renewal test and final TLS-Q |

ClientHello evidence must decode handshake type, offered protocol/version fields
(including supported_versions if present), cipher offers and SNI, bound to
target/socket/time/client hash. Do not mistake a TLS record-layer legacy_version
alone for an actual TLS1.0/1.1 offer. Retain direction/timing and peer alert or
FIN/RST metadata with the match. Use filtered client instrumentation; no raw
general debug dump. Local “no protocols/ciphers available”, DNS error, timeout,
unattributed reset, failed fixture or generic exit code is **inconclusive**.
Even an acceptable peer close proves refusal of that offered handshake, not the
server's global minimum for all possible clients. Inconclusive required cases
block the scoped record; no weakening, counting as rejection or automatic retry.

### 6.4 Bracketing, validity and protected evidence

TLS-Q is the **final full matrix after mandatory renewal and the last authorised
restart/upgrade/drain/rebuild or other lifecycle transition**; any subsequent
transition invalidates its applicability. Earlier baseline tests are provisional.
No TLS-Q pass until required §5 scenarios and other current controls pass; failed
or unavailable supported restart bounds remain blockers, not omitted scenarios.

Tester assigns run ID and UTC start/end, hashes the frozen candidate/parameters,
matrix, input targets/trust, clients/images and evidence objects in a per-run
SHA-256 manifest. Record protected tester/operator identity references, method,
attempt counter, commands/version/options (without credentials), expected/actual
result and raw-to-minimised mapping. Hashes detect alteration, not trusted time
or independent custody by themselves.

Bracket **before/after the whole campaign, each device series, each replica
series and each controller instance**: AKS patch/node image; managed controller
and istiod pod UID/owner/imageID digest/restart count; all gateway UID/imageID/
restart/placement/endpoint sets; Gateway/Service/HPA/PDB/ConfigMap generations,
resourceVersions and sanitised desired/status hashes; TLS-sync/CSI identifiers;
certificate public fingerprint and trust-bundle hash; DNS/LB/network-rule
snapshot hashes. Inventory every controller instance, not a deployment tag alone.
Use API watch/event/audit metadata across the series with recorded continuity;
release notes are context, not an atomic pre-change signal.

No proxy admin/config-dump or secret read is granted to the tester to claim a
perfect effective-config hash. Use only supported exposed status/configuration
metadata and served public chain; **same-pod unexposed configuration changes
cannot be excluded** by those records. Equal before/after hashes do not exclude
transient change/reversion. The claim is precisely “these individual probes
observed these outcomes with these bracketing observations”, never “this build
was fixed throughout” or “TLS was continuously enforced.”

Observed new/missing replica, controller replacement, same-pod restart/config/
certificate/trust/DNS/LB/network change or metadata mismatch invalidates the
affected series; retain as failed/inconclusive evidence, never merge builds into
one pass. Observer/watch gap, relist after lost continuity, clock uncertainty,
missing bracket or evidence-write/hash failure: stop new probes immediately on
discovery, close known sessions, deny new ingress, invalidate the **entire current
campaign's qualification claim**. Previously sealed individual observations remain
historical only. No detection interval guarantees zero exposure; unseen changes
may already have processed authorised probes. New campaign needs §6.5 authority
and complete current inventory/matrix, not a last-good-hash resume.

Record validity ends at the earliest of campaign closure, named UTC authorisation
expiry, observed change, observer loss or any required inconclusive/failing case.
Sealed results can be reviewed historically after that point but **never authorise
continuing use**. No current-state certificate/pod digest establishes app readiness.

| Temporal case | Permitted traffic / record outcome under the proposed scope |
|---|---|
| Change before a bracket/check | No business traffic; inventory new observed set before any new series; prior record is historical only |
| Change between check and handshake | Only authorised synthetic probe may encounter it; detected mismatch fails the campaign, unseen change remains an explicitly accepted observation limitation, never a no-exposure assertion |
| Change during an existing probe | No business session; close bounded probe, stop new probes on discovery and invoke hold; outcome cannot support unchanged-build assurance |
| Observer loss or failed hold/closure | No new test authority/qualification claim; stop known clients, attempt already authorised independent isolation and record any unconfirmed surviving probe as an incident, not containment PASS |

Evidence minimisation: collect decoded handshake fields and bounded status/error
metadata only. No TLS keylogs (including environment callbacks), session secrets,
tokens, kubeconfig, CA/private keys, HTTP bodies/cookies, secret manifests, full
payloads or broad network captures. No privileged packet capture. If client
instrumentation cannot establish the necessary fields without prohibited output,
that case is blocked until a reviewed safe method exists.
Protected device/IP/SNI/certificate/operator metadata stays in the existing
owner-controlled evidence location, not public Git/log paste. Tester writes
append-only-by-procedure run objects; operator cannot routinely edit/delete them;
technical/security assessors read; owner controls exceptional retention/hold
disposition. Preserve hashes and safe redacted summaries plus access/custody
events. No WORM or enforced separation is asserted for the single-owner POC.
Proposed schedule: protected minimal working traces deleted within7 days after
review (unless justified hold), sealed manifests/minimised results/approval
references90 days after POC closure; LAW31 days unchanged. Privacy/legal owner
must approve purposes, readers, holds and exact schedule before collection; no
new store/service/ingestion allowance is requested.

### 6.5 Role, authority, expiry, containment and restore

The requesting user retains all actual FND-01 accountable human roles. Role
separation below is **procedural**, with non-author agent assessments; it is not
a claim of two distinct real approvers or enforced identity separation. Actual
operator/tester principals and effective grants must be recorded before execution.
If the same human performs both operational roles, record that limitation and
retain independent non-author technical/security assessment; if enforced separate
identities are required by policy, block until genuine eligible identities exist.

| Role / action | Proposed authority and scope | Expiry / separation |
|---|---|---|
| Requesting user as target/risk/change/budget owner | Decides exact narrow claim/thresholds, frozen design/plan/cost and separate campaign/deployment/containment/restore authority; does not provide technical PASS | Exact UTC expiry per approval, no later than campaign end for probe/exception authority; no approval exists here |
| Coordinator | Records exact approvals, actors, snapshot, results and counters; returns defects, routes reviews/decision | No waiver, implementation or restore rights inferred |
| Operator / deployer | JIT Entra/MFA-approved platform bootstrap and exact Job/Gateway/certificate changes; scoped ARM permission for existing customer NSG hold, and separately authorised AKS stop if needed; never node VMSS repair | Activate **before** opening tests; effective grant/session lasts through closure plus approved contingency time; revoke at expiry/earlier completion |
| Independent tester/evidence role | Starts/stops own device probes, supplies frozen target matrix, observes safe inventory/status/results and seals evidence; may call STOP without approval wait | Read-only platform authority, no secret read or general pod exec; cannot self-approve restore/accept residual risk |
| Security assessor + technical reviewer | Non-author method/result assessment, classify uncertainty and restore/requalification prerequisites | No assumed Azure mutation, human risk waiver or approval power |
| User in operational/change-owner role | Orders restoration/requalification only after failed cause/uncertainty disposition, reviewed supported candidate, scope/funding/identity/time refresh and applicable reviewer inputs | New bounded authority; expired test grant or prior PASS cannot authorise reopen |

**Before any future opening**, actual plan must bind real approved identities,
role definitions/actions/scopes, activation/MFA conditions and absolute times to
the existing cluster, customer NSGs and test namespace; separately approve the
operator's minimum necessary mutations. Contributor is not grant authority.
Use Entra non-admin user credentials with local accounts remaining **off**;
no static admin kubeconfig, standing privilege, login fallback or silent grant.
Pre-authorise and verify the ARM NSG new-connection hold independently of API
availability, and exact AKS stop operation as contingency if approved. Prove
eligibility/activation before start, not “request privilege when the incident
happens.” If activation/remaining authority cannot cover closure, do not start.

On any failure, mismatch, observer loss or expiry: tester immediately stops
issuing probes and closes device sockets; operator stops/deletes the finite
probe Job, verifies its termination and closes customer NSG probe allowance.
The proposed operational response target is to issue those available actions
within60 seconds of discovery, **not** a maximum undetected-change window,
completed-isolation SLA or zero-exposure guarantee. Later authorised drill must
record discovery/action/completion times and any surviving connections. If API
is unavailable, close device processes and use the already activated ARM NSG
hold; an unconfirmed in-cluster session remains an explicit incident. Only if
pre-authorised, invoke supported cluster stop and verify actual Stopped state;
this is not instant isolation, may fail, and needs the already required bounded
stop/webhook/funding feasibility. Otherwise maintain hold/escalate through owner
and provider support; never claim containment succeeded. NSG deny preserves
required platform traffic, not a blanket platform-subnet shutdown.

Restore means **restore the empty test foundation with business hold intact**:
operator uses only supported reviewed certificate/configuration changes or a
new approved rebuild. Do not pin/roll back a managed build or patch an unsupported
TLS knob. Security/technical assessors review cause/evidence; user authorises a
new finite requalification campaign with complete fresh bracketing and final
TLS-Q. Unresolved method defects return to a new design revision, not a workaround.
Cost/capacity violations never authorise scale or a repeated drill.

Trust lifecycle: prefer an application-specific client CA bundle rather than
OS-wide trust on all three devices. Dedicated test CA issues only this exact SAN,
server-auth leaf; any subordinate is constrained to the private test DNS subtree
where supported, with offline restricted root key. Do not claim an unconstrained
root is name-constrained. Device/security owner must approve actual bundle
isolation and any exception for OS/browser trust **before installation**.
After campaign/expiry, remove the bundle and every installed test anchor/profile
from each device and probe, verify absent fingerprints and resulting untrusted
validation, revoke/reissue as appropriate, destroy disposable legacy fixtures
and session state. Operator records removal; tester verifies safe public metadata.
CA/trust changes require a new campaign, not continuation under an old record.

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

## 8. Finding dispositions, quality and remaining decisions

These are **author-proposed corrections**, not findings closed, reviewer passes
or risk waivers. Both preserved EP-r1 review FAILs remain historical and binding
until the parent obtains applicable independent dispositions on preserved EP-r2.

| Finding | EP-r1 defect | EP-r2 proposed disposition / independent retest focus |
|---|---|---|
| EP-TECH-01 | Pre-use check is not atomic prevention | §§2/3/6.1/6.4: remove continuing-use/app permission from proposed claim; finite test observations only. Trace change-before-check, between-check/use, during probe, existing session and observer loss; all leave business hold intact, invalidate mixed/gapped campaign; probe exposure explicitly retained for owner decision |
| EP-SEC-01 | Undefined managed-change hold | Same coherent narrowed claim; independent customer NSG new-connection hold, no-route/admission boundary, finite probes, loss/expiry stop; no zero-exposure interval or hook |
| EP-SEC-02 | VPN-to-replica access unspecified | §6.2 admitted nonprivileged pod reaches Overlay replicas; devices test LB separately; least privilege/no tunnel, actual identity role verification and explicit device-by-replica limitation |
| EP-SEC-03 | Legacy positive control/rejection undefined | §6.3 same-build loopback handshake before/after, emitted ClientHello fields, peer alert/close with adjacent positive, contained provenance; unsupported/inconclusive blocks |
| EP-SEC-04 | Test/bootstrap admission ambiguity | §§6.2/6.3/7: identical fail-closed digest/signature contract or individually reviewed approved expiring exception; actual pins/full bootstrap contract mandatory before full release |
| EP-SEC-05 | Mixed-build/unsafe unbound evidence | §6.4 per-device/replica/controller brackets, hash-bound manifests, observed/unobservable limits, protected roles/retention, no keylogs/secrets/full payloads/capture privileges |
| EP-SEC-06 | Undefined containment/restore authority | §§6.1/6.5 preactivated scoped Entra and independent ARM hold, local accounts off, session caveat, role/expiry matrix, procedural versus enforced separation, new restore/requalification authority |
| EP-SEC-07 | Renewal, final TLS-Q, WV gaps | §§2/3/6.3/6.4 mandatory renewal; final full TLS-Q after last lifecycle change; explicit narrow WV12 evidence deviation/WV19 observations, no blanket pass |
| EP-SEC-08 | Old protocol/cipher/ALPN/SNI/public gap | §6.3 SSLv3/1.0/1.1 capable-client negatives, negotiated cipher/ALPN and prohibited offers, wrong/absent SNI, resource inspection primary/private negatives supplemental |
| EP-SEC-09 | Private CA scope/cleanup absent | §6.5 app-specific bundle, limited issuance/subordinate constraints without false root constraint, device permission and verified trust/profile removal |

Affected five pillars, author-side only: **Reliability** retains bounded recovery
holds/no restart capacity guarantee; **Security** retains ≥1.2, private audience,
admission and no business use while explicitly exposing test-probe uncertainty;
**Cost Optimization** consumes existing allowances with residual charges, no new
price/service/sizing; **Operational Excellence** requires protected traceable
observations, expiring authorities and verified closure; **Performance Efficiency**
retains §5 per-node effective requests/peaks, not application throughput.
The regulated dedicated non-author five-pillar report remains mandatory.

**Remaining owner decisions / release prerequisites, not approvals requested here:**
the exact §2 scope/assurance/WV12/WV19 residual-risk decision and UTC expiry;
actual device/trust/sandbox permission and approved cipher policy; storage
headroom/lifecycle/reload/alert thresholds; privacy/entity/legal/telemetry retention
and custody; actual operator/tester identity/separation feasibility and scoped
hold/stop/restore permissions; complete fixed design/actual plan/full cost,
D-HA/D-MON/D-SEC and native exceptions, funding/offer/credit and recovery ownership.
Engineer/tester must supply actual pins, admission/bootstrap contracts, supported
no-Route listener feasibility and effective NSG/backend path assertions before
full release. Later exact context/availability/quotas/private routes/WV15–17,
deployment/campaign/drill authorities and actual observations remain **NOT RUN**.
They are not demanded in this method-authoring task. Original §7/current-gate
blockers remain; no unavailable future observation is represented as a method pass.

## 9. Actual checks, official sources and stopped handoff

Research accessed **2026-10-21** through configured Microsoft Learn search/fetch
and official public HTML fetch only. Queries contained public technical terms,
never repository/private text. No code samples/infrastructure were generated.

| Ref / official source | Actually consulted / applicability and limit |
|---|---|
| R1 [Application routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api) | Learn search + fetch; relevant versioning/customisation sections read. Non-revisioned automatic in-place upgrades, HPA defaults and allowlist; no atomic hold/minimum-TLS guarantee established |
| R2 [CNI Overlay overview](https://learn.microsoft.com/en-us/azure/aks/concepts-network-azure-cni-overlay) | Search + full fetch. External clients cannot directly reach Overlay pods; internal pod route and required node/Overlay traffic. Does not prove this candidate's policy |
| R3 [Azure CNI powered by Cilium](https://learn.microsoft.com/en-us/azure/aks/azure-cni-powered-by-cilium) | Search + fetch, policy/limitation sections read; supported network-policy basis, not new paid FQDN/security feature selection |
| R4 [NSG overview](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview) | Search + full fetch. Stateful five-tuples, default VNet allow, rule changes affect new flows only; no existing-session kill claim |
| R5 [Entra Kubernetes API authorization](https://learn.microsoft.com/en-us/azure/aks/manage-azure-rbac) | Search + fetch, relevant role/custom-role sections read. Cluster/namespace scopes and real provider operations must be verified; no made-up pod-action grant or change to authorizer chosen |
| R6 [Local accounts with Entra](https://learn.microsoft.com/en-us/azure/aks/manage-local-accounts-managed-azure-ad) | Search + full fetch. Non-admin Entra access with local accounts off; static admin fallback excluded |
| R7 [Manual Gateway TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls) | Search + full fetch. KV/CSI/Secret/certificateRefs workflow and sync pod dependency; samples neither executed nor trusted/pinned by implication. No supported minimum or no-Route serving guarantee inferred |
| R8 [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) | Official HTML fetch, relevant namespace/subresource/additive-rule sections read. Kubernetes verbs distinguished from Azure data actions; no new RBAC objects generated |
| R9 [kubectl port-forward](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_port-forward/) | Official full fetch during route comparison. Supported pod tunnel exists but is **not selected**; avoids unnecessary human port-forward privileges and path confusion |
| R10 [OpenSSL s_client manual 3.0](https://docs.openssl.org/3.0/man1/openssl-s_client/) | Official HTML options/synopsis fetched/read. Protocol/SNI/verification/cipher/ALPN instrumentation concepts; options do not prove that a particular build emits legacy protocols. Not a selected/pinned build or generated command |

§§4–5 capacity method retained from preserved EP-r1, independently judged suitable
in EP-TECH-r1's scoped method review except the central managed-change defect;
no new runtime capacity claim. Its reservation/system-pool/start-stop/upgrade
research is inherited evidence in S004 EP-r1 and EP-TECH-r1, **not re-executed
source verification here**. In particular, no new restart ceiling is supplied.

| Actual author check | Result / limit |
|---|---|
| Assignment/input coverage/skills and both FAIL reports/assignments | **PASS for author-side reading/coverage only**; parent-verified S004 integrity accepted, independent rehash **NOT RUN** |
| All10 findings mapped to one test-only method, before/after gates, no-adoption and original blockers | Author-side document inspection performed; **no independent adequacy verdict** |
| Guardrail arithmetic | **PASS**, manual:2×4+1×2=10;2×4+2×2=12;3×4+3×2=18;20−18=2; no availability/quota enforcement/placement inference |
| Public supported mechanism/limitation research | Sources above read; **no atomic prevention mechanism established**; narrowed scope explicitly proposed instead |
| Author edit/readback | Sole output revised using apply_patch; an initial unmatched-context patch failed before changes and was corrected within this same reserved author cycle, not a new review/retry. No other path edited |
| Compilation/local implementation validation, Azure/login/query/what-if/deployment, TLS/capacity/renewal/containment/recovery observations | **NOT RUN**, outside authority |
| EP-r2 independent attempt2 reviews / owner adoption / release | **NOT RUN**, parent must freeze and route; no findings closed or approval sought by author |
| Output SHA-256 / Git worktree comparison | **NOT VERIFIED**, no exposed hash/Git execution tool; parent/tester to hash exact stopped EP-r2 and preserve before reviews |

**Offered to coordinator:** usable bounded corrective proposal EP-r2, not approved
method adequacy, scope adoption or design release. Preserve this stopped output
with S004/current assignment and provide the same immutable EP-r2 to both existing
reviewers for their attempt2; only parent records readiness/counters/approvals.
No onward delegation performed or requested by this author outside that handoff.

SQL is not exposed; no task-store file accessed. Intended update for parent:
`UPDATE todos SET status='done' WHERE id='wp001-amendment-revision';`
This means corrective proposal delivered, not findings resolved.
Author usage **WP001-F03-AUTHOR:4/5 used,1 remaining**. No new services, sizing,
cost changes, Azure calls/login/qualification, browser, infrastructure/Kubernetes/
workflow generation, application/data/model work, delegation, commits or pushes.
**STOPPED-WRITING — this sole output; no automatic next phase.**
