# Regulatory Compliance: EU AI Act

## Standard
**Regulation (EU) 2024/1689** of the European Parliament and of the Council of 13 June 2024, laying down harmonised rules on artificial intelligence (Artificial Intelligence Act). Adopted 13 June 2024; published in the Official Journal 12 July 2024. It is the world's first comprehensive AI regulatory framework.

This document is a participant research summary, not the legislation. The linked
official text governs; the case-specific interpretation below requires legal sign-off.

## Scope
- Establishes a **risk-based framework**: unacceptable-risk practices are prohibited; high-risk AI systems face strict obligations; limited-risk systems require transparency measures.
- Obligations for high-risk systems include risk management, data governance, technical documentation, logging, transparency, human oversight, accuracy, robustness, and cybersecurity.
- Applies under a phased timetable. Legal review must record the provisions and
  application dates relevant to each intended use, including any applicable amendments.

## Relevance to Case Study 47 (Hungarian Paying Agency)
Agents have bounded workflow autonomy (L2–L4): crop/activity classification,
recommendations, approved evidence requests, and audit drafts. These levels do not
grant legal decision authority. No agent may change payment entitlement, execute a
payment, or issue an adverse administrative decision; authorised agency workflows
retain those responsibilities as defined in the
[architecture](../architecture/aks-centered-foundry-architecture.md#57-agent-deployment-map).

**High-risk status requires a documented legal assessment of each intended use.**
Article 6 and Annex III, including point 5(a) on essential public assistance benefits
and services, must be considered where relevant. A public agricultural subsidy is
not automatically within that category merely because public money is involved.
Human approval also does not by itself exclude high-risk status. Record provider and
deployer roles, the applicable category or reason for exclusion, and the resulting
obligations before pilot approval.

Regardless of the eventual classification, the proposed design retains:
- **Explainability of classifications** (crop/activity, discrepancy flags).
- **Commission-auditable models** (documentation and logging).
- Human oversight retained by authorised officials for contested or adverse decisions
  (no fully autonomous adverse action against farmers).

## Source
- [Regulation (EU) 2024/1689 — full text, EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32024R1689)
- [Regulation (EU) 2024/1689 — PDF, Official Journal, EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=OJ:L_202401689)
- [AI Act — European Commission Digital Strategy](https://digital-strategy.ec.europa.eu/en/node/9745/printable/pdf)
