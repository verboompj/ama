# WP-001 technical foundation cost estimate — r2

**8 November2026 · USD public retail PAYG illustration · NOT a quote, budget
approval, benefit entitlement or permission to spend.** Matches [design.md](design.md)
r2 only. F03 final cycle5/5 consumed, zero remaining; sole author writes design/cost.
Actual model unknown; requested/default HIGH gpt-6.1-sol, no fallback.

## 1. Footprint and price evidence

One Sweden Central ARM foundation: AKS Standard, sys2 D4as_v5 + usr1 D2as_v5,
three managed128GiB OS disks; Firewall Standard + policy, NAT Standard,
three static IPv4s, VpnGw1AZ, one DNS resolver inbound, three private zones,
ACR Premium, empty KV Standard, three-PE conservative allowance (ACR/KV plus
AKS-managed API PE), LAW/DCR/DCRA, two five-minute log alerts, one project-scoped
activity alert/email action group. No deployed Gateway object, internal LB, app
DNS/certificate/TLS-sync MI/FIC, apps, Foundry, AML, workflow or data/model job.
Managed Gateway/CSI/KEDA/Policy ARM enablement consumes the stated nodes, not an
unpriced separate paid instance. Actual node capacity remains to be measured.

Compared with r1: remove internal LB fixed/data allowance, fourth DNS zone and
two log-alert series; TLS MI/FIC removal has no separate service fee. Keep
private access and controlled egress, not a cheaper public/NAT-only replacement.

Fixed input is T001 manifest/copies identified in design §1. The old cost r1's
**21 October2026** public requests/meter IDs are preserved price observations,
not certified current November prices. This author refreshed two dominant rates
anonymously on **8 November2026**, without subscription/account calls:

* [Firewall Standard Deployment](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Azure%20Firewall%27%20and%20meterName%20eq%20%27Standard%20Deployment%27%20and%20priceType%20eq%20%27Consumption%27):
  one Consumption row, USD1.25/h, ID e90604a4-719b-454b-879d-b85523882c92,
  effective2023-04-01, NextPageLink=null.
* [Linux regular D4as_v5](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20armSkuName%20eq%20%27Standard_D4as_v5%27%20and%20productName%20eq%20%27Virtual%20Machines%20Dasv5%20Series%27%20and%20meterName%20eq%20%27D4as%20v5%27%20and%20priceType%20eq%20%27Consumption%27):
  one Consumption row, USD.184/h, ID803cc6e8-f9c1-5098-9766-423073f16c51,
  effective2022-01-01, NextPageLink=null; no Spot/Windows/US substitution.

A broad Firewall request was truncated and includes new November Premium meters;
it was **not** treated as complete selected-rate evidence. The exact Standard
request above resolves the selected rate; Premium features are not selected.
Other rates below **were not refreshed in this bounded revision**. Their r1
requests R1–R19 remain reproducible at `https://prices.azure.com/api/retail/prices`
with public service/region/meter/type filters in the preserved r1 §3.
All dates in the table are effectiveStartDate, not November freshness.
No authenticated price sheet, taxes/FX, discount, subscription credits or current
paid availability is known. Owner must accept this dated estimate for planning
and refresh/approve the actual paid campaign before execution.

## 2. Complete selected provisioned-meter inventory

730h is a monthly comparison basis, **not November's720h**. Actual calendar
periods, billing increments and service prorating apply. R-references/IDs resolve
to the preserved r1 request register, not a new rate claim.

