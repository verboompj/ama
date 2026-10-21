# WP-001 / F03: Early Security Requirements

## Assignment, Scope and Disposition

| Field | Record |
|---|---|
| Assignment | **ACCEPTED**: [F03 security requirements](assignments/F03-security-requirements.md), 21 October 2026 |
| Author / recipient | Security reviewer → coordinator, for architect integration |
| Fixed input reference | `01002b21e5c6cb57d391c685adcbc05f03885b38`: assigned contracts, maintained architecture and WP-001 context/decisions/assessment/ledger |
| Output / ownership | Only `delivery/releases/WP-001/security-requirements.md`; uncommitted, stopped-writing handoff offered; tester preservation pending |
| Gate / risk | Early requirements input, FND-05 accepted regulated **foundation** path; design not yet produced |
| Loop | `WP001-SEC-REQ`, [ledger](ledger.md): reserved cycle 1/5 consumed; **1 used / 4 remain**; no further attempt started |
| Disposition | **PASS for bounded requirements-authoring scope; COMPLETE.** No fixed-design, implementation or security-certification verdict |
| Human authority | Requesting user holds FND-01 owner roles. This record supplies neither legal/risk acceptance nor implementation, cost or deployment approval |

### Boundary authority

- **Accepted owner boundaries:** one nonproduction POC; public/synthetic business
  data only; private-network-only application audience; dedicated POC resource
  group(s), no reuse/change of existing estate; NAT Gateway design direction;
  regulated review path. Existing subscription selection and completed F02 discovery
  are not reopened.
- **Maintained technical baseline, not observed configuration:** AKS Standard,
  explicit system/user pools, CNI Overlay/Cilium, Workload Identity, NAP disabled;
  managed-identity pulls, signed/scanned images, network/pod restrictions and
  observability per architecture §§12–16. Basic monitoring, manual rebuild and
  business/demo hours are owner directions, not approved detailed targets.
- **Open/proposed:** private access route, API/ACR exposure, addressing/DNS, domain/
  trust, filtering mechanism, role grants/bootstrap, retention, recovery targets and
  baseline-stack deviations. Requirements below translate security intent into
  design inputs; **additional controls/options are proposed until human approval**.
  They do not silently select a VPN, firewall, ingress controller, CA, security
  product or full production monitoring stack.

Public business data does not make administrator identities, tokens, kubeconfigs,
certificate keys, infrastructure inventory or security telemetry public. Protect
their confidentiality and integrity. Assume internet attackers, a compromised
operator device, malicious/untrusted container content and a compromised pod;
do not assume a hostile multi-tenant service or production claimant workload.

## Threat and Trust-Boundary Map

| Boundary | Credible threat / prerequisite | Required response |
|---|---|---|
| TB1: user device → private application ingress | Public exposure or misrouted DNS; internal client mistaken for authorised user | SEC02–03: private route, trusted TLS and separate application authorisation contract |
| TB2: operator → ARM / AKS API | Stolen human session, excessive grants, broad API source range | SEC04–06: distinct network and identity decisions, MFA/activation evidence, limited bootstrap |
| TB3: build/source → ACR → kubelet | Mutable/untrusted image or pull credentials; DNS/login succeeds but layer download fails | SEC05, SEC08, SEC10: split push/pull roles, provenance and full pull-path evidence |
| TB4: pod/namespace → other pods / Azure / internet | Compromised pod uses shared identity, lateral movement or unrestricted outbound path | SEC05–07, SEC10: scoped federation, segmentation and effective egress enforcement |
| TB5: platform → secrets / telemetry / retained state | Debug output leaks keys; attacker erases audit trail; stopped service fails to recover | SEC08–09, SEC11: restricted storage/readers, detection and recoverable trusted state |
| TB6: foundation → later case/evidence/AI/scoring/treasury | Future app reuses platform privilege or treats model/text output as authority | SEC12: interface isolation and separately released application/data controls |

These are threat assumptions and prospective requirements, **not demonstrated
vulnerabilities**. Open design choices and absent later tests have no severity.

## Identified Requirements and Design Evidence

All rows require a concrete design disposition before `design-released`: selected
control, accountable owner, safe evidence reference, measurable acceptance and
implementation package. Choices may remain open while drafting, not silently at
release. Architect authors the design; FND-01 human owners approve new targets.

