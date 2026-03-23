# F-05 PM Skill Builder: Codex Design Review

> **Date**: 2026-03-22
> **Reviewer**: Codex 5.4
> **Document under review**: `design_pm-skill-builder.md` (same directory)
> **Effort brief**: `docs/internal/efforts/F-05-pm-skill-builder.md`
> **Issue**: #113

---

## Review Instructions

Review the design document at `docs/internal/efforts/F-05-pm-skill-builder/design_pm-skill-builder.md` against the effort brief, repo conventions, and practical executability.

### What to evaluate

#### 1. SKILL.md Structure (Section 1)
- Is the frontmatter valid against the repo's linter rules (`scripts/lint-skills-frontmatter.sh`)?
- Are the 7 instruction steps clear enough for an AI agent to follow without ambiguity?
- Is the Current Library Reference table accurate against the actual `skills/` directory?
- Does the output contract define exactly what the builder must produce?
- Is the quality checklist complete — does it cover everything the enhanced CI (M-12) validates?

#### 2. TEMPLATE.md / Packet Format (Section 2)
- Are the 13 packet sections complete? Is anything missing that would be needed to create a skill?
- Is the zone distribution table (K/P/C/W) practical or too abstract for contributors?
- Is the validation checklist aligned with the actual CI rules in `scripts/lint-skills-frontmatter.sh`?
- Would a contributor be able to follow the Next Steps section without additional guidance?

#### 3. Command File (Section 3)
- Is the command frontmatter valid against existing command patterns in `commands/*.md`?
- Is the single optional `idea` argument the right UX, or should there be a `mode` argument for future extensibility?

#### 4. Sample Outputs (Section 4)
- Are the 3 thread scenarios realistic and differentiated enough?
- Do they cover the key builder paths: happy path, why-gate-triggered, and kill-gate-fired?
- Is anything missing — e.g., a foundation or utility skill scenario?

#### 5. Staging Area Design
- Is `library/pm-skill-builder/{skill-name}/` the right location?
- Should the PACKET.md format include any additional metadata (e.g., builder version, creation timestamp)?
- Is the promotion flow (staging → canonical locations) clear and correct?

#### 6. Cross-Document Consistency
- Does the design align with the effort brief (`F-05-pm-skill-builder.md`)?
- Does it align with the backlog spec in `04_next-efforts.md` Effort 2?
- Are there any contradictions between the design doc, effort brief, and approaches doc?

#### 7. Practical Executability
- Could an agent (Claude or Codex) implement this design without needing to ask clarifying questions?
- Are there any ambiguities that would cause two agents to implement it differently?
- What's the estimated implementation effort based on this design?

#### 8. What did we miss?
After the guided checks above: what problems, gaps, or improvements exist that this review prompt didn't anticipate?

### Ground Truth References

