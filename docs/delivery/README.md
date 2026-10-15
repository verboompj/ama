# Azure Delivery Team

Seven repository-native engineering agents take bounded work from architecture
through implementation and independent assurance. This is the development team,
not the CAP application's runtime agents or additional business personas.

The team's deliverable is the **Azure workload**: its design, Bicep, validation,
security/compliance evidence and deployment guidance. Developing or testing the
engineering-agent setup is separate repository maintenance, not a task for these roles.

**Current scope:** agent definitions, reusable skills, task catalogue, and handover
contracts. No Bicep, pipeline, Azure resources, approved architecture release, or
automatic orchestration has been created by this framework.

## Structure

```text
AGENTS.md                     Shared repository instructions
.github/agents/               Seven discoverable Copilot agent profiles
.github/skills/               Five repository-local skills
.github/prompts/              Nine reusable phase entry points
docs/delivery/
  README.md                   Entry point and usage
  workload-guidance.md        Azure design, implementation and verification standards
  workload-checks.md          WV01-WV22: explicit checks, reports and gate requirements
  multi-agent-framework.md    Agent roles, orchestration patterns and control boundaries
  agents-and-skills.md        Responsibilities, permissions, skill catalogue
  context-and-tools.md        Source map, official guidance, Learn access
  handoffs.md                 State transitions and approval gates
delivery/
  README.md                   Operational artifact index
  tasks.md                    Initial backlog; not an execution instruction
  releases/README.md          Future work-package artifact layout
  templates/                  Design release, handoff, review templates
```

Future `infra/` implementation starts only after a bounded architect release.
GitHub Actions design and deployment remain later, separately authorised work.

## Team

| Agent | Accountable output |
|---|---|
| `azure-architect` | Workload architecture and approved implementation release |
| `bicep-engineer` | Released scope implemented with Bicep and pinned AVMs |
| `architecture-documenter` | Traceable architecture/deployment docs and editable visuals |
| `infrastructure-tester` | Independent Azure design review, workload snapshots, infrastructure checks and evidence |
| `security-reviewer` | Threat/control review and revision-bound security findings |
| `compliance-reviewer` | Applicability, obligation/control/evidence matrix and gaps |
| `delivery-coordinator` | Dependency order, accepted handoffs and consolidated readiness |

See [agents and skills](agents-and-skills.md) for ownership and tool boundaries.

## Guidance Documents

- [Workload Guidance](workload-guidance.md): what the Azure solution must satisfy,
  including WAF, AVM/Bicep, security/data boundaries and evidence requirements.
- [Multi-Agent Framework and Orchestration](multi-agent-framework.md): how the
  development agents collaborate, why those patterns were selected, shared state,
  feedback loops, permissions and current implementation limits.

