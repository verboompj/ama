# Review: WP-001 / local IaC r2 design and plan / compliance-reviewer

Scope: **local Bicep template authoring and compile/test only.** This is a
scoped applicability disposition. It is not legal approval, certification, a
legal exemption, a deployment or spend approval, or a CAP/GDPR/AI Act/NIS2
research campaign.

| Field | Value |
|---|---|
| Reviewer / task / review scope | compliance-reviewer; scoped applicability and safety disposition for creating local infrastructure templates |
| Accepted assignment / attempt ID | [U001-local-iac](assignments/U001-local-iac.md); `WP001-COMP-DESIGN` initial attempt |
| Target workload gate / check scope | Local template creation and compile/test only, before `locally-validated`. WV01–WV04 applicability and obligation-trace aspects only. WV05 onward are tester/writer evidence, not decided here |
| Instantiated check/criterion IDs and plan revision | Applicability dispositions LA01–LA10 below. They trace to CR01–CR13 as *reference*, not as passed checks. Plan: `development-plan.md`, ARM foundation r2 |
| Design revision and exact reviewed candidate | Design r2, SHA-256 `1f7afbb6…d26c375`; plan SHA-256 `2e0e8f3c…2a077f`. **No candidate exists and none was reviewed** |
| Input snapshot ID / producer / manifest reference | Session `files/U001-approved-inputs/manifest.json` (19 listed entries, including `AGENTS.md`). Producer: parent host; its integrity record is `WP001-U001-INTEGRITY` initial 1/5 PASS. Manifest and source-relative-path copies are in the session file area |
| Review output paths / artifact owner | `delivery/releases/WP-001/compliance-design.md`; compliance-reviewer. No other file written |
| Stable review loop ID / ledger reference | `WP001-COMP-DESIGN`; `ledger.md` line 100 |
| Attempt number / maximum total attempts | 1 / 5 |
| Attempts consumed / remaining / limits reached | 1 / 4. No limit reached. No reset. The early requirements loop `WP001-COMP-REQ` stays at 1/5, unchanged |
| **Overall disposition** | **PASS for local template authoring, compile and test scope only, with the binding conditions in §Disposition. NOT certified. No deployment, use or legal clearance given** |
| Independence / limitations | Non-author. I did not author design r2, the plan, or the earlier `compliance-requirements.md` as reviewed here (that report is historical reference only). Shared-model and context blind spots are possible. Actual runtime model is **unknown**: no authoritative model field is exposed. Requested role default is HIGH, `claude-sonnet-5.5`. Not attested |
| Risk path / approved target owner | Accepted regulated FND-05 path. The requesting user is the approved owner and holds the human approvals. No legal, DPO or procurement competence is inferred for them |
| Reviewer context / tool limits | Tools: view/grep/glob/create/edit only. No shell and no hash tool. See Actual checks |

## Applicability basis

The reviewed activity is a person writing and locally compiling Bicep text. The
inputs are synthetic fixtures with a public-only SSH key and public-only CER
material, and `example.invalid` contact values. No Azure resource is created, no
Azure call is made, and there is no real data, job, model, account or claimant
record. The plan states "no Azure authentication is needed for these local
commands." The only external operation planned is Bicep module restore from the
public registry.

Applying a legal duty to the *template text itself* would need a specific
provision, and I did not find one. Most duties in CR01–CR13 attach to
processing, deployment, operation or use of a service. They do not attach to
authoring generic Bicep. The reasoning is mine and is not a legal opinion. Where
I could not establish that a duty applies, this report says "not certified". It
does not say "blocked by unknown law."

## Criteria and Evidence

Result vocabulary: **PASS-local** means the constraint is satisfied by the
fixed design and plan text for the local-authoring scope, as a document review.
It does not mean an executable control has been verified. **FUTURE** means the
item is due at a later gate and is *not* a current blocker. **NOT CERTIFIED**
means no basis exists to certify, and the item is not treated as a block.

