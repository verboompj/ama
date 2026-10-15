# Context and Tools

## Repository Grounding

| Source | Role in delivery |
|---|---|
| [Original case](../../case/case-study-47.md) | Issued scenario, business objectives and runtime agent brief; preserve unchanged |
| [Participant rubric](../../case/rubrik/AMA_Capstone_Rubric_Participants.md) | Acceptance/evidence framing, not a production compliance standard |
| [Maintained architecture](../architecture/aks-centered-foundry-architecture.md) | Technical baseline and decisions; not an approved IaC release by itself |
| [Business process](../architecture/business-process-flow.md) | Ownership, evidence, decision, treasury and appeal boundaries |
| [Personas](../Persona/personas-and-use-cases.md) | Stakeholders, permissions, journeys and requirements |
| [Theme and presentation](../Persona/farm-theme-and-persona-map.md) | Field & File visual identity and fictional setting |
| [Training procedure](../copernicus/crop-classification/crop-classifier-training-procedure.md) | As-of-date features, leakage controls, dataset and evaluation contracts |
| [Ground/drone validation](../copernicus/crop-classification/drone-survey-validation-process.md) | Independent findings, upload lifecycle, random/targeted inspection distinction |
| [Payment calendar](../research/cap-claim-and-payment-calendar.md) | Statutory windows, cohort KPIs and treasury integration |
| [Regulatory research](../regulatory-compliance/) | Participant summaries; verify applicable obligations and sign-off |

The rubric's A1–A3 guide contracts, trade-offs and control evidence. A4–A6 require
working and measured evidence, not claims based on a successful Bicep compile.
A7 requires observed runtime agent behaviour. B6/B7 and D1/D2 motivate navigable, sourced materials. Executive
delivery, stakeholder engagement, publication and scoring cannot be certified by agents.

## Agent Collaboration Guidance

See [Multi-Agent Framework and Orchestration](../../delivery/multi-agent-framework.md) for pattern
selection, roles, rationale and primary sources. See [Handoffs and Gates](../../delivery/handoffs.md)
for package states and evidence contracts.

## Azure Workload Guidance

See [Workload Guidance](../../delivery/workload-guidance.md) for the Azure standards, existing
guardrails, AVM/Bicep approach, data/compliance boundaries, documentation and staged
verification requirements. It contains the official workload-source links.
The [validation catalogue](../../delivery/workload-checks.md) supplies concrete check IDs, report
requirements, Azure-context confirmation and stage-specific expected evidence.

## Microsoft Learn Access

Each profile declares an HTTP MCP server at `https://learn.microsoft.com/api/mcp`,
allowlisting `microsoft_docs_search`, `microsoft_docs_fetch`, and
`microsoft_code_sample_search`. It uses the public service without embedded credentials.
Discover tools at runtime because server capabilities can change.

Agent-scoped MCP configuration is supported by applicable Copilot CLI/cloud clients,
but not used by IDE custom agents. In VS Code, merge this into the workspace's
`.vscode/mcp.json` only when that client is being configured:

```json
{
  "servers": {
    "microsoft-learn": {
      "type": "http",
      "url": "https://learn.microsoft.com/api/mcp"
    }
  }
}
```

This example is not an installed IDE configuration. For a CLI/client that does not
activate profile-scoped MCP, configure the same public server through its MCP settings.
No MCP server has been activated or live-tested by merely adding these files.
When unavailable, use official web documentation if the client supports it; otherwise
report research as blocked. Do not send repository text, confidential requirements,
secrets or personal data in public search prompts.

## Client References

- [Custom agent configuration](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- [Repository MCP configuration](https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/configure-mcp-servers)
- [Agent skills](https://docs.github.com/en/copilot/concepts/agents/about-agent-skills)
- [Learn MCP reference](https://learn.microsoft.com/en-us/training/support/mcp-developer-reference)
- [VS Code prompt files](https://code.visualstudio.com/docs/agent-customization/prompt-files)

Tool lists and instructions guide behaviour, not enforce filesystem/network isolation.
Do not assume that creating these definitions installs Bicep, grants Azure access,
or executes a test.
