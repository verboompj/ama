# WP-001 — workable empty-foundation definition

**21 October 2026 · scope-definition drafting complete · planning direction,
not an integrated design, release, technical PASS or execution approval.**

## 1. Assignment accepted and decision recorded

**ACCEPTED:** [F03-working-definition](assignments/F03-working-definition.md).
Writer: `delivery-coordinator`; sole permitted output: this file. The requesting
user approved the recommendations with **“ok for now go with suggestions, log
them, and make it a workable, non blocking definition.”**

Select **A: empty-foundation qualification for WP-001**, not a farmer demonstration.
**B: an actual application PoC is a later, separately scoped release.**
**C: waiting for a vendor guarantee is not the selected planning path.** If such
a guarantee becomes a mandatory acceptance requirement, this empirical path
cannot meet it; return that conflict to the owner, not an invented guarantee.

The approval accepts the directions below and permits recording them now. It is
**not** approval of an exact expiring campaign, residual risk, integrated
design/plan/cost, Azure access or infrastructure generation. Historical “not
adopted” statements in the inputs predate this planning instruction; they do not
prevent this definition. Conversely, broad planning acceptance does not fill in
missing operational values or retrospectively approve the r1 design.

### Input and evidence boundary

Substantive input reference supplied by the assignment:
**`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`**, specifically WP-001 context,
decisions, ledger, design/cost r1, F04 feasibility, security/compliance
requirements, EP-r2, both method reports and
[the owner handoff](handoffs/F03-ep-r2-review-to-owner.md), with the delivery
contracts and maintained architecture. EP-r2's reviewed identity is SHA-256
`5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b`.
This is a **supplied reference**, not a hash newly computed here.

The technical report accepts the finite historical-observation method; the
security report accepts its presentation with five LOW plan/decision findings.
Neither is full design assurance or a human risk decision. **EP-r2 is unchanged.**
This document supplies direction for later architect integration; it does not
extend the reports' verdicts to a new design or close any F04 finding.

## 2. Outcome, scope and non-goals

**Outcome:** a reviewed, costed, implementable empty non-production foundation,
then a locally validated fixed candidate; only under separate authority, a short
private qualification campaign producing a closed historical evidence record.
Success means evidence of the stated foundation controls and bounded observations
at the recorded times—not a working farmer service or permission for later use.
The initial engineering backlog ends at `locally-validated`.

| In scope for later integrated design | Explicitly out of scope |
|---|---|
| Dedicated new POC resource groups and AKS-owned node group; no reuse/change of existing estate; Sweden Central direction | Existing-estate repair, tenant changes, shared-platform adoption or automatic grants |
| One AKS Standard-mode/paid Standard-tier foundation; explicit system/user pools, CNI Overlay/Cilium, Workload Identity, NAP off | Automatic mode, extra cluster/pools, GPU/Spot/ML compute, business workload capacity claims |
| Private AKS API, ACR and Key Vault direction; approved VPN/device access, DNS, private TLS listener, controlled egress | Public application fallback, public demo, business authentication/UI/API, farmer/adviser journey |
| Platform controllers, TLS-sync, policy/admission and individually approved finite test objects | Business application/backend, any business HTTPRoute/other application Route, business session or app admission—even after a successful campaign |
| Bounded synthetic handshake probes on no more than three approved devices plus one admitted in-cluster probe; minimised protected evidence | Real claimant/case/parcel data, uploads, external data acquisition, entitlement or treasury integration |
| Minimal actionable monitoring, explicit operational/recovery/closure duties and complete cost accounting | Foundry, Search, ML, training/scoring/model calls, data/model pipelines, workflow/release-automation creation or execution |

“Empty” still includes platform pods, keys, administrative identities and telemetry.
Public/synthetic business-data scope does not make those records public.
Private reachability is not authorisation. MFA/activation, least privilege,
protected keys, supported TLS controls, private exposure, egress restrictions,
signed/scanned images and safe evidence handling still apply.

