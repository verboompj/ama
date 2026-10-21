# Assignment: WP-001 / F02 / Authenticated Prerequisite Recheck

| Field | Value |
|---|---|
| Objective | Resume the blocked read-only permissions assessment after the user's Azure CLI re-authentication |
| Authorisation | User, 21 October 2026: "i did re-authenticate azure cli, you should be ok assessing"; continue against the same previously confirmed subscription/tenant |
| Input revision | `fe983de9444e808388c9815e9414400604e640aa`: current assessment, decisions, context and delivery contracts; this assignment and the attempt reservation are coordinator-owned execution records |
| Target preflight | Coordinator refreshed `az account show`; exact subscription/tenant match the previously confirmed target and subscription state is Enabled. Exact identifiers stay outside Git |
| Risk / gate | Regulated foundation; prerequisite discovery only, not independent design/candidate approval or authenticated deployment validation |
| Assigned executor | infrastructure-tester, for bounded read-only observation and its evidence report |
| Write ownership | Only `assessment.md`, `decisions.md` and `ledger.md` within this package; raw API/command evidence and hashes in session-local `files/foundation-recheck-20261021/`. Coordinator owns this assignment; separate documenter owns root `README.md` |
| Azure scope | Effective subscription permissions; visible inherited deny assignments and policy exemptions where supported; narrowly scoped remaining prerequisite reads justified by these findings |
| Existing evidence | Reuse attempt-1 provider, quota/SKU, AKS-version and inventory observations with their original date; do not rerun the full batch merely to refresh reports |
| Check method | Inspect existing context before scoped queries; use explicit subscription arguments or full ARM subscription paths; capture timestamps, command, return code and errors; follow pagination or report incomplete coverage |
| Result contract | Distinguish observed action permissions from actual write proof, deny/condition limitations and approvals. Record PASS/BLOCKED/NOT RUN accurately; preserve attempt-1 history without leaving resolved authentication blockers as current facts |
| Attempt budget | Stable loop F02-DISCOVERY; attempt 2 of maximum 5 reserved before queries; 2 used / 3 remaining. No resetting the counter or hidden retries |
| Stop | On renewed authentication failure, context drift, unsupported API or missing permission, record the result without login, switching or trying another identity. No third attempt without coordinator disposition |
| Forbidden | Login/browser, context switch, provider registration, resource/identity/RBAC writes, credentials/token output, data-plane probes, validate/what-if/deploy, workflows, paid jobs, commit or push |
| Handoff | Return sanitised findings, exact changed paths, current blockers/next owner, check results and attempt consumption. Discovery findings do not accept risk, approve design or authorise deployment |

The user's instruction authorises this continuation and separate documentation
update. It does not authorise Azure mutation or resolve outstanding design choices.
