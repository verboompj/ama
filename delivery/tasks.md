# Workload Delivery Backlog

**Reference tasks below are pending.** The coordinator selects work for the authorised objective
and accepted [risk path](handoffs.md#risk-based-review-paths).
The actual development plan fixes files, contracts, reviewers and tests.

The tables below are reference catalogues. Live foundation preparation is tracked
as F01-F07 in [WP-001](releases/WP-001/context.md#planned-work), with current state in
its [ledger](releases/WP-001/ledger.md) and outstanding choices in its
[decision register](releases/WP-001/decisions.md).

## Solution Slice Backlog

S01-S08 support the proposed [public-data crop-evidence slice](first-implementation-slice.md).
Scope, data/compute authority and owner-approved targets must be resolved before
implementation. The plan adds any triggered specialist or platform work with explicit
dependencies and distinct write paths.

| ID | Owner | Depends on | Persistent output | Acceptance / blocking condition | Status |
|---|---|---|---|---|---|
| S01 | delivery-coordinator | None | Package context and decision/owner records | Accepted risk path; region/years/classes, data authority, compute/budget, human owners and quality-target decisions recorded; unresolved decisions block release | pending |
| S02 | azure-architect | S01 | Scoped design and data/scoring/application contracts | Approved experimental boundaries, feasible compute/data route, lineage/test-isolation requirements and exact publisher/consumer ownership | pending |
| S03 | delivery-coordinator | S02 | Accepted actual plan, review evidence and release references | Required non-author technical review and triggered specialist findings resolved; architect/scoped-writer acceptance and applicable human approval; AI/ML criteria instantiated before final evaluation | pending |
| S04 | ml-data-engineer | S03 | Data/geometry/features, grouped splits, baseline/calibration/scoring code and replay bundle | ML01-ML07 candidate artifacts and adjacent author tests; declared limitations; locked final-test protocol preserved | pending |
| S05 | application-ai-engineer | S03, S04 | Deterministic evidence view, scoring adapter, packaging and author tests | Accepted scoring version, explicit UNKNOWN/failure states, safe evidence/access boundaries and applicable AI01-AI05 author checks | pending |
| S06 | infrastructure-tester | S04, S05 | Independent acceptance/evaluation suites and report | Approved-target metrics, independent replay, contract/error/access tests and required specialist evidence against a fixed candidate; missing competence or evidence blocks | pending |
| S07 | architecture-documenter | S04, S05 | Run/replay guidance, visuals and limitations | Documentation matches the candidate; architect accepts technical meaning and supplies author-side conformance | pending |
| S08 | delivery-coordinator | S06, S07 | Readiness and ledger update | Required local evidence accepted; later live/promotion checks remain pending; exact candidate, attempt usage and unresolved issues recorded | pending |

## Initial Backlog

### Regulated Infrastructure Reference

D01-D20 provide the full infrastructure path. Scope the applicable tasks for each
package and use its own records.

| ID | Owner | Depends on | Input | Persistent output | Acceptance / blocking condition | Status |
|---|---|---|---|---|---|---|
| D01 | delivery-coordinator | None | Case, maintained docs, user objective | `WP-001/context.md` | Requirements/source map, known decisions and missing prerequisites; no guessed Azure settings | pending |
| D02 | security-reviewer | D01 | Scoped requirements and data flows | `WP-001/security-requirements.md` | Threat assumptions, required controls and measurable security criteria supplied before design release | pending |
| D03 | compliance-reviewer | D01 | Scope and applicable official sources | `WP-001/compliance-requirements.md` | Applicability, legal questions, required controls and human approval owners identified early | pending |
| D04 | infrastructure-tester | D01 | Business requirements and success measures | `WP-001/test-plan.md` | Measurable acceptance criteria and staged checks; plan refined with design and implementation | pending |
| D05 | architecture-documenter | D01 | Context and emerging decisions | Related design records/visuals and `WP-001/documentation.md` | Initial documentation established, then maintained through design and implementation | pending |
| D06 | azure-architect | D02, D03, D04 | Requirements, specialist constraints and existing baseline | Draft `WP-001/design.md` | Bounded workload design, WAF assessment, contracts and acceptance matrix; documentation updated through coordinator | pending |
| D07 | bicep-engineer | D06 | Fixed design draft | `WP-001/feasibility.md` | Published AVM capability/version evidence, module-contract feasibility and gaps; no infrastructure generated | pending |
| D08 | security-reviewer | D06 | Fixed design and security requirements | `WP-001/security-design.md` | Independent design findings and disposition; revised design requires affected re-review | pending |
| D09 | compliance-reviewer | D06 | Same design and obligation requirements | `WP-001/compliance-design.md` | Design control/evidence mapping and unresolved legal/procedural approval requirements | pending |
| D10 | infrastructure-tester | D06 | Same design and evolving test plan | Updated `WP-001/test-plan.md` | Testability disposition and criterion coverage for the design revision | pending |
| D19 | infrastructure-tester | D07, D08, D09, D10 | Fixed architect-authored design, WAF criteria and specialist inputs | `WP-001/architecture-review.md` | Independent all-five-pillar assessment, WV01-WV03 findings/evidence and disposition; no source design edits | pending |
| D20 | delivery-coordinator | D05, D07, D08, D09, D10, D19 | Reviewed architecture, finding dispositions and actual implementation scope | `WP-001/development-plan.md` | WV04: actual files/contracts, graph/layers, parallel writers, findings and instantiated test inventory; architect/implementer acceptance recorded | pending |
| D11 | azure-architect | D20 | Fixed design snapshot, all required reviews, accepted plan and explicit human approval | Design-release decision for `WP-001/design.md`; coordinator records it in `ledger.md` | WV01-WV04 and required design dispositions match approved snapshot/plan; no self-review or frozen-file mutation | pending |
| D12 | bicep-engineer | D11 | Accepted released package | Approved `infra/` scope and `WP-001/implementation.md` | Pinned AVMs, contracts, local checks and frozen candidate manifest; no deployment/pipeline | pending |
| D13 | infrastructure-tester | D12 | Frozen candidate and actual module/root/parameter test inventory | `WP-001/test-review.md` | WV05-WV14: each build/parameter variant, warning disposition and effective control assertion recorded; current-gate gaps block and later checks stay pending | pending |
| D14 | security-reviewer | D12 | Same candidate and earlier findings | `WP-001/security-review.md` | Independent candidate disposition and verified mitigations | pending |
| D15 | compliance-reviewer | D12 | Same candidate and obligation matrix | `WP-001/compliance-review.md` | Control evidence and remaining legal/procedural gaps, not certification | pending |
| D16 | azure-architect | D12 | Same candidate and released design | `WP-001/conformance.md` | Candidate conforms to approved architecture or required design amendment is raised | pending |
| D17 | architecture-documenter | D05, D12 | Same candidate and maintained documentation | Final `WP-001/documentation.md` and related `docs/`/visuals | Documentation matches candidate; accurate states and setup/validation/recovery guidance | pending |
| D18 | delivery-coordinator | D13, D14, D15, D16, D17 | All accepted current-gate evidence and handoffs | `WP-001/readiness.md` and updated `ledger.md` | `locally-validated` only if required local checks/reviews pass; later checks listed by gate; no deployment authorisation | pending |

Paths above are relative to `delivery/releases/` unless they explicitly name `infra/`
or `docs/`. They describe future outputs; the package has not been created.
Use the [templates](templates/) and [package layout](releases/README.md).
Stable IDs identify tasks. D19/D20 supply independent architecture review and the
actual implementation plan before D11.

Dependencies mean usable prerequisite outputs, not merely a `done` status. D02–D05
provide early input, D07–D10/D19 assess a draft, D20 plans implementation, and
D13–D17 assess/document a candidate.
These groups may run independently only where file ownership and input revisions
permit. D05 produces initial docs rather than a completed implementation runbook.
D17 does not wait for assurance to begin; D18 requires all final outputs to agree.

Findings return through the
coordinator to their owner; re-open affected tasks and bind reruns to the changed
revision. A design change during implementation re-opens D06–D11 and D19/D20 as applicable.
Documenting code that later changes re-opens D17.

## Assignment, Snapshot and Gate Rules

Before each specialist task, the coordinator creates an accepted assignment with
exact write paths/owner, risk path, approved targets, required reviewers, inputs,
output, target gate and attempt limits.
Use [assignment.md](templates/assignment.md) and record consumption in the ledger.

The coordinator assigns the tester snapshot preparation before D07–D10/D19 review the
design and before D13–D17 review the candidate, using
[the snapshot protocol](releases/README.md#snapshot-protocol). This evidence-preparation
step fixes reviewed inputs; an existing immutable commit reference is sufficient
when it covers the full scope. The architect owns design and scoped writers own
implementation. Changed inputs invalidate affected evidence.

D08/D09 are the explicit design security/compliance checks before D11. D14/D15 are
the explicit implementation security/compliance checks before D18; D13 executes
the corresponding technical assertions. The backlog ends at `locally-validated`.
Authenticated/deployment/operational checks keep their later-gate owners and pending
results; they are not waived or declared passed at D18.
D19 supplies the dedicated five-pillar review for regulated infrastructure.
Before D11, D20 converts the actual reviewed architecture into implementation tasks
and instantiates [WV01-WV22](workload-checks.md) with resources, expected values,
commands and evidence. WV15-WV22 remain future authenticated/live work, with their
owners/confirmation prerequisites.

## Decisions to Resolve Before Design Release

- Which first capability is being implemented, and what remains outside the package?
- Existing tenant/subscription/resource groups/landing-zone networking, DNS, policy,
  logging and identity ownership; no credentials in the record.
- Environments, permitted EU regions/model deployment types and verified availability.
- Explicit service choices for still-open architecture options, sizing, quotas and
  budget; availability, recovery, latency, throughput and cost acceptance thresholds.
- Prototype versus production-pilot data scope, lawful data access, retention,
  responsible human decision-makers, and security/legal approval owners.
- Local tooling and later authenticated validation permissions. A resource design
  can be released with explicit prerequisites, but do not claim deployment feasibility
  has been verified without the relevant evidence.

Future release automation belongs to the Bicep engineer under a separate assignment,
consuming application packaging and ML job/scoring contracts. Name the authorised
deployment operator and human operational owner before deployment. Workflows,
deployment, promotion, real-case onboarding and operational drills require scoped approval.
