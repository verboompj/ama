# Repository Agent Instructions

## Start Here

This repository describes a fictional Hungarian CAP paying-agency solution. Read
[delivery/README.md](delivery/README.md) for operating contracts, plans and evidence.
Use the [team guide](docs/delivery/README.md) for roles, skills and usage.

Use the repository skill at
[.github/skills/ama-context/SKILL.md](.github/skills/ama-context/SKILL.md)
before designing or changing the solution. Read the relevant source documents, not
every document indiscriminately.

Use [Workload Guidance](delivery/workload-guidance.md) for Azure artifact standards
and [Multi-Agent Framework and Orchestration](delivery/multi-agent-framework.md)
for development-team collaboration.

The nine delivery roles produce and assess Azure infrastructure, applications,
runtime AI and data/model artifacts. Engineering-setup maintenance requires a
separate user-authorised task.

## Boundaries

- Preserve the original case brief, source scan, and assessment rubric. Participant
  documents and legal summaries are not legislation or verified agency facts.
- Keep the maintained architecture as the baseline. Resolve conflicts explicitly;
  do not silently substitute a new platform or broaden scope.
- Use Bicep and pinned published Azure Verified Modules for future infrastructure.
  Bicep owns resource dependencies; a future pipeline invokes deployment roots.
- No infrastructure generation without a released design for that work package.
  No Azure mutation, deployment, tenant changes, paid resource creation, destructive
  test, or GitHub Actions workflow without explicit user authorisation.
- Data acquisition, remote model calls, training jobs and model promotion require
  scoped authorisation for inputs, environment, identity, cost and intended use.
- Agent findings and coordinator readiness decisions do not replace human design,
  security-risk, legal, compliance, or production-change approval.
- Do not commit, push, or open a browser unless requested or required for an
  explicitly authorised operation.
- Leave unrelated files and user changes alone. Never place credentials, personal
  claimant data, or confidential case records in reports, prompts, or outputs.
- Documentation queries to public services must use public technical terms, not
  repository source text, identifiers, or private data.

## Model Routing

Apply the single detailed [model-routing policy](docs/delivery/agents-and-skills.md#model-routing-policy).
Classify each assignment **before invocation**; prefer deterministic tools for tiny
tasks. The lower tier uses only `gpt-6-luna` for clerical documentation, formatting
and known-state bookkeeping/extraction from fixed inputs, without new technical judgment.
The documenter's low default requires escalation to `gpt-6.1-sol` **before**
technical, architecture, security, legal or evidence interpretation, regulated or
approval documentation, or ambiguous consequential decisions. Arrange a new approved
invocation; a running agent cannot switch itself.

Higher-tier specialist defaults use `gpt-6.1-sol` for multistep technical reasoning
and `claude-sonnet-5.5` for efficient security/compliance evidence and obligation
review with provider diversity. These are initial task-fit choices, not proof of
universal superiority, legal expertise or independent acceptance. The coordinator
stays high by default: release, readiness and dependency judgments are consequential.
Only a separate explicit clerical assignment may use `gpt-6-luna`, with no gate or
approval decisions. Never downgrade Azure, IaC, security, compliance, ML methodology
or acceptance judgments for cost.

If the effective model is unavailable or an override conflicts with the required
tier, stop and report; no silent fallback, downgrade or automatic model shopping.
Record the chosen model, actual model if known, routing/escalations and visibility
limitations in assignments/handoffs; do not infer runtime model or account availability
from configuration. Model choice changes neither permissions nor independence,
fixed-revision evidence, required reviews, the five-attempt ceiling or human approvals.

## Evidence and Handoffs

Use [coordinator-specialist collaboration](delivery/multi-agent-framework.md)
and the accepted [risk-based review path](delivery/handoffs.md#risk-based-review-paths).
Use [workload checks](delivery/workload-checks.md) and
[application/AI/ML checks](delivery/ai-ml-checks.md) for the assigned outputs.
Business/domain owners approve acceptance targets. Required non-author reviews,
scoped design/plan and applicable human approvals precede release. Light changes
within an approved release can reference its existing design and plan.
Use the [assignment contract](delivery/templates/assignment.md) before specialist
execution, with exact write ownership, gate/check scope, output shape and limits.
Every handoff identifies the work package, revision, inputs, outputs, checks,
attempt consumption, unresolved issues, and next owner.
Every review, test or validation loop has a maximum of **5 total attempts**,
including the initial attempt; a lower assigned limit takes precedence. This covers
tester, security, compliance, design-quality and conformance checks. Follow the
[review-loop policy](delivery/multi-agent-framework.md#review-loop-limit): preserve
the counter across fixes, snapshots and handoffs; stop and escalate on exhaustion.
Distinguish `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, and justified `NOT APPLICABLE`.
Missing tools, credentials, evidence, or approvals are not a successful check.
Required evidence due at the current gate blocks that gate when missing; later-gate
checks stay explicitly pending. Use immutable committed references or the
[snapshot protocol](delivery/releases/README.md#snapshot-protocol) for reviewed inputs.

Host permissions, tool approvals and scoped Azure identities enforce access.
Review context and procedural-enforcement limitations are recorded with the evidence.
