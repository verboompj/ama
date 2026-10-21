# Handoff: F03 Draft r1 to F04 Feasibility

| Field | Value |
|---|---|
| Sender / recipient | azure-architect / coordinator, onward to bicep-engineer and documenter |
| State | Coordinator accepted coherent draft delivery, not technical/design approval |
| Assignment / author cycle | [F03 design](../assignments/F03-design.md); `WP001-F03-AUTHOR` 1/5 consumed, 4 remaining |
| Input baseline | `01002b21e5c6cb57d391c685adcbc05f03885b38`, supplemented by completed early SEC/CR requirements handoffs |
| Outputs / preservation | [design.md](../design.md), [cost-estimate.md](../cost-estimate.md), draft r1; writers stopped. Exact bytes preserved in [S001](../snapshots/S001/manifest.md) |
| Preservation | Assigned host operator; 5 uncommitted inputs copied and verified, 16 committed dependencies recorded; `WP001-DESIGN-SNAPSHOT` 1/5 consumed |
| Scope / next action | Bounded AVM feasibility and matching draft guide, followed by complete frozen independent review inputs |
| Human approval | NOT RUN; no implementation or deployment permission |

The proposal includes private AKS/ACR, P2S VPN and DNS resolver/private-CA access,
Firewall Standard with downstream NAT, explicit pools and workload identities.
Proposed capacity is 10 initial / 12 maximum / 18 overlapping-upgrade vCPUs.
These assumptions and sizes remain proposals, not measured workload or accepted
targets.

The architect proposes a USD 2,030 demo approval allowance, not an approved
ceiling. Substantial always-on access/security costs remain when cluster compute
is stopped. All figures require independent arithmetic/source/completeness review;
the coordinator has not independently endorsed the estimate.

Author inspection covered capacity/address arithmetic, resource/cost mapping,
access paths, requirements, five pillars and earliest gates. Executable arithmetic,
parser checks, AVM feasibility, non-author reviews and all Azure/live checks were
NOT RUN by the architect. S001 now establishes snapshot-time byte integrity,
not retrospective author verification of every Git object.

Release blockers include exact AVM/contracts, add-on/Gateway API feasibility,
network overlap and egress inventory, bootstrap authority, proposed target/cost
approval, privacy/contract/corporate disposition and D-HA/D-MON/D-SEC decisions.
The coordinator does not waive them by accepting the draft.
