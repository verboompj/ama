# Handoffs and Gates

This document supplies the work-package states and evidence contracts used by the
[Multi-Agent Framework and Orchestration](multi-agent-framework.md). That document
owns collaboration patterns, routing, feedback and research rationale.
[Workload Guidance](workload-guidance.md) owns Azure output standards.

The coordinator accepts artifact handoffs and routes each authorised phase.

## Assignment Before Execution

The coordinator prepares an [assignment](../../delivery/templates/assignment.md) before invoking
a specialist. It records input snapshot, target gate/check scope, permitted writes,
artifact owner, output format, stop conditions, attempt limits, any user-set budget
and required approvals. The specialist accepts or rejects those inputs before work.
The separate [handoff](../../delivery/templates/handoff.md) records actual outputs and consumption.
Missing required assignment fields are blockers, not permission to guess defaults.

## Risk-Based Review Paths

The coordinator proposes a path; the user or designated accountable owner accepts
it with the scope and required evidence. Use the highest applicable risk, and
escalate unresolved classification rather than silently selecting the light path.

| Path | Suitable work | Required assurance |
|---|---|---|
| **Light** | Small, reversible changes within an existing released design and approved contracts; no new data source, model behaviour, trust boundary or production effect | Concise assignment referencing the baseline; applicable deterministic local checks; non-author judgment review when the change needs it; short evidence-linked handoff |
| **Standard** | A bounded non-production capability, application/interface change or experimental public/synthetic-data model within approved boundaries | Scoped design/actual plan and approved targets; one named non-author technical reviewer; applicable deterministic workload tests; targeted security/compliance review when triggered |
| **Regulated** | Production or personal/case data, entitlement/payment impact, consequential model use, or material changes to identity, trust, exposure or legal obligations | Full independent design-quality and security/compliance review, controlled snapshots, required human approvals, candidate assurance and matching operational evidence |

New sources/licences, model processing geography, identity/tool permissions,
public exposure, secrets or changes to human-decision boundaries trigger the relevant
specialist review even in a standard experiment. Classify the actual data and impact.
The full infrastructure backlog supplies the regulated reference path.

Record the selected path, trigger rationale, acceptance-target owner, required
reviewers/checks, approvals and evidence paths in the existing assignment/plan.
Use only relevant templates; one reviewer may combine technical judgments into
one report. Light work references the approved design/plan.
Material deviations require a new release.

All paths retain exact input revisions, honest results, applicable human decisions
and the five-total-attempt ceiling. Committed references can identify fixed inputs;
uncommitted reviewed bytes need preserved content/hashes. An existing immutable
reference is sufficient when it identifies the complete reviewed input set.
No path grants Azure writes, paid jobs, external acquisition or deployment authority.

## Review Independence and Enforcement

Review requires **non-authorship of the reviewed artifact**. Business/domain owners
approve targets; the tester translates them into checks. Snapshot preparation is
evidence handling. Architect conformance is author-side evidence.

Use deterministic workload checks for hashes, schemas, builds, contracts, metrics
and other objective assertions. Agent judgment covers design trade-offs, threat
interpretation and evidence limitations. Reviewers should start a fresh host-supported
context containing the assigned criteria, fixed inputs and necessary source material.
Exclude the maker's conversation and asserted verdict. Record actual context/model/tool
limitations; shared models/instructions can still cause correlated blind spots.

Gates and counters are procedural. Executable enforcement is deferred to separately
authorised maintenance/pipeline work. The accountable human checks release evidence.

## Gate-Specific Acceptance

Each assignment names its workload gate and bounded check scope.

| Gate | Required evidence at this gate | Work that remains later |
|---|---|---|
| `design-released` | Scoped design/plan, feasibility and non-author/specialist review required by the accepted risk path, and genuine applicable human approval | Candidate implementation and execution of its tests |
| `locally-validated` | Applicable deterministic local validation, required non-author reviews, author-side conformance and matching documentation against a fixed revision | Authorised environment validation and observed behaviour |
| `deployment-ready` | Required environment validation, inspected change preview, operational prerequisites and applicable approvals | Separately authorised deployment and observed runtime behaviour |
| `operationally-verified` | Actual deployment record and required observed checks for the approved environment and scope | Anything outside the explicitly verified scope |

Every criterion specifies its earliest required gate and owner in the design
acceptance matrix. A required current-gate check that is `FAIL`, `BLOCKED` or
`NOT RUN` blocks that gate. Later-gate checks remain visible as `NOT RUN`, not passed
or `NOT APPLICABLE`, and do not block an earlier gate solely because they are later.
Earlier unresolved blockers continue to block later gates. Known current defects
cannot be reclassified as future checks without an approved design/scope amendment.

