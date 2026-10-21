# Agents and Skills

## Agent Contracts

Every role reads [AGENTS.md](../../AGENTS.md), the relevant baseline, and its named
skills. The profiles are the execution instructions; this table is the directory.
The nine roles deliver workload artifacts under an accepted risk path.

| Profile | Inputs | Outputs / write ownership | Cannot approve or perform |
|---|---|---|---|
| [azure-architect](../../.github/agents/azure-architect.agent.md) | Business scope, workload baseline/research, early specialist constraints and design reviews | Package `design.md`/`conformance.md`, module contracts, criteria; technical acceptance of published docs | Concurrent edits to documenter-owned files; its own security/legal approval; implementation/deployment |
| [bicep-engineer](../../.github/agents/bicep-engineer.agent.md) | Scoped design/plan | AVM feasibility, `infra/`, module inventory; future authorised release automation | Unreleased infrastructure, self-approval, unauthorised CI or Azure writes |
| [application-ai-engineer](../../.github/agents/application-ai-engineer.agent.md) | Released application/runtime scope and accepted scoring contracts | Services/UI integration, runtime tools/prompts, evidence adapters, packaging, adjacent author tests | Model tuning/promotion, infrastructure edits, independent verdicts |
| [ml-data-engineer](../../.github/agents/ml-data-engineer.agent.md) | Released data/model scope and approved data/compute/evaluation protocol | Copernicus/features, training/scoring, data/scoring schemas, manifests/model cards/replay, adjacent author tests | Application case logic, final-test tuning, independent verdicts or human promotion approval |
| [architecture-documenter](../../.github/agents/architecture-documenter.agent.md) | Requirements, evolving design, actual code, checks and deployment records if any | Workload docs and diagrams throughout; final deployment guidance | Engineering-team configuration/docs, design changes or claims of unobserved deployment |
| [infrastructure-tester](../../.github/agents/infrastructure-tester.agent.md) | Fixed workload inputs and owner-approved targets | Required non-author design review; independent infrastructure/application/AI/ML suites and results; snapshots when needed | Target self-approval, production fixes, model tuning or deployment |
| [security-reviewer](../../.github/agents/security-reviewer.agent.md) | Workload design/candidate revision, threat/control requirements | Workload security reviews and findings only | Risk acceptance, production changes, live exploitation |
| [compliance-reviewer](../../.github/agents/compliance-reviewer.agent.md) | Workload scope, obligations, official legal sources, control evidence | Applicability matrix, compliance findings, research corrections | Legal sign-off, certification, rewriting source legislation |
| [delivery-coordinator](../../.github/agents/delivery-coordinator.agent.md) | Authorised objective, accepted risk path and evidence | Actual plan, scoped assignments, ledger, handoffs and readiness | Specialist verdicts, human approval, waivers or deployment |

Writers own production changes and adjacent author tests. The tester owns independent
acceptance suites against business/domain-owner-approved targets. Required judgments
use non-author reviewers with fresh context where supported. The architect's
conformance is author-side evidence. Shared-model/context limits are recorded.

