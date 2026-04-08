# Specification: utility-slideshow-creator

## Overview

A utility skill that generates professional presentations (.pptx and PDF) from a JSON deck specification. Encodes 18 slide types with dark/light variants, content-to-layout decision logic, and calibrated character limits so that zero design decisions happen at generation time. Ships with a generic default professional theme; custom themes are created via the companion skill (F-20: slideshow-themer).

## Skill Identity

| Field | Value |
|-------|-------|
| Name | utility-slideshow-creator |
| Classification | utility |
| Version | 1.0.0 |
| License | Apache-2.0 |
| Audience | Product Managers |

## Design Principles

### 1. Zero Design Decisions at Generation Time
Claude selects slide types and fills content slots. All visual properties (coordinates, fonts, colors, spacing) are pre-decided by the theme. This eliminates the entire class of "Claude made a bad layout choice" failures.

### 2. Two-Phase Architecture
- **Phase 1 (Claude):** Read content brief → plan deck → write JSON spec. Costs tokens.
- **Phase 2 (Local script):** JSON spec → pptxgenjs → .pptx → optional .pdf. Zero token cost.

This separation means the expensive part (AI reasoning) only handles content decisions, while the deterministic part (rendering) runs locally for free.

### 3. Character Limits as Hard Constraints
Every content slot has a maximum character count calibrated to its physical dimensions on the slide. This prevents text overflow — the #1 cause of broken AI-generated presentations.

### 4. Brand-Agnostic with Themeable Defaults
Ships with a professional default theme. All visual values (colors, fonts, sizes, coordinates) are expressed as configurable tokens. The slideshow-themer skill (F-20) produces custom theme configurations.

---

## File Architecture

```
skills/utility-slideshow-creator/
├── SKILL.md
└── references/
    ├── TEMPLATE.md          (JSON deck spec template)
    ├── EXAMPLE.md           (worked example: product update deck)
    ├── slide-types.md       (18-type catalog with slots + limits)
    ├── decision-logic.md    (content pattern → type mapping)
    └── platform-rules.md    (pptxgenjs rules + compatibility)

commands/
└── slideshow-creator.md
```

---

## SKILL.md (~120-150 lines)

**Frontmatter:**
```yaml
name: utility-slideshow-creator
description: >-
  Generates professional presentations from a JSON deck specification
  using 18 slide types with dark/light variants, content-to-layout
  decision logic, and calibrated character limits. Ships with a default
  professional theme; custom themes via utility-slideshow-themer.
version: "1.0.0"
updated: YYYY-MM-DD
license: Apache-2.0
classification: utility
metadata:
  category: communication
  frameworks:
    - pptxgenjs
  author: product-on-purpose
```

**Sections:**

1. **When to Use**
   - Creating slide decks for stakeholder updates, product reviews, team presentations
   - Generating professional .pptx files from content briefs
   - Producing consistent, on-brand presentations without manual formatting
   - Exporting presentations to PDF for sharing

2. **When NOT to Use**
   - Creating complex data visualizations (use dedicated charting tools)
   - Building interactive web presentations (this produces .pptx, not HTML)
   - Editing existing PowerPoint files (this creates new decks from scratch)

3. **How It Works** (two-phase summary)
   - Phase 1: Claude writes JSON deck spec
   - Phase 2: Local script generates .pptx (and optional .pdf)
   - Reference to generation workflow in references

4. **18 Slide Types** (quick reference table)
   - Type key, function, default variant, use case — one row per type
   - Points to `references/slide-types.md` for full slot definitions

5. **Decision Logic** (quick reference table)
   - Content pattern → recommended slide type — one row per type
   - Points to `references/decision-logic.md` for variant strategy

6. **JSON Deck Spec Format** (minimal example)
   - 4-5 slide example showing the JSON structure
   - Points to `references/TEMPLATE.md` for full schema

7. **Instructions**
   1. Read the user's content brief
   2. Plan the deck: select slide types using decision logic
   3. Write JSON deck specification following the schema
   4. Run generation script
   5. Optionally export to PDF
   6. Report output file path(s)

8. **Output Contract**
   - Planning artifact: JSON deck specification
   - Final output: .pptx file (+ optional .pdf)
   - Quality gate: all slides render, no text overflow, variant alternation

9. **Quality Checklist**
   - [ ] Every slide has a valid type key
   - [ ] All content slots respect character limits
   - [ ] Dark/light variants alternate for visual rhythm
   - [ ] Deck has a title slide and a closing slide
   - [ ] Section dividers separate distinct topics
   - [ ] Speaker notes included for key slides
   - [ ] JSON validates (no trailing commas, proper quoting)

