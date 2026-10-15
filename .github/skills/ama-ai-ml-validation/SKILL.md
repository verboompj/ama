---
name: ama-ai-ml-validation
description: Independently validate workload runtime AI, application contracts and ML candidates against fixed inputs, locked evaluation protocols and approved targets.
---

# AMA Independent Application, AI and ML Validation

1. Load `ama-context` and `ama-handoff`. Use `docs/delivery/ai-ml-checks.md` for
   workload application/model artifacts.
2. Before work, require the scoped assignment, frozen candidate/evaluation inputs,
   accepted risk path, owner-approved thresholds/tolerances, loop ledger and evidence
   permissions. Use fresh reviewer context when supported; record actual limits. Record
   unavailable datasets, statistical competence, tooling or approvals as blockers;
   request an authorised human domain expert when needed, not a fabricated pass.
3. Independently author acceptance/evaluation tests. Exercise schema/error handling,
   case/tool authorisation, human boundaries, untrusted runtime content, source
   grounding, explicit model/tool outages and evidence/scoring integration.
4. Separate deterministic mocks from authorised live-model experiments. Version the
   runtime prompts/models/tools/retrieval corpus and test cases; capture evaluation
   method, sample coverage, repeat variability, costs and trace references.
5. Verify ML lineage, data exclusions, grouping and temporal/cutoff isolation.
   Lock final-test IDs and protocol before candidate results; evaluate approved
   baselines, class/slice quality, calibration and abstention with stated limitations.
6. Reproduce a frozen candidate from pinned inputs/configuration/environment within
   the approved tolerance. Numerical reproducibility and predictive adequacy are
   different assertions; require evidence for each.
7. Report independent results in `test-review.md`, with AI/ML check IDs, target gate,
   tested artifact versions, metrics and actual evidence. Do not modify production
   code, features, labels, thresholds or models to make a check pass.
8. Return defects to the app or ML writer; return design ambiguity to the architect.
   Preserve the five-total-attempt ledger across fixes and snapshots. A failed final
   test is not permission to tune on it; changed protocols need explicit approval.
   Security/compliance consume evidence but do not supply the statistical verdict.
