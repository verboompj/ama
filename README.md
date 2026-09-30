<p align="center">
  <img src="assets/ama-logo.png" alt="AMA — Azure Master Architect" width="160">
</p>

<h1 align="center">AMA — Azure Master Architect</h1>

<p align="center">
  A working case-study repository exploring agentic AI solution design on Azure,
  grounded in real-world public-sector regulatory and geospatial-data constraints.
</p>

---

## Purpose

This repository documents the end-to-end **solution design exercise for Case Study 47**:
an agentic AI system that verifies EU Common Agricultural Policy (CAP) subsidy claims
using Copernicus (Sentinel) satellite imagery for a fictional Hungarian paying agency.

It captures the full design journey — not just the final architecture:

- **Understanding the case** — business challenge, stakeholders, objectives, and the
  proposed agentic architecture brief.
- **Solution design questions** — the open questions worked through across business,
  data, agent scope, governance, privacy, security, and technical architecture before
  committing to a design.
- **Regulatory & compliance research** — CAP regulations, the Area Monitoring System,
  GDPR, the EU AI Act, NIS2, INSPIRE, eIDAS, and related frameworks that constrain the
  solution.
- **Copernicus reference material** — an inventory of the Copernicus programme's open
  data services, Sentinel satellites, contributing missions, tools, and access portals.
- **Architecture** — the proposed AI solution design, including how components map to
  AKS (self-hosted business logic/agents) versus managed Azure AI/data services.

## Repository Structure

```
.
├── case/                    # The original case study brief (source material)
├── casestudy/               # Case understanding write-up & open design questions
├── docs/
│   ├── architecture/        # Proposed AI solution architecture (AKS + Azure AI services)
│   ├── copernicus/          # Copernicus data/services/tools inventory
│   ├── regulatory-compliance/ # Regulatory & legal framework summaries
│   └── research/            # Supporting research notes
└── assets/                  # Repository media (logo, etc.)
```

## Who This Is For

Solution architects, AI engineers, and anyone studying how to design agentic AI systems
against real regulatory and data constraints — using Azure AI, Azure Kubernetes Service,
and Copernicus Earth observation data as the concrete example.

## License

Licensed under the [MIT License](./LICENSE).

---

<p align="center">
  <sub>
    ⚠️ <strong>Fictive case study.</strong> The organisation, figures, and scenario in this repository are illustrative and used for solution-design practice only.
    No real farmer, agency, or personal data is used or referenced.<br>
    Maintained as part of the <strong>AMA (Azure Master Architect)</strong> initiative.
  </sub>
</p>
