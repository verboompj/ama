---
name: ama-design-release
description: Prepare a bounded Azure workload release with Well-Architected assessment, AVM feasibility, acceptance criteria and explicit approval before AMA infrastructure implementation.
---

# AMA Design Release

1. Load `ama-context`. Establish business requirements, non-functional targets,
   ownership, existing landing-zone services, data classification, environment,
   budget, subscription/scope and region decisions. Unknowns stay explicit.
2. Research current official WAF, Azure service, and AVM guidance. Record URLs,
   access date, applicability, and version/capability limits. Discover Learn MCP
   tools first; use public technical queries without repository/private data.
3. Apply the accepted light/standard/regulated path from `docs/delivery/handoffs.md`.
   Obtain approved targets from business/domain owners; the tester translates them
   into checks. Request scoped implementation feasibility and triggered specialist
   reviews through the coordinator.
4. Assess affected workload properties, stating targets, controls, trade-offs,
   checks, earliest gates and accountable owners. Regulated Azure designs cover
   all five WAF pillars.
5. Define resource scopes, module boundaries and typed contracts, private network
   and DNS paths, identities/RBAC, availability/recovery, diagnostics, lifecycle,
   cost assumptions, and service/model/SKU availability checks.
6. For infrastructure scope, prefer `infra/main.bicep` composition with environment
   `.bicepparam` files and logical modules consuming pinned published AVMs.
   Record ownership and lifecycle reasons for any separately deployed root.
   For application/ML scope, include versioned runtime interfaces, data/scoring
   contracts, evaluation protocols, artifact inventories and applicable AI/ML checks.
7. Use the relevant release/plan records. Obtain required non-author review and
   triggered security/compliance dispositions. Regulated releases include the
   dedicated all-five-pillar `architecture-review.md`. Standard work uses scoped
   technical evidence; light work may reference the existing release within its scope.
   Obtain applicable human approval of exact design/plan revisions.
   Use immutable committed references or preserved uncommitted inputs. The coordinator records
   `design-released` and exact-snapshot human approval in the package ledger only
   after required design-gate evidence is satisfied; do not mutate the reviewed design.
8. Hand off the exact approved package revision. Material changes create a new
   revision and re-open affected approvals. A release is not deployment permission.
