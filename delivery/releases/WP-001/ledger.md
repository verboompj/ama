# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `draft` |
| Current activity | Scope/decision preparation |
| Authorised scope | Repository planning records only; user instruction of 21 October 2026 referenced in [context](context.md) |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Working-tree versions of context, decisions, ledger and F01 assignment; no immutable candidate review reference yet |
| Risk path | Regulated foundation review accepted by requesting user, 21 October 2026; see FND-05 |
| Design release / human approval | Not recorded |
| Azure discovery / validation / deployment | NOT RUN; not authorised by this preparation task |
| Next owner | Coordinator prepares the scoped architecture assignment from recorded preferences; resolve or explicitly bound target/policy discovery prerequisites first. Architect proposes access, sizing, cost, recovery and monitoring options; no automatic design release |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | blocked | Ownership, dedicated POC resource groups, public/synthetic-data scope and regulated review path accepted; target subscription selected and no existing platform reported; permissions and inherited constraints unverified |
| F03-F07 | pending | Their prerequisites and assignments remain pending |

## Decisions and Approvals

| Reference | Decision / disposition | Authority and scope |
|---|---|---|
| User instruction, 21 October 2026 | Bounded foundation scope and decision-record preparation accepted | Repository planning only |
| FND-01 | ACCEPTED | Requesting user confirmed all foundation owner/operator roles and budget ownership in the 21 October 2026 ownership form; independent review remains separate |
| FND-02 / FND-03 | PROPOSED | Intended subscription and dedicated POC resource groups selected; no existing platform reported. Exact context/permissions and inherited constraints remain unverified; pipeline identity choice deferred |
| FND-04 | ACCEPTED | One non-production POC; public/synthetic data only, no real claimant/case data; 21 October 2026 environment form |
| FND-05 | ACCEPTED | Regulated foundation review; infrastructure-tester non-author technical review and scoped security/compliance findings; requesting user retains human approval |
| FND-06 | PROPOSED | Sweden Central preference, one-region footprint; availability-zone options/cost, corporate policy, service/SKU availability and quota require assessment |
| FND-07 | PROPOSED | Dedicated POC VNet subject to corporate approval; exact addressing and overlap checks pending |
| FND-08 | OPEN | Compare private and restricted-public AKS API; no existing private route known; no exposure approved |
| FND-09 | PROPOSED | NAT Gateway selected for POC egress; POC-owned private DNS subject to corporate approval; effective egress controls, DNS integration and costs unresolved |
| FND-10 | PROPOSED | Private-network-only application audience accepted; no domain ready; hostname/TLS options and private access route need design |
| FND-11 | OPEN | Compare private endpoint and restricted-public ACR; identities and connectivity require design |
| FND-12 | PROPOSED | Very small POC, max 3 users; node sizing/scaling and actual workload envelope unresolved |
| FND-13 | PROPOSED | Business/demo hours; no monetary ceiling specified. Supported stop/start, full cost estimate, residual charges and explicit cost approval still required |
| FND-14 | PROPOSED | Manual rebuild acceptable; no HA target requested. Recovery time, data protection and baseline/corporate resilience disposition need design |
| FND-15 | PROPOSED | Basic actionable monitoring; retention/ingestion and baseline-stack disposition pending. No automatic scheduling required now |
| FND-16-FND-19 | OPEN | Lifecycle/naming details and later release/execution approvals unresolved; no deployment approval inferred |

## Review / Test / Validation Loops

No workload design, candidate or environment review loop has started. Create a stable
loop row when its assignment and fixed input set are ready; reserve a slot before
execution. Maximum **5 total attempts**, including the initial attempt, or a lower
assigned limit. Preserve counters across fixes, snapshots, sessions and reassignment.

| Stable loop ID | Objective / reviewer / gate | Maximum total attempts | Used / remaining | Attempt / fixed inputs / result |
|---|---|---|---|---|

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
