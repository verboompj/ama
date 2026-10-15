---
name: ama-ml-lifecycle
description: Build reproducible AMA crop-data and ML candidates using approved sources, leakage-safe splits, prefix features, calibration and versioned scoring contracts.
---

# AMA ML and Data Lifecycle

1. Load `ama-context` and `ama-handoff`. Read
   `docs/copernicus/crop-classification/crop-classifier-training-procedure.md` and
   the assigned prototype/production data plan. Confirm authorised source access,
   region/years/classes, geometry status, compute, targets and human approval owners.
2. Require the accepted risk path and released scoped design/actual plan before
   implementation. Confirm download, storage and compute permissions.
3. Produce machine-readable source, geometry, dataset, taxonomy and feature manifests:
   immutable identifiers/versions/hashes, acquisition and availability timestamps,
   licences, exclusions, authority status and approved protected storage references.
   Keep raw datasets, personal data and credentials out of repository reports.
4. Preserve grouping across holdings, spatial clusters, duplicate/successor geometries,
   years and every cutoff snapshot. Freeze independent test partitions before fitting;
   record out-of-time/out-of-region applicability and missing coverage.
5. Use observations acquired and available by each cutoff. Keep declarations,
   target-year CLMS labels/confidence and later inspection outcomes out of predictors.
   Recompute prefix features; unsupported windows return an explicit unknown result.
6. Pin code/dependencies/environment, input manifests, feature order, taxonomy,
   seeds and training configuration. Train approved baselines before complexity.
   Calibrate/select thresholds using validation only; do not tune on the final test.
7. Publish ML01-ML08 artifacts: model/card, calibration, supported cutoffs, slice/error
   results, scoring schema and replay commands with agreed numerical tolerances.
   Record weak-label agreement honestly, separately from inspection-backed quality.
8. Hand the frozen candidate to the tester for independent verification. Final-test
   findings must not become tuning data; any changed evaluation protocol/test reserve
   needs explicit approval and preserved history, not an automatic budget reset.
9. Keep registration/promotion, endpoint provisioning and staged operational use
   separately authorised. Obtain the existing procedure's human approvals; engineering
   profiles cannot provide those legal, CAP operations or model-risk decisions.
