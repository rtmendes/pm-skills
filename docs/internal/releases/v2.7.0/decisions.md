# v2.7.0 Key Decisions

Status: Accumulating (feed into release notes at tag time)
Last updated: 2026-03-22

This document captures important design and architecture decisions made during v2.7.0 development. These should inform the public release notes and FAQ section.

---

## D-1: PM Skill Builder staging and promotion model

**Decision**: Drafts go to `_staging/pm-skill-builder/{skill-name}/` (gitignored). On approval, only SKILL.md, TEMPLATE.md, EXAMPLE.md, command file, and AGENTS.md entry are promoted. Staging folder is discarded after promotion. No permanent PACKET.md.

**Why**:
- Drafts are scaffolding — they should never ship to users or clutter the repo.
- PACKET.md (design rationale) is maintainer-facing, not part of the skill's public contract.
- Keeping PACKET.md next to shipped skills mixes authoring history with product artifacts and makes every skill directory heavier forever.
- If a specific design rationale is important long-term, capture it intentionally in the issue, PR, or effort brief — don't make every generated skill carry a permanent packet by default.

**Impact**: Skill directories remain clean (SKILL.md + references/ only). The builder is a scaffolding tool, not a documentation generator.

**Related**: F-05 design doc Section 1 (Step 6-7), effort brief output model section.

---

## D-2: Builder naming — `/pm-skill-builder` vs `/agent-skill-builder`

**Decision**: Two separate skills, both in pm-skills repo.
- `/pm-skill-builder` (F-05) — repo-specific, creates skills aligned with pm-skills architecture
- `/agent-skill-builder` (F-09) — general PM capability for creating agent skills in any context

**Why**: Creating agent skills IS a modern PM capability. Both belong in pm-skills. Clear scope separation: one is repo-specific tooling, the other is a transferable PM skill.

**Impact**: No naming collision. F-09 depends on F-05 (same builder patterns, different scope).

---

## D-3: PM Skill lifecycle — three separate skills

**Decision**: Create (F-05), Validate (F-10), Iterate (F-11) are separate skills, not modes of one skill.

**Why**: One skill, one job. Follows the repo's existing pattern where each skill does one thing well. Modes add complexity and make the builder harder to teach.

**Impact**: F-10 and F-11 are backlog items (#121, #122) that depend on F-05.

---

## D-4: CI validation split — enforced vs advisory

**Decision**: The builder's quality checklist distinguishes between CI-enforced checks (must pass `lint-skills-frontmatter.sh`, `validate-agents-md.sh`, `validate-commands.sh`) and quality-advisory checks (builder-enforced but not CI-gated, like example completeness and output contract presence).

**Why**: Contributors need to know which checks will fail CI vs which are best-practice guidance. Conflating them causes confusion ("CI passed but the skill is low quality" or "why did CI fail on something the docs say is optional?").

**Impact**: SKILL.md Quality Checklist has two tiers. CI checks are the hard gate; quality checks are the builder's additional standard.

---

## D-5: Exclude `docs/internal/**` from release ZIP (M-16)

**Decision**: Modify `build-release.sh` to exclude `docs/internal/**` from the published ZIP artifact while keeping internal governance docs tracked in the repo.

**Why**: Internal release governance, effort briefs, and planning documents are maintainer-facing. Users downloading the ZIP should get skills, commands, bundles, and public docs — not internal planning artifacts.

**Impact**: Reduces ZIP size. Internal docs remain in the repo for maintainers but don't ship to users. This also resolves any future concern about staging area content accidentally shipping.

**Related**: M-16 effort brief, GitHub issue #123.

---

## D-6: Efforts are atoms, releases are molecules

**Decision**: Don't assign release numbers at backlog time. Assign effort IDs, then group into releases at release-planning time.

**Why**: Effort scope and release scope serve different purposes. An effort is a unit of work; a release is a bundle of user-visible changes. Coupling them too early constrains both.

**Impact**: Backlog uses effort IDs (M-12, F-05, etc.). Release assignment is a separate column added when release planning happens. v2.7.0 is the first release planned this way.

---

## D-7: Agent assignment framework

**Decision**: Each effort is assigned to an agent (Claude, Codex, Human) based on the work characteristics. Labels (`agent:codex`, `agent:claude`, `agent:human`) applied to GitHub issues. Effort briefs carry an `Agent:` field.

**Why**: Different agents have different strengths. Codex excels at well-specified implementation tasks. Claude excels at design judgment and creative content. Humans handle external interactions (marketplace submission, community outreach).

**Impact**: Codex gets execution context comments on its issues (read-first files, patterns, constraints). Claude gets design latitude. Human tasks are flagged as quick wins.

---

## Decisions to add later

- F-05 implementation approach (after implementation plan is finalized)
- Any breaking changes discovered during implementation
- Release packaging changes from M-16
