# F-05 PM Skill Builder: Design Approaches

> **Date**: 2026-03-22
> **Author**: Claude Opus 4.6
> **Status**: Design phase — awaiting approach selection
> **Effort brief**: `docs/internal/efforts/F-05-pm-skill-builder.md`
> **Issue**: #113

---

## Design Context

### What we're building

A utility skill (`utility-pm-skill-builder`) that guides contributors from "I have an idea for a PM skill" to:
1. A **Skill Implementation Packet** (review artifact with all design decisions documented)
2. Optionally, **draft files on disk** (SKILL.md, TEMPLATE.md, EXAMPLE.md, command, AGENTS.md entry) ready for a PR

This is the **Option C (Packet → Review → Write Files)** pattern, confirmed by the maintainer.

### Key constraints

- Must work as a SKILL.md (instructions for an AI agent), not as a standalone CLI tool
- Must follow pm-skills conventions: 3-file pattern, frontmatter schema, kebab-case naming, phase/classification rules
- v1 scope: **create mode only**. Revise and audit modes are future work.
- The skill's output must pass the enhanced CI validation (M-12, running in parallel)
- Named `/pm-skill-builder` to distinguish from the future `/agent-skill-builder` (F-09)

### Prior art informing the design

| Source | Key contribution |
|--------|-----------------|
| `04_next-efforts.md` Effort 2 | 7-step workflow spec, frontmatter outline, Implementation Packet template |
| `idea_skill-builder_vs_skill-creator.md` | K/P/C/W zone model for skill content types, quality rubric, capsule format |
| `deliver-acceptance-criteria` (Codex, F-06) | Fresh example of a well-structured domain skill — Output Contract, Quality Checklist pattern |
| `foundation-persona` | Precedent for a multi-mode utility skill with resolve-first-then-generate pattern |
| `deliver-prd` | Established pattern for a complex domain skill with numbered instructions |

### The core design question

How many steps should the builder walk the user through, and how much should each step require human interaction?

---

## Approach A: Linear 7-Step Workflow

### Philosophy

Follow the spec in `04_next-efforts.md` faithfully. Every step is a distinct interaction. The builder is a structured interview that produces a complete, high-quality design before any files are written.

### Workflow

```
User: "I want to create a skill for [idea]"

Step 1: Gap Analysis
  → Builder checks all 26+ existing skills for overlap
  → Presents findings: "Here's what already exists that's close..."
  → User confirms: "Yes, this is genuinely new" or builder suggests alternatives

Step 2: Why Gate
  → Builder asks: "Name 2-3 specific prompts where existing skills fail to produce what you need"
  → User provides evidence
  → Builder evaluates: are these gaps real or perceived?
  → KILL GATE: if gaps are not convincing, recommend revise/bundle/command instead

Step 3: Repo-Fit Assessment
  → Builder evaluates: is this a new skill, a revision to an existing skill, a bundle, a command, or a docs-only change?
  → Presents recommendation with reasoning

Step 4: Classification
  → Builder determines: domain (which phase?) / foundation / utility
  → Determines category: specification, research, coordination, etc.
  → Proposes directory name: {classification/phase}-{skill-name}
  → User confirms or adjusts

Step 5: Generate Implementation Packet
  → Builder produces the full packet document:
    - Decision summary + Why Gate evidence
    - Classification (type, phase, category, name)
    - Overlap analysis results
    - Draft frontmatter (complete YAML block)
    - Draft SKILL.md outline (sections, instructions, output contract)
    - Draft TEMPLATE.md sections (with guidance comments)
    - EXAMPLE.md scenario description
    - Draft command frontmatter
    - AGENTS.md entry text
    - Repo update checklist

Step 6: Writing Lens (optional)
  → Builder analyzes the proposed skill's K/P/C/W zone distribution
  → Suggests: "This skill is 40% Process, 30% Knowledge — make sure your instructions
    are step-by-step (process-heavy) with framework references (knowledge)"
  → Provides zone-specific writing guidance

Step 7: Validation Checklist
  → Builder runs through the CI validation rules against the draft:
    - Frontmatter complete? Name matches dir? Phase/classification consistent?
    - TEMPLATE.md has ≥3 sections? EXAMPLE.md fills all sections?
    - Description 20-100 words? Output contract present?
  → Flags any issues for the user to fix

→ CHECKPOINT: "Here's your complete Skill Implementation Packet. Review it."

→ OPTIONAL: "Ready to write these files to disk? [yes/no]"
  → If yes: creates all files in the correct directories
```

