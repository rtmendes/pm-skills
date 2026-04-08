# [F-19] Slideshow Creator Utility Skill
Status: Backlog
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a `utility-slideshow-creator` skill that generates on-brand presentations (.pptx and PDF) from a JSON deck specification. Adopts a proven agentic presentation system (18 slide types, content-to-layout decision logic, character limit enforcement, platform-compatible output) and repackages it as a brand-agnostic, open-source PM skill. The skill encodes the principle of "zero design decisions at generation time" — Claude selects slide types and fills content slots; all visual properties are pre-decided by the theme.

## Problem

PMs spend disproportionate time on slide formatting:
1. Fighting with PowerPoint layouts, alignment, and font sizing
2. Inconsistent slide structures across team decks
3. Content overflow that breaks layouts (too much text, wrong aspect ratios)
4. Design drift when multiple PMs maintain the same deck
5. No reusable system — every deck starts from scratch or a poorly maintained template

The agentic approach separates content authoring (what Claude does well) from visual rendering (what deterministic code does well), eliminating the entire class of "layout fiddling" work.

## How It Would Work

### Input
- Content brief describing what the presentation should communicate
- Optional: brand theme reference (from slideshow-themer or custom)
- Optional: deck metadata (title, subtitle, author, footer text)

### Process (Two-Phase)
1. **Spec phase** (Claude) — Read content brief, select slide types using decision logic, write JSON deck specification with content in typed slots. Character limits enforced per slot.
2. **Generation phase** (Local script) — Deterministic pptxgenjs rendering from JSON spec. Zero token cost. Produces .pptx and optional .pdf.

### Output
- JSON deck specification (the artifact Claude produces)
- .pptx file (generated locally from spec)
- Optional .pdf export

## Prior Art

This skill adapts a production-tested agentic presentation system (868 lines across 10 files, 18 slide types, proven with 35+ decks). The adaptation removes all proprietary brand references and repackages as a generic, themeable system compatible with pm-skills conventions.

Key components being adapted:
- **Slide type catalog** (18 types): title, section, content, bullets, two-column, stats, quotes, cards, grids, timeline, process flow, agenda, highlights, tables, icon rows, closing
- **Decision logic**: content pattern → slide type mapping
- **Character limits**: calibrated per slot to prevent overflow
- **Generation workflow**: JSON spec → pptxgenjs → .pptx → optional .pdf
- **Platform rules**: Google Slides conversion compatibility

## Key Decisions

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Classification** | utility | Cross-cutting tool usable at any phase — not a PM conceptual framework |
| **Brand coupling** | Brand-agnostic with themeable system | Themes are a separate concern (F-20). Skill ships with a minimal default theme. |
| **Dependency on F-20** | Soft — ships with a default theme | Can use without F-20; F-20 enables custom theming |
| **pptxgenjs dependency** | Document as prerequisite | Node.js + pptxgenjs required for generation phase. Skill itself is the spec-writing phase. |
| **Slide type count** | Start with 18 (proven set) | Expansion possible later; 18 covers ~95% of PM deck needs |
| **Example deck** | Include in EXAMPLE.md | Show a complete 8-10 slide product update deck |

## Quality Forecast

| Zone | Weight | Rationale |
|------|--------|-----------|
| Knowledge | 40 | 18 slide types, character limits, platform rules, decision logic |
| Constraint | 35 | Strict JSON spec format, character limits, slot validation, platform compatibility |
| Process | 20 | Two-phase workflow (spec → generate) with clear handoff |
| Wisdom | 5 | Slide type selection judgment, content density decisions |

## Dependencies

- **Node.js + pptxgenjs** for generation phase (documented prerequisite, not a pm-skills dependency)
- **F-20 (slideshow-themer)** — optional, for custom brand themes
- **F-21 (content-voice)** — optional, for voice-consistent slide copy

## Artifacts Produced

- `skills/utility-slideshow-creator/SKILL.md`
- `skills/utility-slideshow-creator/references/TEMPLATE.md` (JSON spec template)
- `skills/utility-slideshow-creator/references/EXAMPLE.md` (worked product update deck)
- `skills/utility-slideshow-creator/references/slide-types.md` (18-type catalog)
- `skills/utility-slideshow-creator/references/decision-logic.md` (content → type mapping)
- `skills/utility-slideshow-creator/references/platform-rules.md` (generation + compatibility)
- `commands/slideshow-creator.md`

## Estimated Complexity

High — largest reference file set (5 references), requires adaptation from proprietary source, generation script packaging, and cross-platform testing.

## PRs

TBD
