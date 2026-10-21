# WP-001: Non-Production Foundation

## Identity and Authority

| Field | Value |
|---|---|
| Objective | Prepare the bounded foundation for the main AMA workload |
| Current phase | Scope and decision preparation |
| Authorisation | User, 21 October 2026: "yes on bounded foundation, lets structure the decisions" |
| Baseline | Commit `ffa66c5b0efc7d144170db9464957123faef6eb5`; maintained architecture sections 12-16 and 20 |
| Package state / approvals | [Ledger](ledger.md) |
| Environment decisions | [Decision register](decisions.md) |
| Preparation assignment | [F01](assignments/F01-scope.md) |

## Outcome and Boundaries

Prepare a deployable design for one non-production foundation, followed by separately
authorised implementation, Azure validation and deployment. Scope agreement is
recorded; environment settings and design release remain pending.

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
