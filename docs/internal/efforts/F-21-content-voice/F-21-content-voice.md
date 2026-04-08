# [F-21] Content Voice Foundation Skill
Status: Backlog
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a `foundation-content-voice` skill that helps PMs create structured voice and tone guides. Produces a referenceable artifact that other skills and workflows can consume to maintain consistent content voice across all PM outputs — PRDs, release notes, stakeholder communications, presentations, and user-facing copy.

Like `foundation-persona`, this is a foundational artifact that shapes how other skills produce content. A persona defines *who* you're writing for; a content voice guide defines *how* you write.

## Problem

PMs produce content across many channels with inconsistent voice:
1. PRDs sound clinical while release notes sound casual — same product, different voices
2. Each PM on a team develops their own style, creating inconsistency across artifacts
3. AI assistants default to generic, formal tone without explicit voice guidance
4. Existing brand voice docs (if they exist) aren't structured for AI consumption — they're written for humans to interpret, not agents to follow
5. Voice changes by context (internal vs customer-facing, crisis vs celebration) but most guides are one-size-fits-all

## How It Would Work

### Input
- Existing brand/voice guidelines (if any)
- Sample content that exemplifies the desired voice (3-5 examples)
- Target contexts: who reads this content and in what situations?

### Process
1. **Analyze existing voice** — If samples provided, extract voice dimensions (formality, technical density, personality, sentence rhythm)
2. **Define voice dimensions** — Structured attributes: tone spectrum (formal↔casual), vocabulary level, sentence length, personality traits, humor usage
3. **Map context variants** — How voice shifts across contexts: internal docs, customer-facing, leadership updates, crisis communication, celebration
4. **Create do/don't examples** — Concrete before/after pairs showing the voice applied to common PM content types
5. **Generate AI-consumable format** — Structured guide that AI assistants can reference when producing content

### Output
A structured content voice guide with:
- Voice identity statement (2-3 sentences capturing the voice essence)
- Voice dimensions table (formality, vocabulary, personality, rhythm — with scale positions)
- Context variant matrix (how dimensions shift across 4-6 communication contexts)
- Do/Don't example pairs (8-10 examples covering common PM artifact types)
- Word lists (preferred terms, avoided terms, jargon policy)
- AI prompt appendix (pre-built voice instructions other skills can reference)

## Key Decisions

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Classification** | foundation | Like persona, this is a foundational artifact other skills reference. It shapes content production across all phases. |
| **Relationship to persona** | Complementary, not overlapping | Persona = who you write FOR. Content voice = how you write. Both inform content but from different angles. |
| **AI-consumable format** | Include as a section, not the whole guide | The guide should be useful to humans AND agents. The AI appendix is a bonus section, not the primary structure. |
| **Context variants** | Required section | One-size-fits-all voice guides fail because PM communication is inherently multi-context |
| **Number of dimensions** | 5-7 core dimensions | Enough to differentiate voice meaningfully, not so many that it becomes unwieldy |
| **Integration with other skills** | Document cross-references | PRD, release-notes, user-stories, stakeholder-summary can all reference a content voice guide |

## Quality Forecast

| Zone | Weight | Rationale |
|------|--------|-----------|
| Knowledge | 35 | Voice dimension frameworks, content strategy principles |
| Wisdom | 30 | Judging appropriate tone for context, balancing personality with professionalism |
| Process | 20 | Step-by-step guide creation workflow with analysis and synthesis |
| Constraint | 15 | Structured format requirements, dimension scales, required example pairs |

## Dependencies

- None required
- **foundation-persona** — natural companion; a persona + voice guide together give comprehensive content direction
- Other skills (deliver-prd, deliver-release-notes, etc.) can optionally reference the voice guide in their workflows

## Artifacts Produced

- `skills/foundation-content-voice/SKILL.md`
- `skills/foundation-content-voice/references/TEMPLATE.md` (voice guide template)
- `skills/foundation-content-voice/references/EXAMPLE.md` (worked example: SaaS product voice guide)
- `commands/content-voice.md`

## Estimated Complexity

Medium — well-understood content strategy domain, but the "AI-consumable format" angle requires careful design. The context variant matrix is the most nuanced section.

## PRs

TBD
