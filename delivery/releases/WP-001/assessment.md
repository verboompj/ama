# WP-001 / F02: Subscription Prerequisite Assessment

## Scope and Result

| Field | Evidence / disposition |
|---|---|
| Date | 21 October 2026 |
| Assignment | [F02 prerequisite recheck](assignments/F02-recheck.md); preserves [attempt 1](assignments/F02-discovery.md) |
| Input revision | Recheck: `fe983de9444e808388c9815e9414400604e640aa`, plus preserved parent-authored assignment and attempt-2 ledger reservation. Attempt 1: `f9ae67f5b495440db314a99bb37022875714e657` |
| Target | User-confirmed Visual Studio Enterprise - MSFT subscription/tenant; exact identifiers retained outside repository reports |
| Execution | Infrastructure-tester bounded read-only recheck; prior coordinator discovery reused. Not independent design/candidate approval or a security vulnerability audit |
| Result | PASS for assigned read-only recheck; authentication evidence gap resolved. F02 discovery/target prerequisites complete for bounded architecture options; package returns to draft, not design release |
| Loop | F02-DISCOVERY, attempt 2 of 5 completed; 2 used / 3 remaining. No attempt 3 or failed-query retry |
| Next owner | Coordinator integrates this handoff and separately assigns bounded F03 options to the architect; owner decisions and design-specific constraint checks remain explicit for design acceptance |

The successful queries establish useful design inputs, not deployment readiness.
No login, browser, context switch, provider registration, Azure mutation,
validation, what-if, deployment or data-plane operation was performed.

## Observations

`PASS` below means only that the named read-only observation succeeded. It does
not approve an architecture, establish effective write authority or pass a workload
gate.

| Check | Result | Observed evidence / limit |
|---|---|---|
| Confirmed CLI context | PASS | Executor freshly ran `az account show`; exact previously confirmed subscription/tenant and Enabled state matched before ARM queries. No switch or login |
| Subscription metadata | PASS | State `Enabled`; offer quota identifier `MSDN_2014-09-01`; `spendingLimit=On` |
| Remaining credit and offer terms | NOT RUN | Credit amount, reset date, available balance and service-specific offer eligibility were not queried; the offer name and spending-limit flag do not establish these |
| Effective subscription permissions | PASS | Attempt 2 returned three permission entries: management `actions=["*"]`, `Microsoft.Authorization/elevateAccess/action`, and role-assignment/role-definition reads. All entries had empty `notActions`, `dataActions` and `notDataActions`; one page, no nextLink. Historical attempt-1 cached-account failure is resolved by this response, not assumed from re-authentication |
| Inherited policy assignments | PASS | `atScope()` returned two management-group assignments with no next page: MFA enforcement for create/update (`Deny`) and delete (`DenyAction`); both referenced definitions were retrieved |
| Visible inherited deny assignments | PASS | Attempt-2 `atScope()` listing returned zero entries at/above the subscription; one page, no nextLink. Not proof of absence at future resource-group/resource scopes or beyond caller/API visibility |
| Visible inherited policy exemptions | PASS | Attempt-2 `atScope()` listing returned zero entries at/above the subscription; one page, no nextLink. No exemption from the previously observed MFA policies is established |
| Design-specific corporate constraint disposition | NOT RUN | Observed MFA policies and locks are design inputs, not corporate approval. Network/DNS approvals and candidate-specific policy compliance remain F03/design-acceptance work; no identified missing current F02 prerequisite prevents drafting options |
| Future scope-specific authority and candidate compliance | NOT RUN | No role/principal enumeration, condition/PIM investigation, write test or future resource-group/candidate evaluation. These require the fixed design, target scopes and separately authorised execution; not a failed read-only discovery check |
| Resource locks | PASS | Subscription lock listing returned three resource-level `CanNotDelete` locks with no next page; no subscription-level lock was returned. Existing resources must remain untouched |
| Foundation provider registration | PASS | Compute, ContainerService, ContainerRegistry, Network, ManagedIdentity, OperationalInsights, Insights, Monitor, Dashboard, PolicyInsights, Authorization, Resources, Storage and KeyVault were registered |
| Existing resources | PASS | Attempt-1 inventory establishes a non-empty subscription; no resource inventory is reproduced here. User requests no reuse; no existing-resource reuse or change is approved |
| Sweden Central compute quota | PASS | Total regional vCPU usage 0 / limit 20; DSv5 and DASv5 family usage each 0 / limit 20. These limits overlap rather than add together |
| Sampled VM SKU availability listing | PASS | `Standard_D4s_v5`, `Standard_D4as_v5`, `Standard_D8s_v5` and `Standard_D8as_v5` returned no SKU restrictions and listed zones 1, 2 and 3; availability observations only, not sizing recommendations |
| AKS version listing | PASS | Regional API returned version/support-plan information; minor 1.36 was marked default with patches 1.36.0-1.36.4. No version selected or pinned |
| Local Azure CLI | PASS | Installed Azure CLI 2.84.0; quota extension 1.0.0 |
| Local Bicep | PASS | Existing Azure CLI-managed executable returned Bicep 0.43.8; standalone `bicep` was not on PATH. Nothing installed or upgraded |
| Remaining service availability and quotas | NOT RUN | AKS managed-cluster quota and selected ACR, networking, monitoring and private-access configurations require design-specific checks; provider registration alone is insufficient |
| Network/data-plane reachability | NOT RUN | No private route, DNS, certificate, registry pull or API connectivity probe performed |
| Workload gates | NOT RUN | No design/candidate review, Bicep build, Azure validation, what-if, deployment or live verification; those require their own inputs and authority |

