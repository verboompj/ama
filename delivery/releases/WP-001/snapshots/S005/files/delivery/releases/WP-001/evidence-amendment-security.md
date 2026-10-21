# Review: WP-001 / EP-r1 alternative evidence-plan method / security-reviewer

Revision: **EP-SEC-r1**, 21 October 2026. Hash: NOT VERIFIED (no hashing tool exposed; the parent or operator must hash this file).

| Field | Value |
|---|---|
| Reviewer / task / review scope | Fresh security-reviewer. Independent security assessment of the proposed evidence **method** only. Not a full design review, vulnerability scan, compliance review or risk acceptance. |
| Accepted assignment / attempt ID | `assignments/F03-amendment-security.md`, **ACCEPTED**. Attempt 1. |
| Target workload gate / check scope | Method suitability for an explicit owner decision. Proposed gates `design-released` (TLS-S/AC03-S), `locally-validated` (TLS-L/AC03-L) and `operationally-verified` (TLS-Q/AC03-Q) are assessed as designed. Runtime evidence is `NOT RUN` and later. |
| Instantiated check/criterion IDs and plan revision | SEC01–12 (mainly SEC03, 05, 07, 08, 09, 10, 11, 12), F04-03/06, AC02/06/10/15, WV08–14 and WV19–21 as referenced. Plan revision EP-r1. |
| Design revision and exact reviewed candidate | Design/cost F03 r1 unchanged. Candidate: preserved `evidence-plan-amendment.md` EP-r1, SHA-256 `7ea29284900e82aed8e747a6d1073db2a0b67c17ff6036430a4ff038722c923c`, as listed by the S003 manifest. |
| Input snapshot ID / producer / manifest reference | S003. Producer: assigned host operator. [Manifest](snapshots/S003/manifest.md): 9 preserved files and 18 immutable references. |
| Review output paths / artifact owner | This file only. Owner: security-reviewer. |
| Stable review/test/validation loop ID / ledger reference | `WP001-EP-SEC`. Ledger row 88. |
| Attempt number / maximum total attempts | 1 / 5 |
| Attempts consumed / remaining / limits reached | **1 used / 4 remaining.** No limit reached. No reset or maker context used. |
| Overall disposition | **FAIL** for EP-r1 as written. See Disposition. |
| Independence / limitations | Non-author. Not the proposal author, and the proposal is not an independent pass. The reviewer shares provider and instruction lineage with other roles only as the routing policy allows; isolation is not asserted. |
| Risk path / approved target owner / non-authorship | Accepted regulated FND-05. The requesting user owns the target, risk and amendment decisions. This reviewer neither waives a finding nor approves. |
| Reviewer context / actual model and tool limits | Chosen model: HIGH `claude-sonnet-5.5`. Actual runtime: **NOT VERIFIED** (no runtime field exposed). No fallback. Tools used: file view/search/create only. |

## Input acceptance

**Accepted:** the S003 preserved EP-r1 copy and the preserved SEC, design, feasibility and author-assignment copies. The preserved author assignment establishes proposal-only authority. The original moving EP-r1 was not used.

Limits:
- I could not recompute the 27 hashes and references. I rely on the host operator's manifest statement and the ledger, which record the same EP-r1 hash.
- I did not open the immutable Git-object dependencies. I used the current working-tree `delivery/workload-checks.md` only to read WV08–14 and WV19–21 wording. The committed S002 copy was not compared.
- No public technical queries were made. The review needed none, and nothing was sent externally.

## Criteria and Evidence

All results are for **document-method adequacy** by non-author inspection. No runtime evidence exists or was requested.

