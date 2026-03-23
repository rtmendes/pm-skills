# [F-10] PM Skill Validate
Status: Planned
Milestone: TBD
Issue: #121
Agent: Claude Opus 4.6

## Scope

Create `utility-pm-skill-validate` — a utility skill that audits an existing pm-skills skill against current conventions, CI rules, and quality criteria. Produces a validation report with pass/fail on structural correctness plus quality assessment (writing lens, output contract completeness, example coverage).

## Relationship

Part of the PM Skill lifecycle: Create (F-05) → **Validate (F-10)** → Iterate (F-11)

## Key Decisions

- Separate skill from the builder (one skill, one job) — not a mode of pm-skill-builder
- Goes deeper than CI: CI checks structure, this checks quality
- Named `/pm-skill-validate`

## Dependencies

- F-05 (#113) — establishes the conventions the validator checks against
- M-12 (#112) — CI rules that the validator mirrors at a deeper level

## Artifacts Produced

- `skills/utility-pm-skill-validate/SKILL.md`
- `skills/utility-pm-skill-validate/references/TEMPLATE.md`
- `skills/utility-pm-skill-validate/references/EXAMPLE.md`
- `commands/pm-skill-validate.md`
- AGENTS.md entry

## PRs

- TBD
