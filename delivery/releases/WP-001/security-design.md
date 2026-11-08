# Review: WP-001 / ARM-only r2 design + offered plan / security-reviewer (narrow local-IaC disposition)

Scoped targeted review only. It is not a security certification, live-environment PASS,
compliance verdict, deployment approval or residual-risk acceptance.

| Field | Value |
|---|---|
| Reviewer / task / review scope | security-reviewer; targeted new identity / private exposure / secure-output safety of **local ARM template generation** for the approved r2 foundation |
| Accepted assignment / attempt ID | [assignments/U001-local-iac.md](assignments/U001-local-iac.md); `WP001-SEC-DESIGN` initial attempt |
| Target workload gate / check scope | Local template creation / `locally-validated` criteria (T03–T05, WV05–WV14 as local-only subset). T06–T10 / WV15–WV22 are later and **NOT RUN** |
| Instantiated check/criterion IDs and plan revision | Plan `development-plan.md` r2 (offered), WV08–WV14 local subset, SEC01–SEC12 only as reference for the targeted topics |
| Design revision and exact reviewed candidate | `design.md` r2, supplied SHA-256 `1f7afbb65e84b302f8930b2b2ed0669a5ae6a59e79b074ebd20b625bbd26c375`; `development-plan.md`, supplied SHA-256 `2e0e8f3c52847498db524c8803f93c48ff08197cfaf8c5fd7cf2cb60b22a077f`. Design/plan only; **no Bicep exists to review** |
| Input snapshot ID / producer / manifest reference | `U001-approved-inputs/manifest.json` (parent, integrity `WP001-U001-INTEGRITY` initial 1/5 PASS, 19 files incl. design/plan/cost/F04-r2/F05/requirements) under `/Users/verboompj/.copilot/session-state/ea45f1eb-0d29-42dc-af7f-f9f5959f94f5/files/` |
| Review output paths / artifact owner | `delivery/releases/WP-001/security-design.md` / security-reviewer |
| Stable review loop ID / ledger reference | `WP001-SEC-DESIGN` (ledger line reserved 1/5). Early `WP001-SEC-REQ` 1/5 and `WP001-EP-SEC` 2/5 untouched |
| Attempt number / maximum total attempts | 1 / 5 |
| Attempts consumed / remaining / limits reached | 1 consumed, 4 remaining, no limit reached. `WP001-F03-AUTHOR` 5/5 exhausted: this review requests no sixth author cycle |
| Overall disposition | **PASS — scoped to local ARM template generation and the local-validation gate only** (see Disposition) |
| Independence / limitations | Non-author of design, plan, cost or F04/F05 reports. Same-family/shared-model independence is not proven. Reads only; no commands, no hashing, no Bicep, no Azure |
| Risk path / approved target owner / non-authorship | Current user approval of 8 Nov 2026 ("approva and build iac templates") is the new authority, outside the input set; frozen reports describing "unapproved/BLOCKED" are historical state, not current rejection. Residual-risk acceptance belongs to the human owner (requesting user) |
| Reviewer context / actual model and tool limits | HIGH role default `claude-sonnet-5.5`; actual runtime model **not attested** (no authoritative field). Tools: file view/grep/glob, public Microsoft Learn search. No shell, no hash capability, no SQL write |

## Source and integrity checks

| Check | Result |
|---|---|
| Manifest lists design and plan with the hashes above | Observed; equals the hashes in the assignment |
| Independent SHA-256 of design/plan | **Not possible** (no hash tool). **Reliance** on the parent's integrity PASS. Only a weak corroboration was done: the preserved repository copy and the session copy have identical line counts (design 596, plan 511). That is not byte equality |
| Reviewed text | Read the session copies of design r2 and plan r2 in full, F05 §"Resource, API and interface checks"/findings, ledger rows and the review template |
| Public technical sources | Microsoft Learn search on secure Bicep outputs (guidance: sensitive module outputs are expected to carry `@secure()`); no repo content sent. Role GUIDs in plan §3 compared with my recollection of the public built-in role list, **not** re-fetched; the plan already requires writer/tester to check them against the pinned module mapping |

## Criteria and evidence

