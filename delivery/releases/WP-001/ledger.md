# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `blocked` |
| Current activity | Both S005 EP-r2 attempt-2 method reviews completed PASS for the explicitly narrower finite, closed, test-only proposal, not owner adoption or a full design verdict. Five LOW plan/decision items retained. Preservation loop exhausted at 5/5; [owner handoff/escalation](handoffs/F03-ep-r2-review-to-owner.md). No further phase, implementation or Azure execution |
| Authorised scope | User's coordinated WP-001 instruction, 21 October 2026: progress through required gates; current execution is design, public technical/pricing research and scoped review preparation. Reviewed design/plan and full cost require human approval before implementation; Azure context confirmation and separate deployment approval remain mandatory |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Context, decisions, assignments, ledger and [subscription assessment](assessment.md); no immutable candidate review reference yet |
| Risk path | Regulated foundation review accepted by requesting user, 21 October 2026; see FND-05 |
| Design release / human approval | Not recorded |
| Azure discovery / validation / deployment | Attempt 1 preserved; [attempt-2 recheck](assignments/F02-recheck.md) PASS for assigned observations, authentication gap resolved; validation/deployment NOT RUN |
| Next owner | Accountable human receives the reviewed method and explicit limits. Exact narrowed-scope/risk decision is still absent; exhausted preservation budget and original design blockers remain escalated. No sixth snapshot, approval inferred from PASS or automatic continuation. Full design/plan/cost approval packet is not ready |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | done | Discovery/target prerequisites complete for bounded options, including successful attempt-2 permissions/deny/exemption reads; [assessment](assessment.md). Accepted target, dedicated POC groups, owner roles, no-reuse direction and review path retained; no missing current prerequisite identified. Design-specific corporate constraints and exact organisation belong to F03/design acceptance |
| F03 | draft delivered | [Design](design.md) and [cost estimate](cost-estimate.md) r1 offered, writer stopped; SEC/CR early input integrated. Capacity/cost/deviations are proposals, not accepted targets; exact AVM feasibility and fresh independent review pending |
| F04 | blocked | Attempt 2 delivered F04-r1: published AKS/VPN contract gaps, unavailable add-on footprint and unresolved DNS/monitoring/TLS/signature/defaults. [Accepted findings handoff](handoffs/F04-feasibility-to-architect.md). Prior transport failure is historical; no feasibility pass or infrastructure generated |
| F05-F07 | pending | Required fixed-input reviews and actual implementation plan precede human approval and design release |

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
| WP001-F03-AUTHOR | Foundation design/cost author quality / azure-architect / design inputs | 5 | 4 / 1 | Cycle 4 delivered EP-r2, SHA-256 `5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b`, writer stopped. Proposed narrower test-only assurance and all ten finding dispositions; no independent finding closure, owner acceptance or changed main design/cost. One author cycle remains; no cycle 5 reserved |
| WP001-SEC-REQ | Early security requirements / security-reviewer / design inputs | 5 | 1 / 4 | Cycle 1 complete: SEC01–SEC12, manual completeness/readback reported; [accepted handoff](handoffs/F03-security-requirements-to-design.md). No fixed-design verdict |
| WP001-COMP-REQ | Early compliance requirements / compliance-reviewer / design inputs | 5 | 1 / 4 | Cycle 1 delivered CR01–CR13; author matrix checks PASS, legal/version confirmation BLOCKED and independent input-integrity check NOT RUN. Specialist clarified drafting complete and no current requirement unstated due source failure; owner/applicability decisions remain. [Handoff](handoffs/F03-compliance-requirements-to-design.md); no fixed-design approval |
| WP001-DESIGN-SNAPSHOT | Preserve fixed non-sensitive design-stage inputs / assigned host operator / review integrity | 5 | 5 / 0 | S001–S005 PASS. S005 verified thirteen current source/copy hashes/eighteen immutable references and all thirteen prior S004 preserved copies using Node v25.8.1/SHA-256/Git-object reads; [manifest](snapshots/S005/manifest.md), [assignment](assignments/F03-preserve-ep-r2.md). Preservation budget exhausted; no sixth attempt/reset. Fixed S005 may still be reviewed within independent reviewer budgets; later complete-design preservation is blocked and must be escalated |
| WP001-COST-ARITHMETIC | Deterministic S001 cost arithmetic / CLI coordinator using local execution / design-input preflight only | 5 | 1 / 4 | Attempt 1 PASS against S001 `cost-estimate.md`: local Node/assert calculation checked 14 fixed-price rows, 14 usage rows, subtotals, 20% contingency, extra node/disk allowances and stopped/full-month-AKS-fee scenarios. Always-on USD 2,322.58; demo USD 1,965.08; full-fee demo USD 2,028.92; stopped fixed residual USD 1,448.08. Does not verify price-source accuracy, service coverage, offer eligibility or cost approval; independent five-pillar cost judgment remains pending |
| WP001-F04-AVM | Published AVM contract/version feasibility / bicep-engineer / design feasibility | 5 | 2 / 3 | Attempt 1 BLOCKED before turn on DNS failure; attempt 2 returned FAIL/BLOCKED F04-01 through F04-08, with F04-09 later availability NOT RUN. [Accepted findings](handoffs/F04-feasibility-to-architect.md). HIGH `gpt-6.1-sol` chosen and reported in host metadata; agent-side runtime attestation NOT VERIFIED. No attempt 3 reserved |
| WP001-DOCS | Matching foundation guide / architecture-documenter / design documentation | 5 | 2 / 3 | Cycle 1 BLOCKED before agent turn on DNS failure; cycle 2 draft delivered against S001 with integrity/basic Markdown author checks PASS. Mermaid parser BLOCKED on `DOMPurify.addHook`; rendering and technical/specialist acceptance NOT RUN. [Accepted draft handoff](handoffs/F03-documentation-draft-to-coordinator.md). HIGH `gpt-6.1-sol` selected before invocation and reported by host metadata; agent-side attestation NOT VERIFIED. Final reconciliation/acceptance pending; no cycle 3 reserved |
| WP001-EP-TECH | Independent evidence-method review / infrastructure-tester / amendment proposal | 5 | 2 / 3 | Attempt 2 PASS for finite test-only method, EP-TECH-01 resolved by withdrawing unsupported continuing-use claim, not atomic prevention. [Current report](evidence-amendment-technical.md) SHA-256 `893ac2774d8e465f02b3a277bd90967bdae2d9787f9f2932492a38c254c5aa9c`; S005/S004 integrity independently checked. Attempt-1 FAIL retained unchanged. No attempt 3 reserved |
| WP001-EP-SEC | Independent evidence-method security review / security-reviewer / amendment proposal | 5 | 2 / 3 | Attempt 2 PASS for narrower method suitable for explicit owner decision; EP-SEC-01–09 resolved at method level, five LOW N-01–05 plan/decision items retained. [Current report](evidence-amendment-security.md) SHA-256 `8f5c2fd14f057bc4d36e97887e3aeac493671cdd943622a4404c96aa5d0e0110`; producer/read limitations explicit. Attempt-1 FAIL retained. No owner risk acceptance, live vulnerability or attempt 3 |