| ID | Obligation / control (trace) | Gate | Expected for local scope | Evidence (document review) | Result |
|---|---|---|---|---|---|
| LA01 | **No real personal or contact data in outputs, tests or reports.** Admin Entra IDs, contact email, IPs and activity are personal data once real (CR02, CR04, CR05) | Local | Only synthetic GUIDs and `example.invalid`. Actual principals, contacts and keys supplied locally and never committed. Reports and diagnostics must not echo them | Plan §3 I11 ("never commit actual contacts, principal inventory…") and I12. Plan §5 ("never dump protected environment values"). Design `FoundationInterfacesV2` whitelist excludes "human contacts" | PASS-local |
| LA02 | **No credentials in the repository** (CR05). Public SSH key and CER material only | Local | No private keys, tokens, kubeconfig or workspace keys committed or output | Plan I12 "No private fixture keys". Design r2 §2 allows the workspace AVM's `@secure()` key outputs internally, unused and unforwarded. Whitelisted outputs and local-auth disabled | PASS-local. The secure-output handling is a **security-reviewer** determination, not decided here |
| LA03 | **Processing boundary / EU direction** (CR03) | Local, then deploy | No data is processed locally. The design keeps `swedencentral`, EU telemetry destinations and no Global model processing | Design r2 §2 and plan §2. The module restore from the public registry carries no project or personal data | PASS-local. The transfer and contract assessment for a live deployment is FUTURE (P2) |
| LA04 | **Retention, erasure and rights** (CR04, CR06) | Deploy and operate | Local files hold no personal data, so there is nothing to retain or erase. Log and telemetry retention for the *deployed* service needs owner-chosen durations | Design r2 §2: administrator and telemetry data protection is retained. CR04 records that no schedule exists | NOT APPLICABLE locally. FUTURE (P3). Template defaults are not a legal schedule |
| LA05 | **Lawful basis, notice and DPA for administrator and telemetry processing** (CR02) | Before any authorised deployment or live use | No processing happens when authoring. The basis, notice and contract roles must exist before real operators or alert contacts are processed | CR02 states that no approved legal record was supplied | FUTURE (P1). Not a local blocker |
| LA06 | **Offer, contract and spend eligibility** (CR08, CR09) | Before deployment | Not needed to write local files. Illustrative cost figures are planning assumptions, not a ceiling or credit confirmation | Assignment: "not a spend ceiling or credit/offer confirmation". Plan §6 and design cost disclaimers | FUTURE (P4). The user's approval covers local creation, **not paid execution** |
| LA07 | **NIS2 entity status** (CR12) | Before deployment or operation | It is not known whether any NIS2 regime applies to the real operating entity, and it is not assumed from public payments or the fictional agency. Authoring text triggers no entity duty that I can identify | CR12 and design r2 §2 (applicable law is not erased) | NOT CERTIFIED. FUTURE (P5). Not a local blocker. Not assumed |
| LA08 | **CAP/IACS/AMS, administrative rights, AI Act, accessibility, eIDAS** (CR10, CR11, CR13) | Later case, AI or application packages | The artifact is an empty foundation. It has no entitlement, payment, adverse-action, AI system, public portal or trust service | Design r2 §2 (no application, Foundry, Search, ML, model or workflow). Plan §6 (AI01–06 and ML01–08 not applicable to this empty ARM candidate) | NOT APPLICABLE to local authoring. FUTURE in separate stage-2 and stage-3 releases. AI risk class is **not** assumed from public payments or human oversight |
| LA09 | **Copernicus and data-source licensing, synthetic data** (CR07) | Later ML stage | The local stage acquires no datasets. Fixtures are generated, with no real people, parcels or payment endpoints | Plan §2 (no dataset acquisition). I12 synthetic-only | PASS-local. Source and licence checks are FUTURE and belong to the later ML stage |
| LA10 | **Public-registry restore and tooling** | Local | Restore fetches public Bicep modules only. It sends no project data and needs no Azure authentication. Missing tools are reported, not silently installed | Plan §5 (restore is the only public-registry operation; no `az` fallback or silent install) | PASS-local |

### Required separations

1. **Three-stage separation.** Stage 1 is infrastructure, authoring locally now.
   Stage 2 is ML/data. Stage 3 is application/runtime. Passing this review
   authorises nothing in stages 2 or 3, and a stage-1 pass is not evidence for
   them. Plan §6 and §2 already say this.
2. **No production, entitlement or payment artifacts.** The local work must
   produce no real-farmer data, entitlement decision, payment integration or
   authority artifact. The design excludes them. A reviewer or tester should
   treat any such artifact as a **FAIL** of this scope.
3. **Current PoC objective is explicitly non-compliant and uncertified.** The
   user deliberately accepted a technical non-compliant PoC with no
   certification campaign. This report **gives no legal exemption**. The
   design says applicable law, contracts and policy are not erased. Deferred
   items are NOT RUN or DEFERRED, never PASS.
4. **Historical documents are reference only.** `compliance-requirements.md`
   (CR01–CR13) and its BLOCKED status are preserved. They are not rewritten and
   not marked PASS. The old wording that blocked on missing approvals was a
   statement about its time. The 8 November 2026 user approval now covers
   local creation. It does not cover paid execution and does not turn any CR
   into a PASS.

## Findings

| ID | Classification | Design requirement | Impact / preconditions | Confidence | Owner / resolution / retest |
|---|---|---|---|---|---|
| CD-01 | Evidence gap, **not blocking** | Plan §5 / I11: actual `poc.bicepparam` needs real locally supplied values | The actual-environment compile (WV06) cannot be done without real principal, contact and key values. Synthetic success cannot replace it. Those values are personal data once real | High | Requesting user, locally and protected. The tester reports WV06 actual variant **BLOCKED, not PASS**, if the values are absent. Values must stay out of reports and the repository |
| CD-02 | Advisory | Design r2 §2: key outputs from the workspace AVM | I did not examine deployment-history exposure of secure outputs. It is a credentials-handling question | Medium | security-reviewer (`security-design.md`). Not decided here |
| CD-03 | Advisory | Operational privacy | Alert email, principal IDs and VPN revocation names are administrator personal data when real. Template tags are limited to the accepted values | Medium | Before deployment: minimise tag and alert content and apply protections as CR02 requires |