All profiles have read/search, scoped-by-instruction editing, web research where
supported, and the three allowlisted read-only Learn tools. The Bicep, application and
ML engineers, tester and documenter have shell execution for assigned local work. Only the
coordinator has agent delegation. Profiles declare repository model defaults under
the [Model Routing Policy](#model-routing-policy).
The tester also prepares preserved snapshots; other roles consume its manifest.
See [artifact ownership](../../delivery/releases/README.md#artifact-ownership) and
[snapshot protocol](../../delivery/releases/README.md#snapshot-protocol) for the
concrete responsibilities.

Tool aliases vary by client. `web` does not enable cloud-agent web research by itself;
use a configured documentation MCP there. Learn search covers Microsoft content,
not general legal research. A compliance review needing EUR-Lex or Hungarian sources
must use available official-source access or remain blocked with the missing sources.

**Permissions caveat:** edit/shell tools cannot enforce the table's path ownership.
Shell access is broad, not a safe read-only boundary. Use host tool approvals,
repository permissions and scoped cloud identities. Native IDE handoff buttons are
not relied upon for cross-client enforcement.

## Model Routing Policy

These cost-optimised defaults apply to **development agents only**, not runtime
Azure Foundry/ML model selection, account entitlement or deployment permission.
The version-controlled `model:` frontmatter in
`.github/agents/<role>.agent.md` declares each default; [AGENTS.md](../../AGENTS.md)
provides the central task-risk guard. LOW means clerical work only; HIGH retains
consequential reasoning and judgment.

| Role | Model ID | Tier | Initial task-fit rationale |
|---|---|---|---|
| `architecture-documenter` | `gpt-6-luna` | LOW, clerical only | Fast formatting, extraction and known-data documentation; escalate consequential writing |
| `delivery-coordinator` | `gpt-6.1-sol` | HIGH | Complex decisions, dependencies, handoffs and readiness |
| `azure-architect` | `gpt-6.1-sol` | HIGH | Architecture trade-offs, contracts and release judgment |
| `bicep-engineer` | `gpt-6.1-sol` | HIGH | Azure/IaC implementation and dependency reasoning |
| `application-ai-engineer` | `gpt-6.1-sol` | HIGH | Application/runtime tools and evidence-boundary implementation |
| `ml-data-engineer` | `gpt-6.1-sol` | HIGH | Data leakage, ML methodology and reproducible pipelines |
| `infrastructure-tester` | `gpt-6.1-sol` | HIGH | Independent acceptance and infrastructure/AI/ML validation |
| `security-reviewer` | `claude-sonnet-5.5` | HIGH | Initial review fit, token/tool efficiency and provider diversity |
| `compliance-reviewer` | `claude-sonnet-5.5` | HIGH | Initial obligation/evidence review fit and provider diversity |

**Route by the highest-risk part of a mixed task**, not its Markdown extension or
role name. LOW GPT-6 Luna is restricted to clerical documentation, known-data
bookkeeping, formatting and extraction. Do tiny deterministic work directly rather
than spawning another agent. Azure/IaC, security, compliance, ML methodology and
acceptance judgment remain HIGH.

Before consequential technical, legal, security, architecture, evidence or
regulated-approval writing, stop the LOW documenter and have the host explicitly
relaunch the assignment on GPT-6.1 Sol. Agents cannot switch their own runtime
model. The coordinator remains HIGH by default; a host may explicitly route only
a **separate clerical assignment** to Luna, never readiness or gate decisions.

Sonnet is an initial task-fit/token-efficiency/provider-diversity judgment, not a
universal benchmark result or legal qualification. Provider diversity alone does
not establish independence: retain non-author reviewers, fixed input revisions,
appropriate review context and human approval boundaries.

**Host operation:** `/subagents` configures host overrides, including per-agent
`subagents.agents.<agent-name>` model, effort and context fields; `/model` selects
the session model and `/usage` reports consumption. Host/account policy,
availability and explicit overrides can affect the effective invocation. Exact
precedence across these controls has not been independently verified; do not
assume a profile always wins. This maintenance changed no local/global CLI
settings and did not retrofit any already-running agent.

Record the actual runtime model when exposed; otherwise record `NOT VERIFIED`.
Profile/configuration validation is not proof of account enablement or a paid
inference benchmark; actual runtime model selection has not been verified here.
If the configured model is unavailable or the effective tier conflicts with the
assignment, stop and report: no silent switch, downgrade or budget reset.
A deliberate higher-tier relaunch preserves scope, reviewer independence, human
approvals and the same [review-loop counter](../../delivery/multi-agent-framework.md#review-loop-limit):
at most **5 total attempts**, including the initial attempt, or a lower assigned
limit. Escalation creates no separate retry budget.

Keep context small: hand off fixed artifacts and scoped evidence, not whole chats.
Parallelise only useful independent reviews; do not automatically request long
context or maximum effort. Measure cost, latency and rework **per accepted result**,
not token price alone. Account plan, credits and exact billing remain unknown;
no guaranteed task-cost saving or paid inference benchmark is claimed.

Sources checked **21 October 2026**:
[custom-agent configuration](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
(`model` is a string; unset profiles inherit the default);
[model comparison](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
(Luna: simple/fast; GPT-6.1 Sol: complex coding; Sonnet 5.5: fewer steps/tokens/tool calls);
[models and pricing](https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing)
(published default-tier pricing is not an account-specific bill).
Local `copilot help config` recognises all three IDs and the per-agent fields above.

## Repository Skills

| Skill | Used by | Reusable procedure |
|---|---|---|
| [ama-context](../../.github/skills/ama-context/SKILL.md) | All nine | Source precedence, risk scope, case boundaries and runtime invariants |
| [ama-design-release](../../.github/skills/ama-design-release/SKILL.md) | Architect | Workload WAF assessment, module contract and release gate |
| [ama-avm-bicep](../../.github/skills/ama-avm-bicep/SKILL.md) | Bicep engineer, tester | Published module verification, composition and validation |
| [ama-workload-validation](../../.github/skills/ama-workload-validation/SKILL.md) | Tester | Scoped non-author review, WV01-WV22 controls and environment confirmation |
| [ama-ai-application](../../.github/skills/ama-ai-application/SKILL.md) | Application/AI engineer | Runtime application/tool/evidence contracts and author checks |
| [ama-ml-lifecycle](../../.github/skills/ama-ml-lifecycle/SKILL.md) | ML/data engineer | Lineage, leakage-safe datasets/features, candidate training and replay |
| [ama-ai-ml-validation](../../.github/skills/ama-ai-ml-validation/SKILL.md) | Tester | Independent AI01-AI06 and ML01-ML08 evaluation |
| [ama-handoff](../../.github/skills/ama-handoff/SKILL.md) | All nine | Revision-bound evidence and acceptance protocol |

Profiles name the skills to load; if the client does not activate a local skill
automatically, read its `SKILL.md`. Skills provide instructions, not installed
executables, cloud privileges or a promise that external services are reachable.

The coordinator uses the
[collaboration patterns](../../delivery/multi-agent-framework.md#selected-collaboration-model)
to select specialists and route review/fix cycles; a simple request can be handled
by one role. [Workload Guidance](../../delivery/workload-guidance.md) separately defines the standards
applied to the Azure artifacts they produce.
The [workload checks](../../delivery/workload-checks.md) provide concrete expected evidence;
[AI/ML checks](../../delivery/ai-ml-checks.md) cover application/model outputs;
[phase prompts](README.md#reusable-execution-prompts) provide repeatable entry points
without replacing assignments or automatically running later phases.

## Release and Operational Ownership

The Bicep engineer authors future release automation under a separately authorised
pipeline assignment. Application and ML writers supply their image/manifests and
job/scoring contracts. The tester independently verifies applicable release evidence.
The coordinator records the actual authorised deployment operator and human service
owner, including monitoring, incident response, rollback and model-drift ownership.
Workflow implementation and execution are deferred.

## Optional Authoring Capabilities

Mermaid in Markdown is the portable baseline for new diagrams. Existing editable
Excalidraw sources remain alongside the architecture documents. If the host provides
an Excalidraw skill, use it for that format; PowerPoint/Word/HTML export skills are
optional and must not become prerequisites for the repository-local workflow.

No agent automatically publishes, builds a slide deck, changes the assessment
rubric, or starts paid infrastructure just to produce evidence.
