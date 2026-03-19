# Codex Agent Context

## Status
- Active; last updated: 2026-03-18
- Focus: baseline-cleanup execution in progress from the refreshed Codex worktree on post-`A-11` `main`; `C-1` through `C-3` are complete and Claude guardrail work remains unblocked

## Purpose
Track Codex sessions for pm-skills. Use this file for stable facts and current execution state; use `AGENTS/DECISIONS.md` for cross-agent commitments; use `AGENTS/codex/DECISIONS.md` for agent-local detail; use `AGENTS/codex/SESSION-LOG/` for session summaries.

## Project snapshot
- Repo: pm-skills (Triple Diamond PM skills, commands, docs, bundles, and internal operating docs)
- Latest published release baseline: `v2.6.1` (see `CHANGELOG.md`)
- Shipped inventory baseline:
  - `25` skills total
  - `24` phase-classified skills
  - `1` foundation-classified skill: `foundation-persona`
- Accepted baseline operating model:
  - GitHub issues own backlog and lifecycle state
  - `docs/internal/efforts/**` is the tracked home for durable effort briefs
  - `docs/internal/releases/**` is the tracked home for internal release governance
  - `_NOTES/**` remains local-only working material
  - keep both `AGENTS/claude/` and `AGENTS/codex/` first-class
  - only `.claude-plugin/plugin.json` and `.claude/pm-skills-for-claude.md` are intentionally shipped Claude-facing tracked artifacts

## Current execution snapshot
- Codex execution lane:
  - `C-1` complete: tracked policy docs now point at `docs/internal/efforts/**` and `docs/internal/releases/**`
  - `C-2` complete: canonical `docs/internal/releases/**` home exists; the tracked backlog and legacy release-entry docs now redirect to the accepted model
  - `C-3` complete: Codex continuity and shared cross-agent decisions now reflect the `v2.6.1` baseline and the landed `A-11` effort-tracking state
  - active continuation now runs from refreshed branch `codex-baseline-refresh`, created from current `main` after `A-11`; only the non-conflicting `C-1` through `C-3` tracked changes were re-ported
- Claude execution lane:
  - `A-1` through `A-4` complete
  - `A-11` complete on 2026-03-17: effort tracking infrastructure landed (`docs/internal/efforts/README.md`, `F-02`, `F-03`, standardized `M-10`, issues `#108`, `#109`, `#110`, label `effort`, milestone `v2.7.0`)
  - `A-8` and `A-9` are now unblocked after `C-3`
  - `A-5` remains deferred for later wrap-session work
- Integration note:
  - the older worktree `codex-c1-baseline-policy` is retained only as a pre-refresh snapshot
  - the active branch `codex-baseline-refresh` preserves Claude `A-11` as the source of truth for `docs/internal/efforts/README.md` and `docs/internal/efforts/M-10-skill-sample-outputs-library.md`
  - later `C-6` work must re-read those effort docs before touching release/sample cross-links again

## Operational playbook
- Session hygiene: use `AGENTS/codex/WRAP-SESSION_TEMPLATE.md` and save logs under `AGENTS/codex/SESSION-LOG/`
- Planning docs: place in `AGENTS/codex/PLANNING/` with front matter (see `PLANNING/frontmatter-template.md`)
- Decisions: record cross-agent items in `AGENTS/DECISIONS.md`; keep Codex-local detail in `AGENTS/codex/DECISIONS.md`
- Agent boundary: do not edit `AGENTS/<other-agent>/CONTEXT.md` unless the user explicitly asks
- Continuity rule: re-read tracked `docs/internal/efforts/**` and `docs/internal/releases/**` entry points after any cross-agent structural change before continuing dependent work

## Immediate next steps
1. Hand off `C-3` completion so Claude can run `A-8` and `A-9`.
2. Keep `A-5` deferred; do not pull wrap-session redesign into this lane.
3. After the continuity/guardrail batch settles, resume `C-4`, `C-5`, and `C-6` in order.

## Reference
- Latest baseline handoff: `AGENTS/codex/SESSION-LOG/2026-03-15_wrap-session_baseline-standards-finalization-prep.md`
- Active Codex execution tracker: `_NOTES/baseline-standards/plan_codex/execution_codex-gpt-5.4.md`
- Shared coordinator: `_NOTES/baseline-standards/execution_shared-claude-codex.md`
