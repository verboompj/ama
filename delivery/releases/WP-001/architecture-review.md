# WP-001 / F05 — independent ARM-only r2 technical architecture review

**8 November 2026 · COMPLETE · PASS for the assigned bounded technical design
judgment. `design-released` remains BLOCKED.**

This is a review of a proposed empty infrastructure foundation, not a build,
deployment, capacity observation, security certification or compliance acceptance.
No high-confidence defect requiring a change to the selected resource topology
was established. The outstanding release evidence and decisions below are real;
this scoped PASS does not supply them.

## Review contract and exact evidence

| Field | Record |
|---|---|
| Assignment / reviewer | `assignments/F05-r2-technical.md`, accepted; infrastructure-tester, non-author of design/cost |
| Objective / gate | Bounded five-pillar technical judgment and testability inputs for ARM-only r2; contributes to `design-released`, does not decide that gate |
| Approved review criteria / target owner | Assignment's resource/API/ownership, capacity boundaries, parameters/outputs, private access, credentials/RBAC, minimal monitoring, complete cost/residual and feasible-test criteria; requesting user, FND-01/FND-22/FND-23 |
| Workload acceptance criteria | Frozen design §§2–8, T01–T10. Exact design amendments and numerical observation targets are proposals, not already approved operating thresholds |
| Sole output / owner | `delivery/releases/WP-001/architecture-review.md` / infrastructure-tester |
| Stable loop / ledger | `WP001-TECHNICAL-DESIGN`; reservation checked in `ledger.md` and F05 assignment before evaluation |
| Consumption | Initial **1/5**, **1 used / 4 remaining**. No technical recheck started. EP-TECH remains its separate method objective at 2/5 |
| Author limit | `WP001-F03-AUTHOR` final **5/5 consumed, 0 remaining**. No sixth author correction, renamed objective or replacement writer budget authorised |
| Risk path | FND-05 accepted regulated foundation path retained; today's technical-only assurance objective does not silently replace it |
| Context / model | Separate non-author invocation with fixed inputs; no maker conversation or moving peer report read. Shared host instructions/context are a correlation limitation. Requested/assignment model HIGH `gpt-6.1-sol`; actual runtime model/provider not authoritatively exposed, not inferred from configuration |
| Tool limits | File/range reads, ripgrep, local Python 3.9.6 and anonymous public technical source access available. No delegated agent or SQL task-store tool exposed. No Azure/auth/browser/what-if/deployment operation; no tool installation |

### Fixed input set

Snapshot root:
`/Users/verboompj/.copilot/session-state/ea45f1eb-0d29-42dc-af7f-f9f5959f94f5/files/R2-review-inputs/`.
Manifest `manifest.json`; copies under `files/<source-relative-path>`.
Producer: assigned parent operator. Supplied base commit:
`ebcbba37dae933e1deec3af2a3f15b61d5a3a7a5`.

Independent Python SHA-256 recomputation matched **all 16 preserved files** to
the manifest. Manifest SHA-256:
`d9b66a6d6e49470d8daa3338ef9a716c4ab26b2111ed4dca5619e3f52e43d812`.
This external digest is not inserted into, or hashed recursively by, the manifest.
Frozen bytes were checked again unchanged before report production.

The complete fixed set is:

- `AGENTS.md`;
- `delivery/{handoffs,workload-guidance,workload-checks,multi-agent-framework}.md`;
- `delivery/releases/README.md`;
- `docs/architecture/aks-centered-foundry-architecture.md`;
- `delivery/releases/WP-001/{design,cost-estimate,poc-direction,decisions,context,feasibility,feasibility-gap-options,security-requirements,compliance-requirements}.md`.

Design r2 hash:
`1f7afbb65e84b302f8930b2b2ed0669a5ae6a59e79b074ebd20b625bbd26c375`.
Cost r2 hash:
`62e64af0052db55f424139fd8334e32bfea06f3af7c7fc7373436dfa35b9cf29`.
The manifest identifies every other file hash. No new snapshot was produced or
frozen input altered. Exact original-source preservation, stopped authors,
base-commit attribution and absence of scoped deletions rely on the parent:
this reviewer verified copies, not a fresh source-to-copy preservation operation.
The manifest does not independently document producer tool version or deletions;
the parent should retain those preparation details outside frozen inputs.

Operating-only reads outside that set: assignment/ledger, team guide, five required
repository skills, review/architecture templates, release protocol and AI/ML
catalogue. These were not substituted for fixed workload design evidence.
The concurrent F04-r2 report was neither read nor used as this review's evidence.

## Five-pillar technical judgment

