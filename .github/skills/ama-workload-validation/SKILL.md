---
name: ama-workload-validation
description: Perform risk-based non-author Azure workload review and scoped checks with explicit evidence, Azure-context confirmation and stage-specific acceptance.
---

# AMA Workload Validation

1. Load `ama-context` and `ama-handoff`; require an accepted assignment with a fixed
   workload revision, accepted risk path, target gate/check scope, permitted writes
   and execution limits.
2. Use `docs/delivery/workload-checks.md` and the package test plan. Map applicable
   WV01-WV22 checks to exact artifacts/resources, expected results and evidence.
   Do not invent an environment or substitute the generic backlog for the actual plan.
3. Review as a non-author against approved targets. Apply the risk path's required
   technical and specialist scope; regulated designs use the dedicated five-pillar
   architecture report. Record fresh-context availability and shared-model limits.
4. Check that the scoped plan derives from the reviewed architecture, covers
   findings, exact files/contracts, dependencies/parallel writers, parameter variants
   and tests. Light work can reference its approved baseline. Material design changes
   require affected review/approval again.
5. For local validation, build every scoped module/root and compile required
   parameter variants. Capture linter diagnostics separately from exit status.
   Errors or undispositioned warnings block; do not suppress rules to obtain a pass.
6. Verify actual effective template properties, approved parameters and AVM defaults
   for naming/tags, private access/DNS, identity/RBAC/secrets, TLS, network controls,
   diagnostics and the repository's architecture restrictions. Static declarations
   do not prove observed runtime behaviour.
7. Before any authorised Azure validation, what-if or live checks, inspect the actual
   tenant/subscription and obtain explicit confirmation for the intended context and
   snapshot. Missing login or mismatch blocks; do not silently log in or switch.
8. Use validation and what-if at the released group/subscription scope. Record actual
   results and review creates/modifies/deletes; previews do not authorise deployment.
9. Live checks require an authorised deployment record and safe approved test scope.
   Verify reachability/TLS, private endpoint/DNS/public denial, effective identity and
   network access, monitoring, and only the operational drills explicitly approved.
10. Report current-gate results and later pending checks separately. Return defects
    to their artifact owners and independently retest changed snapshots. Never edit
    production code, invent approvals or claim unexecuted checks as passed.
11. Use `ama-ai-ml-validation` for model/data quality and runtime AI checks. WV13
    validates infrastructure representation/wiring; ML01-ML08 establish model/data
    quality with domain-approved targets and independent evidence.