10. **References** (table linking to all 5 reference files)

---

## references/slide-types.md (~220 lines)

All 18 slide types with content slots, character limits, and variant support. Each type maps to a JSON `type` key.

### Variant Support
15 types support `variant: "dark"` and `variant: "light"`. 3 types are fixed: `title_dark` (dark only), `title_light` (light only), `closing` (dark only).

### Type Catalog

Each type documented with this structure:

```
### N. {type_key}
{One-line description}

| Slot | Type | Max Chars | Required | Notes |
|---|---|---|---|---|

Variant: {dark/light/both}
```

**The 18 types (identical structure to source, Pushpay content removed):**

| # | Type Key | Purpose | Default Variant | Slots |
|---|----------|---------|-----------------|-------|
| 1 | `title_dark` | Opening slide (bold, dark background) | dark only | title (~50), subtitle (~80) |
| 2 | `title_light` | Opening slide (light/internal tone) | light only | title (~50), subtitle (~80) |
| 3 | `section` | Section divider between topics | dark | title (~30) |
| 4 | `content` | Paragraph explanation | light | title (~60), body (~400) |
| 5 | `bullets` | 3-6 key points | light | title (~60), bullets[] (~120 each) |
| 6 | `two_col` | Side-by-side comparison | light | title (~60), leftTitle (~25), leftItems[], rightTitle (~25), rightItems[] |
| 7 | `stat` | Single key metric | light | stat (~8), label (~60), accentColor |
| 8 | `dual_stat` | Two metrics compared | dark | title (~50), leftStat (~8), leftLabel (~60), rightStat (~8), rightLabel (~60) |
| 9 | `quote` | Testimonial or pull quote | dark | quote (~200), attribution (~60) |
| 10 | `three_card` | Three parallel concepts | dark | title (~50), cards[3] (title ~25, bullets[] ~50 each) |
| 11 | `four_grid` | Four concepts in 2x2 grid | dark | title (~50), cards[4] (title ~25, body ~120) |
| 12 | `timeline` | Dates or milestones (max 6) | light | title (~50), milestones[] (label ~10, description ~80) |
| 13 | `process_flow` | Sequential workflow (max 5) | light | title (~50), steps[] (label ~15, description ~80) |
| 14 | `agenda` | Meeting agenda (max 7 items) | light | title (~30), intro (~200), items[] (time ~10, topic ~30) |
| 15 | `highlight` | Key finding or executive summary | light | title (~50), highlight (~150), context (~300), accentColor |
| 16 | `table` | Tabular data (3-6 cols, 4-8 rows) | light | title (~50), headers[], rows[][] (~20 each) |
| 17 | `icon_rows` | Feature list with markers (max 4) | light | title (~50), items[] (label ~25, description ~100) |
| 18 | `closing` | End slide | dark only | tagline (~50), url |

**Key differences from source:**
- `closing` default tagline is empty (not a brand tagline)
- Color token defaults use generic professional names (not brand-specific names)
- All example content uses generic PM scenarios

---

## references/decision-logic.md (~70 lines)

### Content Pattern to Slide Type

| Content Pattern | Slide Type | Why This Type |
|---|---|---|
| Opening the deck (bold, external) | `title_dark` | Sets authoritative tone with dark impact |
| Opening the deck (internal, lighter) | `title_light` | Softer opener for team/internal decks |
| Transitioning between major topics | `section` | Clear visual break, resets audience focus |
| Explaining something in paragraphs | `content` | Title + body text, no bullet overhead |
| List of 3-6 key points | `bullets` | Clean bullet rendering with colored markers |
| Side-by-side comparison | `two_col` | Vertical divider makes contrast obvious |
| Single key metric | `stat` | Large number on colored card draws attention |
| Two metrics that gain meaning from comparison | `dual_stat` | Side-by-side cards invite comparison |
| Testimonial or pull quote | `quote` | Large quote marks and attribution styling |
| Three parallel concepts or pillars | `three_card` | Colored cards with equal visual weight |
| Four concepts in a grid | `four_grid` | 2x2 layout for balanced coverage |
| Dates or milestones over time | `timeline` | Horizontal dots with chronological flow |
| Sequential workflow or process | `process_flow` | Numbered circles show action sequence |
| Meeting agenda or event schedule | `agenda` | Time-topic pairs with optional intro |
| Key finding or executive summary | `highlight` | Prominent colored box demands attention |
| Tabular data or comparison matrix | `table` | Styled header row, clean grid |
| Feature list with visual markers | `icon_rows` | Colored circles give each point identity |
| Ending the deck | `closing` | Clean closing with optional tagline/URL |