The 21 October coordinated continuation authorises the current design/research
and review work. Later implementation, Azure validation, writes, deployment and
observed verification remain conditional on the user's specified approvals.
No application, Foundry, ML, pipeline or engineering-setup maintenance is in scope.
New proposed targets/deviations remain distinguishable from existing accepted
requirements until the human approves the fixed design and implementation plan.

Resumed model-routing authority uses operational policy at
`5ecf21c2e8333b83c176073b02fece55c9a16f62`. S001 retains its older operational
dependencies unchanged as historical evidence; its workload inputs are not
superseded by setup maintenance. Both resumed scopes are HIGH. Documenter cycle 2
is a draft only: final reviewed-design/plan reconciliation and architect technical
acceptance, with affected specialist assertions accepted, remain an explicit
prerequisite of the human approval packet. No release is inferred from draft delivery.

## Evidence-plan proposal authority

On 21 October 2026 the requesting user selected **“Prepare an alternative
evidence plan for independent review”** after the coordinator explained the
capacity/TLS evidence blockers. This authorises one proposal and its independent
assessment only. It does not approve a changed acceptance gate, weaker security,
native exception, design, plan, cost, Azure qualification, deployment or spend.
Existing AC03/F04-03/F04-06 requirements remain in force until an exact reviewed
amendment is genuinely accepted by the accountable owner.

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
