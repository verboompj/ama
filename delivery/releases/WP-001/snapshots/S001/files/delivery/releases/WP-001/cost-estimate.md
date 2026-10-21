# WP-001 foundation cost estimate — F03 draft r1

**21 October 2026; USD public retail PAYG, not a quote, funding decision or approval.**
Paired exactly with [`design.md`](design.md) r1, baseline
`01002b21e5c6cb57d391c685adcbc05f03885b38`, assignment F03. Author ownership only
these two outputs. No Azure subscription query or spend. Anonymous public pricing
API retrieval succeeded; Learn search/fetch is exposed in this specialist session.
No invented rates, module-version feasibility or model charges.

## 1. What is complete, proposed and still gated

**Draft meter coverage complete for the selected proposal**, including private
operator/user access and controlled egress, conservative allowances and zero-count
exclusions below. No identified in-scope required item is left without a price or
explicit no-additional-service-charge treatment. This is author coverage, not an
independent cost verdict. Offer eligibility, actual benefit balance/exclusions,
tax, corporate support/licence needs and final quantities/defaults need owner/
engineer confirmation before approval. A required extra licence/service or AVM
default not covered here makes cost completeness **BLOCKED until repriced**;
contingency is not a substitute for missing meters.

**Do not fund this on an assumption of Visual Studio credits.** Actual individual
benefit/dev-test/team-demo use, permitted three-user access, service/region/
marketplace exclusions, remaining usable credit, reset/expiry, contractual terms,
support and spending-limit interruption need protected procurement/budget-owner
confirmation. No advertised credit/trial balance deducted, no credits pooled,
no offer conversion/payment method/spending-limit change proposed.

This privately connected, filtered proposal is intentionally not a tiny VM-only
estimate. Azure Firewall dominates cost and stays on while AKS is stopped.
If unaffordable, human owner must request a revised effective-control design,
not approve a partial bill or silently remove security.

## 2. Quantities, time and calculation rules

* All regional resources Sweden Central; global/blank DNS/network meter regions
  where API actually publishes them. No US regional substitute for Swedish VM costs.
* Monthly comparison **730 hours = 30.4167 days**, not exact October (744h).
  A real calendar month uses actual billable hours/days and partial-hour rounding.
* **Always-on:** 730 running AKS/node hours, baseline 2 system nodes +1 user node.
* **Demo:** proposed 22 days x (8 demo hours +1 startup/maintenance hour) =
  **198 AKS/node hours**; 09:00–17:00 **Europe/Budapest** plus preparation.
  Owner has approved neither hours/timezone nor numeric ceiling.
* Stop only AKS; **network/access/registry/disks/monitoring configuration remain
  provisioned all 730h**. No daily Firewall/VPN delete/recreate savings assumed.
  AKS Standard control-plane billing model assumed charges running time; to
  avoid underfunding, a full-month fee sensitivity is also supplied.
* Sys: 2 x Standard_D4as_v5 Linux regular PAYG, not Spot/Windows/Cloud Services.
  User: 1 x Standard_D2as_v5, max2. Max autoscaled steady count4, worst simultaneous
  sys/user surge count6 = **18 vCPU**, within observed total20 and DASv5-family20,
  leaving2; initial10/max12. No operator VM, blue-green duplicate or ML job.
* Each node **128-GiB P10 Premium_LRS managed OS disk**, no data disk/PVC,
  paid bursting or shared-disk mounts. Three OS disks retained full month in both
  scenarios; extra autoscale/surge disk-hour quantities priced separately.
  Dasv5 has no local temp disk; do not assume free ephemeral storage.
* ACR Premium unit1, <=20 GB stored (within current published500GiB included storage);
  no geo-replication/tasks/connected registry. No double-charge for included storage.
* Three chargeable-endpoint allowances: ACR1 + KV1 + AKS API1. ACR login/data
  IPs are within **one** registry PE, not separately billed endpoint resources.
  API PE included conservatively at generic Private Link rate even if AKS bundles/
  exempts its managed endpoint; no unjustified free-private-cluster assertion.
* One VPN gateway active-standby, three P2S clients within included128 connections,
  one resolver inbound; **no outbound resolver/ruleset**; four private zones.