| Criterion (targeted) | Gate due | Method / source | Evidence | Result |
|---|---|---|---|---|
| No claimant data, application, authored image, Kubernetes Gateway/Route/Service/TLS/FIC, business store, ML/Foundry in the template set | locally-validated | Design §§2–3,6; plan §2,§3 resource list, WV13 | Explicit zero-count lists; only AKS-managed add-ons enabled; Gateway API/Istio are ARM enablement flags, no listener/LB/IP/DNS record authored. Local candidate does not exist yet | **PASS (design)**; effective-body assertion due at WV13 — NOT RUN |
| Private access path: private AKS API, ACR, KV with public disabled, default deny, no bypass, no admin/anonymous/local accounts, no kubeconfig/command-invoke | locally-validated | Design §§4–6, plan WV10 | Complete, internally consistent; only exposures are three Standard public IPs (Firewall egress, NAT egress, VPN gateway with cert-only OpenVPN) and public ARM/Entra management, all stated. No DNAT, no public fallback | **PASS (design)**; WV10 compiled assertion NOT RUN |
| Control-plane / kubelet / human identities and scopes least privilege | locally-validated | Design §7, plan §3 grant table (7 built-in roles) | See findings S1–S2 for the only broader-than-minimum items. No Owner, Contributor, User Access Administrator, Cluster Admin, vault data role, ACR push, Monitoring Metrics Publisher, FIC, or free role array in the template inputs. Principal types explicit; dedup by (scope, principal, role) | **PASS (design)**; WV11 NOT RUN |
| Public-root certificate inputs only | locally-validated | Design §5/§6, plan parameter contract | Inputs are public Base64 X.509 root data, revocation thumbprints and an SSH public key; no PFX, private key, password, profile or credential output | **PASS (design)**; see condition C3 for the verification that makes this testable |
| Workspace secure nested key outputs not re-exported | locally-validated | Design §2 row 4, §6 LAW row, F05 sensitivity bullet, plan §4 | Accepted disposition is sound for local templates: the keys are `@secure()` module outputs, unused, `disableLocalAuth=true`, root output whitelist excludes them. ARM treats secure outputs as redacted in deployment history; the deployer already holds rights to list those keys, so no privilege gain. Residual: `listKeys` is still invoked by the published artifact (inspection, not exploit) | **PASS with condition C2** |
| Unused-resource defaults / policy / no-estate mutation | locally-validated (defaults); later (RG adoption, policy effect) | Design §6 default overrides, §3 new RGs; plan WV08/WV13 | All known risky defaults named and overridden (ACR bypass/retention/zone, KV premium/deployment flags, LAW CMK/query, firewall DNS/analytics, no AVM telemetry). Azure Policy add-on enabled with zero assignments created; tenant policy must apply normally, no bypass. New RGs only; no peering/reuse | **PASS (design)**; transitive effective-default inspection due WV13 — NOT RUN |
| Can accepted noncompliance / deferred controls be recorded safely for LOCAL templates? | locally-validated | Design §2, §8; plan §2; U001 assignment | Yes. Deferrals are marked NOT RUN/DEFERRED, never PASS; no legal exemption claimed; deployment, keys, devices, cost, identity and actual processing each still need separate permission. They do not alter what a template can express | **PASS** |
| Actual Azure availability / privacy / epoch / actual authority / RBAC propagation / TLS / DNS resolution / egress behaviour | later (T06–T10) | n/a | None executed or required for template generation | **NOT RUN** (due: deployment-ready / operationally-verified; owner user/operator + tester) |

## Findings

No CRITICAL, HIGH or MEDIUM finding. No demonstrated vulnerability. Items below are
independently supported design residuals or verification conditions; none is a missing-
control claim against an artifact, because no Bicep exists yet. None requires a design
change before local generation, and I request no sixth author cycle.

| ID | Severity / class | Design reference | Impact / preconditions | Confidence | Owner / resolution / retest |
|---|---|---|---|---|---|
| S1 | LOW, design residual | Design §4 NSG text (node NSGs: only TCP22 deny from Any at 4000, otherwise Azure defaults; GatewaySubnet has no NSG) | A certificate-authenticated VPN device (≤3) has a routed path to the whole `10.83.0.0/20`. The VirtualNetwork default allow probably covers the P2S pool, so node ports other than 22 (e.g. kubelet, NodePort) may be reachable from it, limited by their own authentication and by there being no authored workload. Needs a compromised or malicious approved device certificate | Medium (service-tag coverage of the P2S pool not independently verified) | Human owner accepts as a recorded residual for the PoC, or later approves a design amendment (allow the pool only to the API PE/resolver/ingress on 443/53 and deny the pool to the node subnets). Verification at T08 is NOT RUN. Not a local-generation blocker |
| S2 | LOW, design residual | Design §7 (Network Contributor at the whole VNet) | Control-plane MI can alter any subnet in the VNet, including Gateway/Firewall/PE subnets, not only the node subnets. Needs control-plane MI token compromise (managed by AKS) | High | Accepted as a documented AKS pattern. If a narrower scope on the two node subnets is wanted it is a design amendment, not required now. WV11 asserts the scope as designed |
| S3 | LOW, later-gate evidence gap | Design §7 "constrained RBAC administration for new RGs only" | The template creates role assignments inside RGs that do not exist at deployment start. Constraining role-assignment authority by "new RG" is not something an ABAC condition can express; the practical options are a subscription-scope role-assignment authority limited by condition to the seven fixed role definitions and principal types (time-bound), or a time-bound broader role. Whichever is used is a separate identity/permission approval; a standing Owner must not be the answer | Medium | Requesting user / authorised operator at WV15 (deployment-ready). NOT RUN. Does not affect generating templates. The template must not grant the deployer anything |
| S4 | LOW, supply chain | Plan §4–5 (public-registry restore, 20 version-tag pins, no lock/digest) | A restored module could differ from what F04/F05 inspected if a tag were ever re-pushed. Restore executes no code; effect is a changed ARM body that tests and what-if would still examine | Medium | Writer/tester record the restored module digests/cache manifest in the evidence at WV08; inspect transitive artifacts, do not fork |
| S5 | LOW, later-gate | Design §3 RG names and fixed resource names | RG create is a PUT: an existing same-named RG would be updated and then deployed into, i.e. silent estate adoption. Name collision is already named a material amendment | High | T06 name check plus T07 inspected what-if must show both RGs as Create, deployment mode Incremental only. NOT RUN, later |

