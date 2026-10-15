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
3. Involve security/compliance in requirements, the tester in acceptance criteria,
   the documenter in design records, and the Bicep engineer in AVM feasibility before
   release. Route contributions through the coordinator and iterate on shared artifacts.
   Workload standards are not a prescription for agent collaboration.
4. Assess all five WAF pillars, stating the requirement, chosen control, trade-off,
   measurable acceptance check, earliest required gate, and accountable owner for each.
5. Define resource scopes, module boundaries and typed contracts, private network
   and DNS paths, identities/RBAC, availability/recovery, diagnostics, lifecycle,
   cost assumptions, and service/model/SKU availability checks.
6. Prefer `infra/main.bicep` composition with environment `.bicepparam` files and
   logical local modules consuming pinned published AVMs. This is a design starting
   point, not permission to choose unresolved databases/SKUs or generate code.
   Record ownership and lifecycle reasons for any separately deployed root.
7. Use `delivery/templates/design-release.md`. Obtain separate design security and
   compliance dispositions, the tester's independent all-five-pillar
   `architecture-review.md`, and an accepted workload `development-plan.md` with WV01-WV04
   evidence. Obtain explicit human approval of the design snapshot and plan revision.
   Request a tester-prepared fixed design snapshot before review. The coordinator records
   `design-released` and exact-snapshot human approval in the package ledger only
   after required design-gate evidence is satisfied; do not mutate the reviewed design.
8. Hand off the exact approved package revision. Material changes create a new
   revision and re-open affected approvals. A release is not deployment permission.
