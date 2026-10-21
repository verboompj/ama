# Assignment: WP-001 / proposed evidence-plan amendment

| Field | Value |
|---|---|
| Coordinator / writer | Current CLI coordinator / azure-architect |
| User authority | Requesting user selected “Prepare an alternative evidence plan for independent review”, 21 October 2026 |
| Scope / target gate | Propose an explicit design-acceptance/evidence amendment for F04-03 and the managed-Gateway TLS evidence part of F04-06. Preparation only; existing requirements remain in force |
| Fixed workload inputs | [S002 manifest](../snapshots/S002/manifest.md), seven preserved inputs/eighteen committed references, especially design AC03 and feasibility F04-03/06. Current assignment provides the new proposal-only authority |
| Existing blocker / author result | F03 corrective cycle 2 stopped without edits: public managed add-on defaults/placement and managed Gateway minimum-TLS contract could not establish current pre-release criteria |
| Accepted risk / target owner | Regulated FND-05; requesting user owns target, risk and scope-amendment approval; independent reviewers do not waive findings |
| Sole write path | `delivery/releases/WP-001/evidence-plan-amendment.md`; architect ownership explicitly assigned |
| Required proposal | Before/after criterion and earliest-gate matrix; known/unknown evidence; bounded qualification stages, identity/network/data/cost preconditions; exact positive/negative tests and acceptance thresholds; fail/stop/recovery and change/retest triggers; who approves each stage |
| Security invariant | TLS at least 1.2, private-only application access, no real claimant/case data and fail-closed image/admission requirements are not weakened. Missing evidence remains unknown, not a pass |
| Capacity invariant | No invented managed requests, no guarantee inferred from population or a raw CPU sum. State per-node allocatable/bin-packing/DaemonSet/rollout/reserve checks, fixed resource/quota bounds and no production/application admission before qualification |
| Stage boundary | Any proposed Azure qualification requires the later original design/plan/cost approval, exact target/identity/scope confirmation, authorised validate/what-if and explicit deployment approval. This assignment authorises no such execution or spend |
| Other findings | Do not silently resolve/defer F04-01/02/04/05/07/08 or the missing signature/admission specification. Identify which contracts remain mandatory before design release and require native-gap review/human approval |
| Required review | Fresh non-author infrastructure-tester and security-reviewer examine the same preserved proposal for adequacy, no false passes and residual risk. Affected privacy/compliance assertions and full design reviews remain required |
| Author loop | Same `WP001-F03-AUTHOR`, cycle 3 reserved; maximum 5, 3 used / 2 remaining. Proposal does not reset any failed feasibility, review or snapshot budget |
| Model | HIGH `gpt-6.1-sol`; actual runtime if exposed, otherwise NOT VERIFIED; no fallback or downgrade |
| Tools / research / limits | Relevant skills and official public technical queries only; no repository text/private identifiers sent externally. No user-set AI-credit/time ceiling; actual accounting may be unavailable |
| Forbidden | All other writes including design/cost, infra/Kubernetes/workflow generation, Azure calls/login/validation/what-if/mutation, browsers, app/Foundry/ML jobs, onward delegation, commit/push |
| Output / stop | One review-ready proposal or exact blocker, actual sources/checks, loop consumption, safe output hash if available and stopped-writing acknowledgement. No approved amendment or release claim |

Accept/reject inputs before work. Update SQL `wp001-evidence-amendment` to `done`
for the delivered proposal (not approval), or `blocked` with the missing input.
If SQL is unavailable, return that fact and the intended update to the coordinator.
The parent owns lifecycle/handoffs and preserves the stopped proposal before review.
