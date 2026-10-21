# Assignment: WP-001 / F03 / Early Security Requirements

| Field | Value |
|---|---|
| Package / task / initial cycle | WP-001 / F03 security requirements / 1 |
| Coordinator / specialist | Current CLI coordinator / security-reviewer |
| Authorisation | User's 21 October 2026 coordinated WP-001 instruction; foundation planning and required specialist input before human design/cost approval |
| Gate / risk | Requirements input to regulated foundation design, FND-05; not a candidate vulnerability audit or approval |
| Exact inputs | `01002b21e5c6cb57d391c685adcbc05f03885b38`: `AGENTS.md`, relevant delivery contracts/checks, maintained architecture, and WP-001 `context.md`, `decisions.md`, `assessment.md`, `ledger.md` |
| Target owner / accepted boundaries | Requesting user; existing accepted private application audience, no estate reuse/change, public/synthetic-only data, non-production scope and regulated review path |
| Write ownership / format | Only `delivery/releases/WP-001/security-requirements.md`; concise identified requirements, rationale, threats/trust boundaries, design vs later gate, evidence and accountable human decisions |
| Scope | Private client/operator access, AKS/registry exposure and DNS/TLS, egress (NAT is not filtering), identity/RBAC/federation, MFA/policy limitations, logging, bootstrap/credential handling, supply chain and safe operation. Propose controls without silently selecting architecture |
| Read-only / forbidden | No edits to architect/other reviewers/ledger/decisions. No Azure commands, tenant or resource changes, credentials, browser windows, external repository/private data disclosure, deployment, infrastructure/workflow generation, commits/push or onward delegation |
| Research | Relevant official public guidance using generic technical queries; distinguish retrieved evidence from judgment and unverified corporate requirements |
| Checks / limits | Requirements authoring/check loop `WP001-SEC-REQ`, maximum 5 total cycles; cycle 1 reserved. No fixed-design security verdict yet; later security design review has a separately scoped objective and fixed snapshot |
| Human approval | No risk acceptance, corporate attestation or new owner-approved target inferred. Label any additional control/exception requiring owner decision |
| Time / cost | No user-set AI-credit/time ceiling; no Azure spend authorised. Report actual context/tool limits, not invented enforcement |
| Snapshot / independence | Current inputs committed; output freezes only after stopped-writing handoff and tester preservation. Fresh fixed-design review follows separately |
| Success / stop | Accept/reject assignment, deliver actionable early requirements or blockers and stop. Return exact output path/checks/consumption and next owner; do not review a moving draft |

The parent coordinates integration. A requirements document is not a security
approval, deployment permission or a successful candidate check.
