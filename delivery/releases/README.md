# Work-Package Records

No package is released yet. Create a directory when its task is authorised and select
records for the accepted risk path. The layout below illustrates regulated infrastructure.
Standard packages can combine scoped findings; light work references its approved baseline.

```text
delivery/releases/WP-001/
  context.md
  ledger.md
  security-requirements.md
  compliance-requirements.md
  test-plan.md
  documentation.md
  design.md
  architecture-review.md
  development-plan.md
  feasibility.md
  security-design.md
  compliance-design.md
  implementation.md
  test-review.md
  security-review.md
  compliance-review.md
  conformance.md
  readiness.md
  assignments/
    D02-attempt-01.md
  snapshots/
    S001/
      manifest.md
      files/
  handoffs/
    D01-to-D02.md
    ...
```

Use the [templates](../templates/). Name handoffs by actual sender/recipient task.
Revision control plus recorded
commit/hash references identifies the evidence snapshot; the directory name alone
does not make a release immutable.

Keep evidence non-sensitive. Link to protected approval/test records using safe
references rather than copying credentials, claimant data or production logs.
Generated build outputs stay outside committed evidence unless specifically needed.

The coordinator's `ledger.md` also tracks each
[review/test/validation loop](../../docs/delivery/multi-agent-framework.md#review-loop-limit):

| Stable loop ID | Objective / reviewer / check scope / target gate | Maximum total attempts | Attempts used / remaining | Attempt IDs / input snapshots / results | State / blocker / user decision |
|---|---|---|---|---|---|
| TODO | TODO | 5 or lower assigned limit | 0 / assigned limit for a new loop | None yet | Not started |

Reserve the next slot before execution. Keep the same loop and consumed budget
through fixes, new snapshots, sessions and reassignment; do not create a duplicate
loop to bypass exhaustion. Assignment/handoff/review records reference this ledger.

## Artifact Ownership

The coordinator records exact paths and any ownership transfer in each assignment.
These are the defaults; a directory prefix does not grant every role write access.

| Artifact | Default writer | Technical acceptance |
|---|---|---|
| `context.md`, `development-plan.md`, `ledger.md`, assignments, handoff records, `readiness.md` | delivery-coordinator | Contributors supply real acceptance/results; architect/implementer accept plan contracts |
| `design.md`, `conformance.md` | azure-architect | Human design approval and independent reviews as required |
| Published `docs/` content, diagrams, `documentation.md` | architecture-documenter | Architect accepts technical meaning; security/compliance accept affected assertions |
| Approved `infra/`, `feasibility.md`, `implementation.md` | bicep-engineer | Architect conformance and independent assurance |
| Assigned `src/`, application/API/event/tool contracts, `deploy/apps/` and adjacent author tests | application-ai-engineer | Architect accepts interfaces; tester owns independent acceptance; required specialist review |
| Assigned `ml/`, `contracts/data/`, `contracts/scoring/`, manifests/model cards/replay and adjacent author tests | ml-data-engineer | Application writer accepts scoring-consumer contract; independent evaluation and applicable human decisions |
| `architecture-review.md`, `tests/acceptance/`, `tests/evaluation/`, infrastructure tests, `test-plan.md`, `test-review.md`, `snapshots/` | infrastructure-tester | Approved targets and independent workload findings; author-side conformance remains separately identified |
| `security-requirements.md`, `security-design.md`, `security-review.md` | security-reviewer | Designated human risk owner handles acceptance of residual risk |
| `compliance-requirements.md`, `compliance-design.md`, `compliance-review.md` | compliance-reviewer | Designated legal/policy owners handle required human decisions |

The documenter edits published architecture explanations; the architect owns the
underlying decisions in `design.md`. A proposed change to technical meaning returns
to the architect before publication and reopens affected review/approval. The architect
does not concurrently edit the documenter's file. An explicit temporary ownership
transfer names the path, new writer, scope and return point.

The coordinator's `ledger.md` records target gate, package state, artifact owners,
accepted assignments, attempt limits/usage, snapshot references, human approvals,
review dispositions and remaining later-gate checks. Frozen design/candidate files
are not edited just to append approval or lifecycle metadata.

Directory names above are proposed defaults; the released plan fixes actual paths.
App/ML authors publish shared interfaces before consumers implement against them.
Each contract has one writer and explicit consumer acceptance. Protected/raw datasets
stay in approved storage; repository manifests contain safe version/hash references.

## Future Release Ownership

The Bicep engineer authors release automation under a separately authorised pipeline
assignment. App and ML writers supply packaging, jobs and scoring contracts. The
coordinator records the actual authorised deployment operator and human service owner,
including monitoring, incidents, recovery, rollback and model-drift responsibilities.
Pipeline implementation and deployment are deferred.

## Snapshot Protocol

**Producer:** `infrastructure-tester`, assigned by the coordinator. Its existing
local execution capability covers read-only hashing and copying approved non-sensitive
inputs. Other roles supply artifact paths and consume the result; they do not need
shell access. An explicitly authorised tool-capable host operator can substitute;
record that producer and method. No available producer means `BLOCKED`.

1. Coordinator specifies the gate, snapshot ID, complete reviewed input set,
   referenced dependencies, base commit and approved preservation location.
   Exclude secrets, unrelated work and sensitive data; do not silently omit a required
   dependency. Use a protected evidence location if approved inputs cannot be stored here.
   This snapshot-preparation assignment names source paths and stopped-writing
   acknowledgements instead of requiring its own output snapshot as an input.
2. Producer verifies the inputs exist and their owners have stopped writing them.
   For committed inputs, record the full commit and paths. For uncommitted inputs,
   preserve exact bytes under `snapshots/<id>/files/` or the approved evidence location,
   with a base commit and SHA-256 hashes for the complete scoped input set.
3. `manifest.md` records producer, method/tool version, snapshot ID, base commit,
   exact paths, preserved locations and hashes. Record scoped deletions explicitly
   with no content hash. Reject unsupported file types unless preservation semantics
   have been defined; verify copied bytes match the recorded hashes.
4. Keep the manifest, assignment, lifecycle ledger, handoffs and review outputs
   outside their own input hash set. They refer to the snapshot; they do not require
   self-referential hashes. If an earlier review record is a required input to a
   later assignment, include its frozen version in that later snapshot.
5. Recipients verify the manifest reference, expected coverage and fixed input
   locations. Request producer integrity verification when needed; never review an
   unrelated moving worktree and call it the same snapshot.
6. Changes create a new snapshot ID and invalidate affected evidence. Do not overwrite
   old snapshot bytes or add approval text to frozen `design.md`. Record human
   approval of the exact design snapshot in `ledger.md`, then mark the package
   `design-released` there.

Preserved files and hashes support local evidence integrity. Protected approvals
and tamper-resistant storage require separately authorised controls.
