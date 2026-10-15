# Handoff: <sender-task> to <recipient-task>

Template only. Copy into the authorised work package.

| Field | Value |
|---|---|
| Accepted assignment / attempt ID | TODO |
| Package / design revision | TODO |
| Sender / recipient role and task | TODO |
| Handoff state | offered |
| Target workload gate / check scope | TODO |
| Authorised objective / next action | TODO |
| Input snapshot ID / producer / manifest reference | TODO |
| Output revision / snapshot ID / manifest reference | TODO |
| Actual written paths / any ownership transfer | TODO |
| Expected output format / actual output | TODO |
| Review/test/validation loop ID / ledger reference, if applicable | TODO |
| Maximum total attempts for that loop | 5 or lower assigned limit |
| Attempts or cycles consumed / remaining | TODO |
| Stop condition reached / limits or measurement gaps | TODO |
| Acceptance criteria / review records | TODO |
| Human approval reference, where required | Not supplied |

## Delivered Artifacts and Checks

| Artifact / criterion | Exact revision | Gate due / current or later | Check and command if applicable | Result | Evidence |
|---|---|---|---|---|---|
| TODO | TODO | TODO | TODO | NOT RUN | TODO |

Results: `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, justified `NOT APPLICABLE`.
Include tool versions and non-sensitive Azure scope for authenticated checks.
Future-gate checks remain `NOT RUN` and listed as later work, not `NOT APPLICABLE`.
Only required checks due at the current gate determine its technical disposition.

## Open Items

Finding ID, impact, owner, blocking condition, decision needed, remaining risk,
and any changed artifacts invalidating earlier evidence.

## Recipient Acceptance

`accepted` or `rejected`; reviewer/task, exact received revision, reason, missing
inputs, and next authorised action. Acceptance confirms inputs, not implementation
completion or deployment permission.
The recipient consumes the producer-supplied snapshot; it need not calculate hashes
using tools outside its role. A changed or incomplete snapshot is rejected.
