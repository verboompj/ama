# Assignment: WP-001 / F03 / Foundation Design

| Field | Value |
|---|---|
| Package / task / attempt | WP-001 / F03 / initial authoring cycle 1 |
| Coordinator / specialist | Current CLI coordinator / azure-architect |
| Authorisation | User, 21 October 2026: coordinate WP-001 through design, review, implementation, validation and deployment, with reviewed design, implementation plan and complete cost estimate submitted for approval before implementation |
| Current execution boundary | Foundation design and public technical/pricing research only; later phases remain conditional on their required approvals |
| Gate / risk | Prepare inputs to `design-released`; accepted regulated foundation path, FND-05 |
| Exact baseline | `01002b21e5c6cb57d391c685adcbc05f03885b38` |
| Input paths | `AGENTS.md`; `delivery/README.md`, `workload-guidance.md`, `workload-checks.md`, `handoffs.md`, `multi-agent-framework.md`, `releases/README.md`; `docs/architecture/aks-centered-foundry-architecture.md`; WP-001 `context.md`, `decisions.md`, `assessment.md` and historical `ledger.md` at that commit |
| Approved target owner / boundaries | Requesting user; FND-01 through FND-16 supply accepted requirements and distinguish proposals. One non-production foundation, public/synthetic only, no reuse/change of existing estate, private application audience, maximum three users, single-region direction, accepted tags and naming direction |
| Design-derived proposals | Exact network/access/identity choices, capacity, recovery, operating hours and cost are proposals for human approval, not already-approved targets. Three users and sampled SKU availability are not sizing evidence |
| Required context | `ama-context`, `ama-design-release`, `ama-handoff`; maintained architecture sections relevant to the foundation; existing accepted decisions, including AKS Standard, CNI Overlay/Cilium, Workload Identity and NAP disabled |
| Additional inputs | Separately owned early `security-requirements.md` and `compliance-requirements.md`; coordinator forwards their exact references after handoff. Do not treat unfinished files as fixed review inputs |
| Write ownership | Only `delivery/releases/WP-001/design.md` and `delivery/releases/WP-001/cost-estimate.md` |
| Read-only / forbidden | All other repository paths. No Bicep generation, Azure account/resource queries, validation/what-if, mutation, identity/tenant changes, deployments, pipelines, app/Foundry/ML implementation, acquisition/model calls, browser windows, commits or pushes |
| Research | Discover Learn MCP if exposed; otherwise record its absence and use official public documentation, published AVM information and public Azure retail pricing. Queries contain public technical terms only, no repository text/identifiers |
| Outputs | Decision-ready design: bounded resources/interfaces, selected recommendation and meaningful alternatives, exact proposed naming/address/access/identity contracts, node-pool workload/resource assumptions, upgrade/scaling quota envelope, all-five-pillar trade-offs and acceptance matrix. Complete itemised cost estimate with sources/date/currency, quantities, operating assumptions, always-on/residual costs, usage-variable formulas and uncertainty |
| Cost integrity | Do not invent prices, credit balance, eligibility or cost approval. Separate fixed estimate from variable envelope and exclusions. Explicitly flag any unpriced in-scope item or unknown access/support requirement; a partial estimate is not complete |
| Review ownership | Bicep engineer checks exact published AVM feasibility after draft; infrastructure-tester owns independent five-pillar review/test plan; security/compliance own their design findings; architect integrates corrections |
| Checks / limits | Author-quality loop `WP001-F03-AUTHOR`, maximum 5 total cycles, initial cycle 1 reserved in ledger; report actual checks and consumption. Do not restart F02-DISCOVERY (2 used / 3 remaining) |
| Time / cost limits | No user-set AI-credit or elapsed-time ceiling; no Azure spend authorised. Host model defaults; actual cost/model measurement may be unavailable and must not be invented |
| Human decisions | Fixed design, proposed targets/deviations, implementation plan and complete cost require actual human approval; design release and deployment permission remain absent |
| Snapshot producer | Infrastructure-tester after stopped-writing handoffs; parent host operator may preserve explicitly assigned non-sensitive inputs under package snapshots |
| Acceptance / stop | Accept or reject this assignment first. Stop after a coherent draft/cost handoff or genuine blocker. No onward specialist delegation. Parent coordinates feasibility, snapshots, review and approval |

Return a handoff identifying inputs, output paths/revision, checks, attempts,
proposals/deviations, missing evidence and next owner. Specialist execution does
not approve its own design or authorise implementation.
