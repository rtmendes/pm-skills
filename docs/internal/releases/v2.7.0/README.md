# v2.7.0 Internal Release Governance

Status: In progress
Owner: Maintainers
Last updated: 2026-03-22

This directory is the tracked internal release-governance home for the `v2.7.0` release: CI enhancement, release packaging hygiene, a new skill, and PM Skill Builder.

## Release Contents

| Effort | Type | Description | Status | Issue |
|--------|------|-------------|--------|-------|
| M-12 | Infrastructure | CI validation enhancement — extended linter, AGENTS.md sync validator, MCP impact check | Review complete, ready to commit | [#112](https://github.com/product-on-purpose/pm-skills/issues/112) |
| F-06 | New skill | `deliver-acceptance-criteria` — Given/When/Then acceptance criteria skill | Review complete, ready to commit | [#114](https://github.com/product-on-purpose/pm-skills/issues/114) |
| M-16 | Infrastructure | Exclude `docs/internal/**` from the published ZIP while keeping internal governance docs tracked in-repo | Planned | [#123](https://github.com/product-on-purpose/pm-skills/issues/123) |
| F-05 | New skill | PM Skill Builder (`/pm-skill-builder`) — interactive utility skill for creating new PM skills | Design reviewed, implementation pending | [#113](https://github.com/product-on-purpose/pm-skills/issues/113) |

## Release Theme

Infrastructure hardening (M-12) + release packaging hygiene (M-16) + first new skill since v2.6 (F-06) + meta-tooling for skill creation (F-05). This release makes the repo easier to extend, keeps internal governance docs out of user-facing ZIPs, and adds a practical Deliver-phase skill.

## Gating Criteria

- [ ] M-12 committed and CI green
- [ ] F-06 committed and CI green (must pass M-12's enhanced validation)
- [ ] M-16 committed and release ZIP excludes `docs/internal/**` while preserving public docs
- [ ] F-05 design approved and implemented
- [ ] F-05 committed and CI green
- [ ] CHANGELOG.md updated with v2.7.0 section
- [ ] All 27+ skills pass enhanced CI validation
- [ ] Tag `v2.7.0` pushed → release.yml fires → ZIP published

## Commit Order

1. M-12 + F-06 combined commit (F-06 validated by M-12's enhanced CI)
2. M-16 packaging fix commit
3. F-05 implementation commit(s) (after design approval)
4. Release prep commit (CHANGELOG, version bumps if needed)
5. Tag and release

## Canonical Artifacts

1. `docs/internal/releases/v2.7.0/README.md` (this file)
2. `docs/releases/Release_v2.7.0.md` (public release notes — create at tag time)
3. Effort briefs: `M-12`, `M-16`, `F-05`, `F-06` in `docs/internal/efforts/`

## Notes

1. M-12 and F-06 were built by Codex 5.4, reviewed by Claude Opus 4.6.
2. F-05 design was reviewed by Codex, fixes applied by Claude. Implementation is Claude-assigned.
3. One workflow fix applied during review: duplicate steps removed from `validation.yml`.
4. M-16 was created from the F-05 staging/release-packaging review and should land before the final `v2.7.0` cut.
