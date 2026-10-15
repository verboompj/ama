# Repository Agent Instructions

## Start Here

This repository describes a fictional Hungarian CAP paying-agency solution. Read
[delivery/README.md](delivery/README.md) for the engineering agents, task order,
skills, and handover gates. These engineering agents are distinct from the five
runtime application agents and the business personas.

Use the repository skill at
[.github/skills/ama-context/SKILL.md](.github/skills/ama-context/SKILL.md)
before designing or changing the solution. Read the relevant source documents, not
every document indiscriminately.

Use [Workload Guidance](delivery/workload-guidance.md) for Azure artifact standards
and [Multi-Agent Framework and Orchestration](delivery/multi-agent-framework.md)
for development-team collaboration. Do not use one as a substitute for the other.

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
- Agent findings and coordinator readiness decisions do not replace human design,
  security-risk, legal, compliance, or production-change approval.
- Do not commit, push, or open a browser unless requested or required for an
  explicitly authorised operation.
- Leave unrelated files and user changes alone. Never place credentials, personal
  claimant data, or confidential case records in reports, prompts, or outputs.
- Documentation queries to public services must use public technical terms, not
  repository source text, identifiers, or private data.

## Evidence and Handoffs

Use the researched coordinator-specialist collaboration model in
[delivery/multi-agent-framework.md](delivery/multi-agent-framework.md), not a fixed
seven-role sequence. Follow [handoff contracts](delivery/handoffs.md) for evidence.
Workload standards apply to Azure outputs, not agent orchestration.
For Azure output validation, use [workload checks](delivery/workload-checks.md).
Those domain criteria do not define agent roles, routing or framework quality.
Design release requires independent review against the assigned criteria and an
accepted actual development plan, not self-assessment or the generic delivery backlog.
Use the [assignment contract](delivery/templates/assignment.md) before specialist
execution, with exact write ownership, gate/check scope, output shape and limits.
Every handoff identifies the work package, revision, inputs, outputs, checks,
attempt consumption, unresolved issues, and next owner.
Distinguish `PASS`, `FAIL`, `BLOCKED`, `NOT RUN`, and justified `NOT APPLICABLE`.
Missing tools, credentials, evidence, or approvals are not a successful check.
Required evidence due at the current gate blocks that gate when missing; later-gate
checks stay explicitly pending. Use the tester-produced
[snapshot protocol](delivery/releases/README.md#snapshot-protocol) rather than
requiring shell access for every role.

Agent instructions and tool lists are not an access-control sandbox. Use host
permissions and scoped Azure identities as the actual security boundary.