### Interactions required

7 distinct steps, each requiring user input. Plus the optional file-writing step.

Typical conversation: **8-10 messages** from the user.

### Strengths

| Strength | Why it matters |
|----------|---------------|
| **Most thorough** | Every design decision is explicitly surfaced and confirmed |
| **Strongest kill gate** | Steps 1-3 each have an opportunity to redirect bad ideas |
| **Most educational** | A first-time contributor learns the repo's design philosophy step by step |
| **Spec-faithful** | Matches `04_next-efforts.md` exactly — no design drift from the plan |
| **Writing Lens is powerful** | The K/P/C/W zone analysis produces genuinely better skill content |
| **Audit trail** | The packet documents every decision, not just the output |

### Weaknesses

| Weakness | Impact |
|----------|--------|
| **Slow for experienced users** | Someone who knows the repo conventions doesn't need 7 steps |
| **Conversation fatigue** | 8-10 messages is a lot — users may abandon mid-flow |
| **Writing Lens may confuse** | K/P/C/W zones are a sophisticated concept; first-time contributors may not understand it |
| **Over-structured for simple skills** | A straightforward domain skill (like acceptance-criteria) doesn't need gap analysis + why gate + repo-fit + classification + writing lens |
| **SKILL.md will be very long** | Encoding 7 steps with all their logic makes for a large instruction set |

### Best for

- Repo maintainers designing high-impact skills
- Community contributors who are new to pm-skills conventions
- Complex utility or foundation skills that need careful design

### SKILL.md size estimate

~300-400 lines of instructions (comparable to `foundation-persona` which is ~150 lines but has simpler logic)

---

## Approach B: Fast-Track with Kill Gates

### Philosophy

Front-load the two decisions that kill 80% of bad ideas (gap analysis + why gate), then generate everything in one shot. Optimize for speed and assume the user knows roughly what they want.

### Workflow

```
User: "I want to create a skill for [idea]"

Step 1: Gap Analysis + Why Gate (combined kill gate)
  → Builder checks all 26+ existing skills for overlap
  → If overlap found:
    → Asks: "These existing skills cover similar ground: [list]. Name 2-3 specific
      prompts where they fail to produce what you need."
    → KILL GATE: if user can't name gaps, recommend revise/bundle/command instead
  → If no overlap:
    → Proceeds directly

Step 2: Classification (quick)
  → Builder proposes: domain (phase) / foundation / utility
  → Proposes directory name and category
  → User confirms in one message

Step 3: Generate Full Packet + Offer File Writing
  → Builder generates the complete Implementation Packet in one output
  → Includes all sections: frontmatter, SKILL.md outline, TEMPLATE.md, EXAMPLE.md,
    command, AGENTS.md entry, checklist
  → Ends with: "Ready to write these files? [yes/no]"
  → If yes: writes all files to disk
```

### Interactions required

3 steps, each requiring user input. Plus optional file-writing confirmation.

Typical conversation: **4-5 messages** from the user.

### Strengths

| Strength | Why it matters |
|----------|---------------|
| **Fast** | 3 interactions to a complete packet — respects the user's time |
| **Kill gate is still present** | The combined gap analysis + why gate catches bad ideas early |
| **Low conversation fatigue** | Short enough to complete in one sitting without losing momentum |
| **Simple SKILL.md** | Fewer steps = fewer instructions = easier for the AI to follow reliably |
| **Matches agent execution pattern** | Codex or similar agents can run this autonomously with minimal interaction |

### Weaknesses

| Weakness | Impact |
|----------|--------|
| **Skips repo-fit assessment** | Doesn't explicitly consider: is this a new skill, a revision, a bundle, or a command? The user may not think of alternatives. |
| **No writing lens** | The K/P/C/W zone guidance doesn't appear. The generated SKILL.md outline is generic rather than content-type-aware. |
| **Less educational** | A new contributor learns the conventions but not the design philosophy |
| **Classification may be wrong** | With one quick step, the builder may misclassify a skill (e.g., utility vs domain) without enough discussion |
| **No validation checkpoint** | The packet is generated and the user is offered files immediately — no explicit validation step against CI rules |

### Best for

- The repo maintainer building skills quickly
- Experienced contributors who already understand pm-skills
- Agent-driven execution (Codex running the builder autonomously)

### SKILL.md size estimate

~150-200 lines of instructions (comparable to `deliver-prd`)

---

## Approach C: Adaptive Depth (Recommended)