| Criterion | Gate due | Expected result | Method / source | Actual evidence | Result |
|---|---|---|---|---|---|
| M1 TLS ≥1.2 target unchanged; empirical-only assurance honestly framed | design-released (decision) | Target not weakened; no vendor guarantee implied | EP-r1 §2, §6; SEC03; WV12 | Target kept. The proposal says it yields "scoped observations, not a vendor guarantee" and that the owner must accept that, otherwise BLOCKED. The framing is sound. It leaves WV12 ("supported TLS settings meet the minimum") and WV19 unnamed, and TLS-L is reduced to manifest inspection (EP-SEC-07). | **PASS** (framing). Mapping gap: EP-SEC-07. |
| M2 Protocol positive/negative handling and inconclusive results | method design | A negative counts only when the client provably sent the protocol and the server refused it | EP-r1 §6 (L268, L283) | Strong rule: crypto-policy refusal, DNS failure, timeout and generic error are inconclusive, and inconclusive blocks. No criterion defines the positive control or what counts as server rejection. | **FAIL** (EP-SEC-03) |
| M3 SNI / hostname / CA / validity | method design | Correct SNI, separate hostname and trust failures, bounded validity evidence | EP-r1 §6 table | Adequate. Offline revalidation is honestly labelled. Wrong-SNI behaviour and build bracketing are missing (EP-SEC-05, 08). | **PASS with gaps** |
| M4 Replica coverage | method design | Each active proxy replica observed with correct SNI and trust | EP-r1 §6 (L275) | Rule "incomplete = not a pass" is sound, but the access mechanism is undefined and conflicts with other constraints (EP-SEC-02). | **FAIL** (feasibility) |
| M5 Managed-change detection and hold | decision and design-released | A credible contract before the owner accepts "automatic managed changes" | EP-r1 §2, §6 (L283–295) | The proposal defers the contract to reviewers or owner. No signal, latency, hold mechanism or containment is defined (EP-SEC-01). | **FAIL** |
| M6 Private empty-foundation scope and admission | stages 5–7 | No app, claimant or case data, no public path, and admission only after successful fixed-candidate qualification | EP-r1 §2–4 | Scope and sequence are coherent. Ambiguities remain: test objects versus admission (EP-SEC-04) and TLS-Q ordering (EP-SEC-07). | **PASS with gaps** |
| M7 Fail-closed image/signature contract | design-released | F04-06 signature/admission unchanged | EP-r1 §7 | Retained explicitly ("no wildcard workload bypass or permit-on-error"). §2's "bounded platform-only test objects" is not tied to it (EP-SEC-04). | **PASS** (retention). Gap: EP-SEC-04. |
| M8 Safe minimised protected evidence | pre-execution | No secrets; minimal personal data; reviewable integrity | EP-r1 §4 (L160), §6 | Good prohibitions on keys, tokens and bodies. Raw capture, key-log, integrity and retention rules are absent (EP-SEC-05). | **PASS with gaps** |
| M9 Response/approval separation | decision | Separate tester, operator and approver for containment, restore and acceptance | EP-r1 §3, §6, §7 | Tester, operator, reviewer and owner are distinguished. Containment and restore authority and the "preapproved containment plan" are undefined (EP-SEC-06). | **FAIL** (partial) |
| TLS probes, replica access, containment drills, qualification, renewal | later | Observations | — | No run or requested now. | **NOT RUN** (later gates) |
| Vendor-backed minimum-TLS contract; F04-01/02/04/05/07/08; full design, security-design, compliance and plan approvals | later | — | — | Explicitly unresolved, not reviewed here, and not a reason for this FAIL. | **NOT RUN / pending** |

## Findings

No finding below is a demonstrated live vulnerability. No system exists and no obsolete-TLS finding is inferred. All are method-design findings from text inspection, and the labels distinguish them from evidence gaps.

