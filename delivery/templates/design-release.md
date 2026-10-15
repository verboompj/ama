# Design Release: WP-<number>

Template only. Replace placeholders; do not treat this file as an approved package.

## Identity and Gate

| Field | Value |
|---|---|
| Task / architect | TODO |
| Lifecycle / approval ledger reference | TODO; state is recorded outside this frozen artifact |
| Design revision / snapshot ID / producer / manifest reference | TODO |
| Business owner / human design approver | TODO |
| Required approval scope / external approval-record location | TODO; approval is recorded against the frozen snapshot |
| Supersedes / affected earlier evidence | None / TODO |

## Scope and Sources

Business capability, personas and measurable outcome; in/out of scope; original
requirements and rubric references; maintained architecture sections; source
conflicts and resolutions; official research URLs, access dates and applicability.

## Preconditions and Decisions

Existing landing-zone services; environments; approved scope/region/model type;
classification and lawful data access; quotas/availability evidence; ownership;
cost assumptions and budget; unresolved decisions with owners and blocking status.

## Workload Well-Architected Assessment

Assess the Azure workload, not the agent collaboration model. Record existing
platform dependencies and ownership without expanding the approved implementation scope.

| WAF pillar | Requirement / target | Decision and alternatives | Trade-off | Acceptance check / owner |
|---|---|---|---|---|
| Reliability | TODO | TODO | TODO | TODO |
| Security | TODO | TODO | TODO | TODO |
| Cost Optimization | TODO | TODO | TODO | TODO |
| Operational Excellence | TODO | TODO | TODO | TODO |
| Performance Efficiency | TODO | TODO | TODO | TODO |

## Design and Module Contracts

Logical/deployment/data-flow diagrams; resources/scopes; module ownership and typed
inputs/outputs; exact candidate AVMs and verified capability limits; native Bicep
exceptions; dependency graph; identities/RBAC; private access/DNS/egress; diagnostics;
availability/recovery; data lifecycle; app/model bootstrap boundaries.
Include per-resource naming/tagging rules, supported TLS minimums, parameter variants,
private connectivity/DNS and effective control properties expected by the WV checks.

## Acceptance Matrix

| Criterion ID | Requirement and threshold | Check / expected evidence | Earliest required gate | Check method/stage | Owner |
|---|---|---|---|---|---|
| AC-01 | TODO | TODO | TODO | local / authenticated / post-deployment | TODO |

Map applicable WV01-WV22 checks from `delivery/workload-checks.md` to exact package
criteria and evidence. The package plan instantiates properties, values and commands;
generic checklist names are not completed validations.

Gate values: `design-released`, `locally-validated`, `deployment-ready`,
`operationally-verified`. Use the definitions in
[Handoffs and Gates](../handoffs.md#gate-specific-acceptance); after copying this
template, adjust relative links for the work-package location.
Later-gate tests remain required later, not passed or waived at design release.

## Review and Approval Evidence

Security design disposition and findings; compliance applicability/control matrix;
tester testability disposition; Bicep engineer AVM feasibility findings; design
documentation revision; independent all-five-pillar `architecture-review.md`;
accepted workload `development-plan.md` revision and WV01-WV04 evidence;
finding resolutions; required DPO/legal/risk-owner
approvals or open blockers. Review records and human approval refer to the exact
snapshot from the external ledger; do not append approvals to the frozen design file.

## Release and Handoff

Architect release decision, immutable revision, approved implementation scope,
accepted exceptions, prerequisites, Bicep engineer recipient, and handoff reference.
No release until required design-gate reviews and human approval are recorded against
this snapshot in the ledger. The architect supplies the release decision; the
coordinator records `design-released`. No deployment authority is granted.
