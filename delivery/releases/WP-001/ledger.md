# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `blocked` |
| Current activity | Read-only prerequisite assessment recorded; effective-permissions evidence blocked |
| Authorised scope | Repository planning plus read-only subscription assessment; exact refreshed Visual Studio Enterprise - MSFT subscription/tenant confirmed by user on 21 October 2026 |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Context, decisions, assignments, ledger and [subscription assessment](assessment.md); no immutable candidate review reference yet |
| Risk path | Regulated foundation review accepted by requesting user, 21 October 2026; see FND-05 |
| Design release / human approval | Not recorded |
| Azure discovery / validation / deployment | Read-only attempt 1 recorded under [F02 assignment](assignments/F02-discovery.md); effective permissions BLOCKED by CLI account-cache error; validation/deployment NOT RUN |
| Next owner | Requesting user/platform owner resolves authentication and authority evidence; coordinator completes F02 within the existing loop budget before assigning F03 |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | blocked | [Assessment](assessment.md) records subscription, policies, providers, quota/SKUs and tools; effective permissions could not be retrieved. Remaining constraints and target decisions stay explicit |
| F03-F07 | pending | Their prerequisites and assignments remain pending |

## Decisions and Approvals

| Reference | Decision / disposition | Authority and scope |
|---|---|---|
| User instruction, 21 October 2026 | Bounded foundation scope and decision-record preparation accepted | Repository planning only |
| FND-01 | ACCEPTED | Requesting user confirmed all foundation owner/operator roles and budget ownership in the 21 October 2026 ownership form; independent review remains separate |
| FND-02 / FND-03 | PROPOSED | Exact target confirmed; [assessment](assessment.md) records enabled subscription with spending limit on, inherited MFA policies, existing resources and provider registration. Effective permissions BLOCKED; reuse and remaining constraints unresolved. Pipeline identity choice deferred |
| FND-04 | ACCEPTED | One non-production POC; public/synthetic data only, no real claimant/case data; 21 October 2026 environment form |
| FND-05 | ACCEPTED | Regulated foundation review; infrastructure-tester non-author technical review and scoped security/compliance findings; requesting user retains human approval |
| FND-06 | PROPOSED | Sweden Central regional quota, four candidate node SKUs/zones and AKS versions observed in [assessment](assessment.md); actual sizing, topology/cost, service-specific feasibility and constraints remain unresolved |
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

Full identifiers remain in the authorised interaction rather than public planning
records. This context preflight supplies no workload validation pass and starts no
design/candidate review loop.

## Review / Test / Validation Loops

No workload design/candidate review has started. The prerequisite-assessment loop
below consumed its initial attempt. Maximum **5 total attempts**, including the
initial attempt, or a lower assigned limit. Preserve counters across fixes,
snapshots, sessions and reassignment.

| Stable loop ID | Objective / reviewer / gate | Maximum total attempts | Used / remaining | Attempt / fixed inputs / result |
|---|---|---|---|---|
| F02-DISCOVERY | Read-only subscription prerequisites / current authorised session / design inputs | 5 | 1 / 4 | Attempt 1 complete; input `f9ae67f5b495440db314a99bb37022875714e657` and confirmed live target; overall BLOCKED by effective-permissions query authentication error; [results](assessment.md). No failed-query retry |

Documentation author checks on these planning records do not supply workload review
or release evidence. Record future review/test reports and genuine human approvals
against exact inputs. Gate/counter accounting is procedural.

## Resume and Change Rules

Read this ledger, the accepted decisions and the relevant assignment before resuming.
Verify current input revisions and output ownership. Keep one writer per path.
Uncommitted reviewed inputs need preserved bytes/hashes under the
[snapshot protocol](../README.md#snapshot-protocol); committed inputs use exact
commit/path references. Keep approval/state updates outside frozen input sets.

Changed decisions/design/code invalidate affected evidence. Record the impact,
return defects to the owner, and rerun required checks within the existing loop
budget. Required missing evidence blocks its gate; later checks remain pending.