| ID / rationale | Actionable requirement and acceptable choices | Evidence due at design gate / accountable owner |
|---|---|---|
| **SEC01 — protect scope and estate**; TB2/5 | Classify business/demo data separately from identity, credential and telemetry material. Isolate dedicated POC scope; no existing-resource changes or automatic grants. Include managed AKS resources, names/tags and lifecycle boundaries. | Resource/data-flow inventory, classification, scope/dependency map and explicit exclusions; architect + platform/security owner. Map FND-02–04/16; WAF SE:01/03/04. |
| **SEC02 — private application reachability**; TB1 | No public application frontend as a shortcut for absent connectivity. Compare a costed approved VPN, privately connected workstation/management environment or other authorised private route; identify client → resolver → route → ingress. If deferred, state application access is unavailable until the later package delivers that dependency; do not claim a usable private service. Private access alone supplies no user authorisation. | Route/DNS diagram, permitted clients, prohibited internet path, ingress/controller installation owner and timing, app-auth interface. Network/security owner approves route; architect integrates FND-07/10. |
| **SEC03 — DNS and certificate trust**; TB1/3/5 | No domain/CA assumed. Offer an approved owned-domain/split-DNS certificate or private-name/private-CA trust arrangement; document client trust distribution. No routine TLS bypass or unmanaged self-signed trust. Define termination hops, hostname validation, supported TLS minimum ≥1.2, issuance, renewal, expiry alert, key access and revocation. POC DNS links/forwarding must not alter corporate DNS without approval. | Resolver/zone/link/forwarding matrix for clients, nodes and management paths; certificate lifecycle and each protected hop. Network/security owner approves naming/trust; operational owner owns renewal. |
| **SEC04 — management is not user ingress**; TB2 | Compare private AKS API plus reachable operator/DNS path against public API restricted to explicitly approved stable administrator/runner egress CIDRs. No unrestricted public API approval inferred. Separate ARM access, Kubernetes API connectivity and Kubernetes authorisation; API source restrictions do not secure application ingress. Identify emergency access without routine admin kubeconfigs or long-lived credentials; propose disabling AKS local accounts, with any exception scoped. Pipeline access remains an interface, not a pipeline deployment. | API option/cost trade-off, approved source sets/private route, Entra group and Kubernetes authorisation model, credential-retrieval vs API-action permissions, emergency procedure; platform/security owner approves FND-08. |
| **SEC05 — least privilege and bootstrap**; TB2–4 | Inventory operator, deployment/bootstrap, cluster control-plane, kubelet/pull, workload and monitoring identities separately. State role definition, actions/data actions, exact scope, purpose, grantor and revocation. Avoid subscription-wide standing privilege; separate image push from pull. Explicitly obtain human approval for the actual RBAC bootstrap identity, resource-group creation and every role-assignment scope; broad F02 action listings are not approval. Do not infer Owner, effective writes or data-plane grants. | Principal-role-scope matrix, bootstrap sequence and necessary privilege duration/cleanup, approved identity reference (no credential), separation of deployment vs grant rights; platform/security owner. Any broader grant requires explicit rationale and human decision. |
| **SEC06 — federation and inherited MFA**; TB2/4 | Enable OIDC issuer and Workload Identity for AKS Standard. Define exact issuer, subject namespace/service account and audience for each released binding; prevent arbitrary service-account substitution, shared admin identity and fallback to node/developer credentials. Restrict who can create pods or change bindings. Carry observed inherited MFA create/update/delete policies forward; do not weaken them or assume a nonhuman exemption. Confirm actual operator activation/session/conditions later. | Identity/federation contracts, service-account/RBAC ownership and propagation/readiness plan. Platform/security owner confirms policy applicability and bootstrap feasibility; F02 read success is not MFA or write proof. Workload-specific bindings may be later-package interfaces. |
| **SEC07 — controlled egress and segmentation**; TB4 | NAT is SNAT/stable source addressing, **not destination filtering**. Inventory node/add-on, identity, registry, monitoring and future workload destinations, ports/protocols and purpose. Offer supported FQDN-aware firewall/proxy or another demonstrably effective control for the selected AKS configuration; no product mandated. Distinguish node egress from Cilium pod policy, DNS and east-west controls. Default-deny unnecessary workload paths where supported; preserve required AKS dependencies and managed subnet controls. NSGs alone cannot express changing AKS FQDN dependencies. Any residual unrestricted egress needs explicit human disposition, not a NAT security claim. | Effective route/enforcement diagram, allow/deny matrix, system-vs-workload exceptions, bypass analysis, rule owner/update process and full cost. Network/security owner resolves NAT/corporate constraints and filtering choice, FND-09. |
| **SEC08 — ACR and credential paths**; TB3/5 | Compare private endpoint with public access disabled against approved restricted-public registry access; reconcile the choice with the baseline's “private ACR” intent. For private access include login **and regional data/layer endpoints**, DNS from nodes/build/admin paths, endpoint approval and SKU/cost. For restricted-public access specify allowed stable sources, default deny and any trusted-service bypass. Use kubelet managed identity with pull-only permissions appropriate to the selected ACR authorisation mode; no ACR admin/password pulls. No plaintext secrets in source, outputs, logs or images. Where identity cannot replace a secret, specify restricted Key Vault/CSI lifecycle per baseline, including rotation and recovery. | Registry exposure/push-pull/DNS matrix and exact role contract; secret/certificate inventory including a justified “none”. Platform/security owner approves FND-11, trust-service exceptions and credential ownership. |
| **SEC09 — actionable protected telemetry**; TB2/4/5 | Identify AKS control-plane/audit, activity/RBAC changes, registry, DNS/network failures and resource health signals; map each to an available diagnostic category or another named evidence source. Define destination, readers/writers, retention days, ingestion limits, redaction, alert threshold/recipient and response. No tokens/full secret-bearing requests in logs. Propose minimal actionable monitoring while explicitly reconciling the baseline Prometheus/Grafana/Container Insights/App Insights stack; no silent deletion or compulsory purchase. Determine audit integrity/deletion protections; do not import CAP evidence WORM/production retention without applicability. | Per-resource signal/category/destination table, alert/triage and logging-cost plan, retention/integrity decision. Operational/security owner approves FND-15; legal applicability belongs to competent humans, not this record. |
| **SEC10 — trusted supply chain and hardened runtime**; TB3/4 | Exact published AVM version pins and verified module contracts/defaults; record native-resource gaps. Plan image digest pinning, source/build provenance, signing/verification, scan thresholds, re-scan/patch ownership and time-bound vulnerability exceptions. Select supported AKS/node OS versions and maintenance/upgrade approach, not merely discovery defaults. Preserve NAP disabled, approved pool/SKU limits and baseline restrictions on privileged/GPU/unapproved-image workloads; document enforcement timing and any deviation. No workflow generation now. | AVM feasibility inventory and secure runtime/admission contract; implementer verifies published contracts, architect integrates, security/platform owner approves thresholds/deviations. Policy/chart installation ownership must be explicit, including platform exceptions. |
| **SEC11 — safe stop/start and recovery**; TB5 | Costed supported stop/start plan, residual charges and manual owner checks, without automatic scheduling assumed. Identify drain/state loss, capacity non-guarantee, certificate/token ageing, API IP/private-endpoint/DNS changes and monitoring gaps. Manual rebuild is acceptable direction, not backup or RTO/RPO evidence. Classify retained state, select proposed recovery targets and backup/rebuild inputs, protect approved artifacts/logs and define credential revocation/incident escalation. Never delete existing estate or weaken controls merely to restart. | Operational runbook outline, supported-feature check, retained/lost-state inventory, target RTO/RPO decisions, restart revalidation and separately authorised recovery-test plan. Operational/platform/budget owners approve FND-13/14 and lifecycle/cleanup authority. |
| **SEC12 — bounded future interfaces**; TB6 | Do not provision case stores, upload lanes, Foundry/ML/search/scoring or treasury here. Reserve explicit later identities/network interfaces without broad future role grants. Runtime text/tool output cannot grant permissions; agent identities must not write official entitlement/case/payment state directly or execute treasury actions. New data, public exposure, model supply chain/scoring access or tool permissions trigger scoped security review. | Boundary/interface register and later-package owner/check references. Architect records scope; human owners approve any expansion. AI01–AI06 and model-quality work are not satisfied by this foundation. |

