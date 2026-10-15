---
name: iac-06-validate-local
description: Independently execute local build, lint, parameter and control assertions on a fixed candidate.
agent: infrastructure-tester
---

Read `AGENTS.md`; require an accepted local-validation assignment, fixed candidate,
released design and accepted development/test plans.
Load `ama-workload-validation`. Execute WV05-WV14 for every scoped module/root and
required parameter variant; record diagnostics, effective-property assertions,
actual commands/results and later pending checks in `test-review.md`.
Independent security/compliance reviews and architect conformance are separate
required dispositions, not passes this role can invent. Return defects without
editing production code. Do not contact Azure or automatically advance the gate.
