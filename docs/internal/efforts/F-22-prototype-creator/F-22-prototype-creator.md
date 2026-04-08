# [F-22] Prototype Creator Utility Skill
Status: Backlog
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a `utility-prototype-creator` skill that helps PMs produce self-contained HTML prototypes for communicating product concepts, user flows, and interaction patterns. The prototypes are single-file, dependency-free HTML documents that open in any browser — no server, no build step, no framework installation. Designed for the agentic workflow: Claude generates the complete HTML file from a structured brief.

## Problem

PMs need prototypes to communicate product ideas but face barriers:
1. Design tools (Figma, Sketch) require specialized skills PMs may not have
2. Code prototypes require framework setup (React, Next.js) that's overkill for communication artifacts
3. Wireframing tools produce static images that can't demonstrate interaction patterns
4. Prototypes built ad-hoc by AI assistants have inconsistent structure, styling, and interaction patterns
5. No reusable system exists for consistent, professional-looking HTML prototypes that PMs can generate on demand

The key insight: PMs don't need production code — they need *communication artifacts* that demonstrate concepts clearly. A self-contained HTML file with consistent styling and basic interactivity serves this purpose better than a wireframe or a full app.

## How It Would Work

### Input
- Product concept brief (what the prototype should demonstrate)
- Target audience (engineers, stakeholders, users)
- Interaction requirements (static mockup, clickable flow, data-driven demo)
- Optional: style reference from prototype-styler (F-23)

### Process
1. **Scope the prototype** — What screens/states are needed? What interactions matter? What can be faked vs. needs to work?
2. **Define structure** — Page layout, navigation pattern, component inventory
3. **Select interaction patterns** — Tab switching, modal dialogs, form flows, state changes, data filtering
4. **Generate HTML** — Single self-contained file with inline CSS and JavaScript. No external dependencies.
5. **Validate** — Opens in browser, interactions work, responsive basics, accessible markup

### Output
A single self-contained HTML file that:
- Opens directly in any browser (no server required)
- Has consistent, professional styling (from embedded styles or prototype-styler theme)
- Demonstrates the intended interaction patterns
- Includes inline documentation (HTML comments explaining structure for future modification)
- Is small enough to share via email, Slack, or embed in a document

## Key Decisions

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Classification** | utility | Prototyping is a tool/technique, not a foundational PM concept |
| **Single-file constraint** | Required | Self-contained = shareable without setup. This is the core value proposition. |
| **Framework** | Vanilla HTML/CSS/JS only | No React, no Tailwind CDN, no dependencies. Maximizes portability and minimizes AI generation errors. |
| **Responsive** | Basic (desktop + mobile viewport) | Full responsive design is out of scope; basic viewport handling is sufficient for communication artifacts |
| **Dependency on F-23** | Soft — ships with a default style system | Can use without F-23; F-23 enables custom component styling |
| **Interaction complexity** | Cap at "clickable prototype" level | Not a production app. Tab switching, modals, form states, filtering — yes. API calls, real auth, databases — no. |

## Quality Forecast

| Zone | Weight | Rationale |
|------|--------|-----------|
| Process | 40 | Structured workflow from brief to scoping to generation to validation |
| Constraint | 30 | Single-file, no dependencies, accessibility basics, inline documentation |
| Knowledge | 20 | HTML/CSS/JS patterns, interaction patterns, component structures |
| Wisdom | 10 | Scoping decisions — what to prototype vs what to describe |

## Dependencies

- None required
- **F-23 (prototype-styler)** — optional, for custom component styling and design standards
- **F-21 (content-voice)** — optional, for consistent copy in prototypes

## Artifacts Produced

- `skills/utility-prototype-creator/SKILL.md`
- `skills/utility-prototype-creator/references/TEMPLATE.md` (prototype brief template)
- `skills/utility-prototype-creator/references/EXAMPLE.md` (worked example: task management dashboard prototype)
- `commands/prototype-creator.md`

## Estimated Complexity

Medium-High — the skill itself is straightforward but producing consistently good HTML prototypes requires encoding many interaction patterns, layout conventions, and accessibility standards.

## PRs

TBD
