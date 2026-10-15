# Azure Delivery Team

Nine engineering roles deliver Azure infrastructure, applications, runtime AI,
data/model pipelines, independent assurance and deployment guidance.

**Current status:** profiles, skills, prompts and workload contracts are defined.
Implementation starts from the [first-slice scope decisions](first-implementation-slice.md).
Coordination is procedural; executable enforcement and deployment pipelines are deferred.

## Structure

```text
AGENTS.md                     Shared repository instructions
.github/agents/               Nine discoverable Copilot agent profiles
.github/skills/               Eight repository-local skills
.github/prompts/              Twelve reusable phase entry points
docs/delivery/
  README.md                   Entry point and usage
  workload-guidance.md        Azure design, implementation and verification standards
  workload-checks.md          WV01-WV22: explicit checks, reports and gate requirements
  ai-ml-checks.md             Application/runtime AI and model/data acceptance
  first-implementation-slice.md  Public-data crop-evidence scope and open decisions
  multi-agent-framework.md    Agent roles, orchestration patterns and control boundaries
  agents-and-skills.md        Responsibilities, permissions, skill catalogue
  context-and-tools.md        Source map, official guidance, Learn access
  handoffs.md                 State transitions and approval gates
delivery/
  README.md                   Operational artifact index
  tasks.md                    Workload task catalogue
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
| `application-ai-engineer` | Application services, runtime agents/tools, evidence adapters and packaging |
| `ml-data-engineer` | Copernicus/features, training/scoring, versioned contracts and replay bundles |
| `architecture-documenter` | Traceable architecture/deployment docs and editable visuals |
| `infrastructure-tester` | Required non-author review and independent infrastructure/application/AI/ML checks |
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

The [risk-based paths](handoffs.md#risk-based-review-paths) define light, standard
and regulated review depth. The [visual delivery flow](multi-agent-framework.md#input-to-candidate-release)
shows scoped writers, required reviews, bounded fixes and approvals.
Use [assignments](../../delivery/templates/assignment.md) before work and
[handoffs](../../delivery/templates/handoff.md) for actual results.
Use the [WV catalogue](workload-checks.md) and [AI/ML catalogue](ai-ml-checks.md)
to instantiate checks against approved targets. Regulated designs use a dedicated
architecture-review report; light work can reference an existing release.

## Use

In Copilot CLI, open `/agent` and select `delivery-coordinator` (or a specialist).
Start with a bounded request, for example:

> Prepare S01 from delivery/tasks.md using docs/delivery/first-implementation-slice.md.
> Record the proposed risk path and unresolved region, years, data, compute and
> acceptance decisions. Stop before implementation, data acquisition or Azure access.

Profiles and skills are discovered by the supporting client; reopen/reload the
session if newly added files are not listed. Model selection inherits the host's
configuration. No model, subscription, credentials, or deployment identity is pinned.

The coordinator selects the required roles, provides bounded assignments and
consolidates fixed-revision evidence. Business/domain owners approve targets;
non-author reviewers assess the assigned criteria. Review context and model limits
are recorded with the results.

The profiles configure read-only Microsoft Learn MCP access for supporting CLI/cloud
clients. IDEs need their own MCP configuration; tool discovery and connectivity must
be checked in the executing client. See [context and tools](context-and-tools.md).

## Reusable Execution Prompts

| Entry point | Profile | Required output or gate |
|---|---|---|
| [01 Design](../../.github/prompts/iac-01-design.prompt.md) | azure-architect | Bounded design, resource/module inventory and acceptance criteria |
| [02 Review](../../.github/prompts/iac-02-review.prompt.md) | delivery-coordinator | Required technical and triggered specialist review evidence |
| [03 Plan](../../.github/prompts/iac-03-plan.prompt.md) | delivery-coordinator | Actual implementation tasks/dependencies and validation inventory |
| [04 Release design](../../.github/prompts/iac-04-release-design.prompt.md) | azure-architect | Approved design/plan references and release decision |
| [05 Implement](../../.github/prompts/iac-05-implement.prompt.md) | bicep-engineer | Released scope's Bicep and local check evidence |
| [06 Validate locally](../../.github/prompts/iac-06-validate-local.prompt.md) | infrastructure-tester | WV05-WV14 results on fixed candidate, including warnings/control assertions |
| [07 Document](../../.github/prompts/iac-07-document.prompt.md) | architecture-documenter | Matching architecture/setup/validation/recovery guidance; runs throughout |
| [08 Validate Azure](../../.github/prompts/iac-08-validate-azure.prompt.md) | infrastructure-tester | Later authorised WV15-WV17 actual-context confirmation, validation and what-if |
| [09 Verify live](../../.github/prompts/iac-09-verify-live.prompt.md) | infrastructure-tester | Later authorised WV18-WV22 observed checks against a real deployment record |
| [Application implementation](../../.github/prompts/solution-01-implement-application.prompt.md) | application-ai-engineer | Released runtime/application code, contracts, packaging and author checks |
| [ML implementation](../../.github/prompts/solution-02-implement-ml.prompt.md) | ml-data-engineer | Released data/model pipeline code, manifests, candidate artifacts and replay |
| [Application/AI/ML validation](../../.github/prompts/solution-03-validate-ai-ml.prompt.md) | infrastructure-tester | Scoped AI01-AI06 and ML01-ML08 independent results |

Supporting VS Code Local sessions can invoke prompt files. In Copilot CLI, select
the named agent and ask it to read/apply the chosen prompt body with the assignment.
Prompt discovery depends on the client. Each invocation uses its own accepted scope.

### Using and Linking Prompts

The relationship is **prompt -> agent profile -> relevant skills and contracts ->
scoped artifacts/evidence**. For example,
[local validation](../../.github/prompts/iac-06-validate-local.prompt.md) declares:

```yaml
name: iac-06-validate-local
agent: infrastructure-tester
```

The `agent` value names
[the tester profile](../../.github/agents/infrastructure-tester.agent.md).
That profile reads the relevant skills, including
[workload validation](../../.github/skills/ama-workload-validation/SKILL.md) and
[handoff](../../.github/skills/ama-handoff/SKILL.md). The prompt body narrows the selected
phase; its accepted assignment supplies real input snapshots, outputs, permissions,
check scope and loop budget.

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

Replace `<assignment-path>` with the actual accepted assignment.
Review prompt 02 selects the coordinator, which delegates the required independent
reviews and collects their results. A specialist returns to the coordinator.
Required approvals block later phases until recorded.

All review/test/validation loops use the [five-attempt ceiling](multi-agent-framework.md#review-loop-limit),
including security/compliance and fix/recheck handoffs. Attempt accounting is procedural.

## What the Templates Are For

[`delivery/templates/`](../../delivery/templates/) contains blank Markdown forms
for workload records. Inputs, decisions and evidence remain available across sessions.

| Template | Intended record | Used when |
|---|---|---|
| [Assignment](../../delivery/templates/assignment.md) | Authorised scope, inputs, writer, output, approvals and loop budget | Before delegating a workload task |
| [Design release](../../delivery/templates/design-release.md) | Azure design, contracts, criteria and exact approval references | Preparing a workload design for release |
| [Architecture review](../../delivery/templates/architecture-review.md) | Dedicated non-author five-pillar assessment | Regulated Azure design review |
| [Development plan](../../delivery/templates/development-plan.md) | Actual implementation files/tasks, dependencies and tests | Planning implementation from the reviewed design |
| [Review](../../delivery/templates/review.md) | Test, security or compliance findings and evidence | The relevant specialist evaluates a fixed workload revision |
| [Handoff](../../delivery/templates/handoff.md) | Delivered outputs, evidence links, remaining blockers and next owner | Returning a delegated result to the coordinator |

Create the relevant records under an authorised
[`delivery/releases/WP-.../`](../../delivery/releases/README.md). Select forms for the
accepted risk path. Reference existing reports and use concise evidence-linked
handoffs. Light changes can reuse the approved baseline.

## First Work

[S01](../../delivery/tasks.md#solution-slice-backlog) resolves the
[first-slice decisions](first-implementation-slice.md). The infrastructure reference
backlog supports packages that need Azure resources.

Future release automation is authored by the Bicep engineer under a separate
assignment, consuming app packaging and ML job contracts. The authorised deployment
operator and human service owner are recorded before deployment.
