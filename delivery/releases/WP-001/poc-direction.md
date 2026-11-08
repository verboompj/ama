# WP-001 — technical PoC direction and delivery sequence

**8 November 2026 · F03-poc-direction accepted · scope-record pass complete.**
Owner/authority: requesting user, current instruction. This records a new scope
decision, not a design release, implementation plan or Azure execution approval.

## Current decision

The user accepts a **NON-COMPLIANT, non-production PoC for technical validation**:
keep security/compliance requirements and findings as evidence, but drop completion
of regulatory-compliance and security-certification campaigns as PoC deployment
requirements. No compliance, production readiness or legal exemption is claimed.
Deferring a control or campaign does **not** convert its finding into `PASS`.

Select staged delivery: **infrastructure → Azure ML → application/runtime**.
Earlier evidence established foundation/application/ML separation; it did not
establish approval of an exact ML-before-app implementation scope. That ordering
is the **new direction recorded today**. It does not start the later backlog.
One Bicep composition root per infrastructure release composes that release's
resource graph; it does **not** mean one deployment of infrastructure, ML jobs,
models, applications and Foundry runtime together.

## Retained versus deferred

| Retained | Deferred / not required as a PoC assurance objective |
|---|---|
| Existing security/compliance requirements, reports, findings, prior FAILs, method-only dispositions and snapshots remain unchanged reference evidence | Regulatory/security-certification campaigns and claims of full compliance; production/paying-agency assurance |
| Basic safe operations: no secrets in source, prompts, outputs or logs; protect credentials and operational records; public/synthetic business data only, no claimant/case data | Production-scale resilience and broad assurance campaigns beyond the approved technical PoC targets |
| Private, approved application audience; authorised identity/trust/secret/exposure boundaries; dedicated approved PoC resources; no unrelated-estate changes | Completion of historical EP-r2 TLS/capacity qualification campaigns as blanket PoC deployment prerequisites; their methods/findings remain available where relevant |
| Released scoped design, feasible contracts, applicable non-author technical review and triggered specialist checks; honest local and later observed results | Certification is not a substitute for those technical/safety checks, and dropping certification does not drop them |
| Explicit resource, cost and execution authority; inherited policy and actual service/offer constraints | No waiver of binding legal/contract obligations, no permission to weaken inherited controls or incur unauthorised Azure spend |

**Conflict to resolve in the scoped design:** the frozen FND-05/definition records
retain an accepted regulated review path and full specialist prerequisites.
Today's broad non-compliance acceptance changes the PoC assurance objective, but
cannot silently rewrite those release instructions or mark their checks inapplicable.
The architect/coordinator must present the precise scope/criteria disposition and
required review path for owner acceptance. New identity, trust, secrets or exposure
still trigger applicable specialist checks. If removing a requested prerequisite
conflicts with a binding release/safety requirement, report that conflict before
implementation; this record authorises no global framework amendment.

## Three stages

| Stage / owner | Intended outcome and boundary |
|---|---|
| **1 — foundation / `azure-architect`, then `bicep-engineer`** | Finish the bounded empty-foundation technical design and cost reconciliation, then implement its released resource contracts in Bicep. Keep the maintained AKS/private-audience baseline; any simplification is a proposed design change, not selected here. No ML workspace/jobs, business application or Foundry deployment is added by this record. |
| **2 — Azure ML / `ml-data-engineer`** | Separately scope data/features, training and scoring contracts, reproducible packaging/job inputs and outputs, and a versioned scoring-consumer interface. Establish approved data, compute and quality targets before implementation/evaluation. **No acquisition, training, scoring or model jobs now.** |
| **3 — application/runtime / `application-ai-engineer`** | Separately scope the app/API/evidence runtime, scoring adapter, Foundry interfaces, tool/access boundaries and packaging against accepted versioned contracts. **No application implementation or model calls now.** |

Each artifact has one writer; consumers explicitly accept shared contracts.
The app/ML writers supply future packaging/job contracts. The Bicep engineer is
the future release-automation author, only under separate workflow approval.

## Actual next gate and permissions

**Architect next; Bicep is the next implementation output, not the next
unconditional action.** The architect is concurrently finishing its final cycle-5
integration. This pass neither inspects that moving design/cost nor duplicates its
technical reasoning, consumes its attempt, supplies its acceptance or promises a
further cycle. Wait for its stopped output and actual handoff.

Then reconcile this direction against that fixed technical design: feasibility and
required non-author/specialist dispositions, an actual architect/Bicep-writer-accepted
plan, and owner approval of the exact design/plan/reconciled cost precede architect
release and a bounded Bicep implementation assignment. No full implementation plan
is derived here from unsettled contracts. Applicable local builds, parameter/lint/
contract checks and independent review lead only to **`locally-validated`**.

Private access/device/trust permissions, exact resources/identity/context, numeric
funding and operational window are established before their authorised use.
Later Azure validation/what-if, deployment and observed technical checks need
separate authority; they remain **`NOT RUN`**, not passed by this record.
The requesting user is the recorded intended operator and human operational/budget
owner; the actual executing principal and scope must be bound later.

## Evidence, limits and handoff

- Fixed workload evidence: session **T001-inputs/manifest.json**, scope
  `T001-new-user-technical-poc-direction`, base
  `ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`, its **23 exact source/hash pairs**
  and copied `files/<source-relative-path>` inputs. Assignment/user authority is
  outside its own hash set. Retain S001–S005/G001 references and historical
  requirements, EP-r2, technical/security reports and accounting disposition;
  none is extended into acceptance of a new design.
- Checks: manifest coverage and relevant preserved source passages read;
  decision/sequence/safety/gate boundaries checked by the writer. Producer reports
  `WP001-T001-INTEGRITY` initial **1/5 PASS**; hashes were **not independently
  recomputed here**. No independent review or workload validation performed.
- Read-boundary limitation: required repository team/task guides and
  `ama-context`/`ama-handoff` instructions were also read outside the 23-file copy
  set as operating instructions, not new workload evidence. No moving architect
  design/cost or parent ledger was read.
- Routing: **HIGH**, chosen role default **`gpt-6.1-sol`**; actual runtime model
  **NOT VERIFIED** (no authoritative model field exposed). No escalation,
  fallback, model switch or delegation.
- Usage: **one bounded scope-record pass, 1/1 consumed**; not a design-author,
  review, validation or integrity attempt. All other counters remain untouched.
  Gates are procedural, not executable permission enforcement.
- **Record fully done; workload delivery remains pending.** Genuine unresolved
  decision: exact scoped disposition of historical regulated prerequisites versus
  the new technical-only assurance objective, before design release/Bicep.
  Next recipient: coordinator/architect; their acceptance is not claimed here.
- Sole authored output: `delivery/releases/WP-001/poc-direction.md`.
  **Stopped writing.** No other files, requirements, findings, snapshots, ledger
  or framework changed; no code, pipeline, Azure/auth, public/browser, data/model
  operation, commit or push.
- SQL is unavailable; task-store update **not applied**. Intended update:
  `UPDATE todos SET status='done' WHERE id='wp001-log-technical-poc';`