| Item / qty / source / meter ID | USD rate and effective date | 730h all running |
|---|---|---:|
| sys VMs2, R1 `803cc6e8-f9c1-5098-9766-423073f16c51` | .184/VMh, 2022-01-01; Nov refreshed | 268.64 |
| usr VM1, R2 `0ef9fe9f-7a45-596d-905c-dc15a89559ad` | .092/VMh, 2022-01-01 | 67.16 |
| AKS Standard1, R3 `251a08e1-40d6-48e6-8368-4c3e5ee3bbff` | .10/clusterh, 2021-06-08 | 73.00 |
| P10 disks3, R4 `4212a427-f430-5352-b903-3f9c70d4bc46` | 21.68/disk-month, 2021-06-08 | 65.04 |
| Firewall Standard1, R5 `e90604a4-719b-454b-879d-b85523882c92` | 1.25/h, 2023-04-01; Nov refreshed | 912.50 |
| NAT Standard1, R6 `ae30040a-67f5-485b-b0f4-a6ef50504d9c` | .045/h, 2020-06-01 | 32.85 |
| Static IPv4s3, R7 `9c150bf9-2bad-430e-a53c-c213804f49ef` | .005/IPh, 2021-06-08 | 10.95 |
| VpnGw1AZ1, R8 `f7f36e66-5b21-445a-9df1-f192e56ed76c` | .21/h, 2025-01-01 | 153.30 |
| Resolver inbound1, R9 `75134e89-9779-5c46-867e-c02460344857` | 180/endpoint-month, 2022-09-01 | 180.00 |
| Private DNS zones3, R10 `0b608a26-f611-4232-8192-ce81b6b57194` | .50/zone-month first25, 2019-12-01 | 1.50 |
| ACR Premium1, R11 `2f8e1105-47d0-4105-a934-b2175c766a71` | 1.6666/registry-day, 2021-06-08 | 50.6924 |
| PE allowance3, R12 `e6ab7238-e433-4fe0-a2b2-2b2564df2cdb` | .01/endpointh, 2020-02-01 | 21.90 |
| Log alert series2, R15 `25bbac3f-6637-54eb-89f2-30d9afed34a0` | .15/resource-month at5min, 2021-06-08 | .30 |
| **Fixed subtotal** | | **1,837.83** |

Disks billed conservatively as P10 Premium_LRS. Native pool property Managed128GiB
does not select a fictional osDiskSku; reconcile actual service backing. ACR≤20GB
planning storage is within r1's published500GiB included Premium storage tier;
no overage assumed, verify current tier before actual funding.
ACR login/layer addresses constitute **one PE**, not separate PE meters.
Generic API-PE allowance is deliberately conservative; no unverified exemption.
If AKS creates any billable component beyond this contract, report and reconcile,
not hide behind contingency.

No extra provisioned service fee for: RGs2 + AKS node RG1; VNet/subnets7,
NSGs3/UDR1, private IP/NICs, DNS links3/zone groups2, MIs2 and supported generated
add-on identities, fixed role assignments, empty KV, LAW resource/DCR/DCRA,
diagnostic extensions, email action group, project Administrative/Error activity
alert and native Activity Log retention. Usage from these is below.
Firewall policy attached to exactly one firewall has no extra policy-association
fee; Policy Analytics/prescaling off. No public CA/domain, paid VPN client,
HSM/CMK, certificate-renewal API, snapshot/backup/storage account/service, Sentinel,
Prometheus/Grafana/Application Insights/AMPLS/DCE, LB/frontend/rules, publisher/
signing/verifier service or remote evidence storage. None is “implicitly free”:
configured quantity is zero.

## 3. Finite campaign model — chosen assumptions, not approved hours

Define:

* `Hrun`: actual AKS + baseline VM running hours (includes readiness/observations).
* `Hp`: provisioned lifetime including setup, observations, idle and cleanup;
  for conservative scenarios all noncompute services/disks exist for all `Hp`.
* Disk/DNS/resolver/alert monthly prorating uses `Hp/730` only as an illustration;
  actual minimum billing and deletion times require later billing reconciliation.
* No daily stop/start promise. One contiguous campaign; if allocation/readiness
  fails, stop and ask owner, not automatically extend, resize or rebuild.

Baseline running rate: `2*.184 + .092 + .10 = .56/Hrun`.
Retained noncompute rate:

`1.25 + .045 + 3*.005 + .21 + 3*.01 + 1.6666/24
 + (3*21.68 + 180 + 3*.50 + 2*.15)/730 = 1.957578653/Hp`.

Thus **`Cfixed = .56*Hrun + 1.957578653*Hp`**.
Hourly forms of monthly meters are estimates, not claims of literal hourly billing.
All-running rate2.517578653/h. Contiguous illustrative scenarios:

| Scenario | Hrun / Hp / closure assumption | Fixed USD | Usage allowance | Transition reserve | Pre-contingency | +20% planning uncertainty |
|---|---|---:|---:|---:|---:|---:|
| Short technical campaign | 48 /72; up to24h provisioned setup/idle/teardown included | 167.83 | 7.295 | 5.604 | **180.72** | **216.87** |
| Extended technical campaign | 120 /168; 48h setup/idle/teardown included | 396.07 | 17.885 | 5.604 | **419.56** | **503.47** |
| All-running month comparison | 730 /730; no teardown savings | 1,837.83 | 72.95 | 5.604 | **1,916.39** | **2,299.66** |
| AKS stopped but foundation retained | 0 /730;3 disks and3PE allowance retained | **1,429.03** | actual continuing usage | no compute reserve | not a free pause | +20% if funded |

