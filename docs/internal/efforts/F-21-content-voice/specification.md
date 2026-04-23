# Specification: foundation-content-voice

## Overview

A foundation skill that helps PMs create structured voice and tone guides for consistent content across all PM outputs. Like `foundation-persona` (which defines *who* you write for), content voice defines *how* you write. Produces a referenceable artifact that other skills and workflows consume . PRDs, release notes, presentations, user-facing copy, and stakeholder communications all benefit from a shared voice definition. The key design challenge: the guide must be useful to both humans reading it and AI agents consuming it programmatically.

## Skill Identity

| Field | Value |
|-------|-------|
| Name | foundation-content-voice |
| Classification | foundation |
| Version | 1.0.0 |
| License | Apache-2.0 |
| Category | communication |
| Audience | Product Managers |

## Design Principles

### 1. Context-Aware, Not One-Size-Fits-All
A single tone setting fails because PM communication spans radically different contexts: internal planning docs, customer-facing release notes, leadership updates, crisis communications, celebration announcements. The voice guide must define how dimensions shift across contexts . a context variant matrix is a required section, not optional.

### 2. Dimensions Over Adjectives
"Friendly and professional" is not actionable guidance. Voice is defined through measurable dimensions . formality level, vocabulary complexity, sentence rhythm, personality traits, humor usage . each positioned on a scale. Dimensions give both humans and AI agents concrete parameters to follow.

### 3. Show, Don't Just Tell
Do/Don't example pairs are the most consumed section of any voice guide. Each dimension and context variant includes concrete before/after examples using real PM artifact types (PRD excerpts, release note snippets, stakeholder emails). Abstract rules without examples are useless.

### 4. AI-Consumable by Design
The guide's structure must be parseable by AI agents without interpretation. Voice dimensions use numeric scales. Context variants use explicit parameter overrides. The AI prompt appendix provides ready-to-use instructions that other skills can copy directly into their prompts.

---

## File Architecture

```
skills/foundation-content-voice/
├── SKILL.md
└── references/
    ├── TEMPLATE.md
    └── EXAMPLE.md

commands/
└── content-voice.md
```

### SKILL.md (~200-240 lines)

**Frontmatter:**
```yaml
name: foundation-content-voice
description: >-
  Creates structured voice and tone guides that define how a product team
  communicates across channels. Produces a referenceable artifact with voice
  dimensions, context variants, do/don't examples, word lists, and an
  AI prompt appendix that other skills consume for consistent content voice.
classification: foundation
version: "1.0.0"
updated: YYYY-MM-DD
license: Apache-2.0
metadata:
  category: communication
  frameworks:
    - triple-diamond
    - content-strategy
  author: product-on-purpose
```

**Sections:**

1. **When to Use** (~10 lines)
   - Establishing voice guidelines for a product or team
   - Onboarding new PMs or writers to an existing voice standard
   - Providing AI agents with structured voice parameters for content generation
   - Aligning cross-functional teams (PM, marketing, support) on communication style

2. **When NOT to Use** (~8 lines)
   - Writing the content itself (voice guide informs content; other skills produce it)
   - Brand identity design beyond voice (visual identity, positioning, naming)
   - Copywriting for a specific deliverable (use the appropriate deliver-phase skill)
   - Translating or localizing content (different discipline)

3. **Voice Dimensions** (~30 lines)
   - **Formality** . Scale 1-5: casual conversational to formal institutional
   - **Vocabulary complexity** . Scale 1-5: plain language to domain-specialist
   - **Sentence rhythm** . Short/punchy, mixed cadence, long/flowing
   - **Personality** . 3-5 trait words that characterize the voice (e.g., "confident, clear, warm")
   - **Humor** . None, subtle, moderate, frequent
   - **Technical density** . Scale 1-5: no jargon to jargon-heavy
   - **Point of view** . First person plural ("we"), second person ("you"), third person neutral
   - Each dimension includes: definition, scale anchors, default position, example at each end

4. **Context Variant System** (~20 lines)
   - Contexts: internal documentation, customer-facing product content, leadership/stakeholder updates, crisis/incident communication, celebration/announcement, support/help content
   - For each context: which dimensions shift and by how much
   - Matrix format: context rows x dimension columns with override values

5. **Instructions** (~35 lines, numbered steps)
   1. Gather inputs . existing brand guidelines, 3-5 sample content pieces, target contexts
   2. Analyze existing voice . if samples provided, extract current dimension positions
   3. Define voice identity . 2-3 sentence essence statement capturing the voice
   4. Set dimension positions . place each of the 6-7 dimensions on its scale
   5. Map context variants . for each of 4-6 contexts, define dimension overrides
   6. Write do/don't examples . 8-10 pairs covering major artifact types
   7. Build word lists . preferred terms, avoided terms, jargon policy
   8. Create AI prompt appendix . pre-built voice instructions for agent consumption
   9. Validate with stakeholders . review guide against recent real content
   10. Publish and reference . make the guide available for other skills to consume

6. **Output Contract** (~10 lines)
   - References TEMPLATE.md as the deliverable format
   - Required sections: voice identity, dimension table, context variant matrix, do/don't examples, word lists, AI prompt appendix
   - Final output: a structured content voice guide usable by humans and AI agents

