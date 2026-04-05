---
title: PM Skills
description: 29 AI agent skills for product managers — open-source, spec-compliant, and ready for Claude Code, Cursor, GitHub Copilot, and more.
tags:
  - Home
---

# PM Skills

**29 best-practice product management skills for AI agents.**

PM Skills teaches AI assistants how to produce professional PM artifacts — PRDs, user stories, acceptance criteria, experiment designs, and more. One command, consistent output, every time.

```mermaid
flowchart LR
    Create["/pm-skill-builder\nCreate"] --> Validate["/pm-skill-validate\nValidate"]
    Validate --> Decision{Findings?}
    Decision -- "PASS" --> Ship["Ship"]
    Decision -- "WARN / FAIL" --> Iterate["/pm-skill-iterate\nIterate"]
    Iterate --> Validate
```

## The Skills

<div class="grid cards" markdown>

- :material-magnify: **Discover** — 3 skills
  ---
  Research, competitive analysis, stakeholder mapping
  [:octicons-arrow-right-24: Browse](skills/discover/)

- :material-target: **Define** — 4 skills
  ---
  Problem framing, hypotheses, opportunity trees, JTBD
  [:octicons-arrow-right-24: Browse](skills/define/)

- :material-wrench: **Develop** — 4 skills
  ---
  Solution briefs, ADRs, design rationale, spikes
  [:octicons-arrow-right-24: Browse](skills/develop/)

- :material-rocket-launch: **Deliver** — 6 skills
  ---
  PRDs, user stories, acceptance criteria, edge cases, launch, release notes
  [:octicons-arrow-right-24: Browse](skills/deliver/)

- :material-chart-line: **Measure** — 4 skills
  ---
  Experiments, instrumentation, dashboards, results
  [:octicons-arrow-right-24: Browse](skills/measure/)

- :material-refresh: **Iterate** — 4 skills
  ---
  Retrospectives, lessons, refinement, pivot decisions
  [:octicons-arrow-right-24: Browse](skills/iterate/)

- :material-layers-triple: **Foundation** — 1 skill
  ---
  Cross-cutting persona generation
  [:octicons-arrow-right-24: Browse](skills/foundation/)

- :material-tools: **Utility** — 3 skills
  ---
  Create, validate, and iterate skills themselves
  [:octicons-arrow-right-24: Browse](skills/utility/)

</div>

[:octicons-arrow-right-24: Learn more about the lifecycle](concepts/skill-lifecycle.md)

## Quick Start

```bash
git clone https://github.com/product-on-purpose/pm-skills.git
cd pm-skills
```

Then use any skill:

```
/prd "Search feature for e-commerce platform"
/hypothesis "Will one-page checkout increase conversion?"
/acceptance-criteria "User can reset password via email"
```

[:octicons-arrow-right-24: Full setup guide](getting-started/)

## See It In Action

Follow three fictional companies through the complete product lifecycle — from discovery research to pivot decisions — with real prompts and full outputs.

<div class="grid cards" markdown>

- :material-store: **Storevine** — B2B Ecommerce
  ---
  Building email marketing for 15K merchants. Organized prompts.
  [:octicons-arrow-right-24: Follow the journey](showcase/storevine.md)

- :material-bookshelf: **Brainshelf** — Consumer PKM
  ---
  Building a morning digest for 22K users. Casual prompts.
  [:octicons-arrow-right-24: Follow the journey](showcase/brainshelf.md)

- :material-office-building: **Workbench** — Enterprise Collaboration
  ---
  Building document templates for 500 enterprises. Structured prompts.
  [:octicons-arrow-right-24: Follow the journey](showcase/workbench.md)

</div>

## Works Everywhere

| Platform | Method |
|----------|--------|
| **Claude Code** | Slash commands (`/prd`, `/hypothesis`, etc.) |
| **GitHub Copilot** | AGENTS.md auto-discovery |
| **Cursor / Windsurf** | AGENTS.md or [MCP server](https://github.com/product-on-purpose/pm-skills-mcp) |
| **Claude.ai / Desktop** | ZIP upload or MCP |
| **Any MCP client** | [pm-skills-mcp](https://github.com/product-on-purpose/pm-skills-mcp) |

## Links

- [:fontawesome-brands-github: GitHub Repository](https://github.com/product-on-purpose/pm-skills)
- [:material-server: MCP Server](https://github.com/product-on-purpose/pm-skills-mcp)
- [:material-file-document: Agent Skills Specification](https://agentskills.io/specification)
- [:material-tag: Browse by tag](tags.md)
