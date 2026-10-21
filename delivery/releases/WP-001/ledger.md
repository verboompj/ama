# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `draft` |
| Current activity | Attempt-2 evidence handoff complete; documentation integration confirms F02 discovery/target exit criterion met for bounded F03 options. No onward design started |
| Authorised scope | Repository planning plus read-only subscription assessment; exact refreshed Visual Studio Enterprise - MSFT subscription/tenant confirmed by user on 21 October 2026 |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Context, decisions, assignments, ledger and [subscription assessment](assessment.md); no immutable candidate review reference yet |
| Risk path | Regulated foundation review accepted by requesting user, 21 October 2026; see FND-05 |
| Design release / human approval | Not recorded |
| Azure discovery / validation / deployment | Attempt 1 preserved; [attempt-2 recheck](assignments/F02-recheck.md) PASS for assigned observations, authentication gap resolved; validation/deployment NOT RUN |
| Next owner | Coordinator integrates handoff and separately assigns bounded F03 options to architect; owner decisions/corporate constraints remain explicit for design acceptance |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | done | Discovery/target prerequisites complete for bounded options, including successful attempt-2 permissions/deny/exemption reads; [assessment](assessment.md). Accepted target, dedicated POC groups, owner roles, no-reuse direction and review path retained; no missing current prerequisite identified. Design-specific corporate constraints and exact organisation belong to F03/design acceptance |
| F03-F07 | pending | Their prerequisites and assignments remain pending |

## Decisions and Approvals

