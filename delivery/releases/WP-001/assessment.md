# WP-001 / F02: Subscription Prerequisite Assessment

## Scope and Result

| Field | Evidence / disposition |
|---|---|
| Date | 21 October 2026 |
| Assignment | [F02 subscription discovery](assignments/F02-discovery.md) |
| Input revision | `f9ae67f5b495440db314a99bb37022875714e657` |
| Target | User-confirmed Visual Studio Enterprise - MSFT subscription/tenant; exact identifiers retained outside repository reports |
| Execution | Coordinator discovery in the existing session; not an independent technical, security or compliance review |
| Result | BLOCKED for completion of F02: effective permissions could not be retrieved because the CLI reported a missing cached account |
| Loop | F02-DISCOVERY, attempt 1 of 5 consumed; 4 remain; no failed-query retry performed |
| Next owner | Requesting user/platform owner resolves authentication and authority evidence; coordinator then completes F02 within the existing loop budget |

The successful queries establish useful design inputs, not deployment readiness.
No login, browser, context switch, provider registration, Azure mutation,
validation, what-if, deployment or data-plane operation was performed.

## Observations

`PASS` below means only that the named read-only observation succeeded. It does
not approve an architecture, establish effective write authority or pass a workload
gate.

| Check | Result | Observed evidence / limit |
|---|---|---|
| Confirmed CLI context | PASS | Existing context matched the exact confirmed subscription and tenant before the query batch; target arguments/ARM scopes were explicit |
| Subscription metadata | PASS | State `Enabled`; offer quota identifier `MSDN_2014-09-01`; `spendingLimit=On` |
| Remaining credit and offer terms | NOT RUN | Credit amount, reset date, available balance and service-specific offer eligibility were not queried; the offer name and spending-limit flag do not establish these |
| Effective subscription permissions | BLOCKED | ARM permissions request failed with an MSAL token-cache account error. This is not evidence of an RBAC denial or of sufficient permissions; no login or retry performed |
| Inherited policy assignments | PASS | `atScope()` returned two management-group assignments with no next page: MFA enforcement for create/update (`Deny`) and delete (`DenyAction`); both referenced definitions were retrieved |
| Policy coverage and effective authorisation | BLOCKED | The assignment listing is not proof of unrestricted deployment: deny assignments, exemptions, RBAC conditions/PIM, target resource-group policies and future candidate compliance remain unverified |
| Resource locks | PASS | Subscription lock listing returned three resource-level `CanNotDelete` locks with no next page; no subscription-level lock was returned. Existing resources must remain untouched |
| Foundation provider registration | PASS | Compute, ContainerService, ContainerRegistry, Network, ManagedIdentity, OperationalInsights, Insights, Monitor, Dashboard, PolicyInsights, Authorization, Resources, Storage and KeyVault were registered |
| Existing resources | PASS | CLI returned 19 resource groups and 114 ARM resources across multiple locations, including four resources in Sweden Central. Identity, monitoring, storage and other resources exist; no reuse is approved |
| Sweden Central compute quota | PASS | Total regional vCPU usage 0 / limit 20; DSv5 and DASv5 family usage each 0 / limit 20. These limits overlap rather than add together |
| Candidate VM SKU listing | PASS | `Standard_D4s_v5`, `Standard_D4as_v5`, `Standard_D8s_v5` and `Standard_D8as_v5` returned no SKU restrictions and listed zones 1, 2 and 3; details below |
| AKS version listing | PASS | Regional API returned version/support-plan information; minor 1.36 was marked default with patches 1.36.0-1.36.4. No version selected or pinned |
| Local Azure CLI | PASS | Installed Azure CLI 2.84.0; quota extension 1.0.0 |
| Local Bicep | PASS | Existing Azure CLI-managed executable returned Bicep 0.43.8; standalone `bicep` was not on PATH. Nothing installed or upgraded |
| Remaining service availability and quotas | NOT RUN | AKS managed-cluster quota and selected ACR, networking, monitoring and private-access configurations require design-specific checks; provider registration alone is insufficient |
| Network/data-plane reachability | NOT RUN | No private route, DNS, certificate, registry pull or API connectivity probe performed |
| Workload gates | NOT RUN | No design/candidate review, Bicep build, Azure validation, what-if, deployment or live verification; those require their own inputs and authority |

