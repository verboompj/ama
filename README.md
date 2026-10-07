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

This repository is built around **Case Study 47**: a capstone case brief describing an
agentic AI system to verify EU Common Agricultural Policy (CAP) subsidy claims using
Copernicus (Sentinel) satellite imagery, for a fictional Hungarian paying agency.

The original case brief (`case/case-study-47.md` and its source scan
`case/case-study-47.jpg`) sets the scenario: the business challenge, the proposed
agentic architecture brief, expected outcomes, and the business case, as issued for the
capstone exercise.

Everything else in this repository — case understanding write-ups, solution design
questions, regulatory research, Copernicus reference material, and the proposed AI
architecture — is participant work produced *in response to* that case, not part of the
original material.

The repository also includes a detailed
[persona and use-case catalog](./docs/Persona/personas-and-use-cases.md) covering farmers,
government officials, auditors, compliance roles, and technical operators.
The original [Field & File theme and persona map](./docs/Persona/farm-theme-and-persona-map.md)
turns those roles into a seasonal farm narrative with its own logo, visual identity,
colour system, and presentation guidance.
The research section includes a background guide to the
[CAP claim process and its equality and inequality effects](./docs/research/cap-claim-process-and-equity.md)
within countries, between EU Member States, and between EU and non-EU producers.
The [CAP claim and payment calendar](./docs/research/cap-claim-and-payment-calendar.md)
explains how spring claims, seasonal monitoring, autumn advances, and final payments
relate to sowing, harvest, and evidence validation.

## Repository Structure

```
.
├── case/                    # The original case study brief (source material)
│   └── casestudy/           # Case understanding write-up & open design questions
├── docs/
│   ├── architecture/        # Proposed AI solution architecture (AKS + Azure AI services)
│   ├── copernicus/          # Copernicus data/services/tools inventory
│   ├── Persona/             # Role-based personas, requirements & journeys
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
