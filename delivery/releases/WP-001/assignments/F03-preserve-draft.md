# Assignment: WP-001 / F03 / Preserve Draft S001

| Field | Value |
|---|---|
| Coordinator / producer | Current CLI coordinator / explicitly assigned tool-capable host operator, substituting for infrastructure-tester |
| Objective / authority | Preserve non-sensitive, stopped-writing design inputs for bounded feasibility and documentation under the user's coordinated WP-001 instruction |
| Base commit | `01002b21e5c6cb57d391c685adcbc05f03885b38` |
| Snapshot / location | `S001` / `delivery/releases/WP-001/snapshots/S001/` |
| Exact uncommitted input set | WP-001 `context.md`, `design.md`, `cost-estimate.md`, `security-requirements.md`, `compliance-requirements.md` |
| Stopped-writing acknowledgement | Architect's completed draft-r1 handoff; security and compliance completed requirements handoffs; coordinator stops context edits before preservation |
| Committed dependencies | Relevant `AGENTS.md`, delivery contracts/templates/checks, maintained architecture, WP-001 decisions/assessment and historical ledger at the base commit; exact paths/hashes in generated manifest |
| Permitted writes | Snapshot directory only; no source modification, credentials, raw subscription inventories or sensitive records |
| Method / output | Node filesystem/Git-object reads, SHA-256, exact-byte copies, copy verification; generated `manifest.md` with producer/tool/base/input coverage, explicit deletions and limitations |
| Gate / interpretation | Evidence handling for draft feasibility/documentation, not design review or release. Feasibility output will be included in a later complete review snapshot |
| Loop / limits | `WP001-DESIGN-SNAPSHOT`, maximum 5 total design-stage preservation/check attempts across snapshots and fixes; initial attempt 1 reserved before execution; no user-set time/AI-credit ceiling |
| Exclusions | Assignment, manifest, lifecycle ledger and future review outputs are outside their own input hash set; no Azure, browser, deploy, commit or push |
| Stop | Reject missing/unsupported input, unexpected committed-source drift or failed copy verification; report honestly without overwriting a prior snapshot |

This preservation establishes the bytes at snapshot time, not proof that an
earlier author independently verified every historical Git object it read.
