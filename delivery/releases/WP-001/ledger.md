# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `blocked` |
| Current activity | Renewed user approval resumed author execution. Thirteen files now exist (ten compiling Bicep templates, two synthetic-compiling parameter files and a failing author suite). C001 is preserved; effective contract validation aborted and the author loop is exhausted 5/5. [Implementation](implementation.md) records actual results; no local acceptance, Azure execution or publication |
| Authorised scope | User's coordinated WP-001 instruction, 21 October 2026: progress through required gates; current execution is design, public technical/pricing research and scoped review preparation. Reviewed design/plan and full cost require human approval before implementation; Azure context confirmation and separate deployment approval remain mandatory |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Approved design/cost r2, exact accepted development plan and actual design-release; authored C001 and implementation report remain local/uncommitted. Historical r1 and S001-S005 remain preserved, published at `ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5` |
| Risk path | User's 8 November technical-only assurance amendment FND-22 recorded; old regulatory/security-certification campaigns not requested. Binding FND-05 review/triggered-safety disposition remains explicit, not silently waived |
| Design release / human approval | User approval "approva and build iac templates", 8 November; [actual architect release](design-release.md) and implementer acceptance complete for exact r2/plan local generation only |
| Azure discovery / validation / deployment | Attempt 1 preserved; [attempt-2 recheck](assignments/F02-recheck.md) PASS for assigned observations, authentication gap resolved; validation/deployment NOT RUN |
| Next owner | Coordinator/accountable owner receives C001 and exhausted author-check failure for escalation. No sixth attempt or delegated workaround. Independent acceptance/conformance/docs remain pending; infra -> ML -> app remains staged |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | done | Discovery/target prerequisites complete for bounded options, including successful attempt-2 permissions/deny/exemption reads; [assessment](assessment.md). Accepted target, dedicated POC groups, owner roles, no-reuse direction and review path retained; no missing current prerequisite identified. Design-specific corporate constraints and exact organisation belong to F03/design acceptance |
| F03 | r2 delivered | [ARM-only design](design.md) and [cost r2](cost-estimate.md) offered; final author cycle 5/5 complete. Runtime bootstrap and certification campaigns deferred by proposed scope amendment; prior reports retained |
| F04 | r2 check complete | [Feasibility r2](feasibility-r2.md): no new missing ARM capability; exact composition corrections supplied for plan. Attempt 4/5 consumed, one remaining. No compiled Bicep or live deployment proof |
| F05-F07 | design released; candidate blocked | Actual user approval, implementer acceptance, scoped specialist reports and architect release recorded. C001 compiles but effective author contracts failed, five-attempt limit reached; no independent local acceptance |
| WD definition | delivered | [Definition](definition.md), one coordinator drafting pass, accepted as the scope/owned queue requested by the user. No F03 author cycle, technical test or review PASS claimed |
| Separate maintenance | completed / accepted | Retrospective examination 1/1 retained; subsequently authorised [prospective application](evidence-accounting-resolution.md) accepted in policy review 1/5. No workload verdict, counter reset or new design snapshot |

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
| FND-20 | ACCEPTED for planning | User accepted recommended empty-foundation scope and selected directions, 21 October 2026; [definition](definition.md). No exact expiring campaign, numeric cost or design release approved |
| FND-21 | ACCEPTED prospective application | User explicitly authorised targeted clarification and application; [non-author maintenance review](#maintenance-policy-acceptance) accepted the actual changes. Historical broad 5/5 bucket closed, no sixth execution; five-attempt limits remain for actual logical checks |

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
| WP001-F03-AUTHOR | Foundation design/cost author quality / azure-architect / design inputs | 5 | 5 / 0 | Final cycle 5 delivered ARM-only design/cost r2 and stopped. No sixth correction/reset; independent findings requiring changed design must be escalated |
| WP001-SEC-REQ | Early security requirements / security-reviewer / design inputs | 5 | 1 / 4 | Cycle 1 complete: SEC01–SEC12, manual completeness/readback reported; [accepted handoff](handoffs/F03-security-requirements-to-design.md). No fixed-design verdict |
| WP001-COMP-REQ | Early compliance requirements / compliance-reviewer / design inputs | 5 | 1 / 4 | Cycle 1 delivered CR01–CR13; author matrix checks PASS, legal/version confirmation BLOCKED and independent input-integrity check NOT RUN. Specialist clarified drafting complete and no current requirement unstated due source failure; owner/applicability decisions remain. [Handoff](handoffs/F03-compliance-requirements-to-design.md); no fixed-design approval |
| WP001-DESIGN-SNAPSHOT | Historical broad design-stage preservation bucket, closed completed under FND-21 / no further execution | 5 | 5 / 0 | All five S001–S005 PASS and original contracts retained. No sixth attempt or reset. Accepted prospective adjudication removes only the cumulative-successful-sets administrative gate; legitimate new complete-input preparation uses the clarified protocol and an actual bounded integrity objective, never a renamed failed/exhausted check |
| WP001-COST-ARITHMETIC | Deterministic S001 cost arithmetic / CLI coordinator using local execution / design-input preflight only | 5 | 1 / 4 | Attempt 1 PASS against S001 `cost-estimate.md`: local Node/assert calculation checked 14 fixed-price rows, 14 usage rows, subtotals, 20% contingency, extra node/disk allowances and stopped/full-month-AKS-fee scenarios. Always-on USD 2,322.58; demo USD 1,965.08; full-fee demo USD 2,028.92; stopped fixed residual USD 1,448.08. Does not verify price-source accuracy, service coverage, offer eligibility or cost approval; independent five-pillar cost judgment remains pending |
| WP001-F04-AVM | Published AVM contract/version feasibility / bicep-engineer / design feasibility | 5 | 4 / 1 | Attempt 4 complete, [r2 feasibility](feasibility-r2.md); no new ARM capability gap, offered exact composition/plan corrections. No module hunt, code generation, release or Azure validation; one check attempt remains |
| WP001-DOCS | Matching foundation guide / architecture-documenter / design documentation | 5 | 2 / 3 | Cycle 1 BLOCKED before agent turn on DNS failure; cycle 2 draft delivered against S001 with integrity/basic Markdown author checks PASS. Mermaid parser BLOCKED on `DOMPurify.addHook`; rendering and technical/specialist acceptance NOT RUN. [Accepted draft handoff](handoffs/F03-documentation-draft-to-coordinator.md). HIGH `gpt-6.1-sol` selected before invocation and reported by host metadata; agent-side attestation NOT VERIFIED. Final reconciliation/acceptance pending; no cycle 3 reserved |
| WP001-EP-TECH | Independent evidence-method review / infrastructure-tester / amendment proposal | 5 | 2 / 3 | Attempt 2 PASS for finite test-only method, EP-TECH-01 resolved by withdrawing unsupported continuing-use claim, not atomic prevention. [Current report](evidence-amendment-technical.md) SHA-256 `893ac2774d8e465f02b3a277bd90967bdae2d9787f9f2932492a38c254c5aa9c`; S005/S004 integrity independently checked. Attempt-1 FAIL retained unchanged. No attempt 3 reserved |
| WP001-EP-SEC | Independent evidence-method security review / security-reviewer / amendment proposal | 5 | 2 / 3 | Attempt 2 PASS for narrower method suitable for explicit owner decision; EP-SEC-01–09 resolved at method level, five LOW N-01–05 plan/decision items retained. [Current report](evidence-amendment-security.md) SHA-256 `8f5c2fd14f057bc4d36e97887e3aeac493671cdd943622a4404c96aa5d0e0110`; producer/read limitations explicit. Attempt-1 FAIL retained. No owner risk acceptance, live vulnerability or attempt 3 |
| MAINT-WP001-EVIDENCE-ACCOUNTING | Separately authorised maintenance examination of recorded preservation accounting / non-delivery executor | 1 | 1 / 0 | [Examination](evidence-accounting.md) complete: 47 archived/88 dependency entries checked, no numerical correction justified, classification ambiguity retained. No workload preservation/review budget or policy/counter change; no second examination assigned |
| MAINT-EVIDENCE-POLICY-REVIEW | Non-author conformance of explicitly authorised maintenance clarification / parent CLI | 5 | 1 / 4 | Initial review PASS for authorised maintenance scope against six fixed input pairs under [assignment](assignments/MAINT-policy-review.md). Actual policy/application accepted below; no workload gate verdict, second examination or design preservation |
| WP001-GAP-INPUT-INTEGRITY | Integrity of newly accepted definition/contract inputs for bounded gap check / assigned parent host | 5 | 1 / 4 | Initial G001 preparation/check reserved under [assignment](assignments/G001-inputs.md). Distinct legitimate preparation after completed success under FND-21; no sixth execution of the closed historical bucket |
| WP001-T001-INTEGRITY | New user-scope inputs / assigned parent host | 5 | 1 / 4 | 23 source/copy pairs preserved in session `files/T001-inputs`, initial PASS; stopped source authors |
| WP001-R2-INPUT-INTEGRITY | ARM-only r2 review inputs / assigned parent host | 5 | 1 / 4 | 16 stopped source/copy pairs preserved in session `files/R2-review-inputs/manifest.json`, initial PASS. Review assignments specify exact inputs; no new historical-bucket attempt |
| WP001-TECHNICAL-DESIGN | Non-author full technical design judgment, ARM-only r2 / infrastructure-tester | 5 | 1 / 4 | Initial [review](architecture-review.md) complete, PASS for scoped technical judgment. All16 hashes/address/cost arithmetic checked. Design release BLOCKED by actual acceptances and binding path/specialist conflict; no regulatory certification claim |
| WP001-SEC-DESIGN | Narrow local-IaC identity/trust/secret/exposure disposition / non-author security-reviewer | 5 | 1 / 4 | [Scoped report](security-design.md) PASS local authoring only; C1-C5 candidate checks pending, five LOW residual/later items, no demonstrated vulnerability. HIGH claude-sonnet-5.5 requested; runtime unattested, reviewer relied on parent hashing |
| WP001-COMP-DESIGN | Narrow local-IaC scope/applicability disposition / non-author compliance-reviewer | 5 | 1 / 4 | [Scoped report](compliance-design.md) PASS local-only, not certified or legal clearance. HIGH claude-sonnet-5.5 requested, runtime unknown; working-copy review relied on parent preservation. Protected actual-parameter compile remains pending, not synthetic PASS |
| WP001-U001-RELEASE-EVIDENCE | Preserve stopped local release dispositions and verify approved input equality / assigned parent host | 5 | 1 / 4 | Initial PASS: all 18 approved source hashes unchanged (19 files including manifest); three report outputs preserved in session `files/U001-release-evidence/manifest.json`. Parent equality does not claim independent reviewer hashing |
| WP001-RELEASE-READINESS | Architect exact-plan acceptance and local design release, not another author cycle | 5 | 1 / 4 | Initial PASS: [actual release](design-release.md), SHA-256 `93f5298fe7bf378df0c2267f123a448b7a0cd45cf7df42c3d9ba99c793363be9`, preserved by parent after stopped writing. Actual runtime model unknown, requested HIGH gpt-6.1-sol |
| WP001-IAC-AUTHOR-CHECK | Local template generation and author validation / Bicep author parent session on renewed approval | 5 | 5 / 0 | [Actual attempts](implementation.md#stable-attempt-accounting-and-stop): initial compile defects corrected; attempts 3-5 all fifteen compiler commands exit 0, effective evaluator still fails, last unresolved ARM map input. C001 thirteen sources and twenty restored AVM digests preserved. FAIL / exhausted, no sixth check or independent PASS |

Implementer accepted the exact plan in [implementer-acceptance.md](implementer-acceptance.md),
SHA-256 `6c30c7f83c0fc3bdfcd9a250b98ea8297f9b01d2f2d90624cc1bc936ab3a9f0c`.
This was one bounded contract acceptance, not another F04 check. Architect release
is now accepted; implementation is authorised by its exact record and the user.
Candidate and protected actual-value/environment checks remain pending.

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

On 21 October 2026 the user subsequently accepted the recommendations for a
**workable test-only definition**. FND-20 records the selected planning directions,
not an exact campaign risk decision or approval of the r1 design/cost. The
[definition](definition.md) keeps final fixed design/plan/cost and narrow evidence
deviation approval at design release; actual campaign identities, funded ceiling,
window/UTC expiry and final expiring risk acknowledgement precede execution.
They are not invented prerequisites of drafting this definition. Existing
technical defects and required non-author reviews remain owned current-gate
prerequisites. FND-21 records the separate maintenance result without rewriting
snapshot history or implying that the earlier push resolves the accounting stop.

## Maintenance Policy Acceptance

The user explicitly selected **"Authorise the targeted clarification and its
explicit application to WP-001"** after the completed examination. The separately
assigned maintenance author stopped its three outputs; the parent, not their
author, reviewed the actual diff and application under
`MAINT-EVIDENCE-POLICY-REVIEW`, **attempt 1/5: PASS for that maintenance scope**.
The prospective disposition is now accepted and FND-21 completed. This is not
technical/security/compliance design acceptance or a human execution approval.

Exact reviewed output SHA-256:

| Output | SHA-256 |
|---|---|
| `delivery/multi-agent-framework.md` | `a706ed500319968e3647136c94edd48baf0547eb92bb082a49512eadd736d0cd` |
| `delivery/releases/README.md` | `a5b535e7fa2a55abddd28a0ee8b45fdad90bfb27fac496e9181489b32f692a32` |
| `evidence-accounting-resolution.md` | `8efcb59002b42511e79282f4d56daa51696d10b1d2bb33dd0ded6bd17f9f76d3` |

Assigned host preservation for this distinct maintenance review retained those
three files, the examination, author assignment and definition under session
`files/maint-evidence-policy-review/manifest.json`. All six source/copy pairs
matched before and after review. Historical workload baseline:
`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`. No S006, complete-design preservation
or new execution of WP001-DESIGN-SNAPSHOT occurred.

The review checked the explicit authority, historical 5/5 retention, absence of
failed-scope resets or per-file/hash/candidate budget loopholes, preserved
five-attempt ceiling and stop-on-PASS, actual integrity obligations and unchanged
independent/human gates. Failed integrity or workload checks still carry their
same budgets over changed inputs. Publication grants neither authority nor
attempts. The policy diff passed whitespace checking; no workload test was run.
Parent/source-author separation is procedural in shared instruction context, not
host isolation or independent human approval.

The historical broad bucket is closed completed with zero remaining; there is no
sixth execution under it. Only its cumulative-successful-preparations
administrative block is removed by this explicit adjudication. New legitimate
preparation still requires stopped complete inputs, an accepted producer
assignment, immutable references or preserved bytes, actual bounded integrity
verification and the normal dependency/approval contract. All existing workload
counters and substantive F04 findings remain unchanged. Changes are local and
uncommitted; the earlier push did not supply this maintenance authority.

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

## Repository Publication Update

The requesting user authorised "push and update repo, including main readme".
The parent updates the root/infra/delivery entry points and current context with
the already recorded C001 status, then publishes the related pending work.
This is documentation/publication only: no sixth author check, source candidate
change, Azure execution or new gate acceptance. The release-guide introduction
now describes the actual local design release; its operating rules are unchanged.
The earlier approved U001 copy remains the exact immutable review input, not the
new navigation text. Historical snapshot bytes and reports are not rewritten.

## Resume and Change Rules

Read this ledger, the accepted decisions and the relevant assignment before resuming.
Verify current input revisions and output ownership. Keep one writer per path.
Uncommitted reviewed inputs need preserved bytes/hashes under the
[snapshot protocol](../README.md#snapshot-protocol); committed inputs use exact
commit/path references. Keep approval/state updates outside frozen input sets.

Changed decisions/design/code invalidate affected evidence. Record the impact,
return defects to the owner, and rerun required checks within the existing loop
budget. Required missing evidence blocks its gate; later checks remain pending.