**No production-style HA assurance is requested.** Manual rebuild and a small
single-region footprint are planning directions, not an availability SLA, backup
proof or an invented RTO/RPO. Architect/reviewers must still assess all five
pillars and obtain explicit reduced-resilience/monitoring/security dispositions
(D-HA/D-MON/D-SEC as applicable), including corporate constraints.

## 3. Selected directions versus contracts still to establish

These are engineering instructions for the next approved design work, **not
claims that a particular tool, version, deployment or contract works**.

| Selected planning direction | Required engineering contract / release evidence |
|---|---|
| **AVM first, bounded investigation, narrow native exceptions.** One bounded compatible-published-AVM check for the actual gaps, then propose native Bicep only where the gap remains real | `bicep-engineer` verifies exact published pins/inputs/outputs/defaults; `azure-architect` integrates reviewed, human-approved resource-specific exceptions. One complete AKS resource owner; no duplicate cluster or unsafe partial PUT. Cover managed Gateway enablement (F04-01), certificate-only OpenVPN and complete multi-client revocation (F04-02). No fake AAD values, silent authentication widening, `latest`, NGINX/mesh substitution or endless module hunt |
| **Managed routing is test-only.** Retain the private managed Gateway API direction for empty tests | Establish supported no-Route certificate serving, internal frontend selection, TLS-sync/renewal, admission/bootstrap and allowed customisations before release. If no-Route serving is unsupported, report that concrete blocker and options; do not install a backend/Route to make the test appear successful |
| **Measure fixed configurations during a short campaign; do not assume daily stop/start savings** | Retain the proposed bounds: sys D4as_v5 2/2/2, usr D2as_v5 1/1/2; initial 3 nodes/10 vCPU, steady max 4/12, both-pool surge max 6/18, at most six P10 OS disks. These are unverified acceptance ceilings, not guaranteed enforcement. Fix each measured configuration and any permitted scaling/transition in the design/plan; account for all controllers, probes, init/sidecars, DaemonSets, placements and rollout/deletion overlap |
| **Capacity evidence is staged, not guessed from three users** | AC03-S at design: complete owned schema/method/bounds/thresholds and explicit managed unknowns; AC03-L locally: known candidate requests/placement assertions; AC03-Q live: observed per-node allocatable, requests, pressure, scheduling and peaks. No future app-fit assurance. Fresh regional and family headroom must each cover the full envelope; old 20-vCPU observations are not reservations |
| **Keep lifecycle tests honest** | No routine daily restart premise or financial dependency. Mandatory EP-r2 lifecycle/recovery scenarios remain explicit. Supported startup/upgrade bounds must exist before the relevant operation; autoscaler min/max alone is insufficient. An unavailable restart bound blocks that drill and final qualification, not harmless options drafting. Omitting a required scenario needs a reviewed scope change, not a silent “N/A” |
| **Use consistent Firewall DNS proxy design** | Architect/engineer reconcile node/VNet DNS, Firewall proxy/upstream resolution, private-zone links and VPN resolver path, plus exact OS/add-on/identity/monitoring egress destinations (F04-04). Keep required platform traffic; NAT is SNAT, not filtering. No split DNS enforcement story, wildcard-open egress or recursive dependency cycle |
| **Minimal monitoring with one authoritative owner** | One authenticated collection design and DCR/DCRA writer, exact supported intervals/streams/tables, safe categories, retention/caps, queries, alerts and recipient/response owner (F04-05). Reconcile Activity Log's actual subscription export scope and unrelated-estate/privacy implications; do not claim an RG filter exists. No duplicate collectors or uncosted observability stack |
| **One verified signing/admission stack** | Engineer proposes one supported pinned signing/verifier/admission combination with trust roots/identity policy, digests, provenance/scan rules, fail-closed negatives, installation/upgrade ownership, request footprint and egress. Verify bootstrap/webhook lifecycle feasibility; enumerate managed/bootstrap/test exceptions individually with review/owner/expiry. Gatekeeper alone is not signature verification; no wildcard bypass or permit-on-error (F04-06) |
| **Fix output names, cycles and defaults as engineering work** | Correct literal module consumers to `uri`, `privateIp`, `oidcIssuerUrl` where F04 establishes them; derive/reference only supported node-group/pool/resolver contracts. Split late subnet and issuer-dependent federation ownership to remove cycles (F04-07). Do not return these corrections as repeated user questions |
| **Dispose of previews and secure nested outputs case by case** | Inventory actual APIs and defaults for ACR, Key Vault, LAW, AKS and alerts; select explicit settings matching the inventory/cost. Assess each preview's support/alternative/risk and each dependency's secure key-output behaviour against the no-credential-output requirement. Secure output is neither a plaintext leak nor an automatic waiver; obtain specific reviewed disposition or a verified alternative (F04-08) |