These are separate concerns. Workload standards do not prescribe agent routing.
The [visual input-to-release flow](multi-agent-framework.md#input-to-candidate-release)
shows security/compliance checks before both design release and local candidate release.
Use [assignments](../../delivery/templates/assignment.md) before work and
[handoffs](../../delivery/templates/handoff.md) for actual results.
The [validation catalogue](workload-checks.md) makes each gate concrete. Before
implementation it requires an independent `architecture-review.md` and an accepted
workload-specific `development-plan.md`, not just the generic delivery backlog.

## Use

In Copilot CLI, open `/agent` and select `delivery-coordinator` (or a specialist).
Start with a bounded request, for example:

> Prepare task D01 from delivery/tasks.md. Inventory the baseline and unresolved
> prerequisites only; do not start design, generate Bicep, or contact Azure.

Profiles and skills are discovered by the supporting client; reopen/reload the
session if newly added files are not listed. Model selection inherits the host's
configuration. No model, subscription, credentials, or deployment identity is pinned.

The coordinator follows [the agent framework](multi-agent-framework.md) and
[handoff contracts](handoffs.md), maintaining durable records.
The collaboration model uses orchestrator-worker delegation, selective parallel
reviews and maker-checker feedback loops, not a seven-agent assembly line. Security,
compliance, testability and documentation contribute during design; the Bicep engineer
checks feasibility before release. Workload standards do not define the agent framework.
It is not a background service, a GitHub workflow, or a guaranteed automated scheduler.
Only explicitly authorised phases execute. Handoff acceptance does not automatically
authorise the next phase.

The profiles configure read-only Microsoft Learn MCP access for supporting CLI/cloud
clients. IDEs need their own MCP configuration; tool discovery and connectivity must
be checked in the executing client. See [context and tools](context-and-tools.md).

## Reusable Execution Prompts

| Entry point | Profile | Required output or gate |
|---|---|---|
| [01 Design](../../.github/prompts/iac-01-design.prompt.md) | azure-architect | Bounded design, resource/module inventory and acceptance criteria |
| [02 Review](../../.github/prompts/iac-02-review.prompt.md) | delivery-coordinator | Specialist review records plus independent five-pillar architecture report |
| [03 Plan](../../.github/prompts/iac-03-plan.prompt.md) | delivery-coordinator | Actual implementation tasks/dependencies and validation inventory |
| [04 Release design](../../.github/prompts/iac-04-release-design.prompt.md) | azure-architect | Approved design/plan references and release decision |
| [05 Implement](../../.github/prompts/iac-05-implement.prompt.md) | bicep-engineer | Released scope's Bicep and local check evidence |
| [06 Validate locally](../../.github/prompts/iac-06-validate-local.prompt.md) | infrastructure-tester | WV05-WV14 results on fixed candidate, including warnings/control assertions |
| [07 Document](../../.github/prompts/iac-07-document.prompt.md) | architecture-documenter | Matching architecture/setup/validation/recovery guidance; runs throughout |
| [08 Validate Azure](../../.github/prompts/iac-08-validate-azure.prompt.md) | infrastructure-tester | Later authorised WV15-WV17 actual-context confirmation, validation and what-if |
| [09 Verify live](../../.github/prompts/iac-09-verify-live.prompt.md) | infrastructure-tester | Later authorised WV18-WV22 observed checks against a real deployment record |

Supporting VS Code Local sessions can invoke prompt files. In Copilot CLI, select
the named agent and ask it to read/apply the chosen prompt body with the assignment.
Native prompt discovery is client-specific; no file here starts an automatic
pipeline. No deployment prompt, deployer agent or Azure access is added.

### Using and Linking Prompts

The relationship is **prompt -> agent profile -> relevant skills and contracts ->
scoped artifacts/evidence**. For example,
[local validation](../../.github/prompts/iac-06-validate-local.prompt.md) declares:

```yaml
name: iac-06-validate-local
agent: infrastructure-tester
```

The `agent` value names
[the tester profile](../../.github/agents/infrastructure-tester.agent.md), not the next
prompt. That profile instructs the agent to read the relevant skills, including
[workload validation](../../.github/skills/ama-workload-validation/SKILL.md) and
[handoff](../../.github/skills/ama-handoff/SKILL.md). The prompt body narrows the selected
phase; its accepted assignment supplies real input snapshots, outputs, permissions,
check scope and loop budget. References are instructions, not automatic file imports
or an executable dependency graph.

In a supporting **VS Code Local** chat, invoke `/iac-06-validate-local` and provide
the accepted assignment. In **Copilot CLI**, select the profile first:

```text
/agent infrastructure-tester
```

Then send a message such as:

```text
Read .github/prompts/iac-06-validate-local.prompt.md and apply its instructions
to the accepted assignment at <assignment-path>. Use its fixed inputs and
existing loop ledger. Stop at the assigned gate.
```

`<assignment-path>` is a placeholder, not an existing package or authorisation.
Review prompt 02 selects the coordinator, which delegates the required independent
reviews and collects their results. A specialist returns to the coordinator; it does
not invoke the next numbered prompt. Required approvals still block later phases.

All review/test/validation loops use the [five-attempt ceiling](multi-agent-framework.md#review-loop-limit),
including security/compliance and fix/recheck handoffs. This is an instruction-level
contract until an orchestration runtime enforces the ledger and counter.

## What the Templates Are For

[`delivery/templates/`](../../delivery/templates/) contains blank Markdown forms
for workload records. They are not Bicep templates, an agent runtime, or files that
Copilot automatically copies or enforces. This file-based convention makes inputs,
decisions and evidence available beyond an agent's conversation.

| Template | Intended record | Used when |
|---|---|---|
| [Assignment](../../delivery/templates/assignment.md) | Authorised scope, inputs, writer, output, approvals and loop budget | Before delegating a workload task |
| [Design release](../../delivery/templates/design-release.md) | Azure design, contracts, criteria and exact approval references | Preparing a workload design for release |
| [Architecture review](../../delivery/templates/architecture-review.md) | Independent assessment of that Azure design | Reviewing the design, not the engineering framework |
| [Development plan](../../delivery/templates/development-plan.md) | Actual implementation files/tasks, dependencies and tests | Planning implementation from the reviewed design |
| [Review](../../delivery/templates/review.md) | Test, security or compliance findings and evidence | The relevant specialist evaluates a fixed workload revision |
| [Handoff](../../delivery/templates/handoff.md) | Delivered outputs, evidence links, remaining blockers and next owner | Returning a delegated result to the coordinator |

Create the relevant records under an authorised
[`delivery/releases/WP-.../`](../../delivery/releases/README.md). Do not copy every
template for every task. Reference existing reports rather than duplicating their
contents; a handoff is a concise index to outputs, not a second review. A small
documentation task does not require a new infrastructure design package.

## First Work

[D01](../../delivery/tasks.md#initial-backlog) identifies what the repository already settles and
what still needs a decision: deployment scope, existing landing-zone services,
environments, regions/model availability, service choices, sizing, budget and
measurable operational requirements. The backlog records proposed work, not approval
to implement every component in the conceptual architecture.