### Capacity Inputs

**Sampled availability observations, not sizing recommendations.** These four
sizes were sampled during discovery, not derived from workload requirements.
The sample is not a design shortlist or a complete regional SKU inventory and
establishes neither workload suitability nor affordability.

| Sampled VM SKU | vCPUs | Memory | Architecture | Listed zones | Listed restrictions |
|---|---|---|---|---|---|
| Standard_D4s_v5 | 4 | 16 GB | x64 | 1, 2, 3 | None returned |
| Standard_D4as_v5 | 4 | 16 GB | x64 | 1, 2, 3 | None returned |
| Standard_D8s_v5 | 8 | 32 GB | x64 | 1, 2, 3 | None returned |
| Standard_D8as_v5 | 8 | 32 GB | x64 | 1, 2, 3 | None returned |

No node size, count or scaling configuration has been selected. Sizing belongs to
F03 and must follow workload requirements, node-pool design and cost assessment.
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
| Coordinator | Integrate completed F02 discovery and separately assign bounded F03 options using accepted target, dedicated POC resource-group direction, ownership and review path; carry observed constraints and open design decisions forward without re-asking accepted choices | F03 assignment; no onward design performed by this executor |
| Authorised future operator/platform owner | Confirm actual identity, activation/conditions, MFA and scope-specific authority for resource-group creation, resource deployment and any separately approved RBAC/bootstrap operations against the fixed inputs | Later execution authority; current action listing is not proof of successful writes |
| Requesting user/budget owner | Confirm usable credit/offer terms and accept a Sweden Central foundation cost envelope, including residual charges and spending-limit interruption risk | Costed design acceptance; no spending-limit change authorised |
| Requesting user/platform owner | Retain the no-reuse direction or explicitly approve a change; protect the existing estate. "None to reuse" is not an empty-subscription claim | Resource organisation and architecture inputs |
| Architect with network/security owner | Resolve private operator/application access, address overlap, DNS, egress controls, ACR connectivity and applicable constraints; account for MFA requirements on human writes/deletes | Fixed foundation design |
| Architect and Bicep engineer | Select bounded capacity, AKS version/support plan and exact service configurations; verify regional/service quotas, published AVM contracts and costs | Design feasibility and release |

The pipeline identity remains deferred. Neither policy discovery nor successful
read access establishes future OIDC federation, role grants, MFA satisfaction or
runner connectivity. No identity or credential configuration was created.

### F02 Exit-Criterion Clarification

Same-attempt documentation integration corrects the earlier overly broad BLOCKED
classification; no Azure query or new attempt is involved. `context.md:76` defines
F02 as resolving discovery/target decisions and accepting risk/reviewer scope;
`context.md:77` assigns the scoped design to F03. `decisions.md:65-68` explicitly
permits architecture options while remaining targets are open. Accepted owner,
data and review-path records are at `decisions.md:26,29-30`; no-reuse direction,
dedicated resource groups and target selection are at `decisions.md:102,112,126`.
Exact resource-group names/count/root scope are explicitly design proposals, not
missing target acceptance.

