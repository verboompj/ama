# Assignment: <task-id> / <attempt-id>

Template only. The coordinator completes this before specialist execution.
Unresolved required fields block acceptance; this document does not authorise
cloud operations beyond the user's recorded scope.

| Field | Value |
|---|---|
| Package / task / attempt ID | TODO |
| Coordinator / assigned specialist | TODO |
| Authorised objective / user authorisation reference | TODO |
| Target workload gate / check scope | TODO |
| Risk path / trigger rationale / accountable acceptance reference | light, standard or regulated / TODO / TODO |
| Approved acceptance targets / business or domain owner | TODO; tester translates targets, not self-approves them |
| Required non-author reviewer / triggered specialists / evidence | TODO; proportional to accepted risk path |
| Exact input revision / snapshot ID / manifest reference, or snapshot-preparation source set | TODO |
| Required context and acceptance criterion IDs | TODO |
| Artifact owner and permitted write paths | TODO |
| Read-only inputs / forbidden operations | TODO |
| Expected output paths and format | TODO |
| Requested checks / expected evidence | TODO |
| Required human decisions or approvals | TODO |
| Stop condition / success condition | TODO |
| Review/test/validation loop ID / ledger reference | TODO; required for these loops |
| Maximum attempts or review cycles / attempts used | 5 / 0 for a new review/test/validation loop; lower limits allowed; copy existing usage on continuation |
| User-set time or cost limits, if any | Not specified; do not invent |
| Host-enforced limits / measurement availability | TODO; do not claim unavailable accounting |
| Snapshot producer / approved preservation location | infrastructure-tester / TODO |
| Known blockers and dependencies | TODO |

Use the [risk-based paths](../handoffs.md#risk-based-review-paths).
For light work, reference the existing released design/plan and record only relevant
fields; justify inapplicable fields. This contract is not technical gate enforcement.

## Artifact Ownership

| Exact artifact path | Writer for this assignment | Technical approver, if applicable | Ownership transfer reference |
|---|---|---|---|
| TODO | TODO | TODO | None |

No simultaneous writers. An existing owner's content is read-only unless an
explicit transfer is recorded. Technical meaning changes need the responsible
approver's acceptance and any affected review/approval reruns.

## Specialist Acceptance

`accepted` or `rejected`, exact inputs received, missing fields/tools/approvals,
and reason. Reject absent applicable limits or an unusable snapshot; do not start
with guessed inputs. A snapshot-preparation assignment instead supplies the base
commit, exact source paths, owners' stopped-writing acknowledgement and preservation
location; its output snapshot does not need to exist before it starts.
Return results using the separate handoff template.

The coordinator records attempt consumption before retrying. Stop at the recorded
limit or on repeated non-progress; a new assignment cannot silently reset the budget.
For review/test/validation work, the limit must be an integer from 1 to 5 and includes
the initial attempt, not five retries. Follow the
[review-loop policy](../multi-agent-framework.md#review-loop-limit).
Reject a missing loop ID/ledger, a limit above five or an exhausted counter. Other
assignment types still require their own explicit applicable limits.
