# WP-001: Non-Production Foundation

## Identity and Authority

| Field | Value |
|---|---|
| Objective | Prepare the bounded foundation for the main AMA workload |
| Current phase | ARM-only design/cost/plan approved and architect-released for local authoring; ten Bicep files compile, effective author contracts fail and the 5/5 loop is exhausted. Independent local acceptance and Azure execution remain pending |
| Authorisation | User, 21 October 2026: "yes on bounded foundation, lets structure the decisions" |
| Coordinated continuation | User, 21 October 2026: coordinate WP-001 through design, review, implementation, validation and deployment; submit reviewed design, implementation plan and complete cost for approval before implementation, then confirm Azure scope and obtain separate deployment approval |
| Baseline | Commit `ffa66c5b0efc7d144170db9464957123faef6eb5`; maintained architecture sections 12-16 and 20 |
| Package state / approvals | [Ledger](ledger.md) |
| Environment decisions | [Decision register](decisions.md) |
| Working scope | [Empty-foundation definition](definition.md), selected by the user on 21 October 2026; not a farmer/application demo or an execution approval |
| Current amendment | [Technical PoC direction](poc-direction.md), FND-22/FND-23: certification campaigns not requested outcomes; retain requirement evidence, binding safety/release gates and staged infra -> ML -> app |
| Evidence process | [Accepted prospective disposition](evidence-accounting-resolution.md), recorded in FND-21 and the ledger: historical successful 5/5 bucket closed with no further execution; legitimate new preparation follows the clarified protocol without resetting any logical check |
| Preparation assignment | [F01](assignments/F01-scope.md) |

## Outcome and Boundaries

Prepare one non-production foundation through separately approved stages.
The [design release](design-release.md) now authorises local IaC, and the
[implementation report](implementation.md) records the produced templates and
validation blocker. Actual environment settings, independent local acceptance,
Azure validation and deployment remain pending; local approval is not execution
authority.

The user accepted the recommended **empty-foundation qualification** direction on
21 October 2026. [The working definition](definition.md) records selected engineering
directions, concrete owners and stage-specific prerequisites. It governs the next
design revision's planning scope; the original design/cost r1 and reviewed EP-r2
remain unchanged historical inputs, not reconciled releases. Application PoC work
is a later package, even if it also uses synthetic data.

Exact campaign identities, UTC window/expiry, funded numeric spend ceiling and
final expiring risk acknowledgement are required before their authorised use,
not before documenting the scope. This distinction neither supplies a technical
PASS nor waives design-release feasibility, reviews or fixed design/plan/cost
approval. The user separately authorised the targeted accounting clarification;
FND-21 records its accepted prospective application. The administrative bucket
no longer imposes a lifetime maximum of five successful input sets. Actual
integrity checks and reviews remain bounded, and no new preservation is executed
by this definition or that disposition.

| Area | Included in the foundation design |
|---|---|
| Resource organisation | Deployment scope, resource-group boundaries, naming, tags and ownership |
| Networking | Address plan, required subnets, private DNS integration, routing and egress |
| Identity | Cluster/platform identities, Entra administration, least-privilege RBAC and workload federation boundaries |
| Container registry | ACR, image-pull access and approved network connectivity |
| Observability | Monitoring destinations, diagnostic collection, retention, actionable alerts and cost controls |
| Compute | AKS Standard, explicit pools, Azure CNI Overlay/Cilium, Workload Identity and NAP disabled |
| Access and ingress | Operator access route and application-ingress/TLS contract; controller installation ownership and timing must be explicit |
| Operations | Upgrade/maintenance, capacity limits, recovery, cleanup and deployment/operational ownership |

Foundry deployments, AI Search, Azure ML, application data stores, evidence
ingestion/messaging, application releases and model/data jobs belong to later
packages. Define their required network, identity, DNS and observability interfaces
without provisioning them here. Reserve addresses only after an approved address plan.

The separate [ML experiment](../../first-implementation-slice.md) has its own scope,
authorisations and budget. Its earlier cost estimate does not fund this foundation.
Do not provision shared ML resources twice; record reuse explicitly.

## Design Baseline

Use the [maintained architecture](../../../docs/architecture/aks-centered-foundry-architecture.md)
and [workload standards](../../workload-guidance.md). Preserve AKS Standard,
CNI Overlay/Cilium, Workload Identity and disabled NAP. Capture any proposed deviation
as a decision requiring architecture approval.

Existing hub networks, DNS, registry, logging, policy and identity services are
discovery inputs. Decide reuse versus creation before fixing resource counts,
SKUs, regional topology, AVM versions or a bill of materials.

## Risk and Acceptance

The requesting user accepted the **regulated review path** on 21 October 2026
for the foundation's network, identity and RBAC boundaries under
[the risk matrix](../../handoffs.md#risk-based-review-paths). The infrastructure-tester
provides non-author technical review, security/compliance agents provide scoped
findings, and the requesting user retains human approval. Reviews apply to the
non-production/public-synthetic-data scope. Required corporate controls remain
subject to discovery; review execution needs its assignment and fixed inputs.

The architect derives exact acceptance criteria from approved decisions. At minimum,
the design must identify complete resources/interfaces, verified published AVM
contracts, a costed capacity envelope, operator access, relevant failure/recovery
behaviour and staged WV01-WV22 checks. Business/platform owners approve targets.

## Planned Work

These local task IDs identify this package; D01-D20 in the
[reference backlog](../../tasks.md#regulated-infrastructure-reference) supply applicable
detail. Each later specialist needs its accepted assignment and exact input revision.

| Task | Owner | Prerequisites | Output / stop |
|---|---|---|---|
| F01 | delivery-coordinator | User scope authorisation | Context, decision register and initial ledger; stop before design release or Azure access |
| F02 | delivery-coordinator | F01 | Accountable owners resolve discovery/target decisions and accept risk/reviewer scope; missing inputs remain blocked |
| F03 | azure-architect | F02 | Scoped design, diagrams, resource inventory, interfaces, cost estimate and acceptance matrix |
| F04 | bicep-engineer | F03 | Published AVM feasibility and exact candidate versions; no infrastructure generated |
| F05 | infrastructure-tester | F03, F04 | Required non-author design review and testability evidence; triggered specialists have separate assignments and findings |
| F06 | delivery-coordinator | F05 and required specialist dispositions | Actual implementation plan accepted by architect and scoped writers; unresolved findings block |
| F07 | azure-architect | F06 and genuine required human approvals | Design-release decision against fixed design/plan revisions |

Implementation, authenticated validation, deployment and live verification receive
their own tasks/assignments after release. Pipeline creation requires explicit
authorisation. Branches and PRs can carry changes once authorised; reviews bind to
exact commits and input sets, with approvals/state recorded outside frozen inputs.
