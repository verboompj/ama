# Crop Classification

This folder contains the project-specific design for recognising crop types from
Copernicus Earth-observation data and using those results as explainable evidence in
the CAP claim-verification workflow.

The classification goal is:

> Given an agricultural analysis unit or official LPIS parcel and a seasonal
> Sentinel-1/Sentinel-2 time series, estimate the crop class and uncertainty, compare
> the result with the declared crop, and produce traceable evidence without turning
> the model prediction into an autonomous legal decision.

## Documents

- [`agricultural-analysis-use-case.md`](./agricultural-analysis-use-case.md) —
  end-to-end crop-type and parcel-area analysis, evidence outputs, and evaluation.
- [`crop-classifier-training-procedure.md`](./crop-classifier-training-procedure.md) —
  label governance, dataset construction, leakage-safe splitting, training,
  calibration, approval, deployment, and retraining.
- [`public-data-crop-prototype-plan.md`](./public-data-crop-prototype-plan.md) — agreed
  CLMS/Sentinel public-data route for the first capstone/MVP implementation.
- [`high-resolution-data-strategy.md`](./high-resolution-data-strategy.md) — Sentinel
  resolution risks, mixed-pixel controls, Copernicus VHR access, commercial imagery,
  and evidence escalation.
- [`sample-data/`](./sample-data/) — Hungarian Sentinel-2 true-colour/NDVI samples,
  demonstration AOI, and scene metadata.

General Sentinel mission, band, quality-layer, and Copernicus dataset descriptions
remain in [`../sentinel-data-and-layers.md`](../sentinel-data-and-layers.md).

