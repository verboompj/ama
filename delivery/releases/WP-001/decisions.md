# WP-001: Foundation Decisions

## How to Complete This Register

Work through the groups in order. Start with facts about the existing Azure
environment, then choose boundaries, capacity and operating targets.
The architect turns the accepted decisions into a design and bill of materials.

Each row starts `OPEN`. Record a proposed value, supporting evidence and the
accountable owner's approval before marking it `ACCEPTED`. Role labels below
identify responsibilities; FND-01 must identify the actual owners through safe
references. Recommendations and architecture assumptions are not approvals.

Use `PROPOSED`, `ACCEPTED`, `OPEN` or justified `NOT APPLICABLE`. Preserve superseded
values and the reason/date for changes. Changes to accepted decisions require
impact assessment and affected review/approval again.

Keep credentials, kubeconfigs, tokens, personal contact information and sensitive
network inventories out of these records. Reference protected records when needed.
Any authenticated discovery needs its own authority and confirmed Azure context.

## 1. Ownership and Existing Environment

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-01 | Design approver, platform/network/security owners, deployment operator and operational service owner | Requesting user | User confirmed ownership of all listed responsibilities and the budget-owner role on 21 October 2026; see accepted record below | ACCEPTED |
| FND-02 | Tenant/subscription and deployment scope | Platform owner | Visual Studio Enterprise - MSFT exact target confirmed; dedicated POC resource group(s) accepted. [Assessment](assessment.md) found spending limit on; effective-permissions query BLOCKED by cached-account error. Pipeline identity choice deferred | PROPOSED |
| FND-03 | Existing platform services and constraints | Platform owner with network/security owners | No reuse requested; [assessment](assessment.md) confirms existing resources, inherited MFA policies, resource-level locks and registered foundation providers. Reuse, effective authority and remaining constraints unresolved | PROPOSED |
| FND-04 | Environment and permitted data | Business/data owner | Single non-production POC; public and synthetic data only, no real claimant/case data; accepted 21 October 2026 | ACCEPTED |
| FND-05 | Risk path and required reviewers | Accountable owner with coordinator | Regulated foundation review accepted 21 October 2026; infrastructure-tester supplies non-author technical review, security/compliance agents supply scoped findings, requesting user retains human approval | ACCEPTED |

## 2. Location, Network and Access

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-06 | Primary region and availability assumptions | Platform owner with architect | Sweden Central preferred; single region accepted. [Assessment](assessment.md) records regional quota, candidate node SKUs/zones and AKS versions; topology/cost, service-specific feasibility and remaining constraints still require design | PROPOSED |
| FND-07 | Addressing and platform attachment | Network owner | Dedicated POC VNet proposed subject to corporate approval; exact VNet/subnet/pod/service ranges, overlap checks and future endpoint capacity pending | PROPOSED |
| FND-08 | AKS API and operator connectivity | Platform/security owners | Compare private API with restricted-public API before selecting; no existing private access route known. Operator/runner connectivity, DNS and emergency access remain unresolved | OPEN |
| FND-09 | Egress and private DNS ownership | Network/security owners | NAT Gateway selected for the POC; POC-owned private DNS zones proposed subject to corporate approval. Egress restrictions, approved dependencies, DNS links/forwarding and costs pending | PROPOSED |
| FND-10 | Application ingress and certificates | Platform/security owners | Private-network-only application access accepted 21 October 2026; no domain ready. Propose hostname/TLS options and costs; ingress/controller and private client access route pending | PROPOSED |
| FND-11 | Registry connectivity and identity boundaries | Platform/security owners | Compare private endpoint and restricted-public ACR before selection; build/pull identities, Entra groups, role scopes and access paths remain to be designed | OPEN |

## 3. Capacity, Cost and Operations

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-12 | Initial and maximum capacity | Platform owner with application/ML input | Very small POC, maximum 3 users; concurrency/background workload and node roles/SKUs/counts/scaling limits require design and feasibility evidence | PROPOSED |
| FND-13 | Monthly budget and permitted running hours | Budget owner | No monetary ceiling specified; business/demo hours preferred. Produce costed options with supported stop/start, residual charges, alerts and explicit deployment cost approval | PROPOSED |
| FND-14 | Availability and recovery targets | Business/platform owners | Manual rebuild acceptable; no HA target requested. Propose recovery time and data protection; actual RTO/RPO and corporate requirements unresolved | PROPOSED |
| FND-15 | Diagnostics and operational responsibilities | Operational/security owners | Basic actionable health/error/security monitoring requested; propose collection, retention/ingestion limits and baseline-stack disposition. No automatic scheduling required now | PROPOSED |
| FND-16 | Naming, tags and lifecycle | Platform/budget owners | Tag values, coverage and naming direction accepted 21 October 2026; see FND-16 record. Exact names, corporate-policy verification, review/expiry and protection remain pending; cleanup requires explicit authorisation | PROPOSED |