## Verification Contract: Design Now, Tests Later

Coordinator should request a **tester-supplied fixed-input manifest and per-assertion
results**, not generic “private access/identity/TLS configured” statements. Plans
must name resource/property paths, expected values, parameter variants, actor and
network location, positive/negative case and protected evidence location. Assertions
must inspect AVM defaults/compiled output where wrappers cannot resolve values.

| Gate / catalogue | Specific evidence to request from future assigned owners | Current status |
|---|---|---|
| `design-released`, WV01–04 | Requirement-to-design/test matrix for SEC01–12, flows/diagrams, resource inventory, published AVM feasibility, required non-author technical/security/compliance dispositions, actual plan and genuine fixed-revision human approvals. Architect/coordinator integrate; tester reviews. | **NOT RUN**; no design exists. Current requirements input is complete, not a design-release decision. |
| `locally-validated`, WV08–09 | Exact module versions/contracts/scopes/dependencies; approved resource names/tags including AKS-managed-resource applicability and documented exceptions. | **NOT RUN**, later |
| `locally-validated`, WV10 | ACR public network/default action/bypass settings, private-endpoint connection and DNS zone/link/record contract where selected; separate AKS API and private application-ingress exposure assertions. Endpoint existence alone is insufficient. No foundation business data store; later stores need their own WV10. | **NOT RUN**, later |
| `locally-validated`, WV11 | OIDC/Workload Identity settings, local-account disposition, exact principal/role/scope/federation tuples, kubelet pull vs push permissions, no secret-bearing outputs or credentials. | **NOT RUN**, later |
| `locally-validated`, WV12 | Applicable TLS properties, internal ingress/service exposure, API authorised ranges or private settings, supported NSG/routes/egress and Cilium policy contracts, actual diagnostics destinations/categories/retention. | **NOT RUN**, later |
| `locally-validated`, WV13–14 | AKS tier/network/pools/NAP/SKU/admission assertions; reviewed candidate/runbooks match design; outstanding later checks remain visible. Foundry geography/model/data checks excluded only with explicit foundation-scope rationale. | **NOT RUN**, later; WV05–07 compilation/lint also pending |
| `deployment-ready`, WV15–17 | Fresh confirmed context/identity/scope/parameters; policy/MFA/activation and bootstrap approval prerequisites; authorised validation and inspected what-if, including no changes to existing estate. Validation does not prove all writes succeed. | **NOT RUN**, later; F02 is not a substitute |
| `operationally-verified`, WV18–21 | Actual deployment/configuration; trusted hostname/certificate/TLS from approved client; denied public app path; API allowed/denied management path separately; ACR login/data DNS and real kubelet image pull; unauthorised pull/push/access denied; workload identity allowed/forbidden access; enforced egress positive/negative cases; approved test signal delivered and alert received. Safe probes only, separately authorised; no exploitation. | **NOT RUN**, later |
| `operationally-verified`, WV22 | Approved stop/start/rebuild or recovery evidence, elapsed recovery vs owner target, post-restart DNS/TLS/API/pull/identity/egress/telemetry revalidation and retained-state integrity. Disruptive drills require separate authority. | **NOT RUN**, later |