## Conditions bound to the local-validation gate (verification, not new requirements)

These come from the existing plan's assertions; this review only makes them concrete.
Absence at the gate is a current-gate failure; their later runtime counterparts remain NOT RUN.

- **C1 Real values stay out of the repo.** `poc.bicepparam` must obtain tenant, principal IDs, alert email, SSH key and VPN roots from local protected input (for example environment-variable binding), with no real default and no fabricated live value. Synthetic fixtures use `example.invalid`, nonsecret GUIDs and public-only material. Parameters appear in deployment history in clear, so the email/IDs are personal data there. Compliance disposition owns the privacy view.
- **C2 Secure-output non-forwarding.** The compiled root has no output of secureString/secureObject type or any `listKeys`/`listCredential`/`list*` value reaching an output; the root output set equals the whitelist; the only secureString outputs are inside the pinned workspace module; no `@secure()` unwrap into a resource property, tag, log setting or query; no `outputs-should-not-contain-secrets` warning accepted without disposition. Wording in the implementation report must not claim "no `listKeys` anywhere".
- **C3 Public-only certificate/key inputs.** Tests parse each `publicCertData` with Node's built-in `crypto.X509Certificate` from DER (a PFX or key fails that parse; a PKCS#12 and a CER both start with `MII`, so a prefix check is not enough), reject any `-----BEGIN` text or private-key markers in all fixtures and parameters, validate thumbprint format and uniqueness, and check that the SSH value is a public key. No private fixture material in the tree.
- **C4 Role grants.** Seven GUIDs checked against the pinned module mapping or compiled definition IDs (plan already requires it, since the GUIDs are normalised from a corrupted source table); exact tuples, scopes and principal types only; no grant at subscription/RG scope; no Owner/Contributor/UAA/Cluster Admin/data-plane role.
- **C5 No hidden exposure.** Effective bodies show no public ACR/KV/AKS access, no `deploymentScript`, no listener/LB/frontend IP, no FIC, no authored image/Kubernetes object, no `allLogs`/`AllMetrics` default, no extra public IP beyond the three.

## Disposition

**PASS** for the reviewed scope: the r2 design and offered plan are safe enough to
authorise **local Bicep template generation, compilation and local contract tests**, with
conditions C1–C5 enforced at the local-validation gate and S1–S5 carried as recorded LOW
residuals/later checks. This applies to design hash `1f7afbb6…d26c375` and plan hash
`2e0e8f3c…b22a077f` **by reliance on the parent's integrity result**; it does not
transfer to changed bytes.

What this PASS is not: no live security PASS, no certification, no legal/compliance finding
(compliance-reviewer owns its own report), no approval of deployment, Azure validation or
what-if, keys, devices, funded spend, the effective deployer identity, or Microsoft preview
API availability. No bypass of tenant policy or binding legal/contract exposure is
accepted, and none is needed: the deferrals are recorded as NOT RUN/DEFERRED.

Preview APIs (ACR `2025-06-01-preview`, action group, scheduled query), complete-native
AKS/VPN bodies and the secure nested workspace outputs are accepted here only as *planning*
amendments the user has approved; their safety as live behaviour is unobserved.

**NOT RUN / later (owner, gate):** private API/TLS/Entra read over VPN, ACR layer/KV DNS
and reachability, public denial, effective IAM/egress/telemetry (tester + operator,
operationally-verified, WV18–WV22); validate/what-if, name/offer/quota, effective deployer
authority (user/operator + tester, deployment-ready, WV15–WV17); S1/S3/S5 follow-ups above.
Independent tester execution of the local checks and architect conformance are not
replaced by this report. Any later change to identity, exposure, outputs or the
workspace dependency invalidates this disposition for the affected scope.

Stopped writing. No design, plan, Bicep, workflow, requirements or ledger edits; no
commands, Azure, browser, scanner or nested agents.
