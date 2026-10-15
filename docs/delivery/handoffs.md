# Handoffs and Gates

This document supplies the work-package states and evidence contracts used by the
[Multi-Agent Framework and Orchestration](multi-agent-framework.md). That document
owns collaboration patterns, routing, feedback and research rationale.
[Workload Guidance](workload-guidance.md) owns Azure output standards.

Handoffs accept artifact contracts; they do not transfer control autonomously between
specialists or authorise the next phase. The coordinator routes authorised work.

## Assignment Before Execution

The coordinator prepares an [assignment](../../delivery/templates/assignment.md) before invoking
a specialist. It records input snapshot, target gate/check scope, permitted writes,
artifact owner, output format, stop conditions, attempt limits, any user-set budget
and required approvals. The specialist accepts or rejects those inputs before work.
The separate [handoff](../../delivery/templates/handoff.md) records actual outputs and consumption.
Missing required assignment fields are blockers, not permission to guess defaults.

## Gate-Specific Acceptance

These gates apply to Azure workload packages. A workload-documentation-only
assignment names its bounded check scope without implying the entire workload gate.
Engineering-framework maintenance and self-testing are outside this team's scope.

| Gate | Required evidence at this gate | Work that remains later |
|---|---|---|
| `design-released` | Complete design, independent quality/specialist reviews, feasibility evidence, accepted implementation plan and genuine human approval | Candidate implementation and execution of its tests |
| `locally-validated` | Required local validation, independent candidate reviews, conformance and matching documentation against a fixed revision | Authorised environment validation and observed behaviour |
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
| `in-review` | Fixed design revision supplied to all design reviewers | `draft`, `awaiting-approval`, `blocked` |
| `awaiting-approval` | Independent architecture/specialist findings resolved, actual plan accepted; explicit human decision needed | `design-released`, `draft`, `blocked` |
| `design-released` | Architect releases the approved design snapshot; coordinator records decision/approval in ledger | `implementing`, `superseded` |
| `implementing` | Bicep engineer accepts released inputs | `validating`, `blocked`, `superseded` |
| `validating` | Fixed candidate; independent checks, architect conformance and matching docs | `implementing`, `locally-validated`, `blocked`, `superseded` |
| `locally-validated` | Required evidence for the local candidate gate accepted | `deployment-ready`, `blocked`, `superseded` |
| `deployment-ready` | Required environment validation and approvals recorded | `deployed`, `blocked`, `superseded` |
| `deployed` | Later authorised operation has an actual deployment record | `operationally-verified`, `blocked`, `superseded` |
| `operationally-verified` | Required observed checks for that environment and scope accepted | `blocked`, `superseded` |
| `blocked` | Missing decision, prerequisite, access or required evidence recorded | Previously active state after documented resolution |
| `superseded` | Replacement revision identified; no new work uses this revision | None |

These are record states, not a running state machine. Task states in the backlog
are separate: `pending`, `in-progress`, `blocked`, `done`. Completing a review task
can yield `FAIL`; the downstream gate still remains blocked.

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

The initial backlog stops at `locally-validated`, not deployed or legally certified.
`deployment-ready` and `operationally-verified` are defined for later authorised work,
not implemented or achieved by defining these contracts.
A later deployment decision must establish environment, subscription, identity,
budget, approvals, validation/what-if evidence, rollback/recovery and operational
ownership. GitHub Actions orchestration is deliberately not defined here.