AI01–AI05 are **NOT APPLICABLE to this foundation's implementation scope**:
no application/runtime agents, scoring consumers, uploads or models are delivered.
AI06 live integration likewise belongs to a later application package, not a
foundation pass. Before that scope is released, its owners must cover per-object
authorisation, quarantine/clean malware results, byte/version-pinned complete
manifests, idempotency and immutable evidence where applicable; untrusted prompt/
retrieval/tool boundaries; approved model provenance/geography and narrow scoring
access. Tester owns quantitative quality evaluation and later AI01–AI06 evidence.
These are interface safeguards, not added WP-001 production deliverables.

## Human Decisions, Exceptions and Source Limits

Architect can draft alternatives now. Before release, the requesting user in the
FND-01 roles must decide access route and TLS trust (SEC02–04), API/ACR exposure,
egress enforcement/residual reach (SEC07–08), exact bootstrap principal/grants and
MFA feasibility (SEC05–06), monitoring/retention and baseline deviations (SEC09–10),
and recovery/operating targets/costs (SEC11). Corporate network/DNS/policy approval
is not inferred from the same user's platform role or from F02.

Any exception needs a genuine human record: requirement, exact revision/scope,
reason, exposure/impact, compensating control, accountable owner, expiry/review
date and verification. It does not change a failed technical check to PASS.
Changing private-only application access, data classification or estate boundaries
requires explicit scope amendment and affected review, not an implicit exception.
No legal applicability determination, risk waiver or approval is supplied here.