### Capacity Inputs

| Candidate SKU | vCPUs | Memory | Architecture | Listed zones | Listed restrictions |
|---|---|---|---|---|---|
| Standard_D4s_v5 | 4 | 16 GB | x64 | 1, 2, 3 | None returned |
| Standard_D4as_v5 | 4 | 16 GB | x64 | 1, 2, 3 | None returned |
| Standard_D8s_v5 | 8 | 32 GB | x64 | 1, 2, 3 | None returned |
| Standard_D8as_v5 | 8 | 32 GB | x64 | 1, 2, 3 | None returned |

These are candidates for architecture assessment, not approved node sizes.
The design must account for every pool, autoscaler maximum, upgrade surge and any
other regional compute within the 20-vCPU total and applicable family limits.
Quota and zone/SKU listings do not reserve capacity or guarantee allocation.
AKS node requirements, selected features, version/support lifecycle and current
capacity must be checked when the actual configuration is fixed.

The version response also listed minors 1.34, 1.35 and 1.37 with the
`KubernetesOfficial` support-plan capability, and 1.31-1.33 with only
`AKSLongTermSupport`. A listed version is not automatic approval for the selected
tier, support plan or upgrade policy.

## Required Follow-Up

| Owner | Action | Earliest dependency |
|---|---|---|
| Requesting user/platform owner | Resolve the cached-account issue outside this assessment, then authorise a bounded permissions recheck against the same confirmed target. Establish resource-group creation, resource deployment and separately scoped RBAC/bootstrap authority | Complete F02; no effective write authority currently established |
| Requesting user/budget owner | Confirm usable credit/offer terms and accept a Sweden Central foundation cost envelope, including residual charges and spending-limit interruption risk | Costed design acceptance; no spending-limit change authorised |
| Requesting user/platform owner | Confirm which, if any, existing platform resources may be reused. The earlier "none to reuse" declaration is a design direction, not an empty-subscription claim | Resource organisation and architecture inputs |
| Architect with network/security owner | Resolve private operator/application access, address overlap, DNS, egress controls, ACR connectivity and applicable constraints; account for MFA requirements on human writes/deletes | Fixed foundation design |
| Architect and Bicep engineer | Select bounded capacity, AKS version/support plan and exact service configurations; verify regional/service quotas, published AVM contracts and costs | Design feasibility and release |

The pipeline identity remains deferred. Neither policy discovery nor successful
read access establishes future OIDC federation, role grants, MFA satisfaction or
runner connectivity. No identity or credential configuration was created.

## Evidence and Limitations

Local evidence set: `foundation-discovery-20261021` in the current session's
`files/` directory. It contains command arguments, exit status and raw output for
subscription metadata, permissions, policies, locks, providers, aggregate resource
and group listings, VM quota/SKUs, AKS versions and local tools. Two policy
definitions and the installed Bicep version are also preserved.
`manifest.json` records file hashes and save times. Records were saved between
07:18:17 and 07:20:45 UTC; initial queries did not capture individual start/end
timestamps, so save times must not be presented as exact API observation times.

Methods were ARM GET APIs for subscription metadata (`2022-12-01`), permissions
(`2022-04-01`), policy assignments (`2022-06-01`, `atScope()`), locks
(`2016-09-01`) and referenced policy definitions (`2023-04-01`); CLI list/read
commands supplied the other observations. The successful policy and lock
responses contained no `nextLink`. No failed permissions request was repeated
through another API or identity.

Raw evidence contains account/infrastructure identifiers and stays outside Git.
This report intentionally omits identifiers, resource names, personal account
details and unrelated inventories. It does not establish organisation-wide policy
completeness or grant permission to modify existing resources.

Outputs are this report and the linked decision/ledger updates. They are
coordinator-owned discovery records, not frozen reviewer inputs or human approval.
Any later handoff must identify their committed revision or preserved snapshot.
