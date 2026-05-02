# v2.12.0 Release Plan: OKR Skills Launch

Status: Release prep complete; pending tag
Owner: Maintainers
Type: Feature release (minor)
Stub created: 2026-04-18 (during v2.11.0 completion)
Theme pivoted: 2026-05-01 (from sample-automation to OKR launch)

## Release Theme

Ship the first two skills of the OKR Skills set: `foundation-okr-writer` and `measure-okr-grader`. The original v2.12.0 stub theme (sample-automation + meeting-ecosystem continuation) has been pushed to v2.13.0+ because that work is gated on real-world meeting-skills usage feedback that has not yet arrived. The OKR work has momentum from the 2026-04-29 strategy session and a complete OKR-doctrine knowledge base.

## Status Snapshot (2026-05-01, evening)

| Item | Status |
|---|---|
| `foundation-okr-writer` skill canonical | Shipped (commit `6bcfba1`) |
| `foundation-okr-writer` 3 thread samples | Shipped (storevine, brainshelf, workbench) |
| `foundation-okr-writer` AGENTS.md + mkdocs.yml + commands ref | Updated |
| `foundation-okr-writer` Codex adversarial review | 2 medium findings resolved (generator-bug fix, nonexistent-command redirect rephrased) |
| `measure-okr-grader` skill | Shipped (commit `a5c000f`) |
| `measure-okr-grader` 3 thread samples | Shipped (storevine, brainshelf, workbench) |
| `measure-okr-grader` Phase 0 Adversarial Review Loop | 3 rounds; converged on 0 findings round 3 |
| `measure-okr-grader` cross-reference cleanup in writer | Applied (line 45 redirect, line 184 active reference) |
| pm-skill-builder packet format | Simplified (silently bundled) |
| Legacy effort docs | Reorganized; old format removed from tracked tree |
| Sprint-skill backlog stubs (F-41, F-42) | Added |
| CHANGELOG.md v2.12.0 entry | Authored |
| skills-manifest.yaml | Authored |
| Release_v2.12.0.md | Authored |
| README.md skill counts and version badge | Updated to 40 / 2.12.0 |
| .claude-plugin/plugin.json + marketplace.json | Updated to 40 / 2.12.0 |
| README_SAMPLES.md | Updated (126 / 40) |
| Em-dash sweep across docs/skills/ mirror | Committed |
| docs/internal/audit-ci/ → docs/internal/audit/_archived/ rename | Committed |
| Pre-release checklist | Executed (full CI clean, Phase 0 review converged, em-dash zero in tracked files) |
| Codex adversarial review on full release diff | Pending |
| /ultrareview on full release | Pending (user-triggered) |
| Tag and push | Pending |

## Major Deliverables

### foundation-okr-writer (shipped to main, uncommitted)

- `skills/foundation-okr-writer/SKILL.md` (184 lines)
- `skills/foundation-okr-writer/references/TEMPLATE.md` (103 lines)
- `skills/foundation-okr-writer/references/EXAMPLE.md` (264 lines)
- `commands/okr-writer.md`
- 3 thread samples in `library/skill-output-samples/foundation-okr-writer/`
- AGENTS.md entry plus Commands table row
- mkdocs.yml nav entry
- Auto-regenerated `docs/skills/foundation/foundation-okr-writer.md`
- Auto-regenerated `docs/reference/commands.md`

Skill highlights:

- Five entry modes (Guided default, One-Shot via `--oneshot`, Sustained Coach, Audit Only, Rewrite)
- Empowered-team diagnostic with conditional Disclosure section in output
- 16-item anti-pattern catalog
- Constraint Rules block (MUST / MUST NOT)
- Quality Audit Rubric

### measure-okr-grader (pending)

Same shape as the writer. Strategy doc covers the design at `docs/internal/skills-ideas/okr-writer/_LOCAL/definition/approach_opus-4.7.md` (gitignored). Storevine draft sample exists at `_LOCAL/definition/sample_measure-okr-grader_storevine_campaigns-q3-draft.md`.

Estimated time: 2 to 3 hours mirroring the writer's promotion sequence.

### Other deliverables

- F-41 (design-sprint-skills) and F-42 (foundation-sprint-skills) effort stubs registered in backlog (post-v2.12.0)

## Deferred to v2.13.0 or later

The original v2.12.0 stub (2026-04-18) queued 8 efforts under a sample-automation theme. All 8 are deferred:

