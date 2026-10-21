# Handoff: EP-r2 method reviews to accountable owner

| Field | Value |
|---|---|
| Sender / recipient | CLI coordinator consolidating non-author technical/security reports / requesting user |
| Scope | Evidence-method proposal only; not the full foundation design, implementation plan, cost approval or deployment |
| Fixed reviewed proposal | [S005 manifest](../snapshots/S005/manifest.md); preserved EP-r2 SHA-256 `5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b` |
| Technical output | [EP-TECH-r2](../evidence-amendment-technical.md), SHA-256 `893ac2774d8e465f02b3a277bd90967bdae2d9787f9f2932492a38c254c5aa9c`; PASS for the finite, test-only method |
| Security output | [EP-SEC-r2](../evidence-amendment-security.md), SHA-256 `8f5c2fd14f057bc4d36e97887e3aeac493671cdd943622a4404c96aa5d0e0110`; PASS for presentation of that narrower method, with five LOW plan/decision items retained |
| Acceptance / integrity | Coordinator read both current retest sections and verified returned/current hashes. Both writers stopped; output reports remain uncommitted, not separately preserved as future specialist inputs |
| Independent limits | Technical reviewer verified S005 and S004, 31 hashes each; security reviewer relied on producer integrity and prior SEC/design/feasibility reading, did not review capacity/compliance or immutable dependencies. Parent verified current WV wording equals its immutable dependency |
| Model / context | Same non-author reviewer contexts; host metadata reports technical `gpt-6.1-sol` and security `claude-sonnet-5.5`; agent-side runtime attestation NOT VERIFIED. Shared-instruction/isolation limits remain |
| Budgets | `WP001-EP-TECH` and `WP001-EP-SEC`: 2/5 used, 3 remaining each. `WP001-F03-AUTHOR`: 4/5 used, 1 remaining. `WP001-DESIGN-SNAPSHOT`: 5/5 used, 0 remaining |
| Current state / stop | WP-001 BLOCKED. Method/scope/risk adoption is absent, original F04 findings remain, and no further preservation attempt may run under the exhausted loop |
| Human approval | Not supplied. Neither review constitutes owner approval or risk acceptance |

## Meaning of the two method passes

The original unsupported continuing-use claim was removed, not implemented.
EP-r2 can be presented as a finite empty-foundation test campaign with bounded
synthetic device and in-cluster probes. It permits no business Route/session,
application admission or continuing TLS assurance. Changed/unobserved managed
builds may process a probe; a closed test record remains historical only.
TLS below 1.2 is never a passing observation.

The later application package must independently resolve continuing-use
assurance or obtain its own reviewed, explicit risk/scope decision. These method
passes do not reduce or close that problem. They do not establish deployed
capacity, effective TLS, actual isolation, offer eligibility or successful recovery.

## Five retained security plan/decision items

| ID | Required disposition | Owner / earliest action |
|---|---|---|
| N-01 | Name observer identity/role/scope and continuous watch/audit source and continuity proof | Engineer/tester, actual plan and TLS-L; coordinate unresolved F04-05 monitoring contract |
| N-02 | Define lifecycle-drill versus final fresh TLS-Q campaign boundaries/expiry; keep unavailable restart-bound evidence blocking | Architect/tester, actual plan before qualification |
| N-03 | Define attributable peer alert/reset and adjacent-success/path conditions separately for device/LB and pod paths; unidentified failure remains inconclusive | Tester, client/test plan before TLS-Q |
| N-04 | Specify probe Job self-termination/no-retry/no-restart and bind actual VPN source addresses; NSG hold does not control Overlay pod-to-pod traffic | Engineer/architect, fixed design/plan before execution |
| N-05 | Owner decision explicitly names procedural-only role separation, possible same human, in-cluster probe exposure and historical-only records | Coordinator/requesting user, any actual method/risk decision |

These LOW findings are not demonstrated vulnerabilities and were not waived.
They remain explicit required plan/decision dispositions; no future test is
marked passed.

## Decision that remains unmade

Any actual adoption must name the exact reviewed proposal, finite scope, reasons,
UTC expiry, empirical-only minimum-TLS evidence deviation (WV12/WV19), probe/path
and observation limits, procedural role separation and containment duties.
It must explicitly acknowledge possible changed-build probe exposure, including
the in-cluster path, and that the closed result does not authorise any later
traffic or resolve the application continuing-use problem.

No campaign identity, expiry, cost/funding, exact client/trust/sandbox/cipher,
privacy/retention or execution authority is inferred here. Missing prerequisite
decisions still block their respective gates. Rejecting or not adopting the
proposal leaves the original criteria binding.

## Escalation and work still outstanding

All five snapshot-preservation attempts succeeded, but the recorded logical-loop
budget is exhausted. Independent retests on already-fixed S005 were permitted
within their own budgets; neither supplies a sixth preservation attempt or resets
the existing counters. No new changed-input preservation or subsequent phase is
started. Escalate that limit before any further work needing new preserved inputs.

The main design/cost are still F03 r1. F04-01/02/04/05/07/08 and signature/admission
contracts remain unresolved, and no full five-pillar/security/compliance design
verdict, actual accepted implementation plan or full reviewed cost approval packet
exists. Bicep implementation, context-confirmed validation/what-if, deployment
approval and observed foundation verification remain NOT RUN. Nothing was
deployed, generated as infrastructure, committed or pushed by this continuation.