The r1 inventory and estimate are starting inputs, **not reconciled or approved**.
Architect must cost the integrated solution, every native/default/monitoring/
admission consequence, continuously charged access/network/registry/disk/log
resources, transition allowances and closure reserve. Compare a finite campaign
with retained-resource cost; do not carry the r1 198-hour daily-stop scenario or
USD2,030/month recommendation forward as an approved campaign budget or hard cap.
Offer eligibility, usable credit, exclusions, expiry and funding need owner
confirmation. Alerts and ingestion caps do not enforce a currency ceiling.

## 4. Ready engineering queue and dependency boundaries

**Queue only: no downstream task is dispatched or authorised by this document.**
Each execution needs a bounded accepted assignment, fixed inputs, sole writer,
actual run limits and carried counters. Existing findings go back to their owners;
independent reviewers alone disposition fixes.

| ID / owner | Work product and completion target | Depends on / stop |
|---|---|---|
| WD-01 / `delivery-coordinator` with separately authorised accounting owner | Separate honest examination of preservation/attempt accounting; retain actual history and permissible next evidence handling | Independent of recording this definition. This assignment neither reads nor anticipates the parallel maintenance result, prescribes a sixth snapshot nor resets a counter. Work needing new evidence handling must wait for a valid authorised route |
| WD-02 / `bicep-engineer` | One bounded compatible-AVM check; precise remaining gaps, native-exception options, output/dependency/default corrections and full feasibility inventory | Fixed existing inputs and valid assignment/budget. Stop at one check result; no infrastructure, repeated search loop or automatic retry. Carry F04 usage, do not invent a new allowance |
| WD-03 / `azure-architect`, feasibility supplied by `bicep-engineer` | Integrate this direction into a later design/cost revision: every §3 contract, AC03/TLS split, resource graph, egress/DNS, monitoring, roles, signed-image/bootstrap and N-item dispositions | WD-02 and early security/compliance/testability inputs. May prepare bounded options while operational values are unknown; no design release with current contract defects |
| WD-04 / `infrastructure-tester` | Actual acceptance/test plan: exact candidate inventories, clients/probe/fixture provenance, capable legacy controls, evidence, thresholds, lifecycle sequencing, containment and N-01–N-04 tests | WD-03 contracts; parallel preparation only against fixed agreed interfaces. No unverified client pin, executable probe, target self-approval or new snapshot under an exhausted budget |
| WD-05 / `architecture-documenter` | Matching diagrams, staged setup/validation/closure/recovery instructions and limitations | Develop with design; architect accepts technical meaning. No design editing by coordinator/documenter or assurance claims from unrun tests |
| WD-06 / `infrastructure-tester`, `security-reviewer`, `compliance-reviewer` in their own outputs | Full regulated fixed-design feasibility/testability, dedicated five-pillar architecture report and specialist dispositions; retain legal/source/offer/privacy gaps | Same frozen integrated inputs; valid assignments and counters. Prior method passes are inputs, not substitutes. Independent reviews may run together only with disjoint writes |
| WD-07 / `delivery-coordinator`; accepted by `azure-architect` and scoped writer | Actual `development-plan.md`: exact future files/contracts, dependencies, single writers, checks/variants/evidence and finding dispositions | Reviewed design and WD-04–WD-06. This scope queue is not WV04's implementation plan. Obtain exact human design/plan/full-cost approvals, then architect release before any infra generation |
| WD-08 / `bicep-engineer`, then independent assurance owners | Released-scope implementation/author checks; fixed candidate; WV05–14, candidate specialist reviews, architect conformance and matching docs | WD-07 release and separate assignments. Stop at `locally-validated`; no Azure/pipeline permission |
| WD-09 / actual authorised operator and `infrastructure-tester`; requesting user owns operation/risk/cost | Later confirmed context, validation/what-if, separate deployment authority, finite campaign and closed historical record | Local acceptance plus §6 permissions/values and WV15–17. No automatic execution, app admission or next campaign |

