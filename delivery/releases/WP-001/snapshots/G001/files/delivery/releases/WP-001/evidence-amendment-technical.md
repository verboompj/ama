# Review: WP-001 / EP-r2 / independent technical method retest

**Current revision EP-TECH-r2 · 21 October 2026 · PASS for the finite,
test-only historical-observation METHOD PROPOSAL only.**

This is **not adoption of the narrower scope or its residual risk**, a minimum-TLS
guarantee, permission to execute probes, complete design/candidate assurance,
security/compliance acceptance, or application/continuing-use permission.
The original criteria remain binding until a genuine exact owner decision.

## Retest assignment, fixed inputs and limits

| Field | Value |
|---|---|
| Reviewer / task | Same NON-AUTHOR infrastructure-tester; `wp001-amendment-technical-r2` |
| Accepted assignment | **ACCEPTED before retest:** updated `assignments/F03-amendment-technical.md` and the user's narrower same-task instruction. Read and accepted fixed S005 inputs; no maker conversation or parent adequacy verdict used |
| Scope / current gate | EP-r2 method adequacy and disposition of EP-TECH-01, plus material new defects; amendment-proposal review before any adoption, not normal design release |
| Exact candidate | Preserved `snapshots/S005/files/delivery/releases/WP-001/evidence-plan-amendment.md`, **EP-r2**, SHA-256 `5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b` |
| Input snapshot / producer | [S005 manifest](snapshots/S005/manifest.md); explicitly assigned host operator; thirteen preserved copies plus eighteen immutable references; base `5ecf21c2e8333b83c176073b02fece55c9a16f62` |
| Independent integrity | **S005: 31/31 MATCH**. Also **S004: 31/31 MATCH**, including all thirteen prior copies and eighteen immutable references. S005 preserves S004's manifest; its hash matched. Original EP-r1, first-review assignments and prior report remain frozen |
| Prior report identity | S004 and S005 preserved EP-TECH-r1 hash `42d8a238c284a897ad754e8e401504117a29b313d80a0b1bd96994a9197d3a7c`; owned report equalled those bytes before this edit. Attempt-1 FAIL text retained below without alteration |
| Ownership | Update only `delivery/releases/WP-001/evidence-amendment-technical.md`; no proposal/design/cost, ledger, snapshot, security-report or task-store write |
| Stable loop / reservation | **`WP001-EP-TECH`, attempt 2/5; 2 used / 3 remaining**, checked against current ledger row before technical retest. One bounded retest, no model switch/new loop |
| Other budgets | Ledger records `WP001-F03-AUTHOR` **4/5** and `WP001-DESIGN-SNAPSHOT` **5/5, exhausted**. Neither counter changed. No new snapshot, sixth preservation attempt or reset |
| Target owner / risk | Requesting user, regulated FND-05; proposed assurance, probe exposure, thresholds, risk and scope decisions remain theirs. No owner decision is supplied by this PASS |
| Model / context | HIGH `gpt-6.1-sol` remains selected/reported by host metadata; actual runtime **NOT VERIFIED**, no authoritative runtime attestation exposed. Same retained non-author context for retest, not a newly claimed isolated reviewer. No fallback, downgrade, switch or delegation |
| Independence / limitations | Reviewer authored neither proposal revision nor implementation and made no proposal fix. Prior independent reports and author disposition claims are inputs, not current independent verdicts. Shared model/instructions and unverified host isolation can correlate blind spots. No legal/domain/statistical ML judgment or security-risk waiver claimed |
| Tools / measurement | Existing Git 2.54.0 (Apple Git-157), Python 3.9.6, Node v25.8.1; file/search and official public Microsoft Learn search/fetch. No new tool installed; no SQL tool or authoritative inference-cost/credit measurement exposed |

Reactivated/applied the same five skills from their previously read contracts:
`ama-context`, `ama-avm-bicep`, `ama-handoff`, `ama-workload-validation`,
`ama-ai-ml-validation`. Same review template and immutable WV/AI/ML, ownership,
lifecycle, baseline and routing contracts apply. No workload policy baseline was
rewritten. Current assignment/ledger provide authority and attempt accounting only.

## EP-r2 criteria and evidence

`EP2:Lx–Ly` below means **1-based lines in the preserved S005 EP-r2**, not the
moving proposal. All PASS results below are method-granularity judgments except
the explicitly deterministic integrity/arithmetic results; no full WV check
or observed service property is passed.

