# Architecture

## Maintained Design

- [`business-process-flow.md`](./business-process-flow.md) — business ownership and
  claim-to-payment flow, including normal farmer evidence, exception/random
  validation, independent inspection, and the advance/final-payment lifecycle.
  Includes an [editable Excalidraw overview](./business-process-flow.excalidraw).
- [`aks-centered-foundry-architecture.md`](./aks-centered-foundry-architecture.md) —
  recommended design using AKS CPU for the agent runtime and deterministic application
  services, Microsoft Foundry for foundation models, Azure ML managed
  compute/endpoints for the crop classifier, and Copernicus processing APIs for raster
  workloads.

The earlier GPU-serving design has been retired. The AKS-centered Foundry design is
the baseline for the CAP crop-classification case when
Foundry access is available, GPU node pools cannot be provisioned in AKS, and
operating agents on AKS is part of the platform-learning objective.
