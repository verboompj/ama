# Assignment: implementer acceptance of approved local IaC plan

| Field | Value |
|---|---|
| Specialist / authority | bicep-engineer HIGH gpt-6.1-sol / user approval "approva and build iac templates" |
| Fixed inputs | U001-approved-inputs manifest/copies, design/cost/actual plan and completed technical/F04 reports |
| Sole write | `delivery/releases/WP-001/implementer-acceptance.md` |
| Objective | Accept/reject exact plan before architect release; no Bicep yet. Confirm composition corrections and feasible locally supplied parameters without scope or design edits |
| New scoped dispositions | Parent received security/compliance PASS for local template scope; required C1-C5 local checks remain candidate obligations, no runtime/certification PASS |
| Tooling | Host `az bicep version` reports CLI-managed Bicep 0.43.8; bare `bicep` is not on PATH. Use existing CLI-managed binary or local az bicep commands, no tool upgrade/install requested |
| Limits | One acceptance decision, no design/cost revision or F04 feasibility recheck; old F03 5/5 and F04 4/5 unchanged |
| Checks | Exact files/scopes/inputs/grant/alert/native mapping and build variants from accepted plan are implementable; identify real material contradictions rather than invent live values |
| Stop | Return accepted/rejected with precise inputs/hash/limits and stopped output; parent routes actual architect release before implementation |
| Forbidden | Any other writes, source/requirements/framework edits, infra generation, Azure/auth/what-if/deploy/browser, nested agents, commit/push |
