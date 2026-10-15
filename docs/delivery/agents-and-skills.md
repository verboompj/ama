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
coordinator has agent delegation. No profile hardcodes a model.
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