### Official technical grounding

Retrieved 21 October 2026 using generic public technical queries only; no repository
text, private identifiers or source uploaded. Guidance informs choices, not proof of
configured controls or corporate requirements.

| Source | Supported requirement / limit |
|---|---|
| [WAF Security checklist](https://learn.microsoft.com/en-us/azure/well-architected/security/checklist) | SE:01–12: baseline/classification, segmentation/IAM, filtering/encryption, hardening/secrets, monitoring/testing/incident response; trade-offs still require owner decisions |
| [AKS security concepts](https://learn.microsoft.com/en-us/azure/aks/concepts-security) | Separate API network access and authorisation; private/internal ingress; supply-chain/runtime hardening. Recheck selected versions at release; current guidance warns Azure Linux 2.0 is unsupported |
| [AKS egress dependencies](https://learn.microsoft.com/en-us/azure/aks/outbound-rules-control-egress) | Required node/add-on FQDNs and ports; NSGs alone do not supply FQDN filtering; depends on selected features |
| [Azure outbound design guide](https://learn.microsoft.com/en-us/azure/networking/design-guide/outbound-egress#how-to-choose) | Search excerpt explicitly distinguishes NAT SNAT from filtering; no combined firewall architecture mandated here |
| [Workload Identity](https://learn.microsoft.com/en-us/azure/aks/workload-identity-overview) | AKS Standard requires issuer/identity enablement and service-account binding; propagation/readiness is separate from declaration |
| [ACR Private Link](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-private-link) | Premium requirement, private DNS and data endpoints, separate public-access/bypass settings; candidate SKU/role mode remains to be verified |
| [AKS stop/start](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster) | Support constraints, drain/state/IP/private-endpoint and capacity implications; stop is not backup |

Repository grounding: assigned [context](context.md), [decisions](decisions.md)
(FND-01–19), [F02 assessment](assessment.md) and [ledger](ledger.md);
[maintained architecture](../../../docs/architecture/aks-centered-foundry-architecture.md)
§§12–16/20; delivery guidance, gates, WV/AI catalogues and context/handoff skills.
F02 is historical completed discovery, not a new audit target.

### Author checks and actual context

- **PASS — manual author checks:** requirement IDs SEC01–12 unique; each maps to a
  threat boundary, design evidence/owner and staged verification; requested topic
  coverage and accepted-vs-proposed distinctions checked by document readback.
- **PASS — write scope:** only the assigned requirements path authored. No architect/
  compliance moving outputs inspected, delegation, commands, Azure access, browser,
  code/infra/workflow generation, framework tests, commits or settings changes.
- **NOT RUN — independent snapshot/hash/link automation:** read-only file/search
  tools expose current files, not historical Git blobs; assigned baseline association
  is supplied by coordinator/user, not independently Git-verified here. No raw F02
  evidence manifest was available/consumed; report summaries only, not a re-audit.
  Tester should preserve this stopped output and verify baseline coverage before
  any fixed-design review. No fabricated hash or immutable-output claim.
- This is author-side requirements judgment, **not independent review of this
  document**. No design authored/reviewed; no maker conversation or concurrent drafts
  consumed. Shared host/instructions/model may cause correlated blind spots; model
  identity and enforced isolation are not exposed. No fresh reviewer isolation claimed.
- SQL todo tool/database access is unavailable: requested update of
  `wp001-security-requirements` to `done` **not executed**. Coordinator owns tracking.

**Handoff offered / COMPLETE:** coordinator integrates with architect and other
scoped input, records this cycle's completion and obtains preservation/reviewer
scheduling. No blocker to this early requirements handoff; unresolved design
decisions and all later execution evidence remain pending at their stated gates.
Stopped after cycle 1/5; no fixed-design verdict or onward work initiated.
