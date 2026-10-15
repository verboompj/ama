# Agent Framework Checks

## Scope and Owner

The existing `infrastructure-tester` owns framework checks as well as workload
testing. This adds no agent or orchestration engine. The coordinator assigns the
specific checks, fixed profile/skill/template revision, permitted fixture paths
and attempt limits using the [assignment template](templates/assignment.md).

Structural checks inspect files locally. Behavioural checks need an explicitly
authorised client session and disposable, non-sensitive fixture artifacts. They
must not invoke Azure, deploy, commit, change real approval records or launch an
unbounded set of agents. Configuration inspection alone cannot pass a live behaviour
check. Record unsupported capabilities as `BLOCKED`, unexecuted checks as `NOT RUN`.

## Acceptance Cases

| ID | Type | Scenario | Expected evidence |
|---|---|---|---|
| FC01 | Structural | Parse all seven profiles, five skills and nine phase prompts; check names, tool lists, model inheritance, links and assignment fields | Valid native configuration and prompt-agent names; only coordinator delegates; no missing required fields |
| FC02 | Client | Discover profiles/skills in the executing client and inspect exposed tools | Actual names/tool availability recorded; profile text alone does not prove discovery or filtering |
| FC03 | Client | Discover the configured Learn tools and make a public, non-sensitive documentation request | Real discovery/response or explicit blocker; no fabricated connectivity claim |
| FC04 | Behaviour | Supply a complete bounded assignment, then one missing its input snapshot, write scope or attempt limit | Complete assignment accepted; incomplete assignment rejected before specialist work |
| FC05 | Behaviour | Assign different writers the same fixture path without an ownership transfer | Coordinator prevents simultaneous writes; valid serial transfer identifies the new writer and return point |
| FC06 | Local fixture | Freeze a small non-sensitive input set, verify preserved bytes/hashes, then change an original input | Old snapshot remains reproducible; new work requires a new ID and affected reviews are invalidated |
| FC07 | Behaviour | Current local check passes but required operational check is unexecuted; then fail the current local check | Future check remains `NOT RUN` without blocking local readiness; current failure blocks it |
| FC08 | Behaviour | Fail attempts 1-5, change snapshot/session/assignment mid-loop, then request attempt 6; repeat with a lower limit and with a pass on attempt 5; offer a limit above 5 | Stable ledger counter persists; sixth attempt/limit above 5 rejected; lower limit honoured; attempt-5 pass accepted without another call; exhaustion preserves findings and escalates without reset |
| FC09 | Behaviour | Offer release with absent, stale or wrong-snapshot human approval | Gate remains blocked; exact-snapshot human approval is required |
| FC10 | Behaviour | Route a documentation-only request and a design-changing implementation defect | Small request does not invoke the whole team; design defect returns to architect and affected approvals reopen |
| FC11 | Structural/behaviour | Supply a disposable assignment requiring independent review, a plan and explicit environment confirmation; attempt to bypass each prerequisite through a phase prompt | Missing assigned prerequisites block that action; record prompt/client behaviour without invoking the real environment |

Framework acceptance tests assignment handling and gate behaviour, not the quality
of an Azure design. Domain check content is specified separately by the workload.

Use [review.md](templates/review.md), naming framework-check IDs as the check scope,
not claiming a workload gate. Record client/version, input revision, actual commands
or interactions, expected/actual results, fixture locations, findings and limits.
Coordinator tracks unresolved framework blockers before relying on the affected capability.

These cases are defined, not asserted to have passed. New profile changes require
relevant structural checks; changed routing/approval/stopping behaviour requires
affected client/behaviour checks. Runtime gate enforcement remains future work.