### Disambiguation Rules

- **Single metric with context:** `stat` if the number is the star. `highlight` if the insight matters more.
- **List of items:** `bullets` for 3-6 plain points. `icon_rows` when each item deserves visual identity (max 4). `three_card` when items have sub-bullets (exactly 3).
- **Sequential info:** `timeline` for dates/milestones (chronological). `process_flow` for workflows (action-oriented).
- **Two things compared:** `two_col` for lists. `dual_stat` for numbers.

### Dark/Light Variant Strategy

Alternate variants for visual rhythm. Monotone decks cause slide fatigue.

**General rules:**
- Section dividers and quotes default dark
- Content, data, tables, and highlights default light
- Alternate within a section to prevent visual monotony
- Title and closing are always dark (or title_light for internal)

**Suggested rhythm:**
```
TITLE (dark) > SECTION (dark) > CONTENT (light) > STAT (light) >
BULLETS (dark) > HIGHLIGHT (light) > CLOSING (dark)
```

**Override defaults when:**
- Two consecutive slides would have the same variant: flip one
- A stat or highlight needs extra emphasis: use the non-default variant
- Deck is short (< 6 slides): defaults usually suffice

### Deck Length Guidelines

| Deck Size | Typical Structure |
|---|---|
| 3-5 slides | Title + 2-3 content slides + Closing |
| 6-10 slides | Title + Section + mixed content + Closing |
| 11-20 slides | Title + 2-3 sections with 3-5 slides each + Closing |
| 20+ slides | Consider splitting into two decks |

---

## references/platform-rules.md (~55 lines)

### pptxgenjs Rules (Mandatory)

1. Never use `#` in hex colors — write `"2563EB"`, not `"#2563EB"`
2. Never encode opacity in hex strings — use `{ color: "000000", opacity: 0.12 }`
3. Never reuse option objects across addShape/addText calls (pptxgenjs mutates them)
4. Use `bullet: true` for bullet points (never unicode bullet characters)
5. Use `breakLine: true` between items in text arrays
6. Each presentation needs `new pptxgen()` — never reuse instances

### Google Slides Compatibility

Features deliberately avoided (degrade in .pptx → Google Slides conversion):

| Feature | Why Avoided |
|---|---|
| Gradient fills | Convert to solid blocks or disappear |
| Custom fonts (non-Google) | Substituted with default, breaking layout |
| Overlapping semi-transparent shapes | Transparency renders incorrectly |
| Embedded charts | Convert to static images |
| Complex shadow effects | Render differently or disappear |
| SmartArt | Converts to ungrouped shapes |

**Safe features:** Solid color fills, Google Fonts, simple shapes, text boxes, tables, speaker notes.

### Output Format

- File format: .pptx (Office Open XML)
- Layout: 16:9 (10" x 5.625")
- Node.js 18+ required for generation script
- Output directory configurable (default: `output-slideshow-creator/`)

---

## references/TEMPLATE.md (~60 lines)

JSON deck specification template with guidance comments:

```json
{
  "title": "<!-- REQUIRED: Presentation title, used as .pptx metadata -->",
  "author": "<!-- OPTIONAL: Author name for .pptx metadata -->",
  "footerText": "<!-- OPTIONAL: Default footer text for all slides -->",
  "outputFileName": "<!-- OPTIONAL: Output filename. Default: title-slugified.pptx -->",
  "slides": [
    {
      "type": "title_dark",
      "title": "<!-- ~50 chars. Supports \\n for line breaks -->",
      "subtitle": "<!-- ~80 chars. OPTIONAL -->"
    },
    {
      "type": "<!-- One of 18 type keys from slide-types.md -->",
      "variant": "<!-- OPTIONAL: 'dark' or 'light'. See defaults in slide-types.md -->",
      "notes": "<!-- OPTIONAL: Speaker notes for presenter view -->",
      "footer": "<!-- OPTIONAL: Override footerText for this slide -->"
    }
  ]
}
```

Plus a section explaining:
- Common fields (type, variant, notes, footer, slideNum)
- Color values (theme token names or 6-char hex)
- Array patterns (bullets, cards, items, milestones, steps, rows)

---

## references/EXAMPLE.md (~200-250 lines)

A worked example: **PM creating a Q3 Product Update deck**.

Shows:
1. Content brief (what the PM wants to communicate)
2. Deck planning (slide type selection using decision logic, variant assignments)
3. Complete JSON deck specification (~8-10 slides)
4. Notes on what each slide type choice communicates

