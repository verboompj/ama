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

The [whole-case visual](./case/README.md) connects business context, personas,
use cases, technology context, applications, machine learning and Azure in one
picture, with governance and human authority across the lifecycle.

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
The [evidence-validation storyline](./docs/copernicus/crop-classification/evidence-validation-storyline.md)
connects normal farmer-photo capture, exception handling, and random validation to the
[independent ground/drone process](./docs/copernicus/crop-classification/drone-survey-validation-process.md).
The [business-process flow](./docs/architecture/business-process-flow.md) maps those
activities to their owners and carries the claim through advance, final calculation,
payment reconciliation, and appeal safeguards.
The [farmer journey draft](./docs/ux/farmer-journey/README.md) adds a self-contained
clickable UX walkthrough using the Field & File logo and synthetic case data.

The [Azure delivery team](./docs/delivery/README.md) defines nine development agents,
shared repository skills, a staged task backlog, and explicit architecture-to-Bicep
handover gates. It prepares the engineering workflow; infrastructure implementation
and GitHub Actions remain separate, later work.
The [`delivery/` workspace](./delivery/README.md) holds operating contracts, plans
and work-package evidence.
Its [work-package records](./delivery/releases/README.md) and
[templates](./delivery/templates/) support that workflow; a directory under
`releases/` is not evidence of release approval or deployment.
Native [agent profiles](./.github/agents/), [skills](./.github/skills/) and
[phase prompts](./.github/prompts/) live under `.github/`.
The [process screenshots](./docs/deployment/process/) are reference images, not
deployment records.
The [workload guidance](delivery/workload-guidance.md) and
[multi-agent framework and orchestration](delivery/multi-agent-framework.md)
separate Azure solution standards from development-agent collaboration.
The [workload validation catalogue](delivery/workload-checks.md) defines concrete
checks and evidence for design review, local acceptance and later Azure/live stages.
The [AI/ML checks](delivery/ai-ml-checks.md) cover runtime applications,
data/model quality and reproducibility. The
[first implementation slice](delivery/first-implementation-slice.md) defines
the proposed public-data crop-evidence target and decisions needed before execution.

## Repository Structure

```
.
├── AGENTS.md                # Shared engineering-agent instructions
├── .github/
│   ├── agents/              # Nine native Copilot agent profiles
│   ├── skills/              # Reusable repository-local procedures
│   └── prompts/             # Explicit phase entry points
├── delivery/                # Operating contracts, checks & plans (see README.md)
│   ├── releases/            # Work-package records; directory presence is not approval
│   │   └── WP-001/          # Non-production foundation planning & assessment records
│   └── templates/           # Assignment, design, plan, review & handoff forms
├── case/                    # Original sources alongside distinct participant work
│   ├── case-study-47.md     # Original case brief; .jpg is its source scan
│   ├── README.md            # Participant whole-case visual guide
│   ├── case-overview.excalidraw # Editable participant visual; .png/.svg viewing copies
│   ├── casestudy/           # Participant case understanding & design questions
│   └── rubrik/              # Original assessment rubric (Markdown & Word)
├── docs/
│   ├── architecture/        # Proposed AI solution architecture (AKS + Azure AI services)
│   ├── copernicus/          # Copernicus data/services/tools inventory
│   ├── delivery/            # Team usage, role catalogue & context guides
│   ├── deployment/
│   │   └── process/         # Reference screenshots; not deployment evidence
│   ├── Persona/             # Role-based personas, requirements & journeys
│   ├── regulatory-compliance/ # Regulatory & legal framework summaries
│   ├── research/            # Supporting research notes
│   └── ux/
│       └── farmer-journey/  # Illustrative UX draft: README.md & self-contained index.html
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
    ⚠️ <strong>Fictive case study.</strong> The case organisation, personas, figures, and scenario are illustrative and used for solution-design practice only.
    No real claimant or personal case data is used. Public institutions, legislation, and published campaign information are referenced as research, separately from the fictional scenario.<br>
    Maintained as part of the <strong>AMA (Azure Master Architect)</strong> initiative.
  </sub>
</p>