| ID | Name | New target |
|---|---|---|
| F-29 | Meeting Lifecycle Workflow | v2.13.0 (gated on meeting-skills usage feedback) |
| F-30 | Family Adoption Guide | v2.13.0 (gated on at least one team's adoption experience) |
| F-31 | pm-skill-validate Family + Sample Awareness | v2.13.0 |
| F-32 | pm-skill-builder Sample Generation | v2.13.0 (now beneficially smaller after the builder packet simplification) |
| F-33 | check-sample-standards CI Script | v2.13.0 |
| F-34 | THREAD_PROFILES.md Reference | v2.13.0 (unblocks F-32) |
| F-35 | pm-skill-iterate Sample Regeneration | v2.13.0 |
| F-36 | Generic Skill-Family-Registration Validator | v2.13.0 |

The deferral is non-controversial: F-29 and F-30 were always time-gated on real-world signal; F-31 to F-35 form an internally-consistent slate that is better shipped together than sliced; F-36 is infrastructure-prep that is not blocking any current effort.

## Decisions

| Decision | Choice | Rationale |
|---|---|---|
| **v2.12.0 theme** | OKR Skills Launch | Two locked decisions: ship the writer plus grader pair; defer sample-automation slate. Approach B confirmed in 2026-04-30 strategy session |
| **Grader phase placement** | `measure` | Pattern-matches `measure-experiment-results`; iterate skills are general team-process not OKR-specific |
| **Output format** | Markdown only | JSON deferred to family-contract maturity |
| **Empowered-team handling** | Diagnose, do not refuse | Adjust framing via Disclosure section when feature-team signals are present |
| **Coaching modes** | Five named modes, Guided default, explicit `--oneshot` flag | Decision in 2026-04-30 strategy session |
| **Sample thread continuity** | Locked in as design principle | Storevine Campaigns thread now spans `measure-experiment-results`, `foundation-okr-writer`, and (planned) `measure-okr-grader` |
| **OKR family contract** | Defer to v2.13.0 | Two skills do not yet justify a formal contract; meeting-skills-family precedent had 5 |
| **CHANGELOG narrative** | OKR launch only | Internal builder-cleanup work bundled silently per design |

## CI That Applies

| Workflow | Checks | Notes |
|---|---|---|
| `lint-skills-frontmatter` | Includes `foundation-okr-writer` after promotion | Must pass |
| `validate-commands` | New `okr-writer.md` to `skills/foundation-okr-writer/SKILL.md` | Must pass |
| `validate-agents-md` | 39 skill paths after writer ships, 40 after grader | Must pass |
| `validate-skills-manifest` | v2.12.0 manifest with new skill entries | Must pass before tag |
| `validate-skill-history` | No HISTORY.md required for first-version skills | Must pass |
| `check-count-consistency` | Counts updated for the new skill family | Must pass |

## Pre-release Checklist (not yet executed)

Per the v2.11.0 codified Phase 0 Adversarial Review Loop:

- [ ] Em-dash sweep (zero expected; running for defense in depth)
- [ ] Generator reruns (`generate-skill-pages.py`, `generate-workflow-pages.py`, `generate-showcase.py`)
- [ ] Full CI suite passes
- [ ] Live skills CLI dry-run discovers all 40 skills
- [ ] Codex adversarial review on the writer (already done; 2 findings resolved 2026-05-01)
- [ ] Codex adversarial review on the grader (after build)
- [ ] Codex adversarial review on the family pair (cross-skill consistency)
- [ ] CHANGELOG.md v2.12.0 entry authored
- [ ] `docs/releases/Release_v2.12.0.md` authored
- [ ] `docs/internal/release-plans/v2.12.0/skills-manifest.yaml` authored
- [ ] Version bumps: README badge, `.claude-plugin/plugin.json`, `marketplace.json`
- [ ] Final commit with all release artifacts
- [ ] Tag, push, GitHub release polish, live verification

## MCP Impact

| Question | Answer |
|---|---|
| New MCP tools needed? | No. MCP server frozen per M-22 (v2.11.0 decision) |
| Separate MCP release required? | No |
| Skill count drift relative to MCP | MCP at 28; repo will be at 40 after v2.12.0; gap widens but unfreeze still gated on team adoption demand |

## Open Questions

1. **Grader build sequencing**: should the grader build happen before or after the v2.12.0 prep commits land? Recommendation: commits first (writer launch as discrete diff), then grader. This is the path being executed at time of writing.
2. **Family contract timing**: contract document at `docs/reference/skill-families/okr-skills-contract.md` is deferred per Decisions table. Revisit when grader ships.
3. **Cross-skill cross-references**: should `define-hypothesis`, `define-opportunity-tree`, `iterate-retrospective` mention `/okr-writer` and `/okr-grader` for discoverability? Optional polish; not blocking.
4. **Tag timing**: target tag date open. Suggested no earlier than 5 business days after grader ships, to allow real-world testing of the writer in the interim.

## Related

- v2.11.0 release plan: [`../v2.11.0/plan_v2.11.0.md`](../v2.11.0/plan_v2.11.0.md)
- Pre-release checklist template: [`../v2.11.0/plan_v2.11_pre-release-checklist.md`](../v2.11.0/plan_v2.11_pre-release-checklist.md)
- Codex review precedent: [`../v2.11.0/plan_v2.11_codex-review.md`](../v2.11.0/plan_v2.11_codex-review.md)
- OKR strategy doc (gitignored): `docs/internal/skills-ideas/okr-writer/_LOCAL/definition/approach_opus-4.7.md`
- OKR draft samples (gitignored): `docs/internal/skills-ideas/okr-writer/_LOCAL/definition/sample_*-q3-draft.md`
- Backlog canonical: [`../../backlog-canonical.md`](../../backlog-canonical.md)
- F-41 design-sprint-skills: [`../../efforts/F-41-design-sprint-skills.md`](../../efforts/F-41-design-sprint-skills.md)
- F-42 foundation-sprint-skills: [`../../efforts/F-42-foundation-sprint-skills.md`](../../efforts/F-42-foundation-sprint-skills.md)

## Change Log

| Date | Change |
|---|---|
| 2026-04-18 | Stub created at end of v2.11.0 completion session; original theme: sample-automation + meeting-ecosystem (8 efforts F-29 to F-36) |
| 2026-04-18 | F-36 added post-v2.11.0 tag (CI audit gap G2) |
| 2026-05-01 | Theme pivoted from sample-automation to OKR Skills Launch. Original 8 efforts deferred to v2.13.0+. `foundation-okr-writer` shipped to main (uncommitted). `measure-okr-grader` pending. F-41 and F-42 stubs added to backlog. Quiet pm-skill-builder packet-format simplification bundled. |