| Criterion / trace | Earliest gate / current or later | Expected result / method | Actual fixed-input evidence | Result |
|---|---|---|---|---|
| EP-T01 — integrity/authority | Method retest / current | Fixed complete inputs, proposal-only authority, same reserved loop | Independent SHA-256/Git-object verification above; preserved original and corrective author assignments; current retest assignment/ledger inspected | **PASS**, integrity deterministic; authority interpretation is judgment |
| EP-T02 — exact narrower claim/gates; AC03, TLS F04-06, WV12/19 | Method retest / current | No silent adoption or minimum-enforcement/continuing-use claim | EP2:L43–105 withdraws atomic prevention, proposes an explicit finite probe-exposure decision and narrow WV12 evidence deviation; no subsequent traffic/app authority. L107–157 retains normal release and separates later app release | **PASS**; owner acceptance remains absent, not needed merely to review the proposal |
| EP-T03 — capacity accounting; AC03-S/L/Q | Method retest / current | Per-node allocatable/reserve/init/DaemonSet/placement/rollout/peak method preserved, new probes counted | EP2:L207–273 retains effective selected-version request calculation, conservative floors without double subtraction, eligible-node DaemonSets, storage/pod slots, actual hard placement and transient peaks; L340–365 counts single probe/fixture footprint in existing caps | **PASS**, method only; no observed schedulability |
| EP-T04 — counts/quota/budget | Method retest / current | No new resource/funding assumption from correction | EP2:L159–205 retains initial 3 nodes/10 vCPU, steady 4/12, both-surge 6/18, six-disk ceiling, independent regional/family headroom and approved remaining allowance prerequisites; no new service/node for probes. Python arithmetic again gives 10/12/18 and historical margin 2 | **PASS**, arithmetic deterministic; quotas/availability/enforcement/funding unproved |
| EP-T05 — lifecycle bounds/unknowns | Method retest / current | Unsupported restart/upgrade limits cannot become a runtime pass | EP2:L196–205 and L251–273 retain pre-operation supported-bound requirement and missing deadlines/margins; L439–443 makes lifecycle scenarios mandatory before final TLS-Q, not silently omitted | **PASS**, prerequisite handling; actual safe restart remains unestablished |
| EP-T06 — no-route/no-app standing hold and authorised stages | Method retest / current | No business admission even after campaign; probe path opened only after controls/authority | EP2:L50–59, L107–157, L281–329: no app/Route/backend or port-80 fallback; specific test/admission allowlist, no routine publisher rights, time-bound exceptional operator; independent customer-NSG hold before listener/opening; scope, identity, cost, WV15–17 and deployment approvals remain separate | **PASS**, proposed boundary/order, not deployed isolation or protection against the ultimate authorised owner |
| EP-T07 — observations/coverage | Method retest / current | Testable finite probes with honest client/path/evidence limitations | EP2:L331–435: at most four concurrent connections, one/source, 10s/attempt, no long-lived/resumed sessions; three devices via LB and single admitted nonprivileged in-cluster Job per replica, no VPN-to-Overlay assumption; legacy loopback controls, decoded ClientHello, peer refusal evidence, TLS/certificate/cipher/SNI matrix and mandatory renewal | **PASS**, proposed tests; no device-by-replica equivalence/global protocol minimum inferred |
| EP-T08 — containment/closure | Method retest / current | NSG cannot be mistaken for session kill; failure/expiry cannot claim successful closure | EP2:L323–329, L511–574: independent NSG affects **new connections only**; terminate clients/Job and verify sockets/processes plus denied fresh connections; active scoped authority before opening; 60s is an action-issuance target after discovery, not guaranteed isolation. API/ARM failure or surviving unknown flow is an incident, not containment PASS; trust/fixtures removed | **PASS**, response/closure method; no live effectiveness or separation-of-duties proof |
| EP-T09 — change/observation-loss/validity | Method retest / current | Remove withdrawn invariant explicitly; finite observations must not imply unchanged build or future use | EP2:L43–88 and L437–509 expressly accept that unseen/changed builds may process authorised synthetic probes; bracket device/replica/controller sets, reject mixed/gapped qualification, acknowledge same-pod/unexposed/transient changes and equal-hash limits; earliest closure/expiry/change/loss/failure ends applicability; sealed records historical only | **PASS**, narrower claim is coherent; **EP-TECH-01 disposition below** |
| EP-T10 — original blockers/approvals | Method retest / current | No hidden waiver or new authority | EP2:L576–612 retains F04-01/02/04/05/07/08 and signature/admission F04-06, fail-closed scoped exceptions and original design/cost corrections; L640–654 retains owner, plan and full-release prerequisites. Main design/cost hashes match prior snapshots | **PASS**, retention only; full F04/regulated review not performed |

## Finding disposition and material-new-defect assessment

| ID / original classification | Fixed evidence / current disposition | Impact / confidence | Owner / required decision, fix and retest |
|---|---|---|---|
| **EP-TECH-01 — HIGH-priority method-design gap in EP-r1** | **Resolved for the explicitly narrower EP-r2 PROPOSAL by removal of the unsupported claim, not by implementing atomic prevention or accepting risk.** EP2:L43–88 withdraws continuing/app-use permission and explicitly identifies probe exposure as a new owner decision. L94–98 maps narrowed gates; L147–155 forbids inheriting it as later app permission; L281–338 supplies ordered test access/closure; L437–509 defines temporal outcomes and historical validity | EP-r1 **FAIL remains valid** for the original claim. The check/use race and unobserved-change possibility still exist physically, but EP-r2 neither asserts their elimination nor authorises business traffic. Exposing bounded synthetic probes is disclosed rather than disguised as a preventive control. **High confidence** in the textual scope correction; actual control feasibility/effectiveness unverified | Requesting user must still accept/reject exact narrowed scope/residual risk and expiry, after required independent inputs. No method fix required for this scoped disposition. Before implementation/execution, relevant owners must establish the actual approved contracts listed below and tester must verify them. Any restoration of continuing-use/no-unqualified-probe guarantees requires affected independent review; this PASS cannot be reused for that claim |

