# [F-25] Update Release Docs Skill
Status: Idea
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a cross-project utility skill (`/update-release-docs` or similar) that
knows which docs matter for a given repo, checks them for staleness, and
updates them as part of any release or significant change. The skill reads a
per-repo configuration file that defines the critical docs, version sources,
count references, and release artifact templates.

## Problem

Every pm-skills release requires manually remembering to update:
- CHANGELOG.md
- README.md (counts in 5+ places)
- docs/releases/Release_vX.Y.Z.md
- docs/releases/index.md
- skills-manifest.yaml
- 20+ files with hardcoded skill/command/workflow counts
- library/skill-output-samples/README_SAMPLES.md
- AGENTS/claude/CONTEXT.md

This list is different for every repo. A simple project might only need
CHANGELOG + README. The pm-skills repo has 30+ files to check. Without a
systematic approach, the user has to enumerate the artifacts every time
("update readme, changelog, and release notes") or trust that Claude
remembers — which it sometimes doesn't.

The v2.10.0 release required 4 post-tag amendments to catch stale counts
that were missed. The `check-count-consistency` CI helps but only catches
numeric mismatches — it doesn't generate the updates.

## How It Would Work

### Per-repo configuration

A `.release-docs.yaml` (or similar) in the repo root defines:

```yaml
# .release-docs.yaml — tells /update-release-docs what to check/update
version_sources:
  - .claude-plugin/plugin.json:version
  - marketplace.json:plugins[0].version

release_artifacts:
  changelog: CHANGELOG.md
  release_notes: docs/releases/Release_v{version}.md
  release_index: docs/releases/index.md
  skills_manifest: docs/internal/release-plans/v{version}/skills-manifest.yaml

count_references:
  skills:
    count_command: "ls -d skills/*/ | wc -l"
    files:
      - README.md
      - QUICKSTART.md
      - docs/getting-started.md
      - docs/index.md
      - docs/skills/index.md
      - docs/reference/ecosystem.md
      - docs/reference/project-structure.md
      - docs/concepts/agent-skill-anatomy.md
      - AGENTS/claude/CONTEXT.md
      # ... full list
  commands:
    count_command: "ls commands/*.md | wc -l"
    files: [README.md, docs/reference/commands.md, ...]

sample_library:
  readme: library/skill-output-samples/README_SAMPLES.md
  check_coverage: true  # flag skills without samples

generated_pages:
  - script: scripts/generate-skill-pages.py
    output: docs/skills/
  - script: scripts/generate-workflow-pages.py
    output: docs/workflows/
```

### Invocation

```
/update-release-docs              # check all, show what's stale, offer to fix
/update-release-docs --check      # check only, no writes (CI-friendly)
/update-release-docs v2.10.0      # update for a specific version
```

### Flow

1. Read `.release-docs.yaml` from repo root
2. Determine current version from configured sources
3. Check each category:
   - Version sources agree?
   - CHANGELOG has entry for current version?
   - Release notes exist?
   - Release index has row?
   - Count references match actual counts?
   - Sample library covers all skills?
   - Generated pages are fresh?
4. Report findings (pass/stale/missing for each)
5. Offer to fix stale items (with confirmation)
6. Show summary of what was updated

## Where Should This Live?

### Option A: agent-config-toolkit

The skill is cross-project — it works for any repo with a
`.release-docs.yaml`. This makes it a general-purpose tool, not
pm-skills-specific. The config file makes it repo-aware without
hardcoding pm-skills conventions.

**Pros:** Reusable across all projects. Maintains separation of concerns.
**Cons:** Needs the agent-config-toolkit installed alongside pm-skills.

### Option B: pm-skills utility skill

Add it to the pm-skills library as `utility-update-release-docs`.

**Pros:** Ships with pm-skills, immediately available.
**Cons:** Tied to pm-skills conventions. Other repos would need pm-skills
installed just for this one skill.

### Option C: Standalone Claude Code skill (jp-library or ~/.claude/skills/)

A personal skill in the user's skill library.

**Pros:** Available everywhere. No repo dependency.
**Cons:** Not shareable. Not versioned with the project.

**Recommendation:** Option A (agent-config-toolkit) for the skill itself,
with a `.release-docs.yaml` checked into each repo that uses it. The
config file is the repo-specific part; the skill is the reusable engine.

## Key Design Questions

1. **Config format** — YAML? JSON? Something in CLAUDE.md? The config
   needs to be readable by both Claude and potential CI scripts.

2. **How smart should the fixes be?** Just update counts? Or also write
   CHANGELOG entries, generate release notes from git log, update
   skill tables?

3. **CI mode** — Should `--check` be a standalone CI script (like
   `check-count-consistency`) or only work as a Claude skill?

4. **Overlap with existing CI** — `check-count-consistency`,
   `check-workflow-coverage`, and `check-generated-freshness` already
   do parts of this. Should the skill orchestrate them, replace them,
   or complement them?

5. **Per-repo vs convention-based** — Should the skill require a config
   file, or should it also work by convention (detect CHANGELOG, README,
   etc. automatically without config)?

## Relationship to Existing Work

| Existing | What it does | How /update-release-docs relates |
|----------|-------------|--------------------------------|
| `check-count-consistency` (M-20) | Detects stale counts | The skill would use this check AND fix the counts |
| `check-workflow-coverage` (M-20) | Detects missing workflow refs | The skill would use this check AND add missing refs |
| `check-generated-freshness` (M-20) | Detects stale generated pages | The skill would run the generators |
| `validate-version-consistency` | Detects version source mismatch | The skill would bump versions in sync |
| `/wrap-session` | End-of-session docs | Complementary — wrap-session is for session continuity, update-release-docs is for release hygiene |

## Estimated Complexity

Medium-high. The config file design and the "fix" logic (not just
detect, but generate correct updates) are the hard parts. The detection
side is mostly orchestrating existing CI scripts.

## PRs

TBD