`bicep-engineer` remains the **future release-automation author**, only under
separate approval. `application-ai-engineer` and `ml-data-engineer` produce future
application packaging and data/job/scoring contracts in their later packages;
no application or ML implementation/feasibility task is initiated here.
The requesting user is the recorded human operational owner and intended operator;
the **actual executing principal, grants and activation must be bound later**.

## 5. All five LOW findings remain owned, not waived

Labels **N01–N05 below mean report IDs N-01–N-05**. These are pending
plan/decision dispositions, not demonstrated vulnerabilities or false PASSes.
Specify contracts in the design/actual plan before release where they affect
feasibility; execute the corresponding checks only at their stated later gates.

| Finding / accountable writer | Required disposition | Earliest necessary gate / verification |
|---|---|---|
| **N01 / N-01 — `bicep-engineer` + `infrastructure-tester`**, architect integrates | Name observer principal-reference/role/scope, managed controller/Gateway/HPA/PDB/event reads and continuous watch/audit source with continuity proof. ARM Reader alone is insufficient. Align with the single monitoring owner | Role/source contract and feasibility at `design-released`; TLS-L local assertions at `locally-validated`; verify actual effective identity and continuity before opening TLS-Q. Actual principal value belongs before access, not before this draft |
| **N02 / N-02 — `azure-architect` + `infrastructure-tester`** | Separate lifecycle/drill observations from the final **freshly bracketed TLS-Q run after the last transition and mandatory renewal**. Planned watch loss invalidates that run; no last-good resume. Plan enough authorised time for the final run and closure. An unsafe/unavailable restart bound still blocks qualification | Sequence/targets at `design-released`; concrete window/expiry before campaign/drills; live final TLS-Q at `operationally-verified`. Tell owner explicitly that qualification may be unreachable |
| **N03 / N-03 — `infrastructure-tester`** | Define attributable peer alert/close/reset, emitted ClientHello and adjacent same-path TLS1.2 success; distinguish device/LB intermediaries from direct pod path. Unattributed reset, timeout, client crypto refusal or failed legacy fixture remains inconclusive, never rejection PASS | Acceptance rule in actual plan at `design-released`; frozen capable-client/control evidence plan checked at TLS-L; actual observations at TLS-Q. Required SSLv3/1.0/1.1 cannot be declared unsupported therefore passed |
| **N04 / N-04 — `bicep-engineer` + `azure-architect`** | Specify probe self-termination/deadline, no retry/no restart and bounded concurrency independent of API availability; supported Cilium selectors/least privilege. Bind actual P2S source addresses to approved devices at test time. State NSG hold controls device new connections, **not Overlay pod-to-pod probes or existing sessions** | Supported contract at `design-released`, candidate assertions at `locally-validated`; actual source binding, active controls/authority before opening. Live closure verified; unaccounted pod/session is an incident, not containment PASS |
| **N05 / N-05 — `delivery-coordinator` + requesting user** | Record plainly procedural-only separation, possibly the same human in several roles; changed/unseen managed builds may handle synthetic probes **including the in-cluster path**; session/observation limits; results are historical only, not continuing-use assurance | These limitations accompany design approval. **Final exact expiring campaign risk acknowledgement is due before campaign execution/access**, not this scope draft. Reviewer verifies the decision evidence; coordinator cannot supply human acceptance |