Transition reserve for each illustrative campaign (not permission to exercise it):
one extra D2as_v5 user node +disk for24h:
`.092*24 +21.68*24/730 = 2.9208`.
One sys+one usr simultaneous surge for8h:
`(.184+.092)*8 +2*21.68*8/730 = 2.6832`.
Total **5.6039**. Pool limits aren't transient vendor guarantees; cost assumes
these bounded quantities, not arbitrary extra managed/default inventory.
Actual six-node18vCPU envelope must fit fresh total and family quota; historical20
isn't reserved capacity. No parallel ML/app/operator VM or duplicate cluster.

AKS Standard stopped-time fee treatment is not established for the actual offer.
Conservative sensitivity: add `.10*(Hp-Hrun)` if charged during stopped/setup
hours; short +2.40, extended +4.80, fully stopped month +73.00.
Including20% uncertainty makes short **219.75**, extended **509.23**, stopped
fixed month **1,802.44** (before usage). Don't assert SLA/credits/fee suspension
from metadata. The selected Visual Studio offer may lack financially backed SLA/
paid availability despite AKS Standard configuration.

## 4. Variable-meter coverage and scenario quantities

All rates below were observed21 October2026, **not refreshed in November**.
Usage is an allowance, neither measured demand nor a cap. Do not deduct shared
free tiers. Different processing meters on one byte path can legitimately add;
within each meter count directions correctly, not duplicate the same byte.

| Rate / preserved reference and meter ID | Formula | Short / extended /730h assumed quantities |
|---|---|---|
| LAW2.99/GB, R14 `e3669cc9-19b6-55fc-b9fe-782ab83615ab`, effective2021-06-08 | `2.99*L` | L=2 /5 /20GB; no account-shared5GB credit |
| Platform logs .25/GB, R15 `2459c1e0-f88c-54de-8c38-ed2081cb05d6`, 2022-10-01 | `.25*P` conservative export/processing allowance | P=2 /5 /20GB; actual billable diagnostic treatment reconciled later |
| NAT .045/GB, R6 `d32b6352-b66b-4c4c-8f21-60e94058e04d`, 2020-06-01 | `.045*N` processed both directions | N=5 /10 /50GB |
| Firewall .016/GB, R5 `5f492263-6ee9-488d-9b66-02332b889b03`, 2023-04-01 | `.016*F` processed | F=5 /10 /50GB |
| Private Link .01/GB per direction, R12 ingress `10caa28b-6479-4852-9eb7-610870cb6417`, egress `e7f162f6-7cb8-4cea-ad4f-12cdb5dda25b`, 2021-11-01 | `.01*(I+O)` aggregate3PEs | I+O=3 /10 /30GB |
| Private queries .40/million, R10 `46cff9cb-4b15-4af0-bf41-25143827fef8`, 2019-12-01 | `.40*Q/1e6` | Q=100k /250k /1million, no record-count overage |
| KV .03/10k, R17 `0f824807-2376-435c-95c9-f992b67a07b0`, 2021-06-08 | `.03*K/10000` | K=1000 /1000 /10000; empty vault may use less, no future secret-sync campaign |
| Emails .00002 overage/email, R16 `a58b53c3-276c-41d2-9327-fb84df10afd2`, 2017-06-01 | `.00002*M` conservative no free bucket | M=100 /100 /1000 |
| Bandwidth/P2S out .087/GB first paid tier, R18 `9995d93a-7d35-4d3f-9c69-7a7fea447ef4`, 2022-05-01 | `.087*E` | E=5 /10 /50GB, no shared100GB deduction |
| **Usage subtotal** | | **7.295 /17.885 /72.95 USD** |

Analytics retention included31 days; R14 excess .13/GB-month
`eccb9d04-6c73-5e3e-8f45-4298156f1a5e`, effective2021-06-08:
`.13*retainedExcessGBMonths`, configured0. Retaining beyond31 days/export/legal
holds changes cost and needs owner approval. Daily1GB ingestion cap may overshoot
and lose data; it isn't a dollar budget or a security-evidence guarantee.

ACR overage `.10*billableExcessGBMonths`, R11
`6331e61c-1b44-4a10-9fb1-e9c0b470c4d5`, 2021-06-08, selected0 within included
tier; review GB/GiB and current tier. No private-image build/push is authorised
now. Premium private registry charge persists even empty.

