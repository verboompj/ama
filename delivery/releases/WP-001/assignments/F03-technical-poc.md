# Assignment: architect integration / technical PoC

| Field | Value |
|---|---|
| Authority | User, 8 November 2026: retain security/compliance requirements but stop using them as PoC deployment acceptance requirements; accept a non-compliant technical-validation state; architect works next; Bicep is the next intended implementation output |
| Coordinator / specialist | Parent CLI / azure-architect, HIGH `gpt-6.1-sol` |
| Fixed inputs | `T001-inputs/manifest.json` in the assigned session files; exact source-relative copies. Base `ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`, current accepted local scope/policy copied explicitly |
| Sole write ownership | `delivery/releases/WP-001/design.md`, `delivery/releases/WP-001/cost-estimate.md` |
| Objective | Produce the smallest implementable technical-validation foundation design/cost, replacing PoC compliance-certification gates with explicit deferred obligations and proportionate technical/safety checks |
| Scope | WP-001 infrastructure first; Azure ML and application are separate later work packages. No all-workload single deployment. Preserve AKS Standard, explicit pools, Cilium Overlay, WI, NAP off, private-only audience and no reuse of existing estate |
| Requirements treatment | Preserve all requirement reports/snapshots. Do not mark deferred compliance or security findings PASS. Broad non-compliance is not permission for secrets in source, real claimant data, unauthorised/public access, tenant/policy changes, paid jobs, destructive tests or Azure execution |
| Risk-path conflict | Current repository requires non-author technical review and targeted specialist review where trust/identity/secrets/exposure trigger it. Separate regulatory/compliance assurance from essential safety; state any irreducible conflict rather than silently deleting higher-level requirements or rewriting framework |
| Concrete integration | Use F04-GO native complete AKS/VPN contracts where verified; preserve pinned AVMs elsewhere. Resolve owned DNS dependency, monitoring, critical defaults/output contracts. Do not repeat the completed AKS/VPN compatibility hunt |
| Simplification | Mandatory signature engine, no-Route TLS proof, full managed inventory, HA, continuous build-observer, legacy-client/renewal campaigns and strict secret-free nested dependency outputs were prior regulated method gates. For this technical PoC, explicitly propose deferral where not essential to the stated test, with consequences and later owners. Avoid introducing another elaborate compensating-control campaign |
| Runtime unknowns | Capacity/endpoint behaviour is measured later, not fabricated as guaranteed before provisioning. If Gateway runtime bootstrap is later application work, separate that from ARM enablement and do not claim tested ingress. No business app/manifests generated |
| Technical acceptance | Full typed resource ownership/graph, parameters/output names, reproducible versions, selected defaults, names/tags, usable access path and local build/contract tests. Keep actual Azure validate/what-if/deploy/observations later with exact target/cost/change authority |
| Costs | Cost complete selected footprint and illustrative finite campaign scenarios with clear duration assumptions, continuously charged residuals and closure costs. Old quotes are dated evidence, not current Nov prices. Verify public prices where feasible, report unknowns honestly; no invented budget or paid calls |
| Attempt / stop | Existing WP001-F03-AUTHOR cycle 5/5 reserved, 5 used / 0 remaining. One coherent revision; no sixth fix/research author invocation, budget reset or new loop for same objective |
| Output | Design r2 with technical acceptance matrix and explicit deferred-control table; costs r2; finding dispositions, real unresolved blockers, actual sources/checks/runtime visibility and stopped-writing acknowledgment |
| Forbidden | Other writes, framework/requirements/ledger edits, Azure/auth calls, generated Bicep/Kubernetes/workflows, browser, model/data jobs, delegation, commit/push |
| Todo | `wp001-integrate-feasibility`; done for delivered integration, blocked for actual missing prerequisite. Update SQL or return intended update if unavailable |

Accept the fixed assignment first. The coordinator independently logs scope and
delivery sequencing; do not write its files. Stop before design release or
infrastructure generation. Exact human design approval remains separate.