| Pillar | Criterion and fixed evidence | Independent assessment / limits | Result |
|---|---|---|---|
| Reliability | Design §§3–7, FND-14: disposable foundation, explicit owners, dependencies and finite campaign; no approved production HA/RTO/RPO | The complete-native AKS/VPN paths avoid partial PUT ownership. RGs, MI grants, linked custom AKS DNS, final routed node subnets and workspace precede their consumers. Single-zone compute/FW/NAT are a deliberate non-HA choice, not redundant merely because sys has two nodes or VPN is AZ-capable. Rebuild inputs and deletion sequence are credible for no business/PVC state. Allocation, grant propagation and private readiness remain observed later | **PASS**, scoped design judgment |
| Security | Design §§2–7; retained SEC01/02/04–08/12: private management/service path, dedicated estate, no credential outputs, narrow identities | VPN certificate authentication, private resolver and AKS Entra RBAC are correctly distinct. Private ACR includes login and regional layer DNS; KV is empty/private/RBAC. Control-plane network/DNS/MI-operator grants and kubelet AcrPull are separate. No app/publisher/vault data-plane/FIC grant is invented. Firewall application FQDN filtering with Azure DNS/proxy off is coherent without claiming DNS inspection. Shared-domain/Monitor-tag access, Azure platform bypass, device certificate risk and managed-component changes remain residuals for targeted specialist disposition | **PASS**, minimum technical design only; no specialist acceptance |
| Cost Optimization | Cost §§1–5, design BOM: bounded provisioned and variable meters, finite hours, surge and cleanup residuals | Independently reconciled 3 baseline / 4 steady-max / 6 surge nodes/disks and 10/12/18 vCPU; three PIPs, three zones, two customer PEs plus conservative API-PE allowance; no app ILB or separate paid ingress instance selected. Formula/usage/campaign totals reproduce. Firewall dominates; private access is costly even when AKS stops. No free-tier/credit deduction, hard-budget claim or zero-cost rollback. Dated rates and conservative disk/API-PE treatment are disclosed assumptions, not verified billing | **PASS** as a planning estimate, not funding approval |
| Operational Excellence | Design §§6–8, FND-15: one composition root, one collector, limited actionable telemetry and named owner | Exclusive subnet ownership and no second cluster onboarding writer are implementable boundaries. DCR/DCRA, destinations, selected streams, diagnostics, two log queries and scoped failed-ARM alert are specific enough to test. A log cap is not a money cap; absence of samples is not health. Manual daily/start/end checks and residual cleanup are proportionate. Actual file/test inventory, runner versions and protected runbooks remain the coordinator/tester's release work | **PASS** for design/testability; WV04 not completed |
| Performance Efficiency | Design §§4–7: fixed pool limits, pod address space, empirical managed-component fitness later | Address arithmetic is internally valid; Overlay /20 supplies 16 per-node /24 blocks, enough for stated six-node surge. Regional and DASv5 quotas are separate constraints; 18 is not a reserved 20-vCPU allocation. No invented managed requests, application fit or ML capacity is inferred. Proposed 30-minute readiness plus 30-minute stability and telemetry timing require human approval before evaluating a deployed candidate | **PASS** for configuration/envelope design; measured fitness **NOT RUN** |

### Resource, API and interface checks

- **Ownership/dependencies:** two new project RGs; AKS alone owns the node RG,
  pools' generated resources and API PE. VNet AVM parent has no `subnets`
  property in its resource body; optional subnet modules are separate. Omitting
  that input and creating seven exclusive child subnets makes the
  VNet → early FirewallSubnet/NAT → Firewall → UDR → late node-subnet graph
  acyclic. Azure-provided DNS removes the Firewall-IP-to-VNet DNS cycle. This
  source observation does **not** prove provider replay will preserve populated
  subnet state: inspect that at WV17.
- **Native gaps:** fixed F04-GO-r1 supplies published complete AKS
  `2026-03-01` and VPN `2025-01-01` contracts and narrow AVM gaps. r2 preserves
  their selected native fields rather than continuing a module compatibility
  hunt. Inline pool ownership, explicit patch, Manual/NAP-off, private API,
  Cilium/Overlay, MI/WI, selected add-ons and certificate/revocation arrays are
  coherent. Native exceptions and preview APIs still need exact approval.
- **Effective defaults:** independent exact-version source checks confirmed
  VNet/subnet omission behavior; ACR's default trusted-service bypass,
  retention/data-endpoint/zone settings and their required overrides; KV's
  premium/90-day/deployment-enabled defaults and actual `uri` output; LAW's
  `forceCmkForQuery` and secure `listKeys()` outputs; resolver's configured-IP
  input versus name/ID output; Firewall policy DNS/analytics settings; DCR's
  discriminated kind/properties; and scheduled/activity-alert input wiring.
  Remaining pins/publication coverage use the preserved F04 evidence, not a
  fresh independent OCI digest verification of every dependency.