### Philosophy

The two highest-value parts of the builder are (1) the kill gate (gap analysis + why gate) and (2) the packet generation. Everything else should be present but not forced. The skill detects context and adjusts depth: minimal interaction for clear ideas, deeper exploration for ambiguous ones.

### Workflow

```
User: "I want to create a skill for [idea]"
  OR: "/pm-skill-builder" (opens with a prompt for the idea)

Step 1: Understand the Idea
  → Builder asks: "Describe the PM skill you want to create. What artifact
    does it produce? What PM activity does it support?"
  → This open-ended entry gives the builder enough context to run gap analysis
    and classification without separate steps

Step 2: Gap Analysis (always runs)
  → Builder checks all 26+ existing skills for overlap
  → Presents findings with specificity:
    "I found 2 existing skills that overlap: deliver-user-stories (covers story
    writing) and deliver-edge-cases (covers edge case identification). Neither
    produces formal acceptance criteria in Given/When/Then format."
  → If high overlap: triggers Why Gate inline
    "Name 2-3 specific prompts where these existing skills fail to produce
    what you need."
  → KILL GATE: if overlap is too strong and user can't articulate gaps,
    recommend alternatives:
    - "Revise [existing skill] instead"
    - "Create a bundle combining [skill A] + [skill B]"
    - "Add a command variant, not a new skill"
    - "This is a docs improvement, not a new skill"
  → If no overlap: proceed with acknowledgment

Step 3: Classification + Repo-Fit (combined, one interaction)
  → Builder proposes based on Step 1 context:
    - Type: domain / foundation / utility
    - Phase (if domain): discover / define / develop / deliver / measure / iterate
    - Category: specification, research, coordination, validation, reflection, etc.
    - Directory name: {type/phase}-{skill-name}
    - Repo-fit: new skill (confirmed) vs. alternative (if applicable)
  → User confirms or adjusts
  → One message, one confirmation

Step 4: Generate Skill Implementation Packet
  → Builder produces the full packet in one output:

    ### Decision
    [Recommendation + Why Gate evidence if applicable]

    ### Classification
    [Type, phase, category, directory name]

    ### Overlap Analysis
    [What was found, why this skill is still needed]

    ### Draft Frontmatter
    ```yaml
    [Complete, valid YAML block]
    ```

    ### Draft SKILL.md
    [Full outline with section headers, instruction steps, output contract,
    quality checklist. Writing lens guidance is woven into the instructions
    as inline notes — e.g., "This skill is process-heavy; make instructions
    step-by-step with numbered sequences."]

    ### Draft TEMPLATE.md Sections
    [Section headers with guidance comments for each]

    ### EXAMPLE.md Scenario
    [Specific scenario description + key sections filled in to demonstrate
    what a completed output looks like]

    ### Draft Command
    ```yaml
    [Command frontmatter]
    ```

    ### AGENTS.md Entry
    [Exact text to add]

    ### Validation Checklist
    - [ ] Frontmatter: all required fields present
    - [ ] Name matches directory
    - [ ] Phase/classification consistency
    - [ ] Description: 20-100 words
    - [ ] TEMPLATE.md: ≥3 ## sections with guidance comments
    - [ ] EXAMPLE.md: fills all template sections
    - [ ] Output contract present in SKILL.md
    - [ ] Quality checklist present in SKILL.md
    - [ ] Command file references correct skill path
    - [ ] AGENTS.md entry uses correct path format

  → CHECKPOINT: "Review the packet above. Any changes before I write the files?"

Step 5: Write Files (on confirmation)
  → Creates:
    - skills/{name}/SKILL.md (from Draft SKILL.md)
    - skills/{name}/references/TEMPLATE.md (from Draft TEMPLATE.md Sections)
    - skills/{name}/references/EXAMPLE.md (from EXAMPLE.md Scenario)
    - commands/{command-name}.md (from Draft Command)
  → Updates:
    - AGENTS.md (appends entry)
  → Reports: "Created 4 files, updated AGENTS.md. Run CI to validate."
```

### Interactions required

4-5 steps, but Steps 2 and 3 often merge naturally in conversation.

Typical conversation: **5-7 messages** from the user.

### How it adapts