Budget alerts notify; they do not impose a hard spending cap. Scale-down decisions
must account for the AKS tier, network services, registry, disks and stored telemetry
that may remain chargeable.

## 4. Release and Execution Decisions

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-17 | Candidate design acceptance | Human design approver | Exact design/plan revisions, applicable WV01-WV04 evidence, verified AVM feasibility, cost inventory and resolved required findings | OPEN |
| FND-18 | Authenticated validation authority | Platform owner / user | Exact tenant/subscription, environment, identity, scope, parameters and permitted read/validate/what-if actions; WV15 context confirmation | OPEN |
| FND-19 | Deployment and operational acceptance | User / change authority and service owner | Accepted what-if, operator, cost approval, recovery/rollback and live-check plan; explicit deployment permission and actual result recorded separately | OPEN |

FND-01 through FND-05 establish whether scoped design can proceed. Architecture
options can be explored while remaining targets are open; no design release occurs
until material choices and required feasibility/review evidence are resolved.
FND-18 and FND-19 remain later-gate decisions and do not block drafting the design.

## Decision Records

### FND-01: Foundation Ownership

| Field | Recorded decision |
|---|---|
| Status | ACCEPTED |
| Scope | WP-001 non-production foundation |
| Accountable owner / human design approver | Requesting user |
| Platform / network / security owners | Requesting user |
| Budget owner | Requesting user |
| Deployment operator | Requesting user; execution requires separate explicit authorisation |
| Operational service owner | Requesting user |
| Approval reference | User's direct answers to the FND-01 ownership form, 21 October 2026 |
| Review boundary | Required non-author technical review remains separate from implementation; reviewer assignment pending FND-05 |
| Affected revision | WP-001 planning records based on `a497c1381fabe22588a0b05de89b906bd6093060`; design not released |

The repository uses the role reference "requesting user" for the confirmed owner.
This decision assigns responsibility; it does not approve the design, budget amount,
Azure access or deployment.

### FND-02-FND-04: Target and Environment

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the environment form, 21 October 2026 |
| Target reference | Visual Studio Enterprise - MSFT, selected in the user's subscription revision on 21 October 2026; exact IDs remain in the authorised interaction |
| FND-02 status | PROPOSED overall: target and dedicated POC resource groups accepted; exact refreshed context and read-only discovery confirmed. Effective permissions remain blocked; see assessment below |
| Existing platform | User reports none to reuse; discovery found existing resources, not an empty subscription. No reuse or change to them is authorised |
| FND-03 status | PROPOSED: partial policy/provider/quota evidence recorded; effective authority, reuse and remaining constraints unresolved |
| FND-04 status | ACCEPTED: single non-production POC environment, public/synthetic data only; no real claimant/case data |
| Execution boundary | No Azure login/discovery, identity creation, RBAC assignment, workflow creation or deployment authorised by these answers |

### FND-02: Resource Organisation and Access Follow-Up

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the scope/access form, 21 October 2026 |
| Resource organisation | ACCEPTED: create dedicated resource group(s) for this POC; exact group count/names and deployment-root scope to be proposed in the design |
| Current permissions | BLOCKED: authorised ARM permissions query failed with an MSAL cached-account error; no login or retry performed |
| Corporate constraints | Partial read-only evidence in [assessment](assessment.md): inherited MFA enforcement and existing resource-level locks; completeness and candidate applicability remain unverified |
| Pipeline identity | Choice deferred; no OIDC, service principal or managed-identity option selected |
| Bootstrap requirement | Resource-group creation and any later identity/RBAC setup need an appropriately authorised operator and explicit scope |
| Authority | Planning decisions only; no Azure inspection, mutation or workflow execution authorised |

### FND-02: Target Subscription Selection

| Field | Recorded decision / remaining work |
|---|---|
| Source | User instruction, 21 October 2026: revise the target to the previously displayed Visual Studio subscription |
| Selected subscription | Visual Studio Enterprise - MSFT |
| Identity reference | The subscription/tenant IDs displayed in the authorised CLI context inspection; keep identifiers out of public planning records |
| Selection status | ACCEPTED: this is the intended POC target |
| Supersedes | Earlier internal-subscription selection and rejection of this displayed subscription as the target |
| Change impact | Revalidate permissions, policy, quotas, existing resources, regional availability and subscription-offer restrictions against this target; no earlier assumption establishes those facts |
| Retained requirements | Dedicated POC resource groups, Sweden Central preference, public/synthetic-only data, agreed tags and other recorded design requirements |
| Next prerequisite | Resolve effective-permissions evidence after the confirmed read-only assessment; exact context was refreshed and confirmed before queries |
| Authority boundary | Parameter update only; no login, context switch, identity/RBAC change or deployment performed or authorised by this instruction |

