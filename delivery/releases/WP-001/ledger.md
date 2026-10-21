# WP-001: State and Evidence Ledger

## Current State

| Field | Value |
|---|---|
| Package | Non-production foundation |
| State | `draft` |
| Current activity | Scope/decision preparation |
| Authorised scope | Repository planning records only; user instruction of 21 October 2026 referenced in [context](context.md) |
| Baseline input | `ffa66c5b0efc7d144170db9464957123faef6eb5`, scoped architecture and delivery contracts |
| Current planning outputs | Working-tree versions of context, decisions, ledger and F01 assignment; no immutable candidate review reference yet |
| Risk path | Pending accountable-owner acceptance |
| Design release / human approval | Not recorded |
| Azure discovery / validation / deployment | NOT RUN; not authorised by this preparation task |
| Next owner | User/accountable owners supply FND-01 through FND-05; coordinator records answers and routes F02 |

## Task State

| Task | State | Evidence / blocker |
|---|---|---|
| F01 | done | [Context](context.md), [decision register](decisions.md), this ledger and [accepted preparation assignment](assignments/F01-scope.md); decision preparation only |
| F02 | blocked | Owners, target environment/inventory, data boundary and accepted risk path pending |
| F03-F07 | pending | Their prerequisites and assignments remain pending |

## Decisions and Approvals

| Reference | Decision / disposition | Authority and scope |
|---|---|---|
| User instruction, 21 October 2026 | Bounded foundation scope and decision-record preparation accepted | Repository planning only |
| FND-01-FND-19 | OPEN | See decision register; no environment/design/deployment approval inferred |

## Review / Test / Validation Loops

No workload design, candidate or environment review loop has started. Create a stable
loop row when its assignment and fixed input set are ready; reserve a slot before
execution. Maximum **5 total attempts**, including the initial attempt, or a lower
assigned limit. Preserve counters across fixes, snapshots, sessions and reassignment.

| Stable loop ID | Objective / reviewer / gate | Maximum total attempts | Used / remaining | Attempt / fixed inputs / result |
|---|---|---|---|---|

Documentation author checks on these planning records do not supply workload review
or release evidence. Record future review/test reports and genuine human approvals
against exact inputs. Gate/counter accounting is procedural.

## Resume and Change Rules

Read this ledger, the accepted decisions and the relevant assignment before resuming.
Verify current input revisions and output ownership. Keep one writer per path.
Uncommitted reviewed inputs need preserved bytes/hashes under the
[snapshot protocol](../README.md#snapshot-protocol); committed inputs use exact
commit/path references. Keep approval/state updates outside frozen input sets.

Changed decisions/design/code invalidate affected evidence. Record the impact,
return defects to the owner, and rerun required checks within the existing loop
budget. Required missing evidence blocks its gate; later checks remain pending.
