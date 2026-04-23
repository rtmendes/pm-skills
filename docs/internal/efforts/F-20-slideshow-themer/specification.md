# Specification: utility-slideshow-themer

## Overview

A utility skill that helps PMs create presentation themes optimized for agentic generation. Produces a complete theme configuration . color tokens, typography scale, layout grid, slide type variants, and calibrated character limits . that the `utility-slideshow-creator` skill (F-19) consumes. The critical differentiator: themes designed for agentic generation must specify character overflow limits calibrated to slot dimensions, ensure programmatically verifiable color contrast, and use deterministic layout coordinates.

## Skill Identity

| Field | Value |
|-------|-------|
| Name | utility-slideshow-themer |
| Classification | utility |
| Version | 1.0.0 |
| License | Apache-2.0 |
| Category | coordination |
| Audience | Product Managers |

## Design Principles

### 1. Agentic-First Theme Design
Traditional design systems are built for human interpretation. Agentic themes are built for machine consumption. Every token, every layout coordinate, and every character limit must be deterministic . the same theme input must produce the same visual output regardless of which AI agent generates the slides.

### 2. Character Limits Are Non-Negotiable
The single most common failure in agentic slide generation is text overflow. Every slot in every slide type must declare a maximum character count calibrated to the font, size, and container dimensions. This is the skill's most critical constraint and the primary reason themes exist.

### 3. Contrast Verifiable by Default
Color token pairs (text on background) must meet WCAG AA contrast ratios (4.5:1 for body text, 3:1 for large text). The theme includes pre-validated contrast pairs rather than relying on the generator to check at creation time.

### 4. Theme = Creator Contract
The theme file is a contract between the themer and the creator. The themer produces exactly what the creator expects to consume . no more, no less. The theme schema is defined by the slideshow-creator's consumption format.

---

## File Architecture

```
skills/utility-slideshow-themer/
├── SKILL.md
└── references/
    ├── TEMPLATE.md
    └── EXAMPLE.md

commands/
└── slideshow-themer.md
```

### SKILL.md (~200-250 lines)

**Frontmatter:**
```yaml
name: utility-slideshow-themer
description: >-
  Creates presentation themes optimized for agentic slide generation.
  Produces color tokens, typography scales, layout grids, slide type
  variants, and calibrated character limits that utility-slideshow-creator
  consumes. Ensures WCAG AA contrast, deterministic coordinates, and
  overflow-safe content slots.
version: "1.0.0"
updated: YYYY-MM-DD
license: Apache-2.0
classification: utility
metadata:
  category: coordination
  frameworks:
    - pptxgenjs
  author: product-on-purpose
```

**Sections:**

1. **When to Use** (~10 lines)
   - Creating a branded presentation theme for agentic generation
   - Adapting existing brand guidelines into a slideshow-creator-compatible theme
   - Customizing color, typography, or layout beyond the default theme
   - Creating dark/light variant pairs for a presentation style

2. **When NOT to Use** (~8 lines)
   - Generating slides (use `utility-slideshow-creator`)
   - Designing themes for PowerPoint/Google Slides manual editing (different constraints)
   - Creating full brand identity systems (this is presentation-specific)
   - One-off color changes (modify the default theme directly instead)

3. **Theme Architecture** (~30 lines)
   - **Color tokens** . 13+ semantic tokens: primary, secondary, accent, background, surface, text, text-inverse, muted, success, warning, error, divider, highlight. Each with dark and light variant.
   - **Typography scale** . Font families (heading, body), size scale (title, subtitle, heading, subheading, body, caption, footnote), line heights, letter spacing
   - **Layout grid** . Slide dimensions (10" x 5.625" for 16:9), margins (left, right, top, bottom), content zones per slide type, footer configuration
   - **Slide type variants** . For each of the 18 slide types: slot positions (x, y, w, h), character limits per slot, color assignments (dark variant, light variant)
   - **Character limit calibration** . Formula: `(slot_width_inches * chars_per_inch_at_font_size) * line_count`. Pre-calculated for every slot.

4. **Instructions** (~40 lines, numbered steps)
   1. Gather brand inputs . colors (hex values), fonts, logo, tone direction
   2. Map brand colors to semantic token roles . primary through highlight
   3. Generate dark/light variant pairs . ensure each pair meets WCAG AA contrast
   4. Configure typography . select fonts, define size scale, set line heights
   5. Define layout grid . margins, content zones, footer placement
   6. Calibrate character limits . calculate per-slot limits for the chosen font/size
   7. Generate slide type variants . assign colors and validate contrast for all 18 types
   8. Validate the theme . run through the quality checklist
   9. Export the theme configuration . structured JSON matching the creator's schema