| Claim | How to verify |
|-------|--------------|
| 26 skills listed in library table | `ls skills/` (should be 26 with Codex's new deliver-acceptance-criteria) |
| Frontmatter schema | `scripts/lint-skills-frontmatter.sh` defines valid fields |
| Command format | Compare against any file in `commands/*.md` |
| CI validation rules | `scripts/lint-skills-frontmatter.sh`, `scripts/validate-agents-md.sh`, `scripts/check-mcp-impact.sh` |
| Staging area location | `library/` directory exists; `library/pm-skill-builder/` would be new |
| AGENTS.md entry format | Read `AGENTS.md` for existing entry patterns |

### Review Format

Structure your review as:

1. **Section-by-section assessment** — for each of the 4 design sections
2. **Cross-document consistency** — any misalignment
3. **Executability assessment** — could this be built as-is?
4. **Recommended changes** — prioritized list
5. **What we missed** — anything the prompt didn't anticipate
6. **Overall verdict** — approve / approve with changes / needs revision

---

## Codex Review

### 1. Section-by-section assessment

#### Section 1: SKILL.md Structure

The overall structure is strong. The 7-step flow is understandable, the kill gate is well-motivated, and the Current Library Reference table is mostly accurate against the current `skills/` directory: 25 domain skills, 1 foundation skill, and the new `deliver-acceptance-criteria` entry fit the current working tree.

The main blocking issue is the proposed frontmatter. The sample uses:

```yaml
description: >-
  ...
```

That does not pass the repo's current linter. `scripts/lint-skills-frontmatter.sh` expects `description:` to resolve from a single-line value and will count `>-` as a one-word description. So the design currently claims validity against the linter, but the example frontmatter would fail it.

The instruction steps are mostly clear enough to implement, but there are still a few places where two agents could make different choices:

- Step 4 says to mirror exemplar structure, while Step 5 says to generate full draft content. There is not yet a precise rule for when the builder should copy an exemplar pattern versus intentionally diverge from it.
- Step 2 says "check ALL existing skills for overlap" and also use the Current Library Reference table. That is good, but the note "current as of v2.6.1" is already stale because the table includes `deliver-acceptance-criteria`, which is newer than the published `v2.6.1` baseline.

The Output Contract is directionally good, but it assumes that writing permanent staging artifacts under `library/` is acceptable. That is not yet true operationally because `library/` is part of the shipped release artifact set.

The Quality Checklist is solid as a quality bar, but it is not a 1:1 reflection of enhanced CI:

- It correctly covers description length, TEMPLATE header count, command path validity, and AGENTS path format.
- It does **not** explicitly cover `updated`, `license`, exactly one root `version`, or the prohibition on `metadata.version`.
- It includes checks that are valuable but not currently enforced by CI, such as Output Contract presence and Quality Checklist presence in the drafted skill.

#### Section 2: TEMPLATE.md / Packet Format

The 13 packet sections are close to complete. The packet includes the right big pieces: decision, classification, overlap analysis, draft content, AGENTS entry, and validation.

The K/P/C/W zone distribution is usable as advisory guidance, but it needs one more rule to be practically executable: either the weights must sum to 100, or they should be explicitly treated as approximate signals rather than a scored model. As written, different agents will fill it differently.

The largest structural mismatch in this section is the AGENTS entry format. The proposed block:

```markdown
### {Skill Name}
- **Skill**: `skills/{directory-name}/SKILL.md`
- **Command**: `/{command-name}`
- **Description**: {description}
```

does not match the repo's actual AGENTS format. The current validator expects the existing pattern:

- `#### {name}`
- `**Path:** \`skills/{directory-name}/SKILL.md\``
- blank line
- description paragraph

If implemented as written, the builder would generate output that fails `validate-agents-md`.

The Draft Command section has a similar problem. The proposed command frontmatter introduces `name`, `arguments`, and `skill_file`, but the current repo command pattern is much simpler: existing files in `commands/*.md` use only a `description:` frontmatter block plus prose instructions and a literal skill path in the body. This is not just stylistic drift; it means the builder would be teaching contributors a command format that the repo does not currently use.

The Next Steps section is close, but it should explicitly include:

- `validate-commands`
- `validate-agents-md`
- clarification on whether staging artifacts are tracked, local-only, or promotion candidates

#### Section 3: Command File

The UX intent is good. A single optional `idea` concept is enough for v1 if validate/iterate remain separate future skills.

The concrete format is the issue:

- The proposed command frontmatter does not match existing command patterns.
- The body is directionally correct, but it should be reshaped into the repo's normal command style rather than a richer schema.

So the answer here is: the optional `idea` argument is the right product choice, but it should be expressed in the prose body, not as a new command-file schema. A `mode` argument is not needed if the design truly externalizes validate and iterate into F-10/F-11.

#### Section 4: Sample Outputs

Thread 1 and Thread 3 are good. They cover:

- a straightforward happy path
- a kill-gate rejection

Thread 2 is the weakest of the three. The proposed "cross-functional meeting synthesis" example does not read like a clean utility-skill case. It looks closer to:

- a domain skill
- or a bundle / overlap problem

That weakens it as the showcase for the utility classification. Since the builder explicitly supports all three classifications, the sample set is missing at least one clearly valid foundation or clearly valid utility case.

### 2. Cross-document consistency

The design aligns reasonably well with the **current effort brief** in `docs/internal/efforts/F-05-pm-skill-builder.md`. In particular, it matches the newer brief on:

- `/pm-skill-builder` naming
- create-only v1 scope
- staging + promotion flow
- exemplar-driven drafting

It does **not** align cleanly with `docs/internal/_working/distilled/04_next-efforts.md` Effort 2 in several places:

- `04_next-efforts.md` still describes `/skill-builder`, not `/pm-skill-builder`.
- `04_next-efforts.md` still frames revise/audit as command modes, while this design externalizes them into separate future skills (`pm-skill-validate`, `pm-skill-iterate`).
- The current design expands scope beyond the earlier backlog spec by adding a permanent PACKET.md design record, a staging area, and sample-output threads.

The approaches doc is also now partially stale relative to the repo:

- it still says M-12 is "running in parallel"
- it still anchors inventory language to `v2.6.1`

Those are not fatal, but they make the design surface feel less canonical than it should.

### 3. Executability assessment

This is **not** buildable as-is without interpretation. The blockers are concrete:

1. The frontmatter example would fail the current linter.
2. The AGENTS entry format would fail the current AGENTS validator.
3. The command file format does not match existing command conventions.
4. The staging location under `library/pm-skill-builder/` conflicts with current release packaging because `scripts/build-release.sh` ships the full `library/` tree.

Once those are corrected, the rest is implementable. The design direction itself is sound. After revision, I would estimate roughly **1.5-2.5 days** to implement and verify the skill, command, references, staging behavior, and sample outputs.

### 4. Recommended changes

1. Change the SKILL.md frontmatter example to a single-line `description:` value, or explicitly update the linter first if folded YAML descriptions are intended.
2. Replace the AGENTS entry format in the packet with the repo's actual `####` + `**Path:**` + description pattern.
3. Rewrite the command design to follow current `commands/*.md` conventions instead of introducing a new frontmatter schema.
4. Move staging out of `library/` unless you intentionally want generated packets and draft artifacts to ship inside release ZIPs.
5. Split the validation guidance into:
   - **CI validation** (exactly what the repo enforces)
   - **quality checks** (stronger non-blocking guidance like Output Contract presence)
6. Replace or reclassify Thread 2 so the sample set includes a clearly valid utility or foundation case.
7. Define how Quality Forecast weights work. If they should total 100, say so explicitly.
8. Reconcile the design doc, effort brief, and `04_next-efforts.md` so there is one canonical answer on command naming and the create/validate/iterate model.

### 5. What we missed

The prompt did not call out a few important repo-level constraints:

- `library/` is already treated as shipped content, not a neutral scratch area.
- The validator surface now includes AGENTS sync and command validation, not just frontmatter rules.
- The Current Library Reference needs to distinguish between published baseline and current working-tree inventory if it is going to live in a tracked design artifact.
- If PACKET.md is kept as a permanent design record, it likely needs promotion metadata such as:
  - promoted by
  - promoted at
  - canonical paths created
  - related issue / PR link

### 6. Overall verdict

**Needs revision**

The core design is good: adaptive depth, a real kill gate, exemplar-driven drafting, and packet-first output are all strong choices. But the current draft still has several concrete mismatches with the repo's actual validators, command conventions, AGENTS format, and release-packaging behavior. Fix those first, then this becomes a solid implementation spec rather than a high-quality but still unsafe design.

---

## Part 3: Claude Response

> **Date**: 2026-03-22
> **Reviewer**: Claude Opus 4.6 (1M context)
> **Method**: Ground-truthed every finding against actual repo files before responding

### Assessment: All 8 findings confirmed

Every finding was verified against the repo's actual files. Codex's review is accurate and thorough. The "Needs revision" verdict is correct — the design direction is sound but the implementation details would produce files that fail CI.

### Finding-by-Finding Response

#### 1. Frontmatter `>-` fails linter — CONFIRMED, BLOCKING

**Codex's claim**: The `>-` multiline YAML description won't pass the linter.

**Verification**: Read `scripts/lint-skills-frontmatter.sh` lines 8-10 and the `frontmatter_value` function. It uses `sed -n "s/^${key}:[[:space:]]*//p" | head -1` — this captures only the text after `description:` on the same line. For `>-`, it would capture the literal string `>-`, which is 1 word, failing the 20-100 word check.

**Existing pattern**: Both `deliver-prd` and `foundation-persona` use single-line descriptions (34 and 27 words respectively). No existing skill uses multiline YAML.

**Action**: Rewrite to single-line description. Target ~35-45 words to match existing utility/foundation pattern.

#### 2. AGENTS.md entry format wrong — CONFIRMED, BLOCKING

**Codex's claim**: The design proposes `### {Name}` + `- **Skill:**` + `- **Command:**` + `- **Description:**` but the repo uses a different format.

**Verification**: Read `AGENTS.md`. Actual format:
```markdown
#### {skill-name}
**Path:** `skills/{phase}-{skill-name}/SKILL.md`

{1-2 sentence description}

---
```

Key differences: level-4 header (not level-3), `**Path:**` (not `**Skill:**`), description as a paragraph (not a list item), `---` separator between entries, no `**Command:**` field.

**Action**: Replace the AGENTS.md Entry section in TEMPLATE.md with the actual repo pattern. The builder must generate entries that pass `validate-agents-md.sh`.

#### 3. Command frontmatter doesn't match conventions — CONFIRMED, BLOCKING

**Codex's claim**: The design introduces `name`, `arguments`, and `skill_file` fields that don't exist in current commands.

**Verification**: Read `commands/hypothesis.md`, `commands/persona.md`, `commands/acceptance-criteria.md`. All use:
```yaml
---
description: {one-line description}
---
```
Body is instructional prose ending with `Context from user: $ARGUMENTS`. No `name`, `arguments`, or `skill_file` fields anywhere.

**Action**: Rewrite the command design to match exactly. The optional `idea` argument is still the right UX choice — it just gets handled via `$ARGUMENTS` in the prose body, not via a frontmatter schema.

#### 4. Staging area under `library/` conflicts with release packaging — CONFIRMED, BLOCKING

**Codex's claim**: `library/` is tracked and ships in releases, so draft artifacts would be included.

**Verification**: `library/` exists, is not gitignored, and contains `skill-output-samples/` with tracked content. Draft PACKET.md files and in-progress skill files would ship in release ZIPs.

**Action**: Move staging to `_staging/pm-skill-builder/{skill-name}/`. The `_staging/` prefix follows the existing convention of underscore-prefixed directories for non-shipped content (like `_bundles/`, `_NOTES/`). Add `_staging/` to `.gitignore` so drafts never ship. PACKET.md still serves as permanent design record but lives in the staging area until promotion.

**Alternative**: If we want PACKET.md to be a permanent *tracked* record, create `docs/internal/skill-packets/{skill-name}/PACKET.md` — internal docs are gitignored and won't ship. The staging area for draft files stays separate.

**Decision needed from user**: Should PACKET.md be tracked (design record) or gitignored (scratch artifact)?

#### 5. Split validation into CI-enforced vs quality-advisory — CONFIRMED, NON-BLOCKING

**Codex's claim**: The Quality Checklist conflates enforced CI rules with aspirational quality checks.

**Verification**: CI enforces: description 20-100 words, TEMPLATE.md ≥3 `##` headers, AGENTS.md path sync, command path validity. CI does NOT enforce: Output Contract presence, Quality Checklist presence in SKILL.md, example completeness.

**Action**: Split the Validation Checklist in TEMPLATE.md into two sections:
- **CI Validation** (must pass — matches `lint-skills-frontmatter.sh` + `validate-agents-md.sh` + `validate-commands.sh`)
- **Quality Checks** (should pass — builder-enforced but not CI-gated)

Also add the missing CI checks Codex noted: `updated` field present, `license` field present, exactly one root `version`, no `metadata.version`.

#### 6. Thread 2 sample not convincingly utility — CONFIRMED, NON-BLOCKING

**Codex's claim**: The "cross-functional meeting synthesis" example reads like a domain skill or overlap problem, not a clean utility case.

**Verification**: Agreed on inspection. A utility skill operates on the repo, workflow, or other skills — meeting synthesis is a PM activity (domain). The design itself defines utility as "meta-skills, repo tooling" in Step 4.

**Action**: Replace Thread 2 with a genuine utility scenario. Options:
- `utility-pm-skill-validate` preview (validates existing skills against CI + quality bar)
- `utility-skill-migration` (migrates skills between spec versions)
- `utility-template-linter` (checks TEMPLATE.md quality beyond CI minimums)

Recommend: `utility-pm-skill-validate` — it's already F-10 in the backlog, so the sample doubles as early design thinking.

#### 7. K/P/C/W weights need summing rule — CONFIRMED, NON-BLOCKING

**Codex's claim**: Without a rule, different agents will fill the zone distribution differently.

**Action**: Add explicit rule: "Weights must sum to 100. They are approximate guidance signals, not scored metrics. Round to nearest 5." This makes the table deterministic enough to be useful without false precision.

#### 8. Reconcile design doc / effort brief / 04_next-efforts.md — CONFIRMED, NON-BLOCKING

**Codex's claim**: `04_next-efforts.md` still says `/skill-builder` and frames revise/audit as command modes, contradicting the design's `/pm-skill-builder` naming and F-10/F-11 separation.

**Verification**: Confirmed — `04_next-efforts.md` was written before the naming decision and lifecycle separation.

**Action**: Update `04_next-efforts.md` Effort 2 section to reflect:
- `/pm-skill-builder` naming
- Create-only scope (validate/iterate externalized to F-10, F-11)
- Remove `--revise` and `--audit` mode references
- Add note that this section is superseded by the design doc for implementation detail

Also update `approaches_pm-skill-builder.md` to remove "M-12 running in parallel" (it's complete) and the v2.6.1 inventory anchor.

### Action Summary

| # | Finding | Severity | Action | Blocking? |
|---|---------|----------|--------|-----------|
| 1 | `>-` frontmatter | Blocking | Single-line description, ~35-45 words | Yes |
| 2 | AGENTS entry format | Blocking | Use `####` + `**Path:**` + paragraph pattern | Yes |
| 3 | Command schema | Blocking | `description:` only + prose body + `$ARGUMENTS` | Yes |
| 4 | Staging in `library/` | Blocking | Move to `_staging/` (gitignored) — user decides on PACKET.md tracking | Yes |
| 5 | Validation split | Non-blocking | Two sections: CI Validation + Quality Checks | No |
| 6 | Thread 2 sample | Non-blocking | Replace with genuine utility scenario | No |
| 7 | K/P/C/W summing | Non-blocking | "Must sum to 100, round to nearest 5" | No |
| 8 | Doc reconciliation | Non-blocking | Update 04_next-efforts.md + approaches doc | No |

### Verdict Response

Agree with "Needs revision." All 4 blocking issues are format mismatches that would cause generated output to fail CI — these are straightforward fixes that don't change the design direction. The 4 non-blocking issues improve clarity and consistency. Proceeding with all 8 fixes before implementation.