* One internal Standard LB with <=5 forwarding rules, no public application IP.
  Conservatively retain full-month LB/managed API PE allowance while stopped.
* Firewall Standard1 zone1, no prescaling; NAT Standard1 zone1 on firewall subnet;
  three Standard static IPv4s (VPN, firewall, NAT). Firewall Policy1 associated
  with **one** firewall: no additional policy fee; Policy Analytics off.

All following rates were retrieved **2026-10-21** via public
`https://prices.azure.com/api/retail/prices`, `currencyCode=USD`,
`type=Consumption`. Rate dates below are API `effectiveStartDate`, not retrieval
or guarantee that a rate remains unchanged. Retail JSON responses have matching
meter/product/SKU/units; preserve these observations with the review package if
independent source replay is required. No authenticated price sheet.

## 3. Official source request register

Each R-reference identifies the exact reproducible public request. API pagination/
truncation is not interpreted as an empty complete inventory: selected meter rows
were retrieved in bounded queries. Initial Sweden-specific NAT/LB/Private Link/DNS
requests returned zero items because those meters are global/zone/blank; these
zeros were **not** used as zero prices.

| Ref | Exact request URL / matching constraints |
|---|---|
| R1 | [D4as_v5](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20armSkuName%20eq%20%27Standard_D4as_v5%27%20and%20priceType%20eq%20%27Consumption%27): select product `Virtual Machines Dasv5 Series`, sku `Standard_D4as_v5`, meter `D4as v5`, not Spot/Low Priority/Windows/Cloud Services |
| R2 | [D2as_v5](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20armSkuName%20eq%20%27Standard_D2as_v5%27%20and%20productName%20eq%20%27Virtual%20Machines%20Dasv5%20Series%27%20and%20meterName%20eq%20%27D2as%20v5%27%20and%20priceType%20eq%20%27Consumption%27) |
| R3 | [AKS](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Azure%20Kubernetes%20Service%27%20and%20priceType%20eq%20%27Consumption%27): Standard Uptime SLA, not Automatic/LTS/FreeTierInfrastructureCost |
| R4 | [P10](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Storage%27%20and%20meterName%20eq%20%27P10%20LRS%20Disk%27%20and%20priceType%20eq%20%27Consumption%27): product Premium SSD Managed Disks, not Page Blob |
| R5 | [Firewall](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Azure%20Firewall%27%20and%20priceType%20eq%20%27Consumption%27): Standard Deployment/Data Processed; not virtual hub/Premium |
| R6 | [NAT](https://prices.azure.com/api/retail/prices?$filter=serviceName%20eq%20%27NAT%20Gateway%27%20and%20priceType%20eq%20%27Consumption%27): Global Standard Gateway/Data Processed; not StandardV2 or US Gov |
| R7 | [Public IP](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Virtual%20Network%27%20and%20priceType%20eq%20%27Consumption%27): IP Addresses, Standard IPv4 Static Public IP, not prefix/Basic/Global |
| R8 | [VPN](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27VPN%20Gateway%27%20and%20priceType%20eq%20%27Consumption%27): VpnGw1AZ meter/sku; per-connection extras not applicable within128 clients |
| R9 | [Resolver inbound](https://prices.azure.com/api/retail/prices?$filter=serviceName%20eq%20%27Azure%20DNS%27%20and%20meterName%20eq%20%27Private%20Resolver%20Inbound%20Endpoint%27%20and%20priceType%20eq%20%27Consumption%27): blank-region primary meter; all commercial zone rows also180 |
| R10 | [DNS](https://prices.azure.com/api/retail/prices?$filter=serviceName%20eq%20%27Azure%20DNS%27%20and%20priceType%20eq%20%27Consumption%27): blank primary Private Zone and Private Queries, first tier |
| R11 | [ACR](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Container%20Registry%27%20and%20priceType%20eq%20%27Consumption%27): Premium Registry Unit/Data Stored, not replication/connected unit |
| R12 | [Private Link](https://prices.azure.com/api/retail/prices?$filter=productName%20eq%20%27Virtual%20Network%20Private%20Link%27%20and%20armRegionName%20eq%20%27Global%27%20and%20skuName%20eq%20%27Standard%27%20and%20priceType%20eq%20%27Consumption%27): Standard PE/Ingress/Egress |
| R13 | [LB](https://prices.azure.com/api/retail/prices?$filter=productName%20eq%20%27Load%20Balancer%27%20and%20armRegionName%20eq%20%27Global%27%20and%20skuName%20eq%20%27Standard%27%20and%20priceType%20eq%20%27Consumption%27): paid Standard included rules/data, not rows named Free |
| R14 | [Log Analytics](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Log%20Analytics%27%20and%20priceType%20eq%20%27Consumption%27): Analytics Logs ingestion/retention, no free allowance assumed |
| R15 | [Monitor](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Azure%20Monitor%27%20and%20priceType%20eq%20%27Consumption%27): Alerts Resource Monitored at5Minute Frequency, Platform Logs Data Processed |
| R16 | [Email](https://prices.azure.com/api/retail/prices?$filter=serviceName%20eq%20%27Azure%20Monitor%27%20and%20skuName%20eq%20%27Emails%27%20and%20armRegionName%20eq%20%27Global%27%20and%20priceType%20eq%20%27Consumption%27) |
| R17 | [Key Vault](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Key%20Vault%27%20and%20priceType%20eq%20%27Consumption%27): Standard Operations, not managed HSM or advanced key |
| R18 | [Bandwidth](https://prices.azure.com/api/retail/prices?$filter=serviceName%20eq%20%27Bandwidth%27%20and%20armRegionName%20eq%20%27swedencentral%27%20and%20priceType%20eq%20%27Consumption%27): Rtn Preference:MGN Standard Data Transfer Out |
| R19 | [Snapshots](https://prices.azure.com/api/retail/prices?$filter=armRegionName%20eq%20%27swedencentral%27%20and%20serviceName%20eq%20%27Storage%27%20and%20contains(meterName,%27Snapshots%27)%20and%20priceType%20eq%20%27Consumption%27): Premium SSD Managed Disks LRS Snapshots; optional only, quantity0 |

## 4. Fixed provisioned charges — baseline quantities

Round only displayed totals; formulas retain unrounded values. Values in the last
columns are USD/month excluding variable use and contingency.

| Item / source / API meter ID | Rate, unit, effective date | Quantity | 730h always-on | 198h demo |
|---|---|---:|---:|---:|
| System nodes R1 `803cc6e8-f9c1-5098-9766-423073f16c51` | .184/VM-hour; 2022-01-01 | 2 | 268.64 | 72.864 |
| User nodes R2 `0ef9fe9f-7a45-596d-905c-dc15a89559ad` | .092/VM-hour; 2022-01-01 | 1 | 67.16 | 18.216 |
| AKS Standard R3 `251a08e1-40d6-48e6-8368-4c3e5ee3bbff` | .10/cluster-hour; 2021-06-08 | 1 | 73.00 | 19.80 |
| P10 OS disks R4 `4212a427-f430-5352-b903-3f9c70d4bc46` | 21.68/disk-month; 2021-06-08 | 3 retained | 65.04 | 65.04 |
| Firewall Standard R5 `e90604a4-719b-454b-879d-b85523882c92` | 1.25/deployment-hour; 2023-04-01 | 1 | 912.50 | 912.50 |
| NAT Standard R6 `ae30040a-67f5-485b-b0f4-a6ef50504d9c` | .045/gateway-hour; 2020-06-01 | 1 | 32.85 | 32.85 |
| Static IPv4 R7 `9c150bf9-2bad-430e-a53c-c213804f49ef` | .005/IP-hour; 2021-06-08 | 3 | 10.95 | 10.95 |
| VPN VpnGw1AZ R8 `f7f36e66-5b21-445a-9df1-f192e56ed76c` | .21/gateway-hour; 2025-01-01 | 1 | 153.30 | 153.30 |
| Resolver inbound R9 `75134e89-9779-5c46-867e-c02460344857` | 180/endpoint-month; 2022-09-01 | 1 | 180.00 | 180.00 |
| DNS zones R10 `0b608a26-f611-4232-8192-ce81b6b57194` | .50/zone-month, first25; 2019-12-01 | 4 | 2.00 | 2.00 |
| ACR Premium R11 `2f8e1105-47d0-4105-a934-b2175c766a71` | 1.6666/registry-day; 2021-06-08 | 1 x730/24days | 50.6924 | 50.6924 |
| PE allowance R12 `e6ab7238-e433-4fe0-a2b2-2b2564df2cdb` | .01/endpoint-hour; 2020-02-01 | 3 | 21.90 | 21.90 |
| Internal LB <=5 rules R13 `27827eb0-7f60-4928-940b-f5fe15e7a4cb` | .025/hour; 2018-04-11 | 1 | 18.25 | 18.25 |
| Five-minute log alerts R15 `25bbac3f-6637-54eb-89f2-30d9afed34a0` | .15/resource-month; 2021-06-08 | 4, no dimension fanout | .60 | .60 |
| **Fixed subtotal** | | | **1,856.88** | **1,558.96** |

The PE effective date was confirmed by an additional bounded public request
filtering the exact public meter ID during the same author cycle. No additional
API PE cost saving is assumed. Budgeting all PE/LB resources through
AKS stop is conservative if the service deletes/recreates some components.

### Fixed zero-additional-meter treatments and explicit quantities

VNet1/subnets7, NSGs3, UDR table1, RGs2 plus AKS node RG1, MIs3 plus supported
add-on MIs, federation1, role assignments, DNS VNet links4/record groups, one
workspace/DCR/action group, service-health/activity/budget notifications:
no separate provisioned hourly service charge included. Their usage/diagnostics
are priced below. Private IPs/NICs don't get a public-IP hourly charge.
Firewall policy1 tied to one firewall has no additional policy fee; no Policy
Analytics or prescaling. Official [Firewall pricing](https://azure.microsoft.com/en-us/pricing/details/azure-firewall/)
states capacity-unit prescaling is optional, default additionalCU charge0;
[Firewall Manager pricing](https://azure.microsoft.com/en-us/pricing/details/firewall-manager/)
states no policy charge for single-firewall association.

KV Standard has no fixed vault fee; secret operations priced below. Two public
root certificates (VPN trust and separate app private CA), three VPN client
certificates and one app leaf: self-managed issuance with encrypted offline keys,
no paid public CA/domain, no certificate renewal request/managed-HSM rotation
feature selected. KV leaf secret storage not a new disk/storage-account fee.
Open-source VPN/CA/client tooling and supported managed Gateway/Policy/KEDA/CSI
add-ons do not imply paid third-party licence purchase; their pods consume the
stated nodes. Labour/device/internet/support assumptions are stated in §8.

## 5. Usage-variable formulas and bounded allowance

The same conservative monthly envelope is used in both runtime scenarios; firewall,
VPN/security diagnostics and retained data do not fall in direct proportion to
node hours. **These are proposed allowances, not measured or approved thresholds.**
Use actual billable GB units (Monitor decimal10^9 bytes; disk sizes may be GiB).
Count **both directions** where service meters require them; do not bill the same
GB twice within one meter, but NAT, Firewall, Private Link, LB and Bandwidth are
different chargeable processing paths.

| Meter / source / ID | Retrieved USD rate/unit/date | Formula / proposed envelope / monthly allowance |
|---|---|---|
| Analytics Logs ingestion R14 `e3669cc9-19b6-55fc-b9fe-782ab83615ab` | 2.99/GB above5GB tier; 2021-06-08 | `2.99*L`; L<=20GB, **59.80**. API first5GB free tier not deducted: benefit is billing-account-wide, existing estate may consume it |
| Analytics retention R14 `eccb9d04-6c73-5e3e-8f45-4298156f1a5e` | .13/GB-month; 2021-06-08 | `0.13*R_excess`; R_excess=0 at included31-day schedule, **0**. Retention extensions/export/hold change costs |
| Platform logs processing R15 `2459c1e0-f88c-54de-8c38-ed2081cb05d6` | .25/GB; 2022-10-01 | `.25*P`, P<=20GB -> **5.00** conservative allowance for billable platform log export/processing. Exact diagnostic-category billing reconciled in plan; no cloud pipeline/export-to-storage product selected |
| NAT data R6 `d32b6352-b66b-4c4c-8f21-60e94058e04d` | .045/GB; 2020-06-01 | `.045*N`; N<=50GB -> **2.25** (ingress+egress processed through NAT) |
| Firewall data R5 `5f492263-6ee9-488d-9b66-02332b889b03` | .016/GB; 2023-04-01 | `.016*F`; F<=50GB -> **.80** |
| PE ingress R12 `10caa28b-6479-4852-9eb7-610870cb6417`, egress `e7f162f6-7cb8-4cea-ad4f-12cdb5dda25b` | .01/GB each direction, <1PB; 2021-11-01 | `.01*(I+O)`; all3PE aggregate I+O<=30GB -> **.30** |
| Internal LB data R13 `dfc7cc11-fbe2-41c8-b6fa-24a574223938` | .005/GB; 2018-04-11 | `.005*B`; B<=10GB -> **.05**, no free-row benefit assumed |
| DNS queries R10 `46cff9cb-4b15-4af0-bf41-25143827fef8` | .40/million first1billion; 2019-12-01 | `.40*Q/1e6`; Q<=1million -> **.40**; <=25k private records, no record-set overage |
| KV Standard operations R17 `0f824807-2376-435c-95c9-f992b67a07b0` | .03/10k; 2021-06-08 | `.03*K/10000`; K<=10000 -> **.03**, including import/read/polling/rotation operations; no paid certificate renewal API |
| Emails R16 `a58b53c3-276c-41d2-9327-fb84df10afd2` | 0 first1000; .00002/email beyond1000; 2017-06-01 | allowance1000 emails priced conservatively at overage -> **.02**, existing account free bucket not assumed |
| MGN internet/P2S transfer out R18 `9995d93a-7d35-4d3f-9c69-7a7fea447ef4` | .087/GB after100GB, first paid tier; 2022-05-01 | `.087*E`; E<=50GB -> **4.35** no shared100GB deduction. Counts VPN app replies + internet transfer; no outbound VPN GB-specific discount. Incoming transfer0 |
| ACR excess stored R11 `6331e61c-1b44-4a10-9fb1-e9c0b470c4d5` | .10/GB-month; 2021-06-08 | `.10*billableExcessStoredGBMonths` -> S<=20GB, **0** against current500GiB included tier. Reconcile API GB billing conversion to tier GiB before any overage forecast; keep digest/provenance within envelope |
| Optional LRS disk snapshot R19 `ab6979a0-d6b7-522a-bcb7-eb84737e6a21` | .145/usedGB-month; 2021-06-08 | `.145*SnapUsedGB*retainedHours/730`; configured count0 -> **0**. Not a backup allowance; adding snapshots requires approval |
| Interregion transfer R18 `328e9797-0963-55a0-bbdd-e86210b20fe5` | .02/GB; 2018-02-01 | configured interregion business traffic0 -> **0**; future region replication/additional export separately priced |
| **Usage allowance total** | | **73.00/month**, same in both scenarios |

Standard P10 disk IOPS are included, no StandardSSD transaction/shared mount meter
or on-demand paid bursting enabled. No storage account/blob operations/backup vault
is required for the empty stateless foundation; quantity0, not omitted state costs.
Evidence snapshots are local/protected owner-controlled repository handling, not
a newly assumed Azure storage service. If corporate tamper-resistant remote
storage is mandated, design/BOM/prices must be revised.

LAW Analytics query cost included in ingestion; no paid Basic/Auxiliary query,
search job, data restore, data export, Sentinel, managed Prometheus, Grafana,
Application Insights or AMPLS in selected scope. Those are not implicitly free.
Managed Prometheus/Grafana omission is **D-MON HUMAN APPROVAL REQUIRED** in design.
No alert dimension expansion or additional monitored resources assumed; >4 alert
series changes quantity. No SMS/voice/availability webtest. Activity Log standard
90-day native retention/standard platform metrics are no-additional-cost features;
exported ingestion counted above.

Cross-zone workload traffic0 by deliberately single-zone node/FW/NAT design.
VPN/resolver service-internal implementation not priced as fictitious project VM
or bandwidth duplication. If design changes to multi-zone, validate current billing
rules rather than apply an old inter-AZ API listing blindly.

## 6. Autoscale, upgrade overlap, disk/IP and stopped residual costs

Extra **one user node for24 hours/month** (proposed allowance):
`.092*24 +21.68*24/730 = 2.9208`.
Maximum two surge nodes (one D4as sys +one D2as user) for **8 node-pair hours/month**:
`(.184+.092)*8 +2*21.68*8/730 = 2.6832`.
Combined extra allowance **5.604/month**. No extra IP/endpoint per surge; private
node IP addresses don't add hourly public-IP charge. Upgraded/replaced disks must
actually be removed after drain; lingering disks are real extra spend.
No allocation guarantee and no simultaneous unrelated compute under the20quota.

If user max2 remains provisioned rather than24h, add
`.092*H +21.68*H/730` for H retained node/disk hours:
at730h **88.84**, at198h **24.0968** if disk released immediately on scale-down.
If disk remains all month, add21.68 instead of hour-prorating. Each additional
surge pair retained for a whole month would cost **244.84**, not5.604.
Any larger counts require design/quota/cost revision, not contingency-only approval.

**Fully stopped all month, resources retained:** conservative residual fixed
**1,448.08/month** = fixed baseline minus335.80 node compute minus73 control plane.
Includes3OS disks, FW/NAT/VPN/DNS resolver/registry/PEs/IPs/LB/alerts/zones.
Usage can continue; allocate73 use envelope even if less likely. Stopping cluster
is not zero spend, a data backup, reservation or deletion permission.

Official [stop/start documentation](https://learn.microsoft.com/en-us/azure/aks/start-stop-cluster)
says control plane and nodes stop/deallocate and capacity can be unavailable on
restart; state preserved12months. For conservative cost approval, **if the paid
Standard control-plane fee is charged all730h**, add **53.20** to the198h scenario
and **73.00** to the fully stopped case. This sensitivity is priced, not a missing
meter. Do not claim observed invoice savings before billing verification.

## 7. Totals and proposed approval envelope

| Component | Always-on730h | Demo198h |
|---|---:|---:|
| Baseline fixed | 1,856.8824 | 1,558.9624 |
| Usage envelope | 73.00 | 73.00 |
| Extra autoscale+surge allowance | 5.6040 | 5.6040 |
| **Planning subtotal** | **1,935.49** | **1,637.57** |
| Proposed20% contingency, not approved spend | 387.10 | 327.51 |
| **Planning envelope before taxes/support/labour** | **2,322.58** | **1,965.08** |

Propose budget owner review **USD2,325/month always-on** or **USD1,970/month
demo-hours**, **not an approved ceiling**. If owner requires full paid-tier fee
coverage while stopped, demo envelope becomes `(1637.5664+53.20)*1.20`
= **USD2,028.92**, round proposal **USD2,030/month**. Recommended approval packet
uses **USD2,030/month demo envelope** to cover that sensitivity, subject to actual
offer funding/terms and all other assumptions, without promising it is a hard cap.

True invoice may be lower from unused allowances, bundled API PE, shared free tiers
or actual offer pricing; do not promise those savings. May be higher with actual
hours/days, overshoot, changed rates, traffic/log volume, unreleased disks,
support/licence needs or additional mandated controls. Stop/start saves only about
**297.92/month baseline** in this conservative comparison, not198/730 of total.
Most charges persist. Full-month continuously running comparator may also conflict
with benefit-specific development/test continuous-run restrictions: it is a cost
comparison, **not a permitted operating pattern** until procurement confirms.

Budget notification proposal at50/80/100% actual and100% forecast of the
human-approved number, recipient requesting user; review projected credits/service
eligibility before starting each demo. Alerts notify, not enforce a cap or ensure
spending-limit coverage. At forecast overspend: owner pauses demo, stops AKS,
reviews residual services/offer terms and decides separate approved cleanup/revision.
Do not bypass spending limits or shut down security filtering while nodes run.

### Exposure/cost alternative deltas

Not approved variants: restricted-public API could remove its PE allowance7.30 and
AKS zone .50 (plus private queries), but VPN/resolver remain for application;
restricted-public ACR Premium saves its PE7.30+zone .50, not the Premium fee, and
adds stable-source/exposure management. Neither materially solves the FW/access
cost floor or satisfies private app access alone. Public Basic ACR is not an
equivalent default-deny-IP alternative. Corporate private connectivity/shared DNS
could alter costs only with a new explicit reuse decision; no existing route assumed.

## 8. Commercial, third-party and evidence limits

* USD retail excludes VAT/taxes/FX, negotiated/offer-specific discounts/markups and
  any paid support plan. Owner must confirm actual charges in protected procurement
  records, not by public anonymous queries. No price inferred from an empty response.
* Selected proposal requires no paid Entra P1/P2/PIM/Conditional Access licence
  purchase or third-party managed CA/signing/VPN appliance. Certificate VPN does
  **not** supply MFA; inherited MFA requirements remain applicable to human writes.
  If corporate policy demands paid licensing/managed PKI/support or another VPN
  authentication scheme, cost completeness becomes **BLOCKED** until quoted/priced
  and reviewed. Existing tenant entitlement is not presumed.
* Three approved existing client devices, internet connectivity, local encrypted
  storage and human CA/operations labour are **owner-supplied prerequisites, not
  zero-cost purchases**. No laptop/ISP/labour procurement estimated; owner must
  confirm availability and permissions to install VPN profiles/root trust/software.
  A required new device/service cannot be hidden in contingency.
* Open-source image scanner/signing/admission tool software proposed as no paid
  licence; exact supported pins/verification mechanism still engineer/security-plan
  work. Azure node CPU/storage included; no cloud build/runner or signing SaaS
  subscription, workflow, paid Defender for Containers/ACR plan selected. Local
  security tooling/patch/signature labour not priced as Azure consumption.
* No domain registration/public CA costs because private `.internal` name +
  managed owner private trust is selected. No registrar dependency silently assumed.
  If device policy rejects private CA trust, revisit design and certificate/domain
  costs before release; do not disable TLS validation.
* Platform personal data, support processing, contract roles and transfer/retention
  questions remain with actual competent privacy/legal owner. A Sweden Central
  bill does not establish EU-only processing or legal compliance.
* ACR Premium storage allowance is documented at
  [ACR tiers](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-skus);
  retrieved current page updated16October2026 now states **Premium500GiB**
  (not the older100GiB allowance). Same-cycle source check corrected the threshold;
  proposed20GB remains fully included and totals do not change. Technical
  tier/pricing reconciliation belongs to feasibility. VPN included client
  tier and standard P2S data transfer confirmed by
  [official VPN pricing](https://azure.microsoft.com/en-us/pricing/details/vpn-gateway/).
  DNS endpoint unit `1` is monthly per
  [official DNS pricing](https://azure.microsoft.com/en-us/pricing/details/dns/);
  resolver blank primary row matches all commercial zone prices, no unverified
  Sweden-to-zone mapping needed for this numeric rate.
* [Monitor pricing](https://azure.microsoft.com/en-us/pricing/details/monitor/)
  confirms included Analytics retention/query and standard-metric/activity features;
  price placeholders on HTML pages are not numeric price evidence. Numeric rows
  above come from API. Failed old Monitor URL returned404; corrected page retrieved.
* No availability/reservation/credit or exact offer/SKU eligibility established
  by public prices. Selected D2as_v5 was not in F02 sampled listings; separately
  authorised region/zone/AKS SKU confirmation is required before deployment.

## 9. Author check and handoff

Author loop **WP001-F03-AUTHOR cycle1/5**, **1 used /4 remaining**, no retry/reset.
Author inspection completed: fixed resource crosswalk, private access and egress
costs present, three baseline/all-six maximum node disks, three publicIPs/threePE
allowances, query tier selection, no Spot/Windows/CloudService/Automatic mismatch,
730vs198 hours and residual costs, variable formulas/contingency/departures explicit.
Arithmetic is manually calculated and **not executed independently**; tester must
recompute from preserved rates/quantities and reconcile AVM defaults before approval.
No independent PASS, actual invoice, Azure validation or measured usage claimed.

Stopped-writing handoff to coordinator: preserve this file plus paired design,
declared stopped specialist requirements and exact committed dependencies before
review. Engineer verifies quantity/service/AVM feasibility; tester independently
reviews arithmetic and all-five-pillar quality; specialists issue their own
fixed-design findings. Requesting user/procurement approves fixed plan/design/cost/
offer/operating assumptions only after findings resolved. SQL/task-store tool
unavailable: parent to mark `wp001-design` **done for draft delivery**, with release/
implementation still gated. No implementation/deployment authority conveyed.
