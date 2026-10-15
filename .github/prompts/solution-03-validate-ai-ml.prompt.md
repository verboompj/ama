---
name: solution-03-validate-ai-ml
description: Independently verify released workload application/AI and ML candidates against approved evaluation criteria.
agent: infrastructure-tester
---

Read `AGENTS.md`; require the accepted AI/ML validation assignment, fixed candidate
and evaluation inputs, pre-agreed targets, exact interfaces and existing loop ledger.
Load `ama-ai-ml-validation`. Execute only applicable AI01-AI06 and ML01-ML08 checks
from `delivery/ai-ml-checks.md`; reference actual commands, metrics, limitations
and remaining later-gate work in `test-review.md`. Apply at most five total attempts.
Missing expertise/data/tools/approval blocks the relevant check. Never patch the
candidate, tune on final-test results or infer live behaviour from mocks.
Deployment, remote calls and model promotion require separately scoped authority.
