# Assignment: WP-001 / F04 / Published AVM Feasibility

| Field | Value |
|---|---|
| Coordinator / specialist | Current CLI coordinator / bicep-engineer |
| Objective / authority | User's coordinated WP-001 instruction: verify the drafted foundation is implementable before design/plan/cost approval |
| Gate / risk | Design feasibility input to regulated `design-released`; no infrastructure generation |
| Fixed inputs | [S001 manifest](../snapshots/S001/manifest.md); consume preserved `context.md`, `design.md`, `cost-estimate.md`, `security-requirements.md`, `compliance-requirements.md` under its `files/` tree, plus immutable committed dependencies |
| Base / producer | `01002b21e5c6cb57d391c685adcbc05f03885b38`; explicitly assigned host operator, exact-byte/hash verification PASS, 5 preserved inputs and 16 committed dependencies |
| Targets / owner | Existing accepted foundation boundaries; requesting user approves new design-derived targets and cost. Proposed SKUs/capacity/egress/access/deviations are not accepted merely by appearing in S001 |
| Write ownership | Only `delivery/releases/WP-001/feasibility.md` |
| Output contract | Resource-by-resource exact published AVM references/versions/source URLs, parameter/property/output contracts needed by S001, API/service/version restrictions, identity/RBAC/DNS/dependency ownership, native gaps and explicit feasibility disposition |
| Requested checks | Verify actual published source/contracts rather than guessed module names. Assess private AKS/ACR, explicit pools/upgrade envelope/Cilium/Workload Identity/NAP, Firewall with NAT, VPN/resolver/private DNS, certificates/Key Vault/private endpoints/LB and diagnostics. Check API incompatibilities, required service tiers and dependency cycles |
| Additional design gaps | Resolve or identify the exact supported Gateway API/controller/tooling contract and add-on pod request inventory. Do not silently install Kubernetes releases or choose an unapproved new platform/service |
| Read-only / forbidden | All other source and review files. No Bicep resources/modules/parameters generated, deployment, Azure subscription/account/resource queries, validation/what-if, tenant/identity changes, browser windows, pipelines, commits/push or onward delegation |
| Research | Official public documentation, published AVM source/registries and generic public technical queries only; no private/repository material sent externally |
| Review ownership | Return exact blockers/corrections to architect through parent; independent technical/security/compliance reviewers later assess the frozen complete design. This is not design approval |
| Loop / limits | `WP001-F04-AVM`, maximum 5 total attempts; attempt 1 BLOCKED before agent turn. User explicitly resumed coordinated WP-001 on 21 October 2026; attempt 2 reserved, 2 used / 3 remaining. One scoped feasibility execution, report actual tool failures/unverified contracts; no hidden retries or fresh loop on revision |
| Time / cost | No user-set AI-credit/time ceiling; no Azure spend. Do not infer unavailable tool/model/charge accounting |
| Stop / handoff | Accept/reject fixed inputs; stop after feasibility report or genuine blocker. List exact outputs, source/access dates, checks/consumption, unresolved findings and next owner. Preserve writer-stopped acknowledgement |

AVM versions verified here are proposed pins for a future approved release.
They do not authorise generating infrastructure or provisioning resources.

## Resumed Invocation

- Same fixed S001 inputs and sole output ownership; no changes to preserved bytes.
- Current operational model policy: `AGENTS.md` and
  `docs/delivery/agents-and-skills.md` at
  `5ecf21c2e8333b83c176073b02fece55c9a16f62`. This supplements the older
  operational-policy copies in S001 without changing its workload baseline.
- Classification HIGH; chosen model `gpt-6.1-sol`. Record actual runtime model if
  exposed, otherwise `NOT VERIFIED`. No fallback or model-shopping if unavailable.
- Accept or reject the assignment before execution. Check public published module
  source without exposing repository text; no requirement to generate Bicep.
- Record actual checks, unresolved design/contract corrections, source dates,
  attempt consumption and stopped-writing acknowledgement in `feasibility.md`.
  On success update SQL todo `wp001-avm-feasibility` to `done`; on missing
  tools/evidence or unresolved implementability blockers use `blocked` with reason.
  A complete report containing remediable findings does not authorise release.