**No material new defect preventing proposal-method acceptance was identified
in this bounded retest.** This is an affirmative judgment on the stated finite
historical method, not a conditional PASS for continued service. In particular:

- **Change before check:** inventory the current observed set for a new series;
  no inherited business permission.
- **Between check and handshake / during a probe:** a changed build may process
  a permitted synthetic probe. That is the proposed residual risk, not a hidden
  safety promise. Detected mismatch cannot support a campaign PASS; unseen
  changes cannot support unchanged-build assurance.
- **Existing flow / observation or hold loss:** NSG update does not kill the
  flow. Known clients/Jobs are stopped; incomplete closure is an incident and
  invalidates the claim, not “isolated successfully.” No in-flight business
  session is authorised by the campaign.
- **After final observations:** access, session and trust teardown follows;
  records are historical. “Future apps” in capacity discussion at EP2:L245–247
  describes a later capacity constraint, not authority overriding the explicit
  no-app boundary and later independent application-release requirement.

The prior security report is historical feedback, not a verdict borrowed here.
This report does **not** close EP-SEC-01–09 or replace the separately assigned
security retest.

## Later prerequisites and remaining owner decisions

These are **pending evidence/approval gaps, not new method failures or observed
vulnerabilities**. Confidence is high that they remain explicitly required.

| ID / evidence and earliest due | Impact / owner / resolution and later independent retest |
|---|---|
| EP-P01 — EP2:L69–105, L113–127; before applying amended gates | User approves/rejects the exact expiring finite scope, exposure of bounded probes to changed/unseen builds, client/path limits and named WV12/19 evidence deviation. Reviewer PASS does not do this. Rejection leaves original blockers intact |
| EP-P02 — EP2:L207–273, L340–411, L640–654; design/actual plan before relevant operation | Engineer/tester supply exact pinned clients/probe/TLS-sync/admission contracts, selected-version scheduler accounting, bootstrap/rollout counts, storage safety margin, timing anchors and deadlines. Owner approves cipher policy, readiness/recovery/reload/alert targets and sandbox permissions. Later tester checks every scoped path/scenario without guessed defaults |
| EP-P03 — EP2:L196–205, L281–321, L340–384, L530–554; before release/opening or disruptive operation as specified | Establish supported no-Route TLS serving, exact NSG/backend/source/priority and all ingress-path assertions, allowed/denied selector policies, real least-privilege observer/result roles and effective preactivated ARM hold authority. Restart/upgrade bounds remain a potential execution blocker, not presumed feasible. Engineer/architect own contracts; tester verifies later at the specified local/operational gates |
| EP-P04 — EP2:L159–205, L511–574; approval before implementation, refresh before campaign | User/budget/operator/privacy owners supply actual funded ceiling and cleanup reserve, offer/credit, scope/identity/MFA/expiry, device/trust and evidence purpose/retention decisions; grant availability must cover closure/contingency. No quota/allocation/privilege assumption. Exact context, WV16 validation then WV17 preview and separate deployment/campaign authority remain required |
| EP-P05 — EP2:L386–574; after separately authorised deployment | Tester executes actual capable-client controls, per-replica/LB tests, renewal and final post-lifecycle matrix, observation-gap behavior, denied new connections, socket/Job termination, trust removal and approved containment/recovery drills. Record expected/actual evidence and failures. None observed in this retest |
| EP-P06 — EP2:L576–654; normal design release | Original F04 blockers, revised design/actual plan/full-cost approval, dedicated five-pillar architecture review and affected specialist/human decisions remain. Later app scope must independently resolve continuing-use assurance or obtain its own reviewed explicit decision; this historical test record cannot grant it |

The snapshot loop is **5/5 exhausted**. Three remaining technical-review attempts
do not authorise any new snapshot, sixth preservation attempt or reset. Future
changed-input preservation or further work must respect that exhaustion and any
explicit user decision; none is initiated here.

## Actual retest checks, commands, sources and unrun work

Access date **2026-10-21**. `git rev-parse HEAD` again returned
`5ecf21c2e8333b83c176073b02fece55c9a16f62`; versions are listed above.
No installation, authentication, browser, Azure call or live probe occurred.

