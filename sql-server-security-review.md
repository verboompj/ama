# Azure SQL Server Security Review

## Screenshot-Based Assessment

**Server:** `srvphild001`  
**Overall risk:** **Elevated**

The configuration permits relatively broad access to the Azure SQL public endpoint. Authentication is required, but the network boundary is weaker than a private-access design.

---

## Key Findings

| Finding | Risk |
|---|---|
| "Allow Azure services and resources" is enabled | High |
| Broad public IP ranges are allowlisted | High |
| Personal or home access rules are present | Medium-High |
| Microsoft Entra-only authentication is disabled | Medium-High |
| No virtual-network rules are shown | Medium |
| Microsoft Purview status is "Not Governed" | Governance gap |
| Entra administrator appears group-based | Positive |

---

## Main Exposure

### Public network access

- Azure resources outside Philips can attempt connections.
- Some firewall rules permit nearly complete `/24` address ranges.
- Personal and shared proxy addresses are difficult to govern.
- The private `10.x.x.x` firewall entry is likely ineffective or stale.

### Authentication

- Microsoft Entra authentication is configured.
- Entra-only authentication is **not** enforced.
- SQL usernames and passwords may therefore remain usable.

---

## Recommended Target State

1. Use an Azure SQL **private endpoint**.
2. Disable public network access.
3. Disable **Allow Azure services and resources to access this server**.
4. Remove broad, personal and stale firewall rules.
5. Migrate applications to managed identities or service principals.
6. Enable Microsoft Entra-only authentication after compatibility validation.
7. Review Entra administrator group membership through PIM and access reviews.

---

## Immediate Actions

| Priority | Action |
|---|---|
| P1 | Identify dependencies on the broad firewall rules |
| P1 | Validate whether a private endpoint already exists |
| P1 | Disable the Azure-wide firewall exception |
| P2 | Remove personal, obsolete and ineffective rules |
| P2 | Inventory SQL-authenticated applications |
| P3 | Validate auditing, Defender for SQL and diagnostic logging |

---

## Conclusion

The current configuration relies heavily on firewall allowlists and authentication rather than strong network isolation.

**Recommended direction:** private connectivity, Entra-only authentication and centrally governed access.

---

## Estate and Licensing Observations

The additional screenshots show:

- **79 registered SQL Server on Azure VM resources**
- **2,313 SQL Server instances represented through Azure Arc**
- Production and non-production subscriptions
- Standard, Developer and Express editions
- The visible Azure VM records are marked **Pay As You Go**

The Arc number represents SQL instances, not necessarily 2,313 separate machines. Multiple named instances can exist on one host.

---

## AHB and Contract Implications

- The screenshots do not show Azure Hybrid Benefit applied to the visible SQL VMs.
- PAYG classification should be intentional for Standard and Enterprise workloads.
- Developer and Express editions should not consume paid SQL production licenses, but their usage rights must still match the workload.
- Azure Arc inventory must be reconciled separately against the Philips SQL contract position.
- Do not compare the instance count directly with purchased cores; licensing requires edition, host type, physical or virtual cores, cluster role and mobility information.

---

## Required Reconciliation

Create one inventory joining:

| Required field | Purpose |
|---|---|
| Host and SQL instance | Remove duplicates and identify multiple instances |
| Environment | Separate production, non-production and development |
| Edition | Determine applicable licensing rules |
| Physical or virtual cores | Calculate required core licenses |
| Azure VM, Arc or other host | Determine the licensing mechanism |
| PAYG, AHB or existing license | Determine current coverage |
| Active or passive role | Validate HA/DR rights |
| EA/MCA entitlement source | Prove contractual coverage |

**Priority:** reconcile the 79 Azure SQL VMs and 2,313 Arc-visible instances before making subscription-wide AHB assignments.

---

## Estate Health Dashboard

The Microsoft Fabric database dashboard reports:

| Metric | Result |
|---|---:|
| Total database resources | 2,989 |
| Resources with estate issues | 697 |
| Total issues | 1,547 |
| Security issues | 1,338 |
| Performance issues | 209 |
| Resources affected by security issues | 544 |
| Resources affected by performance issues | 153 |

Issue categories can overlap on the same resource, so category counts must not be added to calculate unique affected resources.

---

## Estate-Wide Security Findings

| Finding | Affected resources |
|---|---:|
| Public network access enabled | 516 |
| Microsoft Entra authentication not enabled | 492 |
| Endpoint is not private or in a virtual network | 330 |

This confirms that the configuration observed on `srvphild001` is part of a broader control gap rather than an isolated exception.

**Security priority:** establish policies for private endpoints, restricted public access and Microsoft Entra authentication, then track exceptions centrally.

---

## Capacity Findings

| Finding | Affected resources |
|---|---:|
| Storage above 85% | 119 |
| Memory above 90% | 85 |
| Compute above 90% | 5 |

Storage presents the widest immediate capacity risk. Memory pressure may indicate workload contention or undersized hosts, while the smaller compute set should be reviewed for acute saturation.

**Operational priority:** remediate storage first, then review sustained memory and compute trends before resizing or changing license assignments.
