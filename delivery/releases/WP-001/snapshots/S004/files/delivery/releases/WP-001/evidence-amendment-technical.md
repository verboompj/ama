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