7. **Quality Checklist** (~15 lines)
   - [ ] Voice identity statement is 2-3 sentences, capturing essence without jargon
   - [ ] All 6-7 dimensions have explicit scale positions with rationale
   - [ ] Context variant matrix covers at least 4 communication contexts
   - [ ] At least 8 do/don't example pairs covering different artifact types
   - [ ] Word lists include preferred terms, avoided terms, and jargon policy
   - [ ] AI prompt appendix provides copy-paste-ready voice instructions
   - [ ] Guide tested against 2-3 real content pieces . voice is recognizable
   - [ ] No conflicting guidance between dimension settings and examples

8. **Companion Skills** (~8 lines)
   - `foundation-persona` . persona defines who you write for; voice defines how you write. Together they provide complete content direction.
   - `deliver-prd` . can reference voice guide for PRD tone
   - `deliver-release-notes` . can reference voice guide for user-facing copy
   - `utility-slideshow-creator` (F-19) . can reference voice guide for presentation copy
   - `utility-slideshow-themer` (F-20) . can reference voice guide for typography alignment

---

### references/TEMPLATE.md (~70-90 lines)

A structured content voice guide template. Sections:

1. **Voice Identity** . 2-3 sentence statement capturing the voice essence. "We sound like..." framing.
2. **Voice Dimensions** . Table: dimension / scale range / our position / rationale. All 6-7 dimensions.
3. **Context Variant Matrix** . Table: context / formality / vocabulary / humor / technical density / point of view. One row per communication context with override values.
4. **Do/Don't Examples** . Paired examples organized by artifact type: PRD excerpt, release note, stakeholder email, user-facing copy, internal update, error message, celebration announcement, support article. Each pair: "Instead of [don't] ... write [do]" with the dimension it demonstrates.
5. **Word Lists** . Three sub-sections: (a) Preferred terms with usage notes, (b) Avoided terms with preferred alternatives, (c) Jargon policy . when technical terms are acceptable and when to translate.
6. **AI Prompt Appendix** . Pre-built instruction block that AI agents can prepend to their prompts. Includes: voice identity summary, dimension settings as parameters, context detection rules, example pairs for calibration.

---

### references/EXAMPLE.md (~300-400 lines)

A worked example: **Creating a content voice guide for a B2B SaaS product team**.

Demonstrates the full TEMPLATE workflow:

1. **Inputs** . Existing brand guideline excerpt ("Approachable expertise"), 4 sample pieces (PRD, release notes, support article, leadership update), target contexts identified
2. **Voice Analysis** . Extracts current positions from samples: formality 3/5, vocabulary 3/5 (moderate jargon), humor 2/5 (subtle), sentences mostly mid-length
3. **Voice Identity** . "We sound like a knowledgeable colleague who explains complex concepts clearly . confident without being condescending, precise without being clinical. We respect our reader's time and intelligence."
4. **Dimension Table** . Full 7-dimension table with positions and rationale for each
5. **Context Variants** . Matrix for 5 contexts: internal docs (formality 2, humor 3), customer-facing (formality 3, humor 2), leadership (formality 4, humor 1), crisis (formality 5, humor 0), celebration (formality 2, humor 3)
6. **Do/Don't Examples** . 10 pairs covering: PRD problem statement, release note feature description, stakeholder status update, error message, onboarding tooltip, meeting agenda, retrospective summary, help article intro, launch announcement, incident postmortem
7. **Word Lists** . 15 preferred terms ("ship" not "deploy to production"), 10 avoided terms ("synergy" replaced by specific collaboration description), jargon policy (define on first use, abbreviations in glossary)
8. **AI Prompt Appendix** . Ready-to-use block: "You are writing as [product]. Voice: confident, clear, warm. Formality: 3/5. Vocabulary: 3/5..." with context-detection rules

---

### commands/content-voice.md

```yaml
---
name: content-voice
description: Create a structured voice and tone guide for consistent product communication
skill: foundation-content-voice
---
```

Body: brief instruction to invoke the skill with existing brand guidelines or sample content.

---

## Cross-Cutting Integration Notes

This is a foundation skill with wide integration surface. Other skills reference the content voice guide but do not depend on it . they function without one but produce better output with one. Integration points:

| Consuming Skill | How It Uses the Voice Guide |
|----------------|---------------------------|
| `deliver-prd` | Tone for problem statements, user stories, and acceptance criteria prose |
| `deliver-release-notes` | Voice for user-facing feature descriptions |
| `utility-slideshow-creator` | Copy tone for slide content and speaker notes |
| `utility-slideshow-themer` | Typography choices aligned with voice personality |
| `deliver-user-stories` | Voice for story descriptions and acceptance criteria |
| `discover-stakeholder-summary` | Tone calibration for different stakeholder audiences |

The AI prompt appendix is the primary machine-readable integration surface. Skills that want to apply the voice guide prepend the appendix block to their generation prompt.

## Acceptance Criteria

1. **Given** a PM provides 3-5 sample content pieces, **when** they follow the SKILL.md instructions, **then** the output includes a voice identity statement, all dimension positions, and a context variant matrix with at least 4 contexts.

2. **Given** a completed voice guide, **when** the AI prompt appendix is prepended to a content generation prompt, **then** the generated content recognizably matches the voice dimensions and examples in the guide.

3. **Given** two different communication contexts (e.g., customer-facing release note and internal retrospective), **when** the context variant matrix is applied, **then** the same voice identity produces appropriately different tonal output.

4. **Given** a PM with no prior brand guidelines, **when** they follow the instructions starting from sample content only, **then** the skill produces a complete voice guide without requiring external brand documentation.

5. **Given** a completed voice guide, **when** reviewed against 3 real content pieces from the team, **then** a reader can identify which pieces align with the guide and which deviate.
