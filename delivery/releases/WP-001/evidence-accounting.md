# WP-001 evidence accounting — maintenance disposition r1

## Authority, inputs and disposition

**Completed: 21 October 2026. Accepted assignment:** `assignments/MAINT-evidence-accounting.md`,
separately user-authorised **ENGINEERING MAINTENANCE**, not a delivery role testing
its own setup. Executor: current general-purpose CLI agent; runtime model is not
independently attested. Sole output: this report. Examination
`MAINT-WP001-EVIDENCE-ACCOUNTING` **1/1 consumed; stopped**.

All historical citations below are paths and one-based lines at
**`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`**, read using `git show`.
The uncommitted maintenance assignment supplies current authority, not historical
evidence; it is absent from that commit. The moving worktree ledger and another
executor's scope definition were not used to determine this outcome.

**Disposition: no evidence-backed numerical correction is justified.** All five
executions successfully preserved distinct input sets. They were not five failed
preservations or retries of a broken copy operation. Nevertheless, the accepted
assignments explicitly charged them to one design-stage preservation/check loop,
and the final assignment expressly stopped that loop at **5/5**. Keeping that stop
is supported by the recorded contract. Whether successful evidence preparation
should originally have been aggregated this broadly is a policy-classification
ambiguity, not a demonstrated counting error. No counters, history, policy or
workload verdicts are changed here.

## Execution trace

In this table, `P` means `delivery/releases/WP-001/`. Each `PASS` describes
preservation integrity only, not the downstream artifact's technical adequacy.

| Execution / recorded charge | Objective and exact input-set change | Evidence and result |
|---|---|---|
| S001 / 1 of 5 | Initial draft inputs for bounded AVM feasibility and documentation: context, design r1, cost r1, security requirements and compliance requirements; five copied inputs, sixteen committed dependencies | `P/assignments/F03-preserve-draft.md:6-15`; `P/snapshots/S001/manifest.md:3-20,22-43`; `P/handoffs/F03-design-to-feasibility.md:6-12`. **PASS**, initial preservation |
| S002 / 2 of 5 | Architect correction inputs for F04-r1. Original five unchanged; added feasibility and documentation reports; seven copied inputs, eighteen references, including two operational-routing references distinct from the workload baseline | `P/assignments/F03-preserve-integration.md:6-14`; `P/snapshots/S002/manifest.md:4-13,19-25,47-48`. **PASS**, expanded input set, not a failed S001 preservation retry |
| S003 / 3 of 5 | Common inputs for first independent EP-r1 method reviews. Original seven unchanged; added amendment EP-r1 and its author assignment; nine copied inputs, eighteen references | `P/assignments/F03-preserve-amendment.md:6-12`; `P/snapshots/S003/manifest.md:4-14,20-28`. **PASS**, new proposal inputs |
| S004 / 4 of 5 | Feedback inputs for EP-r2 author correction. Original nine unchanged; added two EP-r1 review reports and their two review assignments; thirteen copied inputs, eighteen references | `P/assignments/F03-preserve-amendment-feedback.md:5-15`; `P/snapshots/S004/manifest.md:4-12,18-30`. **PASS** preservation of reports whose independent method verdicts were **FAIL**; those failures are not preservation failures |
| S005 / 5 of 5 | Common EP-r2 retest inputs. Replaced EP-r1 with EP-r2; added revision-author assignment and S004 manifest; removed the two first-review assignment paths from this set, retaining their immutable provenance in S004. Other ten retained paths unchanged; thirteen copied inputs, eighteen references; prior thirteen S004 copies also checked by the producer | `P/assignments/F03-preserve-ep-r2.md:6-18`; `P/snapshots/S005/manifest.md:4-14,20-32`. **PASS**, changed proposal/retest inputs; explicit final preservation attempt |

The main design/cost bytes did not change across S001–S005. The actual correction
and reviewer recheck concerned the evidence-method proposal: EP-r1
`7ea29284900e82aed8e747a6d1073db2a0b67c17ff6036430a4ff038722c923c`
became EP-r2
`5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b`
(`P/snapshots/S004/manifest.md:25`; `P/snapshots/S005/manifest.md:27`).
Both independent retests subsequently passed only the narrower finite test-only
method, not owner adoption or the full design
(`P/handoffs/F03-ep-r2-review-to-owner.md:6-15,17-29`).

## Reconciliation with literal policy

1. **Count executions, not failures alone.** The policy says a started attempt
   consumes its slot and one attempt executes its assigned check scope once
   (`delivery/multi-agent-framework.md:276-284`). Each assignment above reserved
   the next slot under the same ID. S001 explicitly set a maximum of five
   **“design-stage preservation/check attempts across snapshots and fixes”**
   (`P/assignments/F03-preserve-draft.md:15`). Therefore the recorded five
   executions and zero remaining are arithmetically and contractually supported.
2. **Successful preservation is not failed workload review.** Policy describes
   an initial attempt plus rechecks, separate budgets for distinct stages/scopes,
   and **“Stop on a valid pass”**
   (`delivery/multi-agent-framework.md:268-288`). S001 passed its assigned
   preservation objective; later sets added new deliverables and dependencies.
   This raises a genuine mismatch between a success-terminating logical check
   and the broad package-wide preservation bucket. However, changed inputs alone
   do not create new budgets: usage explicitly survives changed snapshots
   (`delivery/multi-agent-framework.md:282-284`;
   `delivery/releases/README.md:58-60`). No record establishes that the accepted
   bucket was a clerical error or authorises retrospective separation.
