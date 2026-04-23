# [F-20] Slideshow Themer Utility Skill
Status: Backlog
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a `utility-slideshow-themer` skill that helps users create presentation themes and layouts optimized for agentic creation. Produces a complete theme configuration (color tokens, typography scale, layout grid, slide type variants) that the slideshow-creator skill (F-19) consumes. The key insight: themes designed for agentic generation need different constraints than human-authored themes . character limits must be calibrated to slot dimensions, color contrast must be programmatically verifiable, and layout coordinates must be deterministic.

## Problem

When PMs or teams want to brand their agentic presentations:
1. Manual theme creation produces layouts that break when filled by an AI (text overflow, misaligned elements)
2. Color choices often fail accessibility contrast checks
3. Typography scales aren't calibrated to slide slot dimensions
4. No structured format exists for expressing a theme that an agentic system can consume reliably
5. Dark/light variant pairing requires coordinated color token design

## How It Would Work

### Input
- Brand guidelines (colors, fonts, logo) or a reference deck
- Target audience context (internal, customer-facing, investor)
- Optional: existing theme to modify

### Process
1. **Extract brand tokens** . Map brand colors to semantic roles (primary, secondary, accent, background, text, success, warning, error)
2. **Configure typography** . Select fonts, define size scale, calibrate character limits to layout grid
3. **Define layout grid** . Slide dimensions (16:9), margins, content zones, footer rules
4. **Generate slide type variants** . Dark/light configurations for each of the 18 slide types
5. **Validate accessibility** . WCAG AA contrast checks for all color/text combinations
6. **Produce theme file** . Structured JSON/YAML theme configuration

### Output
A complete theme configuration file that the slideshow-creator skill consumes, including:
- Color token map (13+ semantic tokens with dark/light variants)
- Typography scale (heading, subheading, body, caption sizes and fonts)
- Layout grid (margins, content zones, coordinates per slide type)
- Character limits (calibrated per slot per slide type for the chosen font/size)
- Accessibility validation results

## Key Decisions

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Classification** | utility | Meta-tooling for the slideshow system |
| **Theme format** | JSON with documented schema | Consumable by generation scripts, human-readable, versionable |
| **Dependency on F-19** | Hard . themes are meaningless without the creator | Theme format defined by what the slideshow-creator expects |
| **Character limit calibration** | Include calculation guidance | Most critical differentiator . agentic themes MUST specify overflow limits |
| **Default theme** | Ship one minimal theme | Proves the format works; teams can fork and customize |

## Quality Forecast

| Zone | Weight | Rationale |
|------|--------|-----------|
| Knowledge | 45 | Color theory, typography scales, layout grid systems, accessibility rules |
| Constraint | 30 | WCAG AA compliance, character limits, deterministic coordinates |
| Process | 20 | Step-by-step theme creation workflow |
| Wisdom | 5 | Judging which brand elements to prioritize, dark/light balance |

## Dependencies

- **F-19 (slideshow-creator)** . defines the theme consumption format; themer must produce what creator expects
- **F-21 (content-voice)** . optional, for tone-aligned typography choices

## Artifacts Produced

- `skills/utility-slideshow-themer/SKILL.md`
- `skills/utility-slideshow-themer/references/TEMPLATE.md` (theme configuration template)
- `skills/utility-slideshow-themer/references/EXAMPLE.md` (worked example: creating a tech startup theme)
- `commands/slideshow-themer.md`

## Estimated Complexity

Medium . well-scoped but requires deep design system knowledge. Character limit calibration is the most technically nuanced part.

## PRs

TBD
