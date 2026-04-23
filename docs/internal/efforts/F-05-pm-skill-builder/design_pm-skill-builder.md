# F-05 PM Skill Builder: Design Document

> **Date**: 2026-03-22
> **Author**: Claude Opus 4.6
> **Status**: Codex-reviewed, 8 fixes applied . awaiting user approval
> **Effort brief**: `docs/internal/efforts/F-05-pm-skill-builder.md`
> **Approaches doc**: `docs/internal/efforts/F-05-pm-skill-builder/approaches_pm-skill-builder.md`
> **Issue**: #113

---

## Design Summary (Approved)

The PM Skill Builder (`utility-pm-skill-builder`) is an interactive utility skill that guides contributors from "I have a PM skill idea" to a complete Skill Implementation Packet and optionally draft files ready for PR.

**Key design choices:**
- **Output model**: Draft → Review → Promote (staging discarded after promotion)
- **Staging area**: `_staging/pm-skill-builder/{skill-name}/` (gitignored, discarded after promotion)
- **Workflow**: Adaptive Depth (Approach C with enhancements)
- **Kill gate**: Gap Analysis + Why Gate + Scope Splitting
- **Classifications**: All three (domain, foundation, utility)
- **Writing lens**: Quality Forecast woven inline, not a separate step
- **Exemplar-driven**: Builder identifies closest existing skills and mirrors their patterns
- **Lifecycle**: Create (F-05) → Validate (F-10, #121) → Iterate (F-11, #122)

---

## Section 1: SKILL.md Structure

The builder's SKILL.md (the instructions for the AI agent) follows the established pm-skills pattern with numbered instruction steps, an output contract, and a quality checklist. Estimated ~250-280 lines.

### Frontmatter

```yaml
<!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->
---
name: utility-pm-skill-builder
description: Guides contributors from a PM skill idea to a complete Skill Implementation Packet aligned with pm-skills conventions. Runs gap analysis, validates through a Why Gate, classifies by type and phase, generates draft files, and writes to a staging area for review before promotion.
classification: utility
version: "1.0.0"
updated: 2026-03-22
license: Apache-2.0
metadata:
  category: coordination
  frameworks: [triple-diamond]
  author: product-on-purpose
---
```

### Section Outline

```markdown
# PM Skill Builder

This skill creates new PM skills for the pm-skills library. It produces a
Skill Implementation Packet . a complete design document with draft files .
in a staging area for review before promotion to canonical locations.

## When to Use

- When you have an idea for a new PM skill
- When you want to add a domain skill (phase-specific), foundation skill
  (cross-cutting), or utility skill (meta/tooling) to the pm-skills library
- When a contributor needs guided skill creation that follows repo conventions

## When NOT to Use

- To modify an existing skill → use /pm-skill-validate + /pm-skill-iterate
- To create a skill for a non-pm-skills context → use /agent-skill-builder
- To create a workflow bundle → bundles are authored directly, not via this builder

## Instructions

When asked to create a new PM skill, follow these steps:

### Step 1: Understand the Idea

Accept the idea in either form:
- **Problem-first**: "What PM problem does this skill solve? Who runs into
  this problem, and what do they currently produce (or fail to produce)?"
- **Skill-first**: "Describe the skill you want to create. What artifact
  does it produce? What PM activity does it support?"

Both entry points produce the same downstream flow. If the user provides
one form, do not ask for the other . extract what you need and proceed.

If the idea is vague, ask ONE follow-up question to clarify the artifact
type and target audience before proceeding.

### Step 2: Gap Analysis

Check ALL existing skills for overlap. Use the Current Library Reference
table below AND scan the `skills/` directory for the latest inventory.

Present findings with specificity:
- Name each overlapping skill and explain what it covers
- Identify the specific gap this new skill would fill
- If overlap is high, trigger the Why Gate (see below)

**Why Gate** (triggers when overlap is found):
Ask the user: "Name 2-3 specific prompts or scenarios where the existing
skills fail to produce what you need."

**Kill Gate**: If the user cannot articulate convincing gaps, recommend
an alternative:
- "Revise [existing skill] to cover this case"
- "Create a bundle combining [skill A] + [skill B]"
- "Add a command variant, not a new skill"
- "This is a documentation improvement, not a new skill"

Do not proceed past the kill gate without either convincing evidence of
a gap or explicit user override.

### Step 3: Scope Check

Evaluate whether the idea should be ONE skill or MULTIPLE skills.

**Splitting signals:**
- The idea produces multiple distinct artifact types
- The idea crosses Triple Diamond phases (e.g., Discover + Deliver)
- The description naturally contains "and" connecting two activities

If splitting is warranted, present the recommendation:
"This seems to cover two distinct PM activities:
  1. [Activity A] → produces [Artifact A]
  2. [Activity B] → produces [Artifact B]
These work better as separate skills that can be chained via a bundle.
Want to proceed with just [Activity A] for now?"

### Step 4: Classification + Repo-Fit

Determine the skill's classification and naming:

**Domain skills** (phase-specific PM activities):
- Phase: discover | define | develop | deliver | measure | iterate
- Directory: `{phase}-{skill-name}`
- Frontmatter: `phase: {phase}` (required), no `classification` field

**Foundation skills** (cross-cutting, used across phases):
- No phase
- Directory: `foundation-{skill-name}`
- Frontmatter: `classification: foundation` (required), no `phase` field
- Use when: the skill applies to multiple phases equally

**Utility skills** (meta-skills, repo tooling):
- No phase
- Directory: `utility-{skill-name}`
- Frontmatter: `classification: utility` (required), no `phase` field
- Use when: the skill operates on the repo, workflow, or other skills

**Exemplar selection:**
Identify 1-2 existing skills that are the closest structural match:
- Same phase > same category > similar artifact type
- Read their SKILL.md to understand section structure, instruction style,
  output contract format, and quality checklist pattern
- Name the exemplars explicitly: "Modeled after [skill] . same phase,
  [category] category"

Present the classification and exemplar selection for user confirmation.

### Step 5: Generate Skill Implementation Packet

Produce the complete packet using `references/TEMPLATE.md` as the format.
The packet includes:

1. **Decision** . recommendation + Why Gate evidence (if applicable)
2. **Classification** . type, phase (if domain), category, directory name
3. **Overlap Analysis** . what was found, why this skill is still needed
4. **Quality Forecast** . K/P/C/W zone distribution + writing guidance:
   - Knowledge-heavy (≥35% K): reference frameworks, include When to Use
   - Process-heavy (≥35% P): numbered steps, prescriptive, clear I/O per step
   - Constraint-heavy (≥35% C): MUST/SHOULD/MUST NOT rules, separate section
   - Wisdom-heavy (≥25% W): reflective questions, guide thinking
5. **Exemplar Skills** . which existing skills modeled, why
6. **Draft Frontmatter** . complete, valid YAML block
7. **Draft SKILL.md** . full content (not an outline), mirroring exemplar structure
8. **Draft TEMPLATE.md** . section headers with guidance comments
9. **Draft EXAMPLE.md** . complete, realistic example (150-300 lines) with a
   specific PM scenario, every section filled, optional sections demonstrated
   both filled and skipped
10. **Draft Command** . command frontmatter
11. **AGENTS.md Entry** . exact text to add
12. **Validation Checklist** . all CI rules checked against the draft
13. **Next Steps** . local CI, testing, contribution workflow

### Step 6: Write to Staging Area

Write all generated files to the staging area:

```
_staging/pm-skill-builder/{skill-name}/
├── SKILL.md               ← draft skill file
├── references/
│   ├── TEMPLATE.md        ← draft template
│   └── EXAMPLE.md         ← draft example
└── command.md             ← draft command
```

> **Note**: `_staging/` is gitignored . draft artifacts never ship in releases.
> The staging folder is discarded after promotion.

Report what was written and where.

### Step 7: Promote (on confirmation)

Ask: "Review the packet above. When ready, I'll promote the files to
their canonical locations. Proceed? [yes/no]"

If yes, promote files to canonical locations:
- `skills/{name}/SKILL.md`
- `skills/{name}/references/TEMPLATE.md`
- `skills/{name}/references/EXAMPLE.md`
- `commands/{command-name}.md`
- Append entry to `AGENTS.md`

After promotion, discard the staging folder. Design rationale lives in the
GitHub issue, PR, or effort brief . not in a permanent packet file.

Provide post-promotion guidance:
- "Run CI locally: `bash scripts/lint-skills-frontmatter.sh`"
- "Test the skill: try `/[command-name]` with a realistic scenario"
- "If contributing: create a GitHub issue with the skill-proposal template,
  then open a PR"

## Current Library Reference

Use this table for gap analysis. Also scan `skills/` directory for the
most current inventory . this table reflects the current working tree
(25 domain + 1 foundation + deliver-acceptance-criteria from F-06).

### Domain Skills (25)

| Phase | Skill | Category | Description |
|-------|-------|----------|-------------|
| discover | competitive-analysis | research | Structured competitive landscape analysis |
| discover | interview-synthesis | research | User research interview synthesis |
| discover | stakeholder-summary | research | Stakeholder needs and influence mapping |
| define | hypothesis | ideation | Testable hypothesis with success metrics |
| define | jtbd-canvas | problem-framing | Jobs to Be Done canvas |
| define | opportunity-tree | problem-framing | Opportunity solution tree |
| define | problem-statement | problem-framing | Clear problem statement with success criteria |
| develop | adr | specification | Architecture Decision Record |
| develop | design-rationale | specification | Design decision reasoning |
| develop | solution-brief | ideation | One-page solution overview |
| develop | spike-summary | coordination | Technical/design spike results |
| deliver | acceptance-criteria | specification | Given/When/Then acceptance criteria |
| deliver | edge-cases | specification | Edge cases and error states |
| deliver | launch-checklist | coordination | Pre-launch checklist |
| deliver | prd | specification | Product Requirements Document |
| deliver | release-notes | coordination | User-facing release notes |
| deliver | user-stories | specification | User stories with acceptance criteria |
| measure | dashboard-requirements | validation | Analytics dashboard spec |
| measure | experiment-design | validation | A/B test or experiment design |
| measure | experiment-results | reflection | Experiment results and learnings |
| measure | instrumentation-spec | validation | Event tracking specification |
| iterate | lessons-log | reflection | Structured lessons learned |
| iterate | pivot-decision | reflection | Pivot or persevere decision |
| iterate | refinement-notes | coordination | Backlog refinement outcomes |
| iterate | retrospective | reflection | Team retrospective |

### Foundation Skills (1)

| Skill | Category | Description |
|-------|----------|-------------|
| persona | research | Evidence-calibrated product or marketing persona |

### Utility Skills (0 shipped, 1 in progress)

| Skill | Category | Status |
|-------|----------|--------|
| pm-skill-builder | coordination | This skill (F-05, in design) |

## Output Contract

The builder MUST produce draft files for the new skill:
- `SKILL.md` . full skill instructions
- `references/TEMPLATE.md` . output template with guidance comments
- `references/EXAMPLE.md` . complete worked example (150-300 lines)
- `command.md` . slash command file

All drafts are written to `_staging/pm-skill-builder/{skill-name}/` (gitignored).

On promotion, files are copied to canonical locations, AGENTS.md is
updated, and the staging folder is discarded.

## Quality Checklist

Before finalizing the packet, verify all items in both tiers:

### CI Validation (must pass)
- [ ] `name` matches directory name
- [ ] Description is 20-100 words (single-line, no multiline YAML)
- [ ] `version`, `updated`, `license` all present
- [ ] Classification correct (domain → `phase:`, foundation/utility → `classification:`)
- [ ] Directory name follows convention: `{phase/classification}-{skill-name}`
- [ ] TEMPLATE.md has ≥3 `##` sections
- [ ] Command file references correct skill path
- [ ] AGENTS.md entry uses `####` + `**Path:**` format

### Quality Checks (should pass)
- [ ] Gap analysis checked all existing skills (not just same-phase)
- [ ] Why Gate evidence is specific (names prompts/scenarios, not vague)
- [ ] EXAMPLE.md is a complete artifact (150-300 lines), not an outline
- [ ] Output contract is present in draft SKILL.md
- [ ] Quality checklist is present in draft SKILL.md
- [ ] Quality Forecast identifies dominant zone and provides writing guidance

## Examples

See `references/EXAMPLE.md` for a completed Skill Implementation Packet
demonstrating a realistic domain skill creation.

See Section 4 of this design document for three sample builder
scenarios at different complexity levels.
```

### Approval Status

| Section | Status |
|---------|--------|
| Frontmatter | Awaiting approval |
| Section outline | Awaiting approval |
| Instruction steps (1-7) | Awaiting approval |
| Library reference table | Awaiting approval |
| Output contract | Awaiting approval |
| Quality checklist | Awaiting approval |

---

## Section 2: TEMPLATE.md (Skill Implementation Packet Format)

This is the internal working structure the builder follows during skill creation. The builder presents these sections to the user during the interactive session. No permanent packet file is written . design rationale belongs in the GitHub issue or PR, not a repo artifact.

```markdown
# Skill Implementation Packet: {Skill Name}

> **Created**: {date}
> **Builder version**: 1.0.0
> **Status**: Draft | Promoted | Abandoned

---

## Decision

{Recommendation: create / revise existing / bundle / command / docs-only}

{Why Gate evidence if applicable . the 2-3 specific prompts or scenarios
where existing skills fail}

---

## Classification

| Field | Value |
|-------|-------|
| Type | {domain / foundation / utility} |
| Phase | {discover / define / develop / deliver / measure / iterate / n/a} |
| Category | {specification / research / coordination / validation / reflection / ideation / problem-framing} |
| Directory | {phase/classification}-{skill-name} |
| Command | /{command-name} |

---

## Overlap Analysis

### Existing skills checked

{List of skills reviewed during gap analysis}

### Findings

{What was found . specific overlap and differentiation}

### Why this skill is still needed

{The gap this skill fills that no existing skill covers}

---

## Quality Forecast

### Zone Distribution

| Zone | Weight | Description |
|------|--------|-------------|
| Knowledge (K) | {0-100} | {What domain knowledge this skill encodes} |
| Process (P) | {0-100} | {What workflow/steps this skill teaches} |
| Constraint (C) | {0-100} | {What rules/guardrails this skill enforces} |
| Wisdom (W) | {0-100} | {What judgment/reflection this skill develops} |

> **Rule**: Weights must sum to 100. Round to nearest 5. These are approximate
> guidance signals for writing style, not scored metrics.

**Dominant zone**: {zone} ({weight}%)

### Writing Guidance

{Zone-specific guidance based on the dominant zone . see Quality Forecast
Guide in SKILL.md for the mapping}

---

## Exemplar Skills

| Skill | Why selected |
|-------|-------------|
| {exemplar-1} | {Same phase, similar category, closest structural match} |
| {exemplar-2} | {Additional reference for a specific pattern} |

---

## Draft Frontmatter

```yaml
<!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->
---
name: {skill-name}
description: {20-100 word description on a single line . linter reads first line only}
phase: {phase}          # for domain skills only . omit for foundation/utility
classification: {type}  # for foundation/utility only . omit for domain
version: "1.0.0"
updated: {date}
license: Apache-2.0
metadata:
  category: {category}
  frameworks: [triple-diamond]
  author: product-on-purpose
---
```

> **Linter constraint**: `description:` must be a single-line value (no `>-` or `|` folding).
> The linter extracts only the first line after the key using `sed`. Multiline YAML
> would capture the literal `>-` string and fail the 20-100 word check.

---

## Draft SKILL.md

{Full draft content . not an outline. Includes:
- Title and introductory paragraph
- When to Use section
- When NOT to Use section (if applicable)
- Instructions (numbered steps)
- Output Contract
- Quality Checklist
- Examples reference

Mirrors the section structure of the selected exemplar skill.}

---

## Draft TEMPLATE.md

{Section headers with guidance comments for each section.
Each section has:
- A ## header
- A brief instruction comment explaining what goes here
- Placeholder structure showing the expected format}

---

## Draft EXAMPLE.md

{A complete, realistic example . 150-300 lines.
- Picks a specific PM scenario appropriate to the skill's domain
- Fills every TEMPLATE.md section with concrete content
- Demonstrates optional sections both filled and skipped
- Shows what "good" looks like for ambiguous sections}

---

## Draft Command

```markdown
---
description: {One-line description of what the command does}
---

Use the `{skill-name}` skill to {primary action}.

Read the skill instructions from `skills/{directory-name}/SKILL.md` and follow them to {describe the task}.

Use `skills/{directory-name}/references/TEMPLATE.md` as the output format.

Context from user: $ARGUMENTS
```

> **Convention**: Command files use only `description:` in frontmatter. No `name`,
> `arguments`, or `skill_file` fields. The optional idea argument is handled via
> `$ARGUMENTS` in the prose body, matching all existing commands.

---

## AGENTS.md Entry

```markdown
#### {skill-name}
**Path:** `skills/{directory-name}/SKILL.md`

{1-2 sentence description. Imperative verb start, use-case focus.}

---
```

> **Convention**: Level-4 header (kebab-case skill name), `**Path:**` line,
> blank line, description paragraph, `---` separator. No `**Command:**` field.
> Must pass `validate-agents-md.sh` which checks path ↔ directory sync.

---

## Validation Checklist

### CI Validation (must pass . enforced by linter + validators)

- [ ] `name` matches directory name
- [ ] `description` is 20-100 words (single-line, no `>-`)
- [ ] `version` present (exactly one root-level, no `metadata.version`)
- [ ] `updated` present (ISO date format)
- [ ] `license` present (`Apache-2.0`)
- [ ] Phase/classification consistency (domain has `phase:`, foundation/utility has `classification:`)
- [ ] `references/TEMPLATE.md` exists with ≥3 `##` sections
- [ ] Command file references correct skill path (`validate-commands.sh`)
- [ ] AGENTS.md entry uses `#### {name}` + `**Path:**` format (`validate-agents-md.sh`)

### Quality Checks (should pass . builder-enforced, not CI-gated)

- [ ] `references/EXAMPLE.md` is a complete artifact (150-300 lines), not an outline
- [ ] Output contract present in SKILL.md
- [ ] Quality checklist present in SKILL.md
- [ ] Quality Forecast identifies dominant zone with writing guidance
- [ ] Gap analysis checked all existing skills (not just same-phase)
- [ ] Why Gate evidence is specific (names prompts/scenarios, not vague)

---

## Next Steps

1. **Review**: Read through the packet above. Flag any sections that need changes.
2. **Local CI**: Run `bash scripts/lint-skills-frontmatter.sh` after promotion.
3. **Test**: Try using `/{command-name}` with a realistic PM scenario.
4. **Contribute**: If submitting to pm-skills, create a GitHub issue using the
   skill-proposal template, then open a PR with the promoted files.
5. **Iterate**: Use `/pm-skill-iterate` to refine based on testing feedback.
```

### Approval Status

| Section | Status |
|---------|--------|
| Packet structure (13 sections) | Awaiting approval |
| Zone distribution table | Awaiting approval |
| Validation checklist | Awaiting approval |
| Next Steps guidance | Awaiting approval |

---

## Section 3: Command File

```markdown
---
description: Create a new PM skill for the pm-skills library with gap analysis, classification, and a complete Skill Implementation Packet
---

Use the `utility-pm-skill-builder` skill to create a new PM skill.

Read the skill instructions from `skills/utility-pm-skill-builder/SKILL.md` and follow them to guide the contributor through the full builder workflow.

Use `skills/utility-pm-skill-builder/references/TEMPLATE.md` as the packet output format.

If the user provides a skill idea, begin with Step 1 (Understand the Idea) using the provided context. If no idea is provided, prompt the user to describe their skill idea or the PM problem it solves.

Context from user: $ARGUMENTS
```

> **Convention**: Matches all existing commands in `commands/*.md`. Single `description:`
> field in frontmatter, instructional prose body, `$ARGUMENTS` for user input.

### Approval Status

| Section | Status |
|---------|--------|
| Command frontmatter | Awaiting approval |
| Command body | Awaiting approval |

---

## Section 4: Sample Outputs

Three sample builder runs demonstrating different scenarios:

### Thread 1: Simple Domain Skill
**Scenario**: A mid-stage SaaS company needs a skill for creating change management communications when shipping features that change user workflows.
**Classification**: `deliver-change-communication` (deliver phase, coordination category)
**Demonstrates**: Straightforward creation . no meaningful overlap, clear classification, efficient 4-interaction flow. Shows the builder at its most concise.

### Thread 2: Utility Skill with Overlap + Why Gate
**Scenario**: A contributor wants a skill that validates existing pm-skills against the current CI rules and quality bar, producing a health report with fix recommendations.
**Classification**: `utility-pm-skill-validate` . operates on the repo and other skills, not a PM domain activity.
**Demonstrates**: Overlap detected with M-12 CI scripts (which validate at CI time, not interactively). Why Gate triggers . user articulates that CI is pass/fail but doesn't explain *how* to fix issues or assess quality beyond CI minimums. Scope check confirms this is one skill (validate), not validate + iterate. Builder produces a focused utility packet. Also serves as early design thinking for F-10.

### Thread 3: Kill Gate Fires
**Scenario**: A contributor proposes a skill for "creating product requirements documents."
**Classification**: Would be `deliver-prd` . which already exists.
**Demonstrates**: Direct overlap found. Why Gate fails . the contributor's scenarios are all handled by existing `deliver-prd`. Builder recommends revising the existing skill or adding sample outputs instead. Shows the builder preventing a duplicate skill, which is as valuable as creating a good one.

Each sample is a complete Skill Implementation Packet as the builder would produce it.

### Approval Status

| Section | Status |
|---------|--------|
| Thread 1 scenario | Awaiting approval |
| Thread 2 scenario | Awaiting approval |
| Thread 3 scenario | Awaiting approval |

---

## Approval Tracker

| Design Section | Status | Notes |
|---------------|--------|-------|
| Design summary | **Approved** | Packet → Review → Promote, Approach C, staging area |
| SKILL.md structure | **Reviewed** . 8 fixes applied | Frontmatter fixed (single-line), quality checklist split, library ref updated |
| TEMPLATE.md (packet format) | **Reviewed** . 8 fixes applied | AGENTS format fixed, command format fixed, K/P/C/W rule added, validation split |
| Command file | **Reviewed** . rewritten | Matches repo convention: `description:` only + `$ARGUMENTS` |
| Sample outputs (3 threads) | **Reviewed** . Thread 2 replaced | Utility scenario now uses pm-skill-validate (F-10 preview) |

> **Review cycle**: Codex reviewed → "Needs revision" with 8 findings → Claude verified all 8
> against repo ground truth → all 8 confirmed and fixed → awaiting user approval.
