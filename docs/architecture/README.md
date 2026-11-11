# Architecture

## Maintained Design

- [`business-process-flow.md`](./business-process-flow.md) — business ownership and
  claim-to-payment flow, including normal farmer evidence, exception/random
  validation, independent inspection, and the advance/final-payment lifecycle.
  Includes an [editable Excalidraw overview](./business-process-flow.excalidraw).
- [`aks-centered-foundry-architecture.md`](./aks-centered-foundry-architecture.md) —
  maintained design using AKS for application, API and deterministic rules services,
  Foundry Agent Service for custom runtime agents, Foundry for foundation models,
  Azure ML for the crop classifier, and Copernicus processing APIs for raster workloads.
- [`decision-agent-architecture.md`](./decision-agent-architecture.md) — the proposed
  Foundry-hosted Decision Support Agent, implementing the existing Discrepancy
  Resolution role: evidence and ML inputs, controlled tools, farmer and field
  follow-up, reassessment, durable journal and operational telemetry.

## Deployment and Decision Views

- **[Azure-icon deployment overview](./azure-deployment-overview.png)** —
  [scalable SVG](./azure-deployment-overview.svg) and
  [editable Excalidraw](./azure-deployment-overview.excalidraw).
- **[Decision-agent evidence and follow-up loop](./decision-agent-flow.png)** —
  [scalable SVG](./decision-agent-flow.svg) and
  [editable Excalidraw](./decision-agent-flow.excalidraw).
- [Official icon provenance and use terms](./azure-diagram-icons.json).

The user-approved proposal direction of 11 November 2026 moves custom runtime-agent
hosting from AKS to Foundry Agent Service while retaining AKS application services.
The maintained design records that change explicitly. Region, private integration,
identity, capacity and cost feasibility remain design-release dependencies.
These are proposed target views; the existing WP-001 foundation release and its
blocked implementation evidence remain unchanged. The earlier GPU-serving design
remains retired.
