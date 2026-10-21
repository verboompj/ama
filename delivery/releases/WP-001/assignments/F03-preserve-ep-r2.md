# Assignment: WP-001 / preserve corrective EP-r2 S005

| Field | Value |
|---|---|
| Producer / authority | Explicitly assigned current tool-capable CLI host operator; same user-authorised proposal and independent review |
| Purpose / base | Exact common EP-r2 retest inputs; base `5ecf21c2e8333b83c176073b02fece55c9a16f62`; no approved method/gate change |
| Source set | WP-001 `context.md`, `design.md`, `cost-estimate.md`, `security-requirements.md`, `compliance-requirements.md`, `feasibility.md`, `documentation.md`; stopped `evidence-plan-amendment.md` EP-r2; author assignments `F03-evidence-amendment.md` and `F03-revise-evidence-amendment.md`; both stopped EP-r1 review reports; immutable S004 manifest for prior proposal/review-assignment provenance |
| Expected EP-r2 | SHA-256 `5ab1f9e46502d09110f8767deb13f764b6c876ea63d6ff6b8fca139c0d3f476b` |
| Dependencies / checks | Same eighteen committed references as S004; verify all thirteen S004 preserved bytes, then thirteen current source/copy hashes and eighteen Git-object hashes. EP-r1 remains unchanged in S003/S004; live EP-r2 is an intentional new revision |
| Write ownership | New `delivery/releases/WP-001/snapshots/S005/` only; generated manifest and exact-byte copies; no overwrite/deletion |
| Counter | Same `WP001-DESIGN-SNAPSHOT`, maximum 5; attempt 5 reserved, **5 used / 0 remaining**. This is the final permitted preservation attempt in this loop; no S006/hidden retry/reset |
| Method / stop | Node/SHA-256/Git reads, regular files only. Stop on missing/drifted input or existing destination. No Azure, browser, secrets, unrelated writes, commit/push |

Current preservation/retest assignments, ledger, manifest and new review outputs
remain outside their own input hash set. S004's earlier immutable manifest and
copies identify prior reviewer assignments without mutating them. After this
attempt, unchanged fixed inputs can still be reviewed within reviewer budgets,
but further preservation under this loop must stop and be escalated.