Example: a required post-deployment DNS resolution check is `NOT RUN` at
`locally-validated`, while the local DNS configuration assertion must pass there.
If that assertion fails, the candidate is not locally validated.
Neither a gate label nor a technical pass grants permission to deploy.
Every gate requires named report/evidence paths, not a generic assurance statement.
These are artifact/approval gates, not domain standards. The selected workload's
criteria instantiate them; this repository's [Azure catalogue](workload-checks.md)
holds those domain-specific requirements separately.

## Package States

| State | Owner / entry condition | Allowed next state |
|---|---|---|
| `draft` | Architect integrates requirements, early specialist input and design records | `in-review`, `blocked` |
| `in-review` | Fixed design revision supplied to required reviewers | `draft`, `awaiting-approval`, `blocked` |
| `awaiting-approval` | Required findings resolved, actual plan accepted; applicable human decisions due | `design-released`, `draft`, `blocked` |
| `design-released` | Architect releases the approved design snapshot; coordinator records decision/approval in ledger | `implementing`, `superseded` |
| `implementing` | Scoped infrastructure/application/ML writers accept released inputs | `validating`, `blocked`, `superseded` |
| `validating` | Fixed candidate; independent checks, architect conformance and matching docs | `implementing`, `locally-validated`, `blocked`, `superseded` |
| `locally-validated` | Required evidence for the local candidate gate accepted | `deployment-ready`, `blocked`, `superseded` |
| `deployment-ready` | Required environment validation and approvals recorded | `deployed`, `blocked`, `superseded` |
| `deployed` | Later authorised operation has an actual deployment record | `operationally-verified`, `blocked`, `superseded` |
| `operationally-verified` | Required observed checks for that environment and scope accepted | `blocked`, `superseded` |
| `blocked` | Missing decision, prerequisite, access or required evidence recorded | Previously active state after documented resolution |
| `superseded` | Replacement revision identified; no new work uses this revision | None |

Light work starts from its referenced released baseline and accepted assignment.
Task states in the backlog are `pending`, `in-progress`, `blocked`, `done`.
A completed review task can yield `FAIL`; the downstream gate remains blocked.

## Evidence Contract

Use the [assignment](../../delivery/templates/assignment.md), [design release](../../delivery/templates/design-release.md),
[architecture review](../../delivery/templates/architecture-review.md), [development plan](../../delivery/templates/development-plan.md), [handoff](../../delivery/templates/handoff.md)
and [review](../../delivery/templates/review.md) templates in a future
[work-package directory](../../delivery/releases/README.md).

- Identify `WP-<number>`, task ID, design revision, and artifact paths.
- The tester prepares committed/uncommitted snapshots under the
  [snapshot protocol](../../delivery/releases/README.md#snapshot-protocol). Recipients use its
  manifest and preserved inputs, not hashes invented by roles without hashing tools.
- Keep the design and candidate fixed during their respective reviews. Each reviewer
  records its own disposition, findings and evidence without changing implementation.
- Record each criterion as `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, or justified
  `NOT APPLICABLE`. Commands and results distinguish local checks, Azure validation,
  what-if, deployment and data-plane checks.
- Record findings by ID, severity where meaningful, affected revision, owner,
  remediation/decision, retest and non-sensitive approval reference.
- Every required acceptance criterion due at the target gate needs a pass or a
  human-approved scope amendment; later-gate checks remain explicitly pending.
  `NOT RUN`/`BLOCKED` cannot silently count as passed. A justified `NOT APPLICABLE`
  must explain why the released scope does not require that check.
- Human risk exceptions record owner, scope, rationale, expiry and compensating
  controls. An exception does not convert a failed technical check into a pass.
- Sender marks the handoff `offered`; recipient records `accepted` or `rejected`
  with the reason. Acceptance confirms usable inputs, not completion of the next task.

## Changes and Independence

A code/design change invalidates affected downstream reviews and tests. The
coordinator records impact, obtains reviewers' confirmation of unaffected evidence,
and schedules required reruns. If final documentation changes code, configuration,
contracts or security assertions, reopen relevant assurance before readiness.

Required blockers prevent release. No automated security or legal finding can
be waived by the coordinator. Human approval records must be genuine and scoped;
absence of objections is not approval.

## Deployment Boundary

The initial backlog targets `locally-validated`. Later authorised work targets
`deployment-ready` and `operationally-verified`.
A later deployment decision must establish environment, subscription, identity,
budget, approvals, validation/what-if evidence, rollback/recovery and operational
ownership. Pipeline implementation is deferred.