No separate, source-backed current discovery/owner prerequisite remains identified
after the successful permissions recheck. Corporate completeness, network/topology
choices and design-specific policy applicability are unresolved requirements for
F03 and design acceptance, not an inferred precondition to drafting options.
F02 is complete for that bounded purpose and the package is draft. FND-02/FND-03
remain PROPOSED overall where design details are unfinished; no corporate approval,
unconditional readiness, design release, cost approval or execution authority is
created by this correction.

## Evidence and Limitations

### Attempt 1: Preserved History

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
assigned discovery records, not design/candidate approval or human acceptance.
Any later handoff must identify their committed revision or preserved snapshot.

### Attempt 2: Recheck Methods and Disposition

Local evidence set: `foundation-recheck-20261021` in the same session's `files/`
directory. `recheck.py` preserves the exact committed scoped sources and uncommitted
parent execution records before changes, verifies copied bytes and records SHA-256
coverage, base commit, no scoped deletions and Python version in `input-manifest.json`.
The assignment and lifecycle reservation are preserved separately, outside the frozen
source-input set. `evidence-manifest.json` excludes itself. Raw identifiers, exact
command arguments, generated hashes and per-command start/end times stay local.
Earlier evidence was neither changed nor rerun.

Executed commands, with the confirmed identifier replaced by `<confirmed-subscription>`
for publication:

```text
az version --output json
az account show --output json
az rest --method get --url 'https://management.azure.com/subscriptions/<confirmed-subscription>/providers/Microsoft.Authorization/permissions?api-version=2022-04-01' --subscription <confirmed-subscription> --output json
az rest --method get --url 'https://management.azure.com/subscriptions/<confirmed-subscription>/providers/Microsoft.Authorization/denyAssignments?api-version=2022-04-01&$filter=atScope()' --subscription <confirmed-subscription> --output json
az rest --method get --url 'https://management.azure.com/subscriptions/<confirmed-subscription>/providers/Microsoft.Authorization/policyExemptions?api-version=2022-07-01-preview&$filter=atScope()' --subscription <confirmed-subscription> --output json
```

All five commands exited zero with empty stderr; Azure CLI 2.84.0 and Python 3.9.6.
Each ARM endpoint was invoked once, in the order shown; no nextLink required
pagination. The subprocess runner stopped on any nonzero exit or context drift,
requested zero Azure Core retries and disabled CLI telemetry. No manual retry,
alternate API version or alternate identity was used. No additional prerequisite
query was needed. Public documentation lookup used generic API terms only; two
documentation fetches were unavailable, not ARM failures. They conferred no authority.

The wildcard action entry suggests broad current management-plane action coverage,
including resource-group/resource operations and RBAC actions at this queried scope,
before other enforcement. It identifies no role, proves no Owner assignment and
does not test a write. `notActions` are per-entry exclusions, not deny assignments;
none were returned. Empty data-action arrays establish no data-plane grant.
Conditions, eligible versus activated PIM roles, session/MFA requirements, resource
locks, policy evaluation and future scope-specific authority still matter. The
separately returned elevation action was not invoked.

Deterministic results are command exits, context equality, response fields/counts,
pagination and copy/hash verification. Their interpretation and remaining prerequisite
classification are bounded technical judgment. This task used the supplied specialist
context and local tools; no separately spawned fresh reviewer/model context was
available or used, and model identity was not exposed. Shared-model/context limitations
remain; these observations are not an independent architecture review.

WV01-WV04 remain NOT RUN until fixed design/plan inputs at `design-released`;
WV05-WV14 remain NOT RUN at `locally-validated`; formal WV15-WV17 remain NOT RUN
at `deployment-ready` (the discovery preflight is not a full WV15 pass).
WV18-WV22 remain NOT RUN at `operationally-verified`. AI01-AI06/ML01-ML08 are not
evaluated in this infrastructure-prerequisite assignment; their relevant later package
plans own applicability and thresholds. No missing later check is itself a current
F02 blocker. No Bicep candidate, evaluation dataset or approved quality thresholds
exist in this scope; no application/ML acceptance or statistical competence is claimed.