- **Sensitivity:** root output whitelist excludes credentials, kubeconfig,
  VPN profile, private certificates, tokens and workspace keys. Internal
  secure workspace outputs actually invoke `listKeys()` even if not forwarded;
  this is an explicit exception requiring targeted acceptance, not a
  credential-free dependency or a demonstrated plaintext leak. IDs/FQDNs/
  public roots/SSH public keys are not secrets; identities, contacts and
  operational evidence still belong in protected context/evidence.
- **Private audience:** enabling managed Gateway API/app-routing Istio is not
  installing an application Gateway/listener. r2 authors zero Kubernetes
  Gateway/Route/Service/TLS/admission objects and no app LB/IP/DNS/certificate.
  The source's external-LB example applies when a Gateway is created; it is
  not evidence of an automatically deployed listener here. No no-Route,
  legacy-protocol, TLS-renewal or managed-image qualification campaign is
  required to judge this ARM proposal. No usable private application is claimed.
- **Paid/default exclusion:** selected unused Defender, Prometheus/Grafana,
  autoinstrumentation, Sentinel/export, replicas/tasks/cache, business services,
  model jobs and storage drivers are excluded/disabled. Later compiled-property
  inspection must check nested defaults too. Disable direct AVM telemetry where
  supported; don't fork pinned nested dependencies to conceal them.

## Findings, evidence gaps and due gates

These are scoped release/planning inputs, not vulnerabilities or invented
severities for unrun tests. No author-side “integrated” finding closure was
accepted as an independent test result.

| ID / classification | Evidence / impact | Owner and required disposition / earliest gate |
|---|---|---|
| R2-01 — release-path decision gap, high confidence | FND-05 and fixed handoffs risk table require regulated independent design/security/compliance review for these trust boundaries; AGENTS retains non-author/triggered specialist obligations. FND-22 removes certification campaigns as outcomes, not those instructions. Design §2 explicitly acknowledges this conflict | Coordinator routes this technical report and bounded triggered identity/trust/exposure/secrets safety plus compliance-applicability dispositions; requesting user resolves exact retained/deferred criteria/path. **Due design-released; BLOCKED until recorded.** No full legacy campaign, legal exemption or blanket mandatory-controls PASS supplied |
| R2-02 — actual plan/approval evidence gap, high confidence | Design §6 explicitly labels files as future proposals, not an accepted actual plan; T02 requires one. T01 amendments/address allocation and exact design/plan/cost approval are not provided. Operational thresholds remain proposed | Coordinator produces exact inventory/commands/variants/task ownership with writer/architect acceptance; human approves material changes, exceptions, network allocation and fixed release packet. **WV04/T01–T02 due design-released, NOT RUN/pending.** This does not prevent the completed technical judgment |
| R2-03 — module/native mapping planning input, high confidence | Design §7 describes native log-rule `actions.actionGroups`; pinned scheduled-query AVM instead accepts `actions.actionGroupResourceIds` and emits native `properties.actions.actionGroups`. `criterias` is the module input; `criteria` the native property. Logical/native contract spelling must not be passed verbatim to the wrong layer | Bicep writer/actual plan records these mappings; tester asserts final native action group IDs and query criteria. **Due WV08/T05 locally-validated.** Valid mapping exists; no generated implementation defect or topology change asserted |
| R2-04 — execution prerequisites, not current design failures | Exact patch/SKU/zone/service/offer/quotas, effective principal/MFA/grants, device permissions, numeric funded hours/closure/expiry and current usable credit are not proven by old discovery, schema or public prices | User/operator and later tester bind approved protected parameters and authority; WV15 then WV16 then WV17. **T06–T07 deployment-ready: NOT RUN.** No fresh Azure query, live capacity guarantee or procurement campaign demanded for drafting |
| R2-05 — observed foundation/closure evidence absent | Private DNS/API/ACR-layer/KV reachability, public denial, effective IAM/egress, monitoring/query/table availability, managed-pod fit and deletion residuals have not been observed | Authorised operator/tester executes T08–T10 against a real deployment. **Operationally-verified: NOT RUN.** Failed query validation on a cold workspace, missing telemetry/categories or unexpected paid/generated resources must be reported, not bypassed or covered by contingency |