| Reference | Decision / disposition | Authority and scope |
|---|---|---|
| User instruction, 21 October 2026 | Bounded foundation scope and decision-record preparation accepted | Repository planning only |
| FND-01 | ACCEPTED | Requesting user confirmed all foundation owner/operator roles and budget ownership in the 21 October 2026 ownership form; independent review remains separate |
| FND-02 / FND-03 | PROPOSED overall; F02 inputs complete | Accepted target and dedicated-group/no-reuse direction retained. [Assessment](assessment.md) records enabled subscription/spending limit, inherited MFA policies, existing estate/providers and successful permissions/deny/exemption reads. Exact organisation/candidate constraints remain F03/design-acceptance work; pipeline identity deferred |
| FND-04 | ACCEPTED | One non-production POC; public/synthetic data only, no real claimant/case data; 21 October 2026 environment form |
| FND-05 | ACCEPTED | Regulated foundation review; infrastructure-tester non-author technical review and scoped security/compliance findings; requesting user retains human approval |
| FND-06 | PROPOSED | Sweden Central regional quota, sampled availability for four VM SKUs/zones and AKS versions observed in [assessment](assessment.md); not a design shortlist or sizing recommendation. Actual sizing, topology/cost, service-specific feasibility and constraints remain unresolved |
| FND-07 | PROPOSED | Dedicated POC VNet subject to corporate approval; exact addressing and overlap checks pending |
| FND-08 | OPEN | Compare private and restricted-public AKS API; no existing private route known; no exposure approved |
| FND-09 | PROPOSED | NAT Gateway selected for POC egress; POC-owned private DNS subject to corporate approval; effective egress controls, DNS integration and costs unresolved |
| FND-10 | PROPOSED | Private-network-only application audience accepted; no domain ready; hostname/TLS options and private access route need design |
| FND-11 | OPEN | Compare private endpoint and restricted-public ACR; identities and connectivity require design |
| FND-12 | PROPOSED | Very small POC, max 3 users; node sizing/scaling and actual workload envelope unresolved |
| FND-13 | PROPOSED | Business/demo hours; no monetary ceiling specified. Supported stop/start, full cost estimate, residual charges and explicit cost approval still required |
| FND-14 | PROPOSED | Manual rebuild acceptable; no HA target requested. Recovery time, data protection and baseline/corporate resilience disposition need design |
| FND-15 | PROPOSED | Basic actionable monitoring; retention/ingestion and baseline-stack disposition pending. No automatic scheduling required now |
| FND-16 | PROPOSED | Naming direction and tag values/coverage accepted in the 21 October 2026 form; canonical values in [FND-16](decisions.md#fnd-16-naming-and-tagging). Exact names, corporate-policy verification, AKS-managed-resource coverage/exceptions, review/expiry and protection remain pending |
| FND-17-FND-19 | OPEN | Later release/execution approvals unresolved; no deployment approval inferred |

## Context Discovery: 21 October 2026

| Action | Result / authority |
|---|---|
| Existing context inspection | User authorised `az account show`; existing context was a different subscription from the intended target |
| Target confirmation | User explicitly rejected the displayed subscription; no target-specific resource queries performed |
| Accessible subscription listing | User authorised `az account list`; it returned only the rejected subscription |
| Stop condition | Intended subscription not present in the current CLI list; target discovery BLOCKED |
| Boundary | No login, browser opening, subscription switch, provider registration, identity/RBAC change or deployment performed |
| Subsequent target decision | User selected the previously displayed Visual Studio Enterprise - MSFT subscription on 21 October 2026; earlier mismatch is resolved at selection level. Refresh/confirm exact context before discovery |
| Confirmed assessment target | Exact refreshed subscription/tenant confirmed by user; pre-query context matched and read-only target queries executed |
| Assessment result | [Attempt 1 report](assessment.md): useful design inputs obtained, but permissions query failed with a cached-account error; no authentication change or retry performed |
| Recheck authority and context | User reports Azure CLI re-authentication and requests resumed assessment; refreshed exact context still matches the previously confirmed subscription/tenant. Attempt 2 reserved; no login or context change performed by the assistant |
| Attempt-2 outcome | Executor independently refreshed context and matched the confirmed target/Enabled state. Permissions, inherited deny assignments and policy exemptions each queried once, all exit zero with empty stderr; one page each, no nextLink. Prior cached-account blocker resolved |
| Remaining boundary | Broad action coverage is not an Owner-role assertion, write proof, condition/PIM/MFA satisfaction, corporate approval or budget/design acceptance. No Azure mutation, formal validation, deployment or data-plane probe |

Full identifiers remain in the authorised interaction rather than public planning
records. This context preflight supplies no workload validation pass and starts no
design/candidate review loop.

## Review / Test / Validation Loops

No workload design/candidate review has started. The prerequisite-assessment loop
below has consumed two attempts. Maximum **5 total attempts**, including the
initial attempt, or a lower assigned limit. Preserve counters across fixes,
snapshots, sessions and reassignment.

| Stable loop ID | Objective / reviewer / gate | Maximum total attempts | Used / remaining | Attempt / fixed inputs / result |
|---|---|---|---|---|
| F02-DISCOVERY | Read-only subscription prerequisites / infrastructure-tester recheck / design inputs | 5 | 2 / 3 | Attempt 1 BLOCKED on input `f9ae67f5b495440db314a99bb37022875714e657`, history retained; attempt 2 completed on `fe983de9444e808388c9815e9414400604e640aa` plus preserved parent assignment/reservation: PASS for bounded read-only scope, authentication gap resolved. [Assignment](assignments/F02-recheck.md), [evidence/disposition](assessment.md#attempt-2-recheck-methods-and-disposition). F02 complete for bounded options; no attempt 3 started |

Same-task integration correction: the initial attempt-2 handoff overclassified
unfinished corporate/design details as F02 blockers. The assessment now traces
the exit criterion to `context.md:76-77` and the existing accepted decision records.
No new current prerequisite is identified. F02 is done and the package returns to
draft for separately assigned bounded F03 options, without corporate, budget,
design-release or deployment approval. No new Azure query, attempt or SQL state
change accompanies this documentation correction; subscription-recheck stays done.

Attempt-2 raw commands, per-command times/exits/errors, exact pre-edit bytes and
SHA-256 manifests are session-local in `foundation-recheck-20261021`; no raw
identifiers or hashes are published here. Copies were byte-verified. Attempt-1
evidence remains unchanged. Assigned output ownership for this recheck is limited
to `assessment.md`, `decisions.md` and this ledger; coordinator retains the assignment.
The report records actual context/tool limits and separates deterministic reads from
judgment; this is not independent workload design/candidate or security approval.

Later WV01-WV22 and application/ML checks remain NOT RUN at their respective gates
as scoped in the assessment. They are not failed current discovery checks.

Documentation author checks on these planning records do not supply workload review
or release evidence. Record future review/test reports and genuine human approvals
against exact inputs. Gate/counter accounting is procedural.

Scoped recheck author checks: PASS for `git diff --check --` on the three assigned
output paths; PASS for all 23 relative Markdown links/anchors and UUID-redaction
checks; PASS for verification of the 30 preserved evidence-manifest entries.
Commands, results and output hashes are retained locally in `author-checks.json`.
Root README and the parent-owned assignment were not edited by this executor.

## Resume and Change Rules

Read this ledger, the accepted decisions and the relevant assignment before resuming.
Verify current input revisions and output ownership. Keep one writer per path.
Uncommitted reviewed inputs need preserved bytes/hashes under the
[snapshot protocol](../README.md#snapshot-protocol); committed inputs use exact
commit/path references. Keep approval/state updates outside frozen input sets.

Changed decisions/design/code invalidate affected evidence. Record the impact,
return defects to the owner, and rerun required checks within the existing loop
budget. Required missing evidence blocks its gate; later checks remain pending.