No current-gate FAIL was found. No finding requires a design change, so the
exhausted `WP001-F03-AUTHOR` loop is not touched.

## Disposition

**PASS, for local-template authoring, compilation and local tests of design r2
under plan r2 only.**

This PASS is conditional on these binding limits. If any is broken, the scope
changes to FAIL:

- Only synthetic compile fixtures are used. No real contact, principal, key or
  certificate value, and no employment, contact or case data, appears in the
  repository, outputs or reports.
- No credentials or private keys are committed.
- No Azure authentication, validation, what-if or deployment happens, and no
  paid resource, ML or Foundry service, browser, workflow, commit or push
  happens under this approval.
- No farmer, entitlement, payment or production artifact is produced.

**Not certified.** I certify no legal compliance for the design or for any
generic Bicep. I have no basis to certify it, and I do not treat that as a block.
Nothing here is a legal exemption, a security approval, a legal sign-off by a
DPO, legal owner or policy owner, or release approval. Those belong to the
human owners.

### Future prerequisites (before authorised deployment or live use; NOT RUN, not local blockers)

| ID | Prerequisite | Owner |
|---|---|---|
| P1 | Controller and processor roles, lawful basis, administrator notice and DPA for operator and telemetry data (CR02) | Requesting user with privacy/legal competence |
| P2 | Transfer, EU Data Boundary exception and support-access assessment for the actual configuration (CR03) | Privacy/legal owner; architect documents the configuration |
| P3 | Retention and deletion schedule per log destination, and an incident and cleanup procedure (CR04–CR06) | Operational owner with privacy/legal owner |
| P4 | Actual corporate address and tenant context, subscription offer and contract eligibility, funded ceiling and window, and authorised executing principal (CR08, CR09, WV15) | Requesting user, procurement and budget owner |
| P5 | NIS2 or other entity applicability decision (CR12) | Requesting user routes it to legal |
| P6 | A separate review at the next gates for any added service or data: later AI, case, CAP, accessibility or eIDAS scope (CR10, CR11, CR13), and Copernicus licensing | Domain and legal owners per stage |
| P7 | Review of the actual candidate against the executable evidence supplied by the tester. This is a **separate review** from this design-scope disposition | Compliance-reviewer after tester manifest |

These need human decisions and procedures that Bicep cannot supply, such as
legal authority, staff responsibilities and DPIA or model governance. I do not
treat them as arbitrary blockers to local drafting.

## Actual checks, limitations and independence

- **Read:** the assignment, the 19-entry manifest, working-tree copies of
  `design.md` (§§1–2), `development-plan.md` (§§1–3, 5–7), and
  `compliance-requirements.md` (assignment record, applicability boundary,
  matrix CR01–CR13), the ledger line 100 and `delivery/templates/review.md`.
  I did not read all of design §§3–9. I did not re-research statutory sources
  and made no web query.
- **Hashes:** this host has no shell or hash tool. I **did not** compute
  SHA-256 of design, plan or any file. The design and plan hashes in the header
  come from the user, the assignment and the manifest. The plan's own table
  gives the same design hash. I rely on the parent's integrity record
  (`WP001-U001-INTEGRITY` initial 1/5 PASS). I also read repository working-tree
  paths and did not compare them byte by byte with the session copies.
  Equality with the fixed approved bytes is a **parent reliance**, not my
  verification.
- **Not run:** no Bicep build, no test, no candidate inspection (none exists).
  This is a document review, not technical evidence.
- **Ledger:** `WP001-COMP-DESIGN` was read as 1/5 reserved. This attempt
  consumes the initial attempt, leaving 4. I did not edit the ledger, because I
  own only this report. The coordinator must record the consumption.
- **Independence:** non-author, but not model-isolated. The actual model is
  unknown. The requested role default is `claude-sonnet-5.5` and is not
  attested.

## Completed, more work and stopping

- **Completed:** the scoped applicability disposition above.
- **More work (others):** the security-reviewer's `security-design.md`;
  architect and Bicep-engineer plan acceptance; the writer's local build; the
  tester's independent checks; the human approvals P1–P6; a later candidate
  compliance review (P7).
- **Todo SQL:** a SQL tool is not available to me. **Intended, not applied:**
  `UPDATE todos SET status='done' WHERE id='wp001-compliance-design';`. The
  review prerequisite is not missing, so `blocked` is not warranted. The parent
  should apply it.
- **Stopped writing.** Only `delivery/releases/WP-001/compliance-design.md` was
  created. No other file, source, requirement, framework or report was changed.