## 6. Acceptance targets and gates

Targets for later integration: retain TLS ≥1.2 as the successful observation
minimum; no lower protocol success, insecure verification, untrusted identity or
unexpected routed content is acceptable. EP-r2's bounded method proposes sequential
cases, at most one connection per source/four total, ten seconds per attempt,
three specified repeats per required device/replica case, handshakes or safe
bodyless HEAD only, no credentials/resumption/long-lived sessions. Exact client,
cipher, sandbox, timing and permission contracts must be verified/approved, not
filled with an example tool. No device-by-replica path equivalence is claimed.

For capacity, retain EP-r2's effective per-node calculation, actual allocatable/
reservation reconciliation without double subtraction, pod slots/storage,
init/sidecar semantics and eligible-node DaemonSets. Its proposed 30-minute
readiness then 30-minute stable observation thresholds are **targets for exact
design/plan approval**, not measured results or production SLOs. Actual
drain/upgrade/recovery/reload/alert deadlines and storage margin need owner-approved
values before release of their contracts. No automatic scale, weaker security,
retries or cost increase follows failure.

| Gate / owner | Evidence required to advance | Current disposition / what is not due yet |
|---|---|---|
| **This scope definition / coordinator** | Accepted directions, boundaries, owned engineering queue, N01–N05 and staged approvals recorded | **Drafting complete**. No technical gate awarded; absent campaign values do not block this document |
| **`design-released` / architect; human approves** | Full current-gate feasibility (WV03), integrated design/contracts/criteria (WV01), regulated non-author five-pillar and security/compliance dispositions (WV02), actual architect/writer-accepted plan (WV04), reconciled full cost, required privacy/offer/corporate and scoped exception decisions, exact human design/plan/cost approval | **BLOCKED pending these outputs**, not by missing live observations alone. F04-01/02/04/05/07/08 and signing/admission F04-06 remain open. AC03-S/TLS-S need explicit approval of the narrower design evidence/assurance obligation; otherwise original AC03/TLS release blockers remain binding |
| **`locally-validated` / coordinator on actual independent results** | Fixed implemented candidate; WV05–14, AC03-L/TLS-L including supported TLS properties, private controls/roles/admission/bootstrap assertions, N-item local tests, specialist candidate dispositions, architect conformance and matching documentation | **NOT RUN**. Managed minimum-TLS guarantee is not a static PASS: the exact reviewed narrow WV12 deviation must be approved in the released design; other supported TLS obligations remain. No capacity qualification, deployment or traffic authority |
| **`deployment-ready` / tester + human change owner** | Separately authorised WV15 actual tenant/subscription/cloud/region/identity/scope confirmation; fresh patch/OS/SKU/zone/quota/names/IPAM/private-device readiness; WV16 validate then WV17 inspected what-if; exact deployment candidate/roles/funding/rollback/closure prerequisites | **NOT RUN**. Unsupported/unresolved preview or unexpected existing-estate changes block. Exact executing identity and approved spend/time must exist before the authorised action, not be inferred from discovery |
| **Campaign opening / requesting user + actual operator/tester** | Exact campaign ID, **UTC start/end and absolute UTC expiry**, real operator/tester/observer principal references with effective scopes/MFA/activation, at most three approved devices/source bindings, exact currency and numeric ceiling, remaining usable funded amount, residual-charge/cleanup reserve; approved trust/sandbox/cipher/privacy/retention, containment/stop/restore authorities and final N05 risk acknowledgement | **NOT RUN; values not supplied**. No campaign may start without them. Do not invent numbers, identities, windows or expiry. Separate explicit deployment and drill permissions are required; design/preview approval is not execution authority |
| **`operationally-verified` for this empty scope / tester, specialists, human owner** | Actual deployment record; WV18–22 scoped observed checks; AC03-Q and final TLS-Q after required lifecycle/renewal, complete brackets/continuity and device/LB plus per-replica coverage; actual allow/deny, identity, egress, monitoring, recovery and closure/trust-removal evidence | **NOT RUN**. Required failure/inconclusive case blocks the scoped result. Closure/expiry/change/observer loss ends applicability. A sealed record is historical only; it authorises no app, business Route/session, later managed build or continuing use |

