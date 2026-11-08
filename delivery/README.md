# Workload Delivery

This directory holds the operating contracts, plans and evidence for workload
delivery. The [team guide](../docs/delivery/README.md) explains roles, skills and usage.

| Location | Purpose |
|---|---|
| [Collaboration model](multi-agent-framework.md) | Coordinator routing, ownership, review loops and operating limits |
| [Handoffs and gates](handoffs.md) | Risk paths, assignments, state transitions and release evidence |
| [Workload standards](workload-guidance.md) | Azure artifact requirements and solution guardrails |
| [Azure checks](workload-checks.md) and [AI/ML checks](ai-ml-checks.md) | Required checks, owners, gates and expected evidence |
| [First implementation slice](first-implementation-slice.md) | Public-data crop-evidence scope, decisions and acceptance |
| [Tasks](tasks.md) | Authorised-work prerequisites and initial workload backlog |
| [Templates](templates/) | Assignments, design/review/plan contracts and handoff records |
| [Work-package records](releases/README.md) | Artifact ownership, snapshots, evidence and loop ledgers |
| [WP-001 foundation](releases/WP-001/context.md) | Released local-authoring design; [ledger](releases/WP-001/ledger.md) tracks the blocked candidate and remaining decisions |
| [Foundation IaC](../infra/README.md) | Ten compiling Bicep files, synthetic parameter checks and unresolved author-contract failure |

WP-001 has actual [architect release](releases/WP-001/design-release.md) and
user approval for local templates, not Azure execution. Its
[implementation report](releases/WP-001/implementation.md) records successful
compilation but failed effective ARM contract checks and an exhausted 5/5 author
loop. Independent local acceptance and deployment remain pending. Delivery is
staged: infrastructure, then Azure ML, then application/runtime.

Explanatory team guides live under [`docs/delivery/`](../docs/delivery/).
Native agent, skill and prompt definitions live under `.github/` for client discovery.

Start the explicitly authorised workload task using its accepted risk path.
Engineering-setup maintenance has its own user-authorised scope.
