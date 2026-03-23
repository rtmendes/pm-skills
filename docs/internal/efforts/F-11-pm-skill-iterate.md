# [F-11] PM Skill Iterate
Status: Planned
Milestone: TBD
Issue: #122
Agent: Claude Opus 4.6

## Scope

Create `utility-pm-skill-iterate` — a utility skill that takes feedback, learnings, or convention changes and applies them to improve an existing pm-skills skill. Reads the current skill files, applies targeted improvements, and produces an updated skill package with a change summary documenting what changed and why.

## Relationship

Part of the PM Skill lifecycle: Create (F-05) → Validate (F-10) → **Iterate (F-11)**

## Key Decisions

- Separate skill from the builder and validator (one skill, one job)
- Input can be: validation report (from F-10), user feedback, convention changes, or general improvement request
- Named `/pm-skill-iterate`

## Dependencies

- F-05 (#113) — establishes the skill structure
- F-10 (#121) — validation report feeds into iteration

## Artifacts Produced

- `skills/utility-pm-skill-iterate/SKILL.md`
- `skills/utility-pm-skill-iterate/references/TEMPLATE.md`
- `skills/utility-pm-skill-iterate/references/EXAMPLE.md`
- `commands/pm-skill-iterate.md`
- AGENTS.md entry

## PRs

- TBD