| ID | Severity or evidence-gap class | File/lines or design requirement | Impact / preconditions | Confidence | Owner / resolution / retest |
|---|---|---|---|---|---|
| **EP-SEC-01** | **HIGH (method-design defect)**: decision-critical control undefined | EP-r1 §2 (owner must acknowledge "automatic managed changes and the resulting hold/requalification duty"), §6 L285 (containment) and L290–295 (invalidate/compare/"credible detection-and-hold operating contract"); design L542 ("record impact and retest"); SEC03/09/11 | **Impact:** the owner is asked to accept observational TLS assurance for an add-on that changes itself, while the compensating control is deferred. An unqualified build could serve traffic after an unseen managed change. The only stated check is a digest comparison "before any app admission/use", so it is point-in-time and not continuous. **Preconditions:** a managed upgrade or controller rollout after TLS-Q, with the admission check passed earlier. Missing: signal source, detection latency target, how "hold" is technically enforced (what blocks routes or listener use), and containment that works when local accounts are off, privileges are activated just in time and Kubernetes RBAC is limited. The plan does not mention controlling the timing of auto-upgrade or maintenance channels as a mitigation. | High on the omission. Medium on the impact, because the plan itself says it blocks if no credible contract exists. | **Owner:** azure-architect/engineer, with the requesting user for acceptance. **Remedy (author revision):** state minimum acceptance terms. These are (a) named change signals and checks, (b) maximum undetected-change window, (c) a hold mechanism independent of the possibly affected proxy, with at least one non-Kubernetes lever such as network-level isolation, (d) who may invoke it, with what pre-staged permission and how fast, and (e) the explicit residual-exposure statement for the owner. **Retest:** fresh security re-review of the revised method. A later tester-run containment drill is outside this review. |
| **EP-SEC-02** | **MEDIUM (unimplementable as specified)** | §6 L274–277 (per-replica probe "with same SNI/trust and no new public endpoint"); §4 compute (CNI Overlay); §4 private-VPN-only rule and "no `command invoke` bypass"; §5 probe pods | **Impact:** the replica requirement cannot be met by the specified route and may be silently met by weaker evidence. Overlay pod IPs are not expected to be routable from VPN devices (source: Azure CNI Overlay documentation, not re-verified in this review). Every remaining route has side effects the plan does not assess. A port-forward through the API needs extra pod RBAC. An in-cluster probe pod needs an admitted client image, signing and egress rules. It also tests from a different client and path than the real devices. **Preconditions:** two or more proxy replicas, HPA 2–2 as designed. **Positive:** "incomplete is not a pass" prevents a false pass. | Medium. I did not review live AKS or its docs. | **Owner:** engineer/architect. **Remedy:** name the mechanism, its RBAC, its image provenance and admission treatment, and the client it uses. Say which probe-pod and device observations are required for each replica, and state that a different client or path is a documented limitation. **Retest:** TLS-L feasibility inspection before any deployment, then tester observation at TLS-Q. |
| **EP-SEC-03** | **MEDIUM (evidence-acceptance gap)** | §6 L268 (negative TLS1.0/1.1; "safe local fixture/capability evidence"); L283 | **Impact:** the plan correctly makes inconclusive results block, but gives no acceptance standard for the key positive control. "Safe local fixture/capability evidence" can be satisfied by a statement. The rule that a generic connection error is inconclusive may make the negatives unattainable if the server resets without a protocol alert. Modern default clients usually cannot emit TLS 1.0/1.1, so a special client or build is needed, and the plan does not say where it runs or whether it may be installed on approved devices. **Preconditions:** managed devices with current crypto libraries. | High on the omission. | **Owner:** tester/engineer, with the plan author. **Remedy:** define the control. The client must be shown to complete a handshake at that version against a local fixture. Specify what the ClientHello version evidence consists of. Define server-initiated alert or close after a sent ClientHello as the acceptable rejection signature. Specify the legacy client's provenance and containment, and where it runs. **Retest:** TLS-L client-test prerequisites. |
| **EP-SEC-04** | **MEDIUM (ambiguity touching a fail-closed control)** | §2 (~L46–48, "bounded platform-only test objects"); §5 L186 (bootstrap/probe pods); §7 06 | **Impact:** the qualification needs probe objects and probably a probe image. The text does not say these fall under the same digest, signature and provenance admission rules as business workloads. A reader could treat "platform-only test objects" as an exception class. §7 forbids wildcard bypass, but also leaves the verifier, the exceptions list and the bootstrap-order contract unresolved. There is a dependency loop: TLS-Q needs admitted probe images, while the admission design is itself unresolved. | Medium. | **Owner:** architect/engineer. **Remedy:** state explicitly that probe and bootstrap objects obey the same admission policy or are listed named exceptions with scope, owner and expiry, and that no test-only bypass exists. Pin their images. **Retest:** design-time review, then WV08/11 candidate assertions. |
| **EP-SEC-05** | **MEDIUM (evidence-gap)** | §4 L160; §6 L253 (evidence binding), L283; §8 author checks | **Impact:** the plan prohibits keys, kubeconfig and tokens, but does not address raw packet captures, TLS key-log files, client debug logs and resolver output, all of which hold operator IPs, SNI, certificates and sometimes secrets. It defines no integrity or chain-of-custody for evidence (hash manifest, run ID, tester identity, raw-to-redacted mapping), so a reviewer cannot confirm a redacted result. Build identity is bound at the start but not bracketed. A managed change during the multi-device, three-repeat run could make mixed-build evidence look consistent. **Preconditions:** a managed rollout during testing. | High on the omissions. | **Owner:** tester/security/privacy owner. **Remedy:** require build and digest capture before and after each device run. Ban key-log output. State storage, readers and retention for any capture. Require a hash-bound manifest per run. **Retest:** tester plan review at TLS-L. |
| **EP-SEC-06** | **MEDIUM (separation / containment-authority gap)** | §3 steps 5–7; §6 L285–288; §7 (L332 "Named human operator… preapproved stop/isolation/cleanup permissions") | **Impact:** the "preapproved containment plan" is not defined or expiry-bound. Who can order restore, what counts as "supported approved" configuration, and who re-authorises requalification are open. Stage 6 names an "operator/tester", which could merge the deployer with the independent evidence role, and the requesting user holds the target, risk, cost and deployment approvals. These do not conflict as written, but nothing stops one person from running the test, containing the incident, restoring service and accepting the result. | Medium. | **Owner:** coordinator/requesting user. **Remedy:** a role matrix that separates operator, tester, security assessor and approver for qualification, containment, restore and re-acceptance. Time-bound the preapproved permissions. **Retest:** design/plan review. |
| **EP-SEC-07** | **LOW (ambiguity)** | §2 table row F04-06/TLS; §6 L271; §2 final paragraph; WV12/WV19; `design.md` AC10/AC15 | (a) It is unclear whether the renewal/reload and trust-lifecycle row is part of TLS-Q or optional. A 90-day leaf will renew in operation, so a later unverified renewal path would sit behind an admission that appeared complete. (b) TLS-Q must be the final run after the last lifecycle transition (restart, upgrade). The invalidation list implies this but the sequence does not say so. (c) WV12 requires "supported TLS settings meet the minimum" and WV19 is not named. Owner approval should name them as acceptable-by-observation. | High. | **Owner:** architect. **Remedy:** name the WV mapping. State TLS-Q ordering and scope for renewal. **Retest:** next re-review. |
| **EP-SEC-08** | **LOW (evidence-gap)** | §6 table | Not covered: SSLv3, negotiated cipher and ALPN recording (the target is ≥1.2, so weak ciphers at 1.2 are not examined), wrong-SNI/default-certificate behaviour, and the "outside VPN" attempt, which proves little against a private address. | Medium. | **Owner:** tester. **Remedy:** record the cipher/ALPN observations. Decide explicitly whether to test SSLv3, wrong SNI and non-VPN reachability. Resource inspection is the stronger evidence for "no public frontend". |
| **EP-SEC-09** | **LOW (evidence-gap)** | §4 L157–160; §6 | The private CA trust anchor is installed on three real devices. The plan does not mention name constraints on the CA or removal of the test trust at the end of the stage. This falls under SEC03 and is not reviewed here. | Medium. | **Owner:** security/network owner. **Remedy:** state trust scope and removal in cleanup. |

