---
name: ama-handoff
description: Produce or accept a revision-bound AMA work-package handoff with explicit evidence, blockers, review independence and human approval boundaries.
---

# AMA Handoff

1. Read `docs/delivery/handoffs.md` and the current work-package state. Do not infer
   approval or task completion from conversation tone or an agent's confidence.
   Specialists return results to the coordinator, which routes further authorised work.
2. Require an accepted `delivery/templates/assignment.md` contract before execution:
   exact inputs, permitted paths/owner, output format, target gate/check scope,
   applicable limits and stop conditions. The coordinator records attempt usage.
   Use `delivery/templates/handoff.md` to identify task/package, sender/recipient,
   exact input and output revisions, paths, acceptance criteria, checks, findings,
   remaining risks, and requested next action.
3. Use immutable committed references or the snapshot protocol in
   `delivery/releases/README.md`. For uncommitted inputs the tester or an authorised
   tool-capable operator preserves bytes/hashes. Missing required preservation is a
   blocker. Lifecycle/approval records stay outside frozen inputs.
4. Use `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, or justified `NOT APPLICABLE` for each
   check. Record its earliest required gate and authenticated scope where relevant;
   redact sensitive output. Later checks remain `NOT RUN`; they do not block an
   earlier gate solely because they are later. Current required failures still block.
5. The recipient accepts or rejects the inputs before work. Rejection names the
   missing prerequisite and returns to the owning role. Reviews refer to the same
   frozen candidate, not different moving snapshots.
6. Separate design review, implementation review, release readiness and deployment.
   A changed design/code artifact invalidates affected tests and reviews.
7. The coordinator consolidates evidence but cannot waive findings, supply another
   role's pass, or invent human approval. External approvals name the owner and
   record a non-sensitive approval reference and scope.
8. Stop at the requested gate. No automatic next-phase execution, agent swarm,
   pipeline, commit, push, deployment or risk acceptance follows from a handoff.
   On failed checks, use a bounded owner-fix/reviewer-retest loop; stop on non-progress
   or exhausted run limits.
9. Apply the [review-loop policy](../../../docs/delivery/multi-agent-framework.md#review-loop-limit):
   at most **5 total attempts**, including the initial attempt, or the lower assigned
   limit. Carry the stable loop ID and consumed/remaining attempts in every assignment
   and handoff. Fixes, new snapshots, sessions or reassignment do not reset the budget.
   Stop and escalate when exhausted; a handoff cannot authorise a sixth attempt.