### FND-02/FND-03/FND-06: Discovery Evidence

| Field | Observed evidence / remaining work |
|---|---|
| Source | [F02 assessment](assessment.md), 21 October 2026; attempt 1 of 5 |
| Authority | User separately authorised read-only assessment and confirmed the exact refreshed target; no Azure writes authorised |
| Subscription | Enabled; Visual Studio offer metadata returned `spendingLimit=On`. Remaining credit, offer terms and foundation costs are not established |
| Permissions | BLOCKED by a CLI cached-account error on the effective-permissions request; successful reads do not prove resource creation or RBAC grant authority |
| Inherited policies | Two observed management-group assignments enforce MFA for human create/update and delete operations; effective authorisation and complete constraints remain unverified |
| Existing estate | 19 resource groups and 114 ARM resources observed; no reuse approved. Three resource-level deletion locks returned |
| Regional capacity | Sweden Central total regional vCPU usage 0 / limit 20; DSv5 and DASv5 families each 0 / limit 20. Four D4/D8 candidate SKUs list no restrictions and zones 1-3; allocation is not guaranteed |
| AKS and tooling | Regional versions returned, with minor 1.36 marked default; Azure CLI 2.84.0 and existing CLI-managed Bicep 0.43.8 available. No version/SKU chosen or tool installed |
| Status impact | FND-02, FND-03 and FND-06 stay PROPOSED; evidence narrows unknowns but does not approve permissions, topology, cost or service configuration |
| Next owner | Requesting user/platform owner for authentication/authority and reuse facts; architect for bounded options after F02 prerequisites are resolved |

### FND-05: Foundation Review Path

| Field | Recorded decision |
|---|---|
| Status / approval | ACCEPTED by requesting user in the review-scope form, 21 October 2026 |
| Path / rationale | Regulated review for the bounded foundation's network, identity and RBAC trust boundaries |
| Non-author technical reviewer | infrastructure-tester; dedicated five-pillar architecture review and testability evidence |
| Specialist reviewers | security-reviewer and compliance-reviewer; findings scoped to the public/synthetic-data, non-production foundation |
| Feasibility / human approval | bicep-engineer verifies published AVM contracts; requesting user approves the fixed design/plan |
| Limits | Shared-model/context limitations must be recorded. Actual corporate requirements remain subject to discovery |
| Execution boundary | Reviewer arrangement accepted; no review execution, Azure access or deployment approved by this decision |

### FND-06: Region and Footprint

| Field | Recorded decision / remaining evidence |
|---|---|
| Source | User's direct answers to the region form, 21 October 2026 |
| Preferred region | Sweden Central |
| Regional footprint | ACCEPTED: one region; assess availability-zone options and cost during design |
| Overall status | PROPOSED: initial quota, node-SKU/zone and AKS-version evidence recorded in [assessment](assessment.md); remaining constraints, design-specific service feasibility and zone topology remain open |
| Dependency boundary | Later Foundry and ML packages verify their own availability, geography and connectivity requirements |
| Cost boundary | Earlier West Europe ML POC pricing is not a Sweden Central foundation estimate |
| Authority | Design preference only; no Azure access or resource creation authorised |

### FND-07/FND-08: Network and Operator Access

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the network/access form, 21 October 2026 |
| Network direction | PROPOSED: dedicated POC VNet, subject to corporate network approval |
| Address plan | Unassigned; verify overlap, policy and approved subnet/pod/service capacity before selection |
| AKS API choice | OPEN: architect to compare private and restricted-public API options, including security, operator access, cost and runner connectivity |
| Existing private connectivity | No existing route known; no VPN, connected runner or management host assumed |
| Exposure boundary | Restricted-public access is an option for assessment only; no public API or firewall rule approved |
| Related choices | Private DNS/egress FND-09 and application ingress FND-10 remain separate decisions |

### FND-09/FND-10: Egress, DNS and Application Access

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the egress/DNS/ingress form, 21 October 2026 |
| Outbound connectivity | ACCEPTED design direction: use NAT Gateway for the POC; verify corporate policy, supported AKS configuration, public IP requirements, dependencies and regional costs |
| Egress controls | NAT provides outbound connectivity and stable source addresses, not destination filtering; architect/security reviewer must specify required filtering and evidence. A policy conflict requires an explicit decision |
| Private DNS | PROPOSED: POC-owned private DNS zones, subject to corporate approval; links, forwarding and client resolution remain to be designed |
| Application audience | ACCEPTED: only users on an approved private network; no public application ingress authorised |
| Hostname and certificates | No domain ready; propose hostname, certificate trust/issuance/renewal and costs, including any necessary domain ownership |
| Access dependency | No existing private route is known. Compare an approved VPN, connected workstation/runner or other authorised access path before claiming the application is reachable |
| Scope boundary | Design the private ingress/TLS contract and identify which foundation or later application package implements each component; AKS management API selection remains FND-08 |
| Overall status | PROPOSED until private access, DNS/TLS, effective egress controls, cost and corporate constraints are resolved; no Azure configuration changes authorised |