Historical SEC01–SEC12, CR01–CR13 and F04 findings remain preserved.
In particular, F04-03/06 vendor-capacity and app TLS/signature campaigns are not
current infra1 acceptance tests after the proposed exact amendment; their
historical BLOCKED/FAIL states are not rewritten to PASS. F04-07 has a technically
valid proposed interface/ownership resolution; F04-08 retains explicit exceptions.
CR02–04/06/08–09/12 retain actual privacy/entity/contract/policy/funding questions.
This reviewer has not provided competent legal applicability or specialist risk
acceptance. Real permission for administrator/telemetry processing and inherited
controls cannot be waived by calling the PoC non-compliant.

## Criteria/check inventory and testability handoff

| Criteria / catalogue | Expected evidence / actual review result | Gate and status |
|---|---|---|
| Fixed inputs | Exact 16-file manifest/copy coverage and SHA-256 equality; **PASS deterministic** | Current review input |
| T01 / WV01 | Readable complete resource/SKU/region/ownership/interface graph, exclusions and assumptions; textual graph reviewed, no rendered-diagram validation claimed | Technical completeness **PASS judgment**; human amendments/address approval still pending |
| T02 / WV02 | Dedicated independent five-pillar scoped report | **PASS** for this report's assigned judgment |
| T01–T02 / WV03 | Pins/gaps/defaults plus required specialist reconciliation; selected independent source checks and fixed F04 evidence described above | Partial evidence present; final r2 feasibility/specialist dispositions **NOT RUN in this review**, required before release |
| T02 / WV04 | Actual accepted file/dependency/variant/test plan with findings dispositions | **NOT RUN**, design-released; R2-02 |
| T03 / WV05–07 | Restore/build **every scoped root and module**, including modules not reached from root; compile every required parameter variant; inspect warnings separately from exit codes | **NOT RUN**, locally-validated. No candidate exists by scope; root-only build will not satisfy WV05 |
| T03–T05 / WV08–13 | Effective compiled contracts, native/module mappings, grant IDs/scopes, names/tags, complete AKS/VPN fields, exclusive subnet/DNS/UDR/PE owners, private settings and nonsecret outputs | **NOT RUN**, locally-validated. Use released values, synthetic nonsecret fixture and compiled/nested templates, not wrapper grep alone |
| T05 / WV14 | Candidate, required reviews, independent results, matching docs/runbooks and separate architect conformance | **NOT RUN**, locally-validated. Published baseline is not yet an r2 deployment guide |
| T06–T07 / WV15–17 | Confirm actual target/identity/scope/parameter snapshot; authorised validation before inspected preview, including repeated-root/autoscaled-count and estate effects | **NOT RUN**, deployment-ready; no Azure access authorised here |
| T08 / WV18–20 | Deployed inventory; trusted private API/service TLS, VPN/resolver/private DNS and public-denial observations from approved locations | **NOT RUN**, operationally-verified. App-listener subset not applicable to this no-listener scope |
| T09 / WV21–22 applicable | Effective access/egress and DCR/diagnostic/alert signal, approved 15-minute telemetry/email and 30+30-minute readiness/stability observations | **NOT RUN**, operationally-verified; thresholds must be approved before evaluation |
| T10 / WV22 applicable | Authorised campaign closure, residual resource/role/device/evidence inventory and reconciled cost, or funded named retention | **NOT RUN**, operationally-verified. Provisioning/deletion/drills require their own authority |
| AI01–AI06 / ML01–ML08 | No app/API/tool/model/data candidate in infra1 | **NOT APPLICABLE to this delivered ARM design scope**, not a later workload PASS |

The actual plan must pin the local runner/tooling and commands, name every module
and the sole proposed `poc.bicepparam` variant (and any subsequently approved
variant), capture all warnings, and specify acceptance evidence destinations.
Inventory assertions must distinguish customer resources from AKS-generated
children. Validate full retained VPN revocation arrays, exact role-definition IDs,
secure-output non-forwarding, diagnostics/DCR destinations, absence of default
paid features and the actual native alert action mappings.

No statistical/model-quality assessment was performed: no frozen dataset, model
or domain-approved quality thresholds were assigned. Stage 2 must establish
independent statistical/domain competence, locked splits/test protocol, numerical
replay tolerance, quality/calibration/abstention targets and tools before ML
evaluation; lack of capability requires an authorised expert or blocker. Stage 3
must instantiate application/tool-authorisation, safe failure/answer and scoring
integration checks. Infrastructure → ML → application ordering starts neither
later package, and infra success proves no AI/ML acceptance.

## Commands, deterministic results and public sources