**Uncertainty (not a finding):** whether the managed Gateway programs and serves a TLS listener when no HTTPRoute is attached, and what HEAD returns. This is untested and should be settled at TLS-L/TLS-Q. The plan already says that an HTTP 200 is not TLS proof.

## Assessment of the requested areas

- **Unchanged TLS ≥1.2 target versus empirical-only guarantee:** suitable to present. The proposal does not weaken the target or imply a vendor guarantee, and it blocks if a vendor-backed guarantee is required. The owner must still decide whether observational assurance is acceptable. That is a risk decision I cannot make.
- **Inconclusive handling and real-client ClientHello capability:** the principle is right and the specification is too thin (EP-SEC-03).
- **SNI/hostname/CA/validity/replica proof:** adequate except for replica mechanism (EP-SEC-02) and build bracketing (EP-SEC-05).
- **Managed-change hold:** the central weakness (EP-SEC-01). Not yet a decision-ready contract.
- **Empty-foundation qualification and admission scope:** coherent. See EP-SEC-04 and EP-SEC-07.
- **Fail-closed image/signature contract:** retained. See EP-SEC-04.
- **Evidence and response/approval separation:** EP-SEC-05 and EP-SEC-06.

## Disposition

**FAIL** for EP-r1 as written, for the method only.

Reason: EP-SEC-01 is an undefined central compensating control that the owner would be asked to accept. EP-SEC-02, 03 and 06 are method elements that cannot be carried out or accepted as stated. They are specification-level problems, not demonstrated vulnerabilities. The direction (empirical, inconclusive-blocking, private, empty-foundation, fail-closed) is acceptable in principle. A revised proposal (EP-r2) addressing EP-SEC-01 to 06, with 07 to 09 handled or recorded, may be re-reviewed. That would be attempt 2 of the same loop, with 3 attempts remaining after it.

This is not a full design security review, compliance review or certification. It does not waive original blockers. F04-01/02/04/05/07/08 and the signature/admission half of F04-06 remain pending and were not the reason for FAIL.

**NOT RUN / later:** all runtime probes, replica access, containment drills, qualification, renewal tests and the vendor guarantee. **NOT APPLICABLE:** none claimed.

**Remaining owner decisions (all absent):**
- Accept or reject observational-only TLS assurance and the managed-change residual risk.
- Approve the target and the criterion split.
- Approve the plan, cost, identity and scope, and authorise any deployment or qualification.
- Decide privacy basis and retention for operator telemetry.
- Decide the trust arrangement for the CA and devices.
- Decide whether to require a vendor-backed guarantee instead (then BLOCKED).

**Downstream artifacts invalidated:** none. This review changes no source.

## Return details

- Report revision: EP-SEC-r1. Hash: NOT VERIFIED.
- Loop `WP001-EP-SEC`: attempt 1 used, **1/5 consumed, 4 remaining**. No resets.
- Model: HIGH `claude-sonnet-5.5` chosen. Actual runtime NOT VERIFIED. No fallback.
- Checks performed: document reading and text search of S003 EP-r1, SEC/design/feasibility excerpts and WV wording. No shell, Azure, live, browser or exploit action. No external queries.
- SQL tool: not exposed to me. Intended statement for the parent: `UPDATE todos SET status='done' WHERE id='wp001-amendment-security'`. The review is complete with a FAIL disposition.
- Stopped writing: this file is the only write. No other file, source or task store was touched.
