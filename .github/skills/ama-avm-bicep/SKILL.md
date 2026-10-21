---
name: ama-avm-bicep
description: Implement or test released AMA infrastructure using native Bicep composition, exact published AVM versions and evidence-based validation without deploying.
---

# AMA AVM Bicep

1. Load `ama-context`. During design, verify AVM feasibility without writing
   infrastructure. For implementation require the approved architect release and
   acceptance criteria. Tester use evaluates contracts/candidates, not implementation.
2. Discover AVMs through the official index and inspect the exact published version's
   README, parameters, outputs, examples, source and limitations. Never invent a
   registry path/version or assume a module supports a required property.
3. Pin exact `br/public:avm/...:<version>` references. Use local composition modules
   for meaningful project contracts, not one pass-through wrapper per AVM.
4. Keep resource dependencies in Bicep through output references and explicit scopes;
   use `dependsOn` only where no data reference expresses a real dependency.
   Keep environment differences in parameter files and avoid cyclic RBAC wiring.
5. Apply the released identities, private endpoints/DNS, egress, narrow role scopes,
   diagnostics, approved compute configuration, retention, tags and naming.
   An AVM default does not automatically satisfy WAF or regulatory requirements.
6. Use managed identity and secret references; never output credentials. For any
   approved Azure SQL implementation, use Entra-only authentication without SQL
   administrator login/password fields.
7. Use native resources for a documented AVM capability gap, not for convenience.
   Escalate design-changing workarounds to the architect before implementation.
8. Run available local restore/build/lint and parameter checks. Record command,
   version, exit status, and candidate revision. Missing dependencies are explicit
   blockers; install tools only with approval.
9. Authenticated validation/what-if requires approved scope and identity. Deployment,
   data-plane changes, application bootstrap and GitHub Actions are separate work.
   What-if is neither a guarantee nor deployment authorisation; ARM is not transactional.
10. Produce a module/version inventory, non-secret outputs and acceptance mapping.
    Hand off through `delivery/handoffs.md`; no self-approval or hidden exclusions.