The exact campaign risk decision must reference the approved frozen design/plan
and reviewed EP-r2 method, reasons, controls and expiry, acknowledging empirical
TLS evidence rather than a vendor-backed minimum; possible changed/unobserved-build
probe exposure and surviving in-flight probes until closed; separate device and
pod paths/coverage limitations; NSG new-connection-only reach; procedural role
separation; and historical-only results. The requesting user has **not yet supplied
that exact decision**. Broad planning approval is not an evergreen waiver.
Final authority must last through closure/contingency; expired authority never
permits reopening. Evidence must exclude keys, tokens, kubeconfigs, keylogs,
secret manifests, payloads and broad captures.

No technical finding is waived. Current-gate `FAIL`, `BLOCKED` or `NOT RUN`
prevents that gate; later observations stay pending rather than being demanded
before drafting or declared passed. AI01–AI06/ML01–ML08 execution is not applicable
to the delivered empty-foundation artifact because no app/agent/model/data
capability is supplied; those are later-package obligations, not satisfied checks.
A later app PoC must independently solve continuing-use/managed-change assurance
or obtain its own reviewed explicit scope/risk decision.

## 7. Drafting checks, limits and stopped handoff

- Classification **HIGH**; chosen coordinator model **`gpt-6.1-sol`**; actual
  runtime **NOT VERIFIED** (no authoritative model attestation exposed). No
  conflicting effective override observed, no fallback, model switch or delegation.
- Read assignment, `ama-context`/`ama-handoff`, relevant delivery contracts,
  maintained baseline and substantive inputs listed above. Local file views
  cannot extract Git objects or hash/compare bytes: equality to the supplied
  commit, output SHA-256 and worktree-wide diff are **NOT VERIFIED**. No integrity,
  feasibility or independent-review PASS is claimed from these reads.
- Author-side coverage/readback checks only: outcome and exclusions, all selected
  directions, engineering owners/dependencies, every N finding, stage-specific
  evidence and approval boundaries. No compiler, test suite, Azure/auth query,
  web/browser, resource/manifest/workflow generation, remote workload-model call,
  snapshot, commit, push or downstream assignment was executed.
- **One bounded definition-drafting pass**, not a technical author/review cycle.
  `WP001-F03-AUTHOR` stays **4/5 used, 1 remaining**. Supplied history:
  `WP001-EP-TECH` and `WP001-EP-SEC` each **2/5 used, 3 remaining**;
  `WP001-F04-AVM` **2/5 used, 3 remaining**; snapshot history **5/5 used**.
  No counter or other budget changed; parallel accounting outcome not inspected
  or decided. No new preservation attempt is requested. Every future invocation
  must honour its valid recorded counters; this definition replenishes none.
- Procedural gates/path limits are not host-enforced assurance. No numerical
  inference-credit/time ceiling was supplied or usage accounting exposed; no
  Azure spend authorised/incurred by this drafting activity.

**Offered to parent coordinator:** the definition todo is complete; no missing
operational value prevents this planning deliverable. Engineering/release and
execution blockers remain explicitly assigned above. Parent acceptance and any
future routing are outside this sole-path assignment.

SQL is unavailable; **not applied**. Intended todo update:

```sql
UPDATE todos SET status='done' WHERE id='wp001-working-definition';
```

**STOPPED WRITING after final readback — sole output `definition.md`; no automatic
next phase.**