| Scenario | What happens |
|----------|-------------|
| **Clear idea, no overlap** | Steps 2-3 are fast (one message each), packet generates immediately. ~4 interactions. |
| **Clear idea, some overlap** | Why Gate triggers inline at Step 2, adds one interaction. ~5 interactions. |
| **Ambiguous idea** | Step 1 response is vague → builder asks a follow-up question before proceeding. ~6 interactions. |
| **Bad idea (high overlap)** | Kill gate fires at Step 2. Builder recommends alternative. ~3 interactions (saved the user time). |
| **Complex utility skill** | Classification discussion at Step 3 is longer (utility vs foundation, naming considerations). ~6-7 interactions. |

### Strengths

| Strength | Why it matters |
|----------|---------------|
| **Kill gate preserved** | Gap analysis + Why Gate always runs — the highest-value part of the builder |
| **Writing lens is woven in, not forced** | Zone-aware guidance appears as inline notes in the packet, not as a separate step |
| **Adaptive conversation length** | Simple ideas get 4 interactions; complex ones get 6-7. No wasted steps. |
| **Repo-fit is integrated** | Classification step naturally surfaces "is this really a new skill?" without a separate assessment |
| **Validation is built into the packet** | The checklist at the end IS the validation step — no separate interaction needed |
| **Review checkpoint before file writing** | User sees the complete packet and can request changes before anything touches disk |
| **Educational without being didactic** | The packet itself teaches conventions (the frontmatter is correct, the template has guidance comments, the checklist explains the rules) |

### Weaknesses

| Weakness | Impact |
|----------|--------|
| **Writing lens is less prominent** | Inline notes are easier to miss than a dedicated step. Users may not internalize K/P/C/W thinking. |
| **SKILL.md is moderately complex** | More instructions than Approach B, less than Approach A. ~220-280 lines. |
| **"Adaptive" is harder to test** | The branching behavior means more paths to validate |
| **Gap analysis quality depends on the skill library table** | The builder needs an up-to-date reference of all existing skills — if the table in SKILL.md is stale, gap analysis is wrong |

### Mitigations for weaknesses

| Weakness | Mitigation |
|----------|-----------|
| Writing lens less prominent | Add a "Content Type Notes" subsection in the Draft SKILL.md section of the packet. It's visible but not a gate. |
| SKILL.md complexity | Use the same pattern as `foundation-persona`: numbered steps with clear branching logic. Well-proven pattern. |
| Adaptive harder to test | The main path (no overlap, clear classification) is the most common. The kill gate path is the second most common. Together they cover 90%+ of uses. |
| Stale skill library table | Include a note: "Check `skills/` directory for the most current inventory. The table below was current as of v2.6.1." The builder should also instruct the agent to scan the actual directory, not just read the table. |

### Best for

- Mixed audience: maintainer + community contributors
- Both interactive (Claude) and semi-autonomous (Codex with human confirmation) execution
- Skills of any complexity level

### SKILL.md size estimate

~220-280 lines of instructions

---

## Comparison Matrix

| Dimension | Approach A (Linear) | Approach B (Fast-Track) | Approach C (Adaptive) |
|-----------|--------------------|-----------------------|----------------------|
| Steps | 7 + file write | 3 + file write | 4-5 + file write |
| User messages | 8-10 | 4-5 | 5-7 |
| Kill gate | Steps 1, 2, 3 (three chances) | Step 1 (one chance) | Step 2 (one chance, inline Why Gate) |
| Writing lens | Dedicated step | Absent | Inline in packet |
| Repo-fit assessment | Dedicated step | Absent | Combined with classification |
| Validation | Dedicated step | Absent (implicit) | Built into packet checklist |
| SKILL.md size | ~300-400 lines | ~150-200 lines | ~220-280 lines |
| Best audience | New contributors, complex skills | Experienced users, agent execution | Mixed audience |
| Educational value | High | Low | Medium-High |
| Speed | Slow | Fast | Moderate |
| Reliability | Highest (most checkpoints) | Lower (fewer checkpoints) | High (key checkpoints preserved) |

---

## Recommendation

**Approach C (Adaptive Depth)** balances thoroughness with usability. It preserves the two features that matter most (kill gate and packet generation) while eliminating the steps that add friction without proportional value (separate repo-fit assessment, separate writing lens, separate validation).

The key insight: **the kill gate is a safety feature, the writing lens is a quality feature, and the validation checklist is a correctness feature**. Only the safety feature needs to be a gate (blocking). The quality and correctness features work just as well as inline content in the packet.

If the maintainer later wants to add revise/audit modes (v2 scope), Approach C's structure accommodates them naturally — revise mode skips Steps 1-3 and goes straight to packet editing, audit mode runs only the validation checklist against existing skills.