Local commands used `python3 -c` with standard-library
`pathlib/json/hashlib`, `ipaddress`, `decimal` and `urllib.request`; Python
**3.9.6** reported by the hash invocation. File/range reads and ripgrep supported
source inspection. No build/restore/linter/parameter compiler was run or installed.
Anonymous public HTTP reads used exact public module paths/versions only.

The hash operation can be reproduced without writing files:

```text
python3 -c 'import pathlib,json,hashlib; p=pathlib.Path("/Users/verboompj/.copilot/session-state/ea45f1eb-0d29-42dc-af7f-f9f5959f94f5/files/R2-review-inputs"); m=json.loads((p/"manifest.json").read_text()); print([(x["file"],hashlib.sha256((p/"files"/x["file"]).read_bytes()).hexdigest()==x["sha256"]) for x in m["inputs"]])'
```

The first location probe omitted the `files/` component and returned
FileNotFoundError/exit 1, before hashing any input. Directory inspection corrected
the read location; the complete verification exited 0 with 16 MATCH results.
No input failure, fix or new technical review attempt occurred.

Independent in-memory `ipaddress` assertions exited 0: all seven subnets are
contained in `10.83.0.0/20`, pairwise disjoint; VNet/pod/service/VPN ranges are
disjoint; configured resolver address is in its dedicated subnet. This proves
neither external overlap approval nor device routing.

Independent Decimal assertions exited 0:
baseline `.56/Hrun`; retained rate `1.957578652968…/Hp`; transition reserve
`5.603945205479…`; usage subtotals **7.295 / 17.885 / 72.95**; fixed campaign
totals **167.83 / 396.07 / 1,837.83** and contingency totals
**216.87 / 503.47 / 2,299.66**; stopped retained fixed month **1,429.03**.
These reproduce cost §§2–4, not prices, billing minimums or consumption.

Official public sources accessed **8 November 2026**, relevant portions inspected:

- [Managed application-routing Gateway API](https://learn.microsoft.com/en-us/azure/aks/app-routing-gateway-api):
  Standard-mode enablement distinct from subsequent Gateway/Service creation;
  managed implementation limitations. No runtime no-listener experiment inferred.
- [Container Insights collection configuration](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-data-collection-configure):
  selected individual streams, DCR/DCRA and schema/collection distinction; fetched
  content presented the enable-monitoring article.
- [Legacy Container Insights authentication](https://learn.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-authentication):
  current managed-identity authentication removes the old Monitoring Metrics
  Publisher requirement. No workspace-key fallback added.
- [Log-alert troubleshooting](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-troubleshoot-log):
  creation/query validation is not proof of future table/data/alert health.
  Q&A search hits were not accepted as authoritative evidence of a cold-workspace
  defect in this design.
- Exact version-tagged public AVM `main.bicep` files, fetched in memory through
  `https://raw.githubusercontent.com/Azure/bicep-registry-modules/avm/res/<path>/<version>/avm/res/<path>/main.bicep`:
  `network/virtual-network:0.10.2`, `container-registry/registry:0.13.1`,
  `operational-insights/workspace:0.16.1`, `network/dns-resolver:0.5.8`,
  `network/firewall-policy:0.3.6`, `key-vault/vault:0.14.2`,
  `insights/data-collection-rule:0.11.0`,
  `insights/scheduled-query-rule:0.6.0`,
  `insights/activity-log-alert:0.4.2`.
  Public source fetches exited 0; no repository content, credentials, context IDs
  or operational records were uploaded. No fresh price-sheet/retail-rate fetch
  or all-pin OCI verification claimed.

## Disposition and stopped handoff

**Assigned technical architecture judgment: PASS; review task COMPLETE.**
**Exact design release: BLOCKED** on R2-01/R2-02 and pending required feasibility/
specialist/approval evidence. The requesting user approves the fixed design,
actual plan and reconciled cost assumptions before architect release and a
bounded Bicep assignment. No blanket assurance campaign is recreated.

Bicep remains the next implementation output **only after that exact release**.
Live/private bootstrap and observations remain authorised later operations, not
fake passes. Stop on any actual local/validation/provisioning defect; do not widen
egress, resize, add features or deploy to make testing convenient.

Any finding requiring changed design returns to the coordinator for escalation:
F03's exhausted author loop prohibits a sixth fix or renamed budget.
This reviewer made no design/cost/plan/requirements/framework edit, generated no
Bicep/manifests/tests/resources, and performed no Azure/auth/live/what-if,
public-browser, nested-agent, commit or push operation.

SQL task-store tool unavailable; **update not applied**. Intended completed-review
update:
`UPDATE todos SET status='done' WHERE id='wp001-technical-review';`

**Stopped writing after this sole report.** No release, deployment, human risk
acceptance, compliance or continuing-use approval is implied.