3. **Attempt-five PASS succeeded at its actual scope.** Policy states
   **“A pass on attempt 5 succeeds”**
   (`delivery/multi-agent-framework.md:285-289`). S005 therefore remains usable
   historical evidence; exhaustion does not turn it into a failure. It did not
   preserve a future corrected complete design. Its assignment explicitly says
   **“further preservation under this loop must stop and be escalated”**
   (`P/assignments/F03-preserve-ep-r2.md:11,16-18`). The ledger and owner handoff
   correctly retain that limit (`P/ledger.md:83`;
   `P/handoffs/F03-ep-r2-review-to-owner.md:59-65`).
4. **Committed references are an evidence form, not additional budget.**
   `delivery/releases/README.md:117-120` permits full commit/path references for
   committed inputs instead of byte-copy preservation; `AGENTS.md:84-93` also
   recognises this alternative. But neither provision rescinds this explicitly
   recorded stop. Publishing a new commit cannot automatically authorise a new
   same-scope integrity/preservation execution or erase the five charges.

## Counter treatment and narrow next steps

**Retain unchanged:** `WP001-DESIGN-SNAPSHOT` **5/5, zero remaining**, all five
preservation PASS results and their immutable records; `WP001-F03-AUTHOR`
**4/5**; `WP001-F04-AVM` **2/5**; `WP001-EP-TECH` and `WP001-EP-SEC` **2/5**
each. Preserve attempt-one method FAIL results and attempt-two narrow method
PASS results (`P/ledger.md:80,83,85,87-88`). The F04 findings and human approval
gaps remain real (`P/handoffs/F03-ep-r2-review-to-owner.md:67-71`).
No conversion to “one attempt used,” refunded slots, replacement loop or sixth
preservation is recommended.

**Planning that can proceed independently now:** the separately user-authorised
coordinator may write a working scope/definition from existing fixed records,
identifying proposed boundaries, unresolved decisions and the gated future
evidence path. Such drafting is not a fresh complete-design review, integrity
certification, design/cost author cycle, acceptance of EP-r2 risk or an
implementation release. It must not claim that this examination supplies any of
those outcomes. The present assignment does not execute or dispatch that work.
This distinction avoids making all clarification/planning wait for workload
release evidence while preserving the exact-design stop.

**Still gated:** further preservation/check execution in the exhausted scope;
any review needing newly fixed changed inputs; complete design/plan/cost
acceptance; owner method/risk adoption and its retained plan items; infrastructure
implementation and Azure execution. Already-fixed S005 remains eligible for
appropriately assigned review within the reviewers' existing budgets, not an
automatic extra review after a valid PASS
(`P/assignments/F03-preserve-ep-r2.md:16-18`).

**Next owner: parent coordinator/requesting user.** They can record this
disposition and the independently drafted definition without dispatching a new
preservation. If continued changed-input evidence preparation is wanted, the
unresolved decision is whether to retain the present stop or separately authorise
bounded engineering maintenance to clarify preservation-versus-review accounting
and explicitly adjudicate its application to this existing exhausted record.
That would be a substantive rule/interpretation decision, not an arithmetic
correction established here. Any proposal must preserve all five executions,
the five-attempt ceiling for logical checks, stop-on-PASS, unchanged workload
budgets and approval gates; it cannot rename/reset this scope or authorise a
sixth attempt. An explicit user decision is necessary but does not by itself
override higher-level constraints. No such policy change is authorised here.

If that separately approved path becomes available, committed full-revision/path
inputs are the narrow evidence-format option already recognised by the protocol;
uncommitted changed inputs still require approved byte preservation. The
accounting/stop must be resolved explicitly **before** either is used to restart
the stopped activity. A new commit is neither budget approval nor design approval.

## Checks, limitations and stop

- **PASS — retrospective record/hash audit:** local Python 3, `hashlib.sha256`
  and `git show` verified all **47 archived copied-blob entries** and **88
  historical committed-dependency entries** against S001–S005 manifests. Counts
  include repeated references, not 135 unique files. Input-set deltas match the
  trace table. No current source set was frozen, copied or certified.
- **PASS — documentary trace:** all five preservation assignments/manifests and
  relevant design, feasibility, correction and owner handoffs were examined at
  the fixed revision against the literal policy and protocol.
- **Tool limitation:** `python` was unavailable (exit 127); `python3` completed
  the archive audit. This command-availability failure produced no preservation
  or workload result. There was one bounded maintenance examination, not a
  second examination or a workload retry.
- **NOT RUN:** workload design/security/compliance acceptance, new evidence
  preservation, Azure/public research, infrastructure generation, browser,
  publication/commit/push and downstream dispatch. Historical producer claims
  about snapshot-time source equality are not independently reconstructed from
  today's worktree. Hashes establish archived integrity, not approval or
  tamper-resistant storage.

The examination is fully done; unblocking changed-input workload evidence is not.
There is no missing examination prerequisite. The remaining blocker is the
explicit exhausted-loop stop and unresolved accounting-policy decision, alongside
the existing workload findings/approvals. This report is not a workload
security/design PASS, a risk waiver or a sixth preservation.
**MAINT1/1 consumed. Sole artifact complete; stopped writing.**