| Actual check | Reproducible command / method and outcome |
|---|---|
| Fixed-input integrity | Same Python `pathlib/re/hashlib/subprocess` manifest algorithm retained in attempt-1 history below, now run for `S005` and `S004` with expected count **31 each**: preserved `files/` bytes or `git show <commit>:<path>` bytes; assert SHA-256 per row, final count and thirteen copies/eighteen immutable refs. **Exit 0**, every row matches. No snapshot written or self-hash |
| Prior-output integrity | Python byte equality between owned report and S005 preserved prior report before edit: **PASS**. Frozen report SHA-256 above also independently verified through both manifests |
| Change inspection | Full preserved EP-r2 read in ranges; preserved corrective author assignment, historical reports and S004 provenance read; exact-line extraction with Python. `git --no-pager diff --no-index -- <S004-EP-r1> <S005-EP-r2>` returned **1**, expected because revisions differ, not a test failure. Large diff output was not relied on as a complete read; full preserved EP-r2 governs |
| Ledger / tools | Scoped `rg` over current ledger confirms technical 2/5, author 4/5, snapshot 5/5. `git --version`, `node --version`, `python3 --version`, `git rev-parse HEAD`, scoped `git --no-pager status --short` all completed with exit 0 |
| Arithmetic | Python assertions `2*4+1*2==10`, `2*4+2*2==12`, `3*4+3*2==18`, `20-18==2`: **exit 0**; no allocation, reservation, charge accuracy or enforcement inferred |
| Official mechanism corroboration | Public generic Microsoft Learn searches followed by full fetches of NSG, Overlay and Cilium pages below; relevant limitations inspected. No repository/private text or identifiers sent externally; no code generated/executed from examples |
| Output hygiene | Read-only whitespace/readback/prior-history-preservation/hash check after this update; final byte hash returned rather than embedded in its own content. Not another review attempt |

Newly independently consulted official sources:

