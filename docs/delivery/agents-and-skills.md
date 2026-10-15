# Agents and Skills

## Agent Contracts

Every role reads [AGENTS.md](../../AGENTS.md), the relevant baseline, and its named
skills. The profiles are the execution instructions; this table is the directory.
All seven roles deliver the Azure workload. They do not develop, validate or
maintain their own engineering-agent definitions as part of that delivery.

| Profile | Inputs | Outputs / write ownership | Cannot approve or perform |
|---|---|---|---|
| [azure-architect](../../.github/agents/azure-architect.agent.md) | Business scope, workload baseline/research, early specialist constraints and design reviews | Package `design.md`/`conformance.md`, module contracts, criteria; technical acceptance of published docs | Concurrent edits to documenter-owned files; its own security/legal approval; implementation/deployment |
| [bicep-engineer](../../.github/agents/bicep-engineer.agent.md) | Draft design for feasibility; approved release for implementation | AVM feasibility, `infra/`, module inventory, implementation evidence | Infrastructure before release, architecture deviations, its own independent pass, CI or Azure writes |
| [architecture-documenter](../../.github/agents/architecture-documenter.agent.md) | Requirements, evolving design, actual code, checks and deployment records if any | Workload docs and diagrams throughout; final deployment guidance | Engineering-team configuration/docs, design changes or claims of unobserved deployment |
| [infrastructure-tester](../../.github/agents/infrastructure-tester.agent.md) | Assigned workload inputs, architect-authored Azure design or fixed infrastructure candidate | Independent design-quality report, workload snapshots/checks, evidence and testability review | Engineering-framework tests, authoring the reviewed design, production fixes or cloud deployment |
| [security-reviewer](../../.github/agents/security-reviewer.agent.md) | Workload design/candidate revision, threat/control requirements | Workload security reviews and findings only | Risk acceptance, production changes, live exploitation |
| [compliance-reviewer](../../.github/agents/compliance-reviewer.agent.md) | Workload scope, obligations, official legal sources, control evidence | Applicability matrix, compliance findings, research corrections | Legal sign-off, certification, rewriting source legislation |
| [delivery-coordinator](../../.github/agents/delivery-coordinator.agent.md) | Authorised workload objective, reviewed architecture and accepted evidence | Actual workload development plan, task states, ledger, handoffs and readiness summary | Engineering-framework development/testing, specialist passes, human approval, waivers or deployment |

Shared evidence is intentional; shared authority is not. The engineer's local checks
do not replace independent testing. The tester executes technical assertions;
security/compliance assess that evidence against their own scoped requirements.
The independent architecture report references specialist findings rather than
overruling them. The architect owns decisions and conformance; the documenter owns
the assigned published explanation. The coordinator routes work, not specialist verdicts.

All profiles have read/search, scoped-by-instruction editing, web research where
supported, and the three allowlisted read-only Learn tools. Only the Bicep engineer,
tester and documenter have shell execution for their stated local checks. Only the
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
| [ama-context](../../.github/skills/ama-context/SKILL.md) | All seven | Source precedence, case boundaries, runtime invariants |
| [ama-design-release](../../.github/skills/ama-design-release/SKILL.md) | Architect | Workload WAF assessment, module contract and release gate |
| [ama-avm-bicep](../../.github/skills/ama-avm-bicep/SKILL.md) | Bicep engineer, tester | Published module verification, composition and validation |
| [ama-workload-validation](../../.github/skills/ama-workload-validation/SKILL.md) | Tester | Independent full-WAF review, WV01-WV22 control checks, context confirmation and evidence |
| [ama-handoff](../../.github/skills/ama-handoff/SKILL.md) | All seven | Revision-bound evidence and acceptance protocol |

Profiles name the skills to load; if the client does not activate a local skill
automatically, read its `SKILL.md`. Skills provide instructions, not installed
executables, cloud privileges or a promise that external services are reachable.

Role ownership is not execution order. The coordinator uses the
[collaboration patterns](multi-agent-framework.md#selected-collaboration-model)
to select specialists and route review/fix cycles; a simple request can be handled
by one role. [Workload Guidance](workload-guidance.md) separately defines the standards
applied to the Azure artifacts they produce.
The [workload checks](workload-checks.md) provide concrete expected evidence;
[phase prompts](README.md#reusable-execution-prompts) provide repeatable entry points
without replacing assignments or automatically running later phases.

## Optional Authoring Capabilities

Mermaid in Markdown is the portable baseline for new diagrams. Existing editable
Excalidraw sources remain alongside the architecture documents. If the host provides
an Excalidraw skill, use it for that format; PowerPoint/Word/HTML export skills are
optional and must not become prerequisites for the repository-local workflow.

No agent automatically publishes, builds a slide deck, changes the assessment
rubric, or starts paid infrastructure just to produce evidence.