**Example slides (generic PM content, zero brand references):**
1. `title_dark` — "Q3 Product Update" / "Engineering All-Hands — October 2026"
2. `section` — "Key Metrics" (dark)
3. `stat` — "94%" / "Customer satisfaction score, highest this year" (light)
4. `dual_stat` — "Q2 vs Q3" with two revenue figures (dark)
5. `bullets` — "What Shipped This Quarter" with 4 feature items (light)
6. `timeline` — "Roadmap Milestones" with 5 milestones (light)
7. `highlight` — "Key Insight" with a product finding (dark)
8. `table` — "Quarterly Metrics" with 4 metrics across Q1-Q3 (light)
9. `closing` — optional tagline + URL (dark)

---

## Default Professional Theme

The skill ships with a generic professional theme. This is NOT a brand — it's a clean, neutral starting point.

### Color Tokens (Default)

| Token | Hex | Use |
|---|---|---|
| `primaryDark` | 0F172A | Darkest elements, text on light backgrounds |
| `primary` | 1E293B | Dark slide backgrounds |
| `accent` | 2563EB | Primary accent (bullets, links, process circles) |
| `secondary` | 0891B2 | Secondary accent (stat cards, teal elements) |
| `tertiary` | 7C3AED | Tertiary accent (purple differentiation) |
| `warm` | F97316 | Warm accent (alerts, attention) |
| `muted` | 94A3B8 | Subtitles, footers, de-emphasized text |
| `lightBg` | F1F5F9 | Light slide backgrounds |
| `white` | FFFFFF | Text on dark backgrounds |
| `textDark` | CBD5E1 | Body text on dark backgrounds |
| `textLight` | 334155 | Body text on light backgrounds |
| `subtitleDark` | 94A3B8 | Subtitles on dark backgrounds |
| `divider` | 64748B | Lines, separators |

### Typography (Default)

**Font:** Lexend Deca (Google Fonts — renders without substitution in Google Slides)

| Token | Size | Bold | Use |
|---|---|---|---|
| titleHero | 40pt | yes | Title slide main text |
| titleSlide | 32pt | yes | Standard slide titles |
| titleSection | 36pt | yes | Section divider titles |
| subtitle | 16pt | no | Subtitles |
| bodyLarge | 16pt | no | Primary body text |
| body | 14pt | no | Standard body text |
| bodySmall | 12pt | no | Dense content |
| caption | 10pt | no | Footnotes, labels |
| statNumber | 72pt | yes | Stat callout numbers |
| statLabel | 18pt | no | Stat labels |
| quoteText | 24pt | yes | Pull quotes |
| cardTitle | 16pt | yes | Card headers |
| cardBody | 11pt | no | Card body text |

### Layout Grid (Default)

- Slide dimensions: 10" x 5.625" (16:9)
- Margins: 0.6" left, 0.6" right, 0.5" top, 0.7" bottom
- Content width: 8.8" (slide width minus margins)
- Footer: thin line at y=5.05", footer text at y=5.15" (8pt, muted color)

### Closing Slide Defaults

- Tagline: empty (user provides or omits)
- URL: empty (user provides or omits)

---

## Adaptation Notes

This skill adapts a production-tested agentic presentation system. The following changes are made from the source:

| Source Element | Adaptation |
|---|---|
| Brand colors (13 Pushpay tokens) | Replaced with 13 generic professional tokens (slate/blue palette) |
| "Pushpay Confidential" footer | Empty by default (user configures) |
| "Technology that leads to connection." tagline | Empty by default |
| "Pushpay Brand Guidelines 2024" references | Removed — theme is self-documenting |
| Example content (donor retention, churches) | Replaced with generic PM content (product updates, metrics) |
| Font (Lexend Deca) | Retained — it's a Google Font, not proprietary |
| Slide types (18) | Retained — architecture is brand-agnostic |
| Character limits | Retained — calibrated to layout grid, font-independent |
| Decision logic | Retained — content patterns are universal |
| Platform rules | Retained — pptxgenjs constraints are framework-level |

## Open Questions

1. **Generation script packaging** — Should the skill include the generation script in the pm-skills repo, or reference it as an external tool? Recommendation: include a minimal script or point to an npm package.
2. **Theme file format** — JSON or YAML for the theme configuration file? JSON matches the deck spec format; YAML is more human-readable. Recommendation: JSON for consistency.
3. **PDF export dependency** — Puppeteer (for PDF) is a heavy dependency. Should PDF export be optional/separate? Recommendation: yes, document as optional.
4. **Default theme refinement** — The proposed palette (Tailwind slate/blue inspired) should be tested in actual .pptx rendering before shipping. Colors that look good on screen may not render identically in PowerPoint.
