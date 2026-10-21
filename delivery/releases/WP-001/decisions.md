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
| FND-01 | Design approver, platform/network/security owners, deployment operator and operational service owner | User / accountable sponsor | Safe owner/group references, responsibilities and approval authority; identify gaps | OPEN |
| FND-02 | Tenant/subscription and deployment scope | Platform owner | Approved target reference, resource-group versus subscription deployment authority; actual context confirmation before authenticated work | OPEN |
| FND-03 | Existing platform services and constraints | Platform owner with network/security owners | Reuse/create inventory for hub, DNS, policy, registry, monitoring and identity; inherited policies, locks and allowed regions/SKUs | OPEN |
| FND-04 | Environment and permitted data | Business/data owner | One non-production environment; public/synthetic-only proposal accepted or revised; exclude real claimant/case data until separately authorised | OPEN |
| FND-05 | Risk path and required reviewers | Accountable owner with coordinator | Accepted classification and triggers, named non-author reviewer, required specialist/human approvals | OPEN |

## 2. Location, Network and Access

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-06 | Primary region and availability assumptions | Platform owner with architect | Approved EU region, zone strategy and permitted alternatives; later official service/SKU availability and quota evidence | OPEN |
| FND-07 | Addressing and platform attachment | Network owner | Approved non-overlapping VNet/subnet, pod/service ranges, future private-endpoint capacity and hub/peering routes; reference protected inventory | OPEN |
| FND-08 | AKS API and operator connectivity | Platform/security owners | Private/public API decision, authorised operator and test-runner access, DNS resolution and emergency access; restricted exposure requires explicit approval | OPEN |
| FND-09 | Egress and private DNS ownership | Network/security owners | Existing firewall/NAT route versus new components, allowed external dependencies, DNS zones/links/forwarding and owning team; cost implications | OPEN |
| FND-10 | Application ingress and certificates | Platform/security owners | Public/private application entry, DNS zone owner, TLS issuance/renewal, controller choice and implementation package; baseline contract for later apps | OPEN |
| FND-11 | Registry connectivity and identity boundaries | Platform/security owners | ACR reuse/SKU/networking, image pull/build identities, Entra groups, RBAC scopes and federated workload contract; no credentials in outputs | OPEN |

## 3. Capacity, Cost and Operations

| ID | Decision / information needed | Accountable owner | Required answer / evidence | Status |
|---|---|---|---|---|
| FND-12 | Initial and maximum capacity | Platform owner with application/ML input | Node-pool roles, SKU candidates, node minima/maxima, expected pods/concurrency, autoscaling boundaries and resource quota requirements | OPEN |
| FND-13 | Monthly budget and permitted running hours | Budget owner | EUR ceiling, currency/tax assumptions, shared-service allocation, alert recipients and action owner; shutdown/restart expectations and residual charges | OPEN |
| FND-14 | Availability and recovery targets | Business/platform owners | Operating window, tolerable downtime, RTO/RPO where applicable, rebuild/restore strategy and permitted test methods | OPEN |
| FND-15 | Diagnostics and operational responsibilities | Operational/security owners | Reused/new destinations, selected logs/metrics, retention/ingestion limits, alerts, incidents, maintenance/upgrade windows and recovery ownership | OPEN |
| FND-16 | Naming, tags and lifecycle | Platform/budget owners | Naming rules and environment/workload/owner/costCenter values, resource protection, expiry/review date and authorised cleanup process | OPEN |

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

## Decision Record Format

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
