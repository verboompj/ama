# Architecture

## Options

- [`aks-centered-foundry-architecture.md`](./aks-centered-foundry-architecture.md) —
  recommended design using AKS CPU for the agent runtime and deterministic application
  services, Microsoft Foundry for foundation models, Azure ML managed
  compute/endpoints for the crop classifier, and Copernicus processing APIs for raster
  workloads.
- [`copernicus-ai-solution-architecture.md`](./copernicus-ai-solution-architecture.md)
  — earlier, broader Earth-observation design with custom AKS orchestration and
  GPU-based model/raster workloads in AKS.

The AKS-centered Foundry option is preferred for the CAP crop-classification case when
Foundry access is available, GPU node pools cannot be provisioned in AKS, and
operating agents on AKS is part of the platform-learning objective.