1. [NSG overview](https://learn.microsoft.com/en-us/azure/virtual-network/network-security-groups-overview),
   **Security rules / Default rules / Azure platform considerations**: stateful
   existing flows survive rule changes; new connections are affected; rule
   priority/default VNet allow and backend/source treatment matter. Supports the
   proposed limited hold, not instantaneous session termination or this
   candidate's effective ingress isolation.
2. [CNI Overlay](https://learn.microsoft.com/en-us/azure/aks/concepts-network-azure-cni-overlay),
   **How it works / NSGs**: external clients cannot directly reach pod IPs;
   intra-cluster Overlay communication and required node/pod traffic must be
   preserved. Supports separate pod-to-replica and device-to-LB observations,
   not path equivalence or observed candidate connectivity.
3. [CNI powered by Cilium](https://learn.microsoft.com/en-us/azure/aks/azure-cni-powered-by-cilium),
   **Network policy / Limitations / FAQ**: pod/node `ipBlock` restrictions,
   selector alternatives and hostNetwork limitations. Supports the proposed
   non-hostNetwork selector-scoped probe; no paid ACNS feature, policy object,
   default footprint or live enforcement is assumed.

Prior technical documentation consultations remain dated attempt-1 evidence,
not newly re-executed routing/TLS/start-stop source verification. No repetition
of all AVM research or complete implementation audit was attempted.

**NOT RUN, later:** WV05–WV14 candidate restore/build/lint/parameters/control
assertions; WV15–WV17 confirmed Azure context/validation/what-if; actual deployment,
AC03-Q/TLS-Q and WV18–WV22 health/TLS/access/monitoring/renewal/closure/recovery
observations. No implementation tool probe is necessary to review this document.
Required later missing tools or evidence must block their own gate, not be
reported as passed here.

**NOT APPLICABLE to this method artifact:** AI01–AI06 and ML01–ML08 execution,
because no application/agent/tool/scoring consumer, model or dataset is delivered.
No model/data jobs, legal certification or statistical/domain ML acceptance
performed. Full regulated architecture/security/compliance/candidate reviews and
human approvals are outside this retest and remain pending.

## Current disposition and writing stop

**PASS for EP-r2's finite, closed, test-only historical-observation METHOD
PROPOSAL.** EP-TECH-01 is dispositioned only for that changed claim as above;
the EP-r1 FAIL below is not rewritten into a pass. No new material blocking
method defect found. This does not approve the proposed scope/risk change,
waive any original target or finding, certify WAF, release design/candidate/app,
grant probe authority, or promise atomic change prevention/continuous TLS.

**SQL unavailable; no task-store files accessed.** Intended parent statement:
`UPDATE todos SET status = 'done' WHERE id = 'wp001-amendment-technical-r2';`
Completion means report delivered, not owner adoption or downstream unblocking.

**WRITER STOPPED — one bounded retest completed; sole owned report updated.**
Only read-only output verification follows. No onward author/reviewer routing,
other writes, proposal fixes, snapshots, Azure/auth/validation/what-if/qualification,
browser, infrastructure/workflow generation, model/data work, delegation,
commit or push. Technical loop **2/5 consumed, 3 remaining**; snapshot remains
**5/5 exhausted**, author **4/5** unchanged. Current output revision
**EP-TECH-r2**, SHA-256 returned after verification.

---

# Historical attempt 1 — EP-r1 FAIL (unaltered report follows)

The following report records attempt 1 and its then-current S003 scope, counters
and verdict. Those historical counters/SQL intent are not the current retest
state. Exact original bytes are additionally frozen in S004 and S005 at the
prior-report hash stated above.

# Review: WP-001 / EP-r1 / independent technical method

**Revision EP-TECH-r1 · 21 October 2026 · FAIL for the scoped evidence-method proposal only.**

## Assignment, inputs and independence

| Field | Value |
|---|---|
| Reviewer / task / scope | Fresh NON-AUTHOR infrastructure-tester; `wp001-amendment-technical`; adequacy and practical coherence of the proposed capacity/TLS evidence-method amendment |
| Accepted assignment | **ACCEPTED before work:** `assignments/F03-amendment-technical.md` and the user's narrower execution instruction. Proposal/review authority only; no amendment acceptance |
| Target gate / criteria | Amendment-method review, before owner decision; EP-T01–EP-T10 below. References to WV/AC checks are traceability, not full-check completion |
| Exact reviewed artifact | **EP-r1**, preserved `snapshots/S003/files/delivery/releases/WP-001/evidence-plan-amendment.md`; SHA-256 `7ea29284900e82aed8e747a6d1073db2a0b67c17ff6036430a4ff038722c923c` |
| Fixed input set | [S003 manifest](snapshots/S003/manifest.md): nine preserved copies and eighteen immutable dependency references; base `5ecf21c2e8333b83c176073b02fece55c9a16f62` |
| Producer / integrity | Explicitly assigned host operator; producer's Node v25.8.1/SHA-256 verification accepted and **independently rechecked here: 27/27 MATCH**. No manifest self-hashing, snapshot alteration or comparison against moving workload sources |
| Authority evidence | Preserved `assignments/F03-evidence-amendment.md`, authority/scope/stage-boundary rows: preparation only. Current review assignment and operational model policy govern this invocation without replacing frozen workload requirements |
| Output / owner | Sole write `delivery/releases/WP-001/evidence-amendment-technical.md`; infrastructure-tester |
| Stable loop / reservation | `WP001-EP-TECH`, current `ledger.md`, Review / Test / Validation Loops row; reservation corroborated before substantive review |
| Attempt / budget | **1/5 consumed; 1 used / 4 remaining.** One bounded review, no fix/recheck iteration. `WP001-F03-AUTHOR` and `WP001-DESIGN-SNAPSHOT` remain **3/5** each; no ledger edit |
| Risk / target owner | Regulated FND-05; requesting user owns proposed threshold, risk and scope-amendment decisions. No threshold is approved by this report |
| Model routing | HIGH, assigned `gpt-6.1-sol`; actual runtime **NOT VERIFIED** because no authoritative runtime-model field is exposed. No observed unavailability, switch, fallback or downgrade |
| Context / non-authorship | This invocation started with the fixed-input review assignment, not the maker conversation. Reviewer did not author or change EP-r1/design/cost/implementation. Author-check assertions present in the preserved artifact were treated as author-side claims, not independent evidence |
| Isolation / competence limits | Fresh invocation supplied by host/user; process isolation and provider/model independence cannot be attested. Shared instructions/model selection can correlate blind spots. Infrastructure-method judgment only, not legal/security-risk acceptance or statistical/domain ML evaluation |
| Tools / accounting | Local read, search, Git, Python, Node and public Microsoft Learn search/fetch available. No SQL tool or authoritative inference-cost/credit accounting exposed. No delegated reviewer or onward routing |

Activated and applied `ama-context`, `ama-avm-bicep`, `ama-handoff`,
`ama-workload-validation` and `ama-ai-ml-validation`. Read AGENTS, team guide,
ownership/snapshot and review-template contracts, fixed WV/AI/ML catalogues and
relevant immutable lifecycle/standards/routing/loop contracts. Workload judgments
use preserved EP-r1, design, F04-r1, context, cost and SEC/CR requirements, not
moving workload files. Current ledger is lifecycle/reservation evidence only.

## Criteria and evidence

Line references below are **1-based preserved S003 file lines**, not moving
worktree lines. `EP` means the exact preserved amendment above; other filenames
mean preserved files under the same S003 workload directory.

| Criterion / obligation / control | Earliest gate / current or later | Expected result and method | Actual evidence | Result |
|---|---|---|---|---|
| EP-T01 — input integrity and authority | Method review / current | Verify complete fixed-input coverage, exact main hash, proposal-only authority and reserved attempt | Python SHA-256 over nine copies and `git show <commit>:<path>` bytes for eighteen dependencies: 27 matches; frozen author assignment and current review assignment inspected | **PASS**, deterministic integrity; authority interpretation is reviewer judgment |
| EP-T02 — explicit gate split, not a waiver; AC03/F04-03, TLS F04-06; WV01–04 trace | Method review / current | Before/after criteria, owner approval, honest static/runtime separation | EP:55–79 separates AC03-S/L/Q and TLS-S/L/Q; 88–99 requires exact human decision and later revised design/actual-plan/full-cost approval. Original design AC02/03/05/06/07 remain baseline, not silently rewritten | **PASS**, method/traceability only |
| EP-T03 — per-node capacity method; AC03; WV13/22 trace | Method review / current | Include allocatable/reserves, all eligible-node DaemonSets, init/sidecar concurrency, hard placement and transient peaks | EP:175–227 specifies inventory, zero-request treatment, `min(allocatable, capacity − floor)`, no double-charging reserve, selected-version effective requests, per-node fit, pod slots/storage, HPA/rollout/terminating-pod and bootstrap peaks. Missing scheduler semantics block calculation | **PASS**, proposed method; no actual requests or fit verified |
| EP-T04 — fixed counts, quota and cost control; AC03/07/13 | Method review / current | Separate arithmetic from enforceable bounds/availability; no hidden funding or allocation assumption | EP:135–152: initial 3/10, steady 4/12, both-surge 6/18 and six-disk ceiling; total-region and family quota checked independently; 198h and extra/surge allowances consume existing proposed budget; unknown funded ceiling and cleanup reserve block execution. Independent arithmetic: 10, 12, 18, historical margin 2 | **PASS**, bounded planning method, not quota reservation or cost approval |
| EP-T05 — start/stop, upgrade and unknowns; AC19/WV22 | Method review / current | Do not infer startup ceilings from autoscaler limits; separately authorise disruptive tests and predefine missing limits | EP:163–171 explicitly lacks a supported restart bound and holds restart qualification/app admission without one; 219–239 requires supported peaks, target upgrade selection and deadlines before operations. Official stop/start guidance corroborates out-of-range startup and allocation risk | **PASS**, honest prerequisite/failure treatment; startup feasibility remains unestablished |
| EP-T06 — staged empty-foundation qualification; AC13–19/WV15–22 | Method review / current | Separate approval, implementation, preflight, validation, preview, deployment and qualification; no app/model/data admission | EP:81–124 requires normal release, candidate checks, actual confirmed context, WV16 before WV17, separate exact deployment authority and actual deployment record. EP:154–161 preserves private device/data boundaries | **PASS**, proposed sequencing, not execution permission |
| EP-T07 — precise observations and pass/fail; TLS-Q/AC03-Q | Method review / current | Meaningful CPU/memory/health and endpoint tests, explicit inconclusive cases and replica coverage | EP:229–239 proposes Ready within 30m then 30 continuous healthy minutes; 241–280 binds configuration/client evidence, TLS1.2 success, old-protocol negatives, hostname/trust negatives, offline expiry distinction, per-replica plus LB coverage. TLS1.3 is not invented as mandatory. No business backend needed for handshake | **PASS**, test design at proposal granularity; exact commands, protocol-error classification, fixture capabilities and timing anchors belong in the later approved actual test plan |
| EP-T08 — failure, containment, recovery and requalification | Method review / current | No automatic retries/scale/bypass/rollback or uncontrolled spend on failure | EP:282–288 and 328–334 hold admission, require preapproved containment/cleanup authority, preserve evidence and require new design/cost approval for sizing/control changes. Nontransactional deployment and residual charges acknowledged | **PASS**, failure policy; actual containment permissions/effectiveness untested |
| EP-T09 — automatic change and safe validity interval; TLS-S/Q, SEC03/09/10/11 | Method review / **current** | Proposed operational method must explain how an automatically changed serving build cannot be used before its qualification, including races and loss of observation | EP:253–258 binds evidence to observed builds; 290–297 demands a credible detection-and-hold contract but supplies only comparison before use and a future-contract requirement. No ordering/control point or fail-closed observation-loss behavior is proposed. Official routing guidance confirms automatic in-place upgrades | **FAIL — EP-TECH-01**; this is missing core method design, not missing future runtime observations |
| EP-T10 — unchanged blockers and approval ownership | Method review / current | Do not close F04, invent native exceptions, waive SEC/CR/owner targets or claim complete assurance | EP:69–79, 92–99, 299–334 explicitly retain F04-01/02/04/05/07/08 and signature/admission F04-06, all-five-pillar review and human approvals. Preserved feasibility §2 and design §11 corroborate the original requirements | **PASS**, retention/traceability only; original findings not retested or closed |

These are independent **method judgments**, except the explicitly deterministic
hash/arithmetic assertions. None is an independent full WV01–WV22 pass.

## Findings preventing a method PASS

| ID | Severity / evidence-gap classification | Exact evidence / criterion | Impact / preconditions | Confidence | Owner / fix / independent retest |
|---|---|---|---|---|---|
| **EP-TECH-01** | **HIGH-priority method-design evidence gap**, not an observed vulnerability | EP:70 requires a complete TLS change/stop contract; EP:55–63 proposes empirical-only assurance with managed-change risk; EP:253–258 binds qualification to observed builds; EP:290–297 invalidates changed evidence, compares before use and requires prevention of unqualified-build use. SEC03/09/10/11; EP-T09 | A pre-use digest/config check is not ordered atomically with serving traffic. After that comparison, an automatic in-place update or new serving proxy/configuration can appear before the next handshake/request, or during an existing session. Retrospective detection cannot prove the proposal's stronger prevention invariant. For initial empty-foundation tests the admission hold is coherent; for later continued use, the central replacement assurance is still an unspecified design requirement. Declaring BLOCKED if a future contract cannot work prevents a dishonest future pass, but does not provide a reviewable operating method now | **High** that the prevention mechanism and observation-loss semantics are absent; **medium** on eventual implementability. No assertion that every supported solution is impossible | **Architect/proposal owner** supplies a revised proposal describing the supported control point and ordering between automatic change, traffic hold, qualification and release; responsible actors, evidence-validity scope, new-replica and same-pod configuration cases, observation/hold failure, and existing-session handling. Demonstrate the method logically prevents the stated prohibited use within the fixed service/resource/security bounds, or return a separately reviewed owner decision/design revision rather than silently tolerating a detection window. **Retest:** fresh fixed revision in this same loop; independently trace change-before-check, change-between-check-and-use, change-during-use and observer/hold failure. Require a consistent fail-closed outcome on paper now; actual implementation/operational proof remains later and separately authorised |

**Why this is a proposal defect, not a demand for future observations:** the
amendment substitutes a build-bound observational route for a supported minimum-TLS
contract. The operating rule preserving that evidence between observations is
part of the substitute method itself. A high-level supported ordering/control
contract is needed to judge that method; deployed digests, TLS results, code or
live demonstrations are not requested now. Exact command syntax, operator IDs
and later test measurements can properly remain in the actual approved plan.
This review does not choose a new control/product, relax the zero-unqualified-use
requirement, approve a detection interval or prove an Azure pre-change hook exists.

No additional logical deadlock is established from the fixed inputs. In
particular, full F04 closure is a later normal-release prerequisite, not a
prerequisite to reading/reviewing EP-r1. Unknown restart feasibility is an
explicit execution hold, not proof of an achievable restart method and not a
second method failure merely because its proof is not available today.

## Later prerequisites — not defects preventing this method review

These are **evidence-gap classifications**, not security vulnerabilities and not
conditional passes. They remain required even after EP-TECH-01 is corrected.

| ID / classification | Preserved evidence / earliest due | Impact / confidence | Owner / required resolution and later retest |
|---|---|---|---|
| EP-P01 — owner/target approval pending | EP:55–79, 88–99; exact amendment decision before applying changed gates; revised design/plan/cost and applicable SEC/CR decisions at normal design release | No changed gate, budget or residual risk is currently approved. **High** | Requesting user and competent delegated owners approve/reject exact frozen scope/targets, empirical-only assurance and deviations; coordinator records protected references. Later reviewer checks exact approved revision, not conversation tone |
| EP-P02 — actual capacity inventory/thresholds pending | EP:175–239; numerical storage margin and approved readiness/lifecycle deadlines must be fixed in design/actual test plan before relevant qualification; managed inventory observed at AC03-Q | Raw CPU/count arithmetic is not schedulability or measured health. **High** | Engineer supplies exact contracts/pins and selected-version accounting; owner approves missing margins/deadlines; tester independently checks all eligible-node/peak scenarios, including transient and terminating pods. No guessed defaults |
| EP-P03 — startup/upgrade bound feasibility pending | EP:163–171, 219–239; before authorising each disruptive operation | Supported restart ceiling is **not established** and may prevent this execution path; no allocation guarantee. **High** on gap, no claim of impossibility | Engineer/architect establish a supported pre-operation bound, including replacement/deletion lag and webhook behavior; tester reviews before any separately authorised drill. Failure returns to owner/design decision, not quota reduction, direct VMSS edits or bypass |
| EP-P04 — funded envelope and scope readiness pending | EP:135–161, 104–117; cost approval before implementation, refreshed allowance/context before execution | No actual currency ceiling, usable credit, cleanup reserve, availability or private client readiness established. **High** | Budget/operational/privacy owners provide approved limits/rights/data handling; authorised operator confirms exact context; tester later performs WV15–17 under separate authority. Alerts/caps never substituted for spend enforcement |
| EP-P05 — test implementation and operational evidence pending | EP:100–103, 229–297; actual plan before execution; AC03-Q/TLS-Q and applicable WV18–22 after authorised deployment | No health, TLS, certificate renewal, public denial or recovery observed. **High** | Tester instantiates exact tools/digests/commands, start/stop clock anchors, protocol-capable safe fixtures and distinguishable peer rejection versus client/cipher/network failure; maps per-replica access and evidence locations. Owner fixes renewal/alert/deadline targets before mutations. Later evidence must meet the unchanged approved thresholds |
| EP-P06 — original design blockers retained | EP:299–334; preserved F04-r1 §2; normal `design-released` gate | Native ownership/VPN/DNS/egress/monitoring/output/default and signature/bootstrap contracts remain unresolved. **High** | Existing architect/engineer/specialist owners resolve under separate authority; exact exceptions and human approvals required, then affected independent checks. This method report neither closes nor waives any original finding |

## Actual checks, commands, tools and sources

Access date: **2026-10-21**. Repository HEAD observed:
`5ecf21c2e8333b83c176073b02fece55c9a16f62`. Local versions:
**Git 2.54.0 (Apple Git-157), Python 3.9.6, Node v25.8.1**. No tools installed.

| Executed check | Reproducible method / actual outcome |
|---|---|
| Worktree/versions/base | `git --no-pager status --short`; `git --version`; `node --version`; `python3 --version`; `git rev-parse HEAD` — exit 0. Existing modified/untracked workload records present; sole report path absent before writing. Unrelated changes left alone |
| All fixed-input hashes | Python `pathlib`, `re`, `hashlib`, `subprocess`: parse manifest rows matching `r"\| `([^`]+)` \| `([^`]+)` \| `([0-9a-f]{64})` \|"`; for `files/` rows read bytes relative to S003, otherwise read `subprocess.check_output(["git","show",commit+":"+path])`; assert each SHA-256 and final count 27. **Exit 0, 9 copies + 18 references MATCH**. No moving source read for workload judgment |
| Preserved source inspection | `view` ranges and Python line enumeration of preserved EP/design/requirements, preserved feasibility §2 and author assignment; fixed contracts read with `git --no-pager show <manifest-commit>:<path>`. Relevant limits/criteria reviewed, not every AVM re-audited. Author asserted verdicts not adopted |
| Arithmetic | Python assertions `2*4+1*2 == 10`, `2*4+2*2 == 12`, `3*4+3*2 == 18`, `20-18 == 2` — **exit 0**. No price accuracy, eligibility, headroom, reservation, effective ceiling or placement inference |
| Public technical corroboration | Microsoft Learn search then full fetch of routing, stop/start, reservations and manual Gateway TLS pages below; generic public technical queries/official URLs only. Large tool returns inspected by section/search where needed; no public upload of repository text or private identifiers |
| Report hygiene | After writing, scoped whitespace/readback/hash check recorded in final response. This is report verification, not a second method-review attempt |

Official documentation independently consulted:

- [Application routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api),
  **Versioning and Upgrades / Resource customizations**: non-revisioned, in-place
  managed updates; automatic patch/minor change paths and default istiod HPA
  maximum five. Supports the temporal-risk finding and bootstrap inventory need,
  not a version-bound minimum-TLS or allocation guarantee.
- [Stop and start AKS](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster),
  **About stop/start / Stop / Start**: startup may be outside autoscaler bounds,
  webhook/drain restrictions, 15–30-minute settling interval, private-endpoint
  changes and possible inability to reacquire capacity. The published suggestion
  to ignore/remove webhooks is not adopted.
- [Node reservations](https://learn.microsoft.com/en-us/azure/aks/node-resource-reservations):
  capacity versus allocatable, CPU/memory reservations, eviction and OS overhead.
  No formula/default is substituted for actual selected-cluster evidence.
- [Manual Gateway TLS](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api-tls):
  Key Vault/CSI sync and Secret `certificateRefs` are documented; manual workflow
  remains described alongside a recommended automated option. Samples do not
  establish this workload's exact federation/encoding contract or minimum TLS.
  No new integration or sample resource is selected or executed by this review.

### NOT RUN / NOT APPLICABLE

- **WV05–WV14 candidate execution: NOT RUN**, later `locally-validated` gate;
  no released infrastructure/candidate inventory is assigned here. Bicep
  restore/build/lint/parameter compilation/tool availability were not probed or
  run. This is not a missing current method-review prerequisite.
- **WV15–WV17: NOT RUN**, later separately authorised `deployment-ready` gate;
  no Azure/authentication/context/validation/what-if calls.
- **AC03-Q/TLS-Q and WV18–WV22: NOT RUN**, later authorised deployment and
  operational gates, including endpoint/TLS, access, monitoring, capacity and
  recovery. Code assertions and public docs supply none of these observations.
- **AI01–AI06 and ML01–ML08: NOT APPLICABLE to this method-review artifact**:
  empty-foundation proposal supplies no app/runtime agent, API/tool/scoring
  consumer, model, dataset or model/data job. No model-quality competence,
  dataset isolation or acceptance evidence is claimed; later app/ML assignments
  require their own approved protocols, tools and domain/statistical competence.
- **Complete regulated five-pillar architecture report, security/compliance
  acceptance, author conformance and human approval: NOT RUN here**, separately
  scoped normal-release work retained by EP:92–99. This report deliberately
  does not write `architecture-review.md` or certify WAF alignment.

## Disposition and writing stop

**FAIL — scoped method adequacy, because of EP-TECH-01.** Inputs were sufficient
to complete the assigned independent review; this is not a BLOCKED review task.
Passing subcriteria are not an amendment acceptance, conditional design pass,
candidate assurance, WAF certification, deployment approval or security-risk waiver.
No future observation or full F04 closure was required to perform this review.

Remaining owner decisions: resolve the proposed change/hold method without
weakening targets; separately obtain security-method review and the requesting
user's exact amendment decision; retain all revised design/actual-plan/cost,
privacy/legal/offer and later execution approvals. This report initiates none of
those actions and does not route another author/reviewer.

**SQL unavailable:** no SQL tool is exposed; no task-store files accessed.
Intended statement for parent (not executed; parent must use its actual schema):
`UPDATE todos SET status = 'done' WHERE id = 'wp001-amendment-technical';`
`done` means the report is complete despite FAIL, not amendment approval or
downstream unblocking.

**Stopped substantive review and writing after this one bounded attempt.**
Only read-only report hygiene/readback/hash verification follows. Sole repository
write is this report; no proposal fixes, snapshots, ledger/task-store edits,
infrastructure/workflows, Azure/live/exploit tests, browsers, model/data jobs,
delegation, commits or pushes. Loop remains **1/5 consumed, 4 remaining**;
author and snapshot loops unchanged. Output revision **EP-TECH-r1**; byte hash
is returned after verification rather than self-embedded.