5. **Output Contract** (~10 lines)
   - References TEMPLATE.md as the theme configuration format
   - Output: a JSON theme file consumable by `utility-slideshow-creator`
   - Must validate against the creator's expected theme schema

6. **Quality Checklist** (~15 lines)
   - [ ] All 13+ semantic color tokens defined with dark and light variants
   - [ ] Every text-on-background pair meets WCAG AA contrast (4.5:1 body, 3:1 large)
   - [ ] Typography scale defined with font family, sizes, and line heights
   - [ ] Character limits calibrated for every slot in every slide type
   - [ ] Layout coordinates use consistent units (inches) matching pptxgenjs expectations
   - [ ] Dark and light variants tested . no missing tokens in either mode
   - [ ] Footer configuration defined (company name, confidentiality, date format)
   - [ ] Theme renders correctly with the slideshow-creator's default deck

7. **Companion Skills** (~5 lines)
   - `utility-slideshow-creator` (F-19) . consumes themes produced by this skill
   - `foundation-content-voice` (F-21) . optional, for tone-aligned typography choices

---

### references/TEMPLATE.md (~80-100 lines)

A structured theme configuration template. Sections:

1. **Theme Metadata** . Theme name, version, author, description, target use (internal/customer/investor)
2. **Brand Inputs** . Source colors, fonts, logo placement preferences, tone direction
3. **Color Tokens** . Table: token name / light variant hex / dark variant hex / usage description. All 13+ tokens.
4. **Contrast Validation Matrix** . Table: text token / background token / contrast ratio / pass/fail. Pre-calculated for all planned pairings.
5. **Typography Scale** . Table: role (title, subtitle, body, etc.) / font family / size (pt) / line height / letter spacing / weight
6. **Character Limit Table** . Table: slide type / slot name / width (in) / height (in) / font size / max chars / max lines
7. **Layout Grid** . Slide dimensions, margin values, content zone coordinates per slide type
8. **Slide Type Variants** . For each of the 18 types: dark configuration + light configuration with token assignments
9. **Footer Configuration** . Left text, center text, right text, font size, color token

---

### references/EXAMPLE.md (~300-400 lines)

A worked example: **Creating a tech startup presentation theme**.

Demonstrates the full TEMPLATE workflow:

1. **Brand Inputs** . Startup "Acme Analytics": primary blue (#2563EB), secondary slate (#475569), accent amber (#F59E0B), fonts Geist/Inter, modern/clean direction
2. **Color Token Mapping** . Shows the 13 tokens derived from brand inputs, with dark variants (inverted backgrounds, adjusted text colors)
3. **Contrast Validation** . Matrix showing all 8 critical text/background pairs with calculated ratios (e.g., text #1E293B on background #FFFFFF = 15.4:1 pass)
4. **Typography Scale** . Full scale from title (28pt Geist Bold) to footnote (8pt Inter Regular), with line heights and character-per-inch calculations
5. **Character Limit Calibration** . Walks through the calculation for 3 representative slide types (title, content-bullets, two-column), showing how slot dimensions + font size = max characters
6. **Slide Type Variants** . Shows complete dark/light configurations for 4 slide types (title, section-header, content-bullets, comparison), with token assignments for each element
7. **Validation** . Demonstrates checking the theme against the quality checklist, catching one contrast issue and fixing it

---

### commands/slideshow-themer.md

```yaml
---
name: slideshow-themer
description: Create a presentation theme optimized for agentic slide generation
skill: utility-slideshow-themer
---
```

Body: brief instruction to invoke the skill with brand inputs and target audience context.

---

## Companion Skill Dependencies

- **F-19 (utility-slideshow-creator)**: Hard dependency. The themer's output schema must match what the creator consumes. The 18 slide types, slot names, and coordinate system are defined by the creator. The themer cannot be built without referencing the creator's theme consumption format.
- **F-21 (foundation-content-voice)**: Soft dependency. Typography choices can optionally align with a content voice guide, but the themer works without one.

## Acceptance Criteria

1. **Given** a PM provides brand colors and font preferences, **when** they follow the SKILL.md instructions, **then** the output is a complete theme configuration with all 13+ semantic tokens, typography scale, and character limits for all 18 slide types.

2. **Given** a generated theme, **when** the contrast validation matrix is checked, **then** every text-on-background pair meets WCAG AA contrast ratios (4.5:1 for body text, 3:1 for large text).

3. **Given** a theme produced by this skill, **when** it is consumed by `utility-slideshow-creator`, **then** no slide type produces text overflow when content respects the declared character limits.

4. **Given** a theme with dark and light variants, **when** either variant is applied, **then** all tokens resolve to valid values and no missing-token errors occur.

5. **Given** a PM with no design background, **when** they follow the step-by-step instructions with only brand hex colors as input, **then** the skill produces a usable theme without requiring design expertise.
