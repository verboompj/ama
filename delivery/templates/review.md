# Review: WP-<number> / <design-or-candidate> / <role>

Template only. Copy into the authorised work package.

| Field | Value |
|---|---|
| Reviewer / task / review scope | TODO |
| Accepted assignment / attempt ID | TODO |
| Target workload gate / check scope | TODO |
| Instantiated check/criterion IDs and plan revision | TODO |
| Design revision and exact reviewed candidate | TODO |
| Input snapshot ID / producer / manifest reference | TODO |
| Review output paths / artifact owner | TODO |
| Stable review/test/validation loop ID / ledger reference | TODO |
| Attempt number / maximum total attempts | TODO / 5 or lower assigned limit |
| Attempts consumed / remaining / limits reached | TODO |
| Overall disposition | BLOCKED |
| Independence / limitations | TODO |

## Criteria and Evidence

| Criterion / obligation / control | Gate due / current or later | Expected result | Method / exact command / source | Actual evidence | Result |
|---|---|---|---|---|---|
| TODO | TODO | TODO | TODO | None yet | NOT RUN |

Record tool versions and source access dates. Distinguish local checks, Azure
validation, what-if, deployment evidence and actual data-plane checks. Legal reviews
also record applicability, effective dates, interpretation and responsible human owner.

## Findings

| ID | Severity or evidence-gap classification | File/lines or design requirement | Impact / preconditions | Confidence | Owner / resolution / retest |
|---|---|---|---|---|---|
| TODO | TODO | TODO | TODO | TODO | TODO |

Security severity: CRITICAL, HIGH, MEDIUM, LOW. Evidence gaps are not automatically
vulnerabilities. A finding's resolution must identify the corrected revision and
independent verification, or the genuine human exception reference.

## Disposition

`PASS`, `FAIL` or `BLOCKED` for this reviewed scope only. List `NOT RUN` and justified
`NOT APPLICABLE` checks separately. Required missing/failed evidence due at the
current gate prevents a pass. Later-gate checks remain `NOT RUN` with their gate and
owner; they do not block an earlier gate solely because execution is scheduled later.
Do not move a discovered current-gate defect to a later gate to obtain a pass.
Record human approval requirements, unresolved legal questions, risk-owner decisions,
and downstream artifacts invalidated by changes. No certification or deployment approval.