### FND-11-FND-13: Registry, Capacity and Cost

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the registry/capacity/budget form, 21 October 2026 |
| Registry access | OPEN: compare private endpoint and restricted-public ACR access, including SKU, DNS, image build/pull paths and cost |
| Expected usage | Very small POC; maximum 3 users. This is user population, not a measured concurrency, pod-count or compute requirement |
| Capacity status | PROPOSED: architect selects node roles/SKUs/counts and bounded scaling from application/background workload and platform requirements; no sizing approved yet |
| Operating window | Business/demo hours; assess supported AKS stop/start, startup delay, scheduling ownership and residual costs |
| Budget | User specified no monetary limit. No numeric ceiling is set; provide a cost estimate and obtain explicit cost/deployment approval before provisioning |
| Cost boundary | Absence of a ceiling does not authorise unrestricted consumption or new resources. Include AKS tier, nodes, NAT/public IP, registry, private access, disks, DNS and monitoring |
| Remaining controls | Alert thresholds/recipients, operating schedule/timezone, restart readiness and approved resource limits remain to be agreed |

### FND-14-FND-16: Recovery, Monitoring and Lifecycle

| Field | Recorded answer / remaining work |
|---|---|
| Source | User's direct answers to the recovery/operations/lifecycle form, 21 October 2026 |
| Recovery direction | Manual rebuild acceptable; no high-availability target requested for the POC. Propose recovery time and data protection rather than inventing RTO/RPO values |
| Resilience disposition | Architect must reconcile this preference with the maintained availability-zone baseline, corporate requirements, stateful dependencies and documented recovery limitations |
| Monitoring direction | Basic actionable health/error/security monitoring; propose retention, ingestion limits, alerts and cost |
| Monitoring disposition | Architect must explicitly assess any reduced collection/stack against the maintained Prometheus/Grafana, Container Insights and Application Insights/OpenTelemetry baseline before design approval |
| Scheduling | No automatic scheduling required at present; propose operator-controlled start/stop with readiness checks. Exact operating hours/timezone remain unspecified |
| Lifecycle | Review/expiry date unknown; naming/tag decisions are recorded in the FND-16 follow-up below. Protection and cleanup process remain open |
| Ownership | Requesting user remains the operational owner under FND-01 |
| Authority | No recovery drill, scheduling implementation or deletion authorised by these answers |

### FND-16: Naming and Tagging

| Field | Recorded decision / remaining work |
|---|---|
| Source / approval | User's direct answers to the naming/tagging form, 21 October 2026 |
| Accepted scope | WP-001 POC resource groups and all taggable in-scope resources |
| Naming direction | Propose Azure-compatible names using `ama`, `poc`, resource type and region, with unique suffixes where required |
| Exact names | Pending service-specific character/length/uniqueness checks and corporate-policy verification; region abbreviation not selected |
| Tag propagation | Apply explicitly through Bicep and supported service settings; resource-group tags do not automatically inherit to resources |
| AKS-managed resources | Verify node-resource-group and managed-resource coverage separately using supported AKS settings; document service-specific exceptions rather than assuming coverage |
| Verification | Instantiate WV09 for expected tags on each taggable resource and WV18 for deployed inventory; assess supported AKS tag propagation and changes at relevant gates |
| Remaining decisions | Review/expiry date, resource protection and authorised cleanup process; overall FND-16 stays PROPOSED |
| Execution boundary | Approved naming/tagging requirements only; no Azure tags or resources created or changed |

Accepted tag values:

| Tag key | Value |
|---|---|
| `environment` | `poc` |
| `workload` | `ama` |
| `workPackage` | `WP-001` |
| `owner` | `paverboo` |
| `costCenter` | `10122` |

Preserve `costCenter` as a string in infrastructure parameters. Corporate-policy
conflicts require an explicit resolution; do not silently replace approved values.
The design records per-resource applicability and any required additional corporate
tags. Sensitive credentials and case data never belong in tags.

### Format for Further Decisions

Append one concise record per decision as answers arrive:

```text
Decision ID:
Status:
Selected value and scope:
Options considered / trade-off:
Evidence reference and date:
Accountable approval reference and date:
Affected design/plan revision:
Supersedes / change impact:
```

Start by supplying ownership, target subscription/environment and the existing
platform inventory. Then resolve networking/access with the platform owners and
approve capacity/budget targets. Record approvals against fixed revisions in the
[ledger](ledger.md).
