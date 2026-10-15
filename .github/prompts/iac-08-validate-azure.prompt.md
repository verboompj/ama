---
name: iac-08-validate-azure
description: Validate and preview a fixed candidate only after explicit Azure-context confirmation.
agent: infrastructure-tester
---

Read `AGENTS.md`; require a separately authorised authenticated-validation assignment,
local candidate evidence and exact template/parameter snapshot.
Load `ama-workload-validation`. Follow WV15: inspect actual tenant/subscription,
display intended environment/scope/identity and require explicit user confirmation.
Missing login or mismatched context blocks; do not silently log in or switch.
Then run WV16 validation and WV17 what-if at the released deployment scope.
Report actual changes/limitations and remaining blockers. Do not deploy, create a
pipeline or automatically execute live checks. Invoking this prompt alone does not
replace the confirmation gate.