Selected zero counts: internal LB rules/data (R13), disksnapshots
(.145/usedGB-month, R19), interregion business transfer(.02/GB R18),
new app/ML/model calls or interzone project workload traffic. No “zero tariff”
claim: those objects/paths aren't part of infra1. P10 ordinary IOPS included;
no paid bursting, shared mount or StandardSSD transaction assumption.
Incoming internet traffic has no transfer-out charge; NAT/FW/PE processing can
still bill both directions. No VPN additional connection allowance beyond3
clients within the preserved included128-client tier.

## 5. Closure, residuals and funding decisions

No free rollback: ARM deployment is nontransactional. If half the graph fails,
bill actual deployed resources from their billable start until confirmed removal.
Illustrations charge the **full** retained footprint during setup/teardown.
Deleting only AKS doesn't remove Firewall/VPN/NAT/resolver/ACR/disks/log retention.

* One extra day with AKS stopped and all retained resources:
  `1.957578653*24 = USD46.98` fixed, plus actual data/log charges and possible
  AKS fee2.40. One extra fully running day **USD60.42** fixed plus usage.
* User max2 left running adds `.092*H +21.68*Hdisk/730`; if both retained730h,
  **USD88.84/month** beyond baseline. Lingering disks remain charged after VM
  removal; residual inventory must include disks/IPs/PEs/LAW/registry.
* Deleting network/access isn't a daily cost-saving shortcut: recreate latency,
  availability, new PIP/client profile work and authority cost aren't zero.
* KV purge protection/7-day soft deletion is not permission to purge or instantly
  reuse the same name. An empty soft-deleted vault isn't priced as a running
  VM; any retained resource/operations/support effect is checked, not asserted0.
* Protected local summary retention is proposed30 days; LAW31/native Activity90
  are different schedules. Removing project resources doesn't erase all provider
  records. Retained workspace/export/hold charges require an explicit funded
  disposition, not hidden regulatory retention or an automatic free archive.
* 20% is a **planning uncertainty reserve**, not a hard cap or substitute for an
  omitted required meter. A newly identified paid resource invalidates BOM
  completeness until specifically reconciled.

Requesting user is confirmed budget/operations owner but has approved no numeric
ceiling/campaign duration. For planning approve the fixed r2 topology, dated-rate
assumptions and exceptions. Before paid execution confirm: actual tenant/
subscription/operator/activation, offer eligibility for personal/dev-test and up
to3 device users, permitted services/region, remaining usable credit/reset/expiry,
exclusions/tax/payment authority and full funded scenario+closure. No credits
deducted/pooled, no spending-limit/payment/offer/policy changes proposed.
Unsupported or unaffordable actual offer is a real execution blocker, not schema
evidence of paid availability.

No budget resource is generated now because amount/period/context are unapproved.
Manual daily/start/end cost review and optional later owner-approved budget
notification are proportionate. Budget alerts cannot enforce currency ceiling.
Estimate excludes unpaid human labour, existing approved3 devices/internet,
enterprise support, tax/FX and procurement-specific licences; no new paid device/
support/licence dependency selected. If required later, add an explicit estimate,
not an invented zero. Development-model account charges/credits are unknown and
separate from this Azure BOM; no nested model call or numeric agent-credit claim.

## 6. Delivery and checks

Author meter/quantity/formula reconciliation completed against the selected r2
graph and preserved r1 rates; two November rate fetches succeeded. No arithmetic
runner, independent cost review, billing sheet, Azure query, allocation, spend,
deployment or live test. Displayed totals rounded; use formulas with actual
billable hours/units later. No quota/SKU/patch/preview support inferred from price
presence, and no November freshness asserted for unrefreshed rows.

Integration **COMPLETE**, exact design release **BLOCKED** pending parent-routed
fixed-output preservation, required bounded independent checks, explicit material
amendment/native/preview/output approval, network allocation and actual plan/
human approval. Paid context/identity/funding/rates are later execution
prerequisites, not a demand for a regulatory acceptance campaign.

**Stopped writing, WP001-F03-AUTHOR5/5 consumed, 0 remaining.** Parent routes
checks/approvals and Bicep next only after actual exact design release; no sixth
author correction/reset/rename. SQL is not exposed: intended update
`UPDATE todos SET status='done' WHERE id='wp001-integrate-feasibility';`
reports delivered integration, not a false executed SQL or release claim.
