# PM Skills Update Report

> **Update complete.** pm-skills has been updated to v2.10.0.

---

## Update Summary

| Field | Value |
|-------|-------|
| Date | 2026-04-15 |
| Local version (before) | v2.9.0 |
| Latest version (after) | v2.10.0 |
| Update type | minor |
| Version source | .claude-plugin/plugin.json |
| Release date | 2026-04-14 |
| Release notes | [v2.10.0](https://github.com/product-on-purpose/pm-skills/releases/tag/v2.10.0) |

## Pre-Flight Results

| Check | Result |
|-------|--------|
| Network access | PASS |
| Local version detected | PASS -- .claude-plugin/plugin.json |
| Latest version fetched | PASS |
| Version comparison | update-available |

## What's New

### Headline

This update adds mermaid diagramming and slideshow creation to your
toolkit, letting you go from analysis directly to visual communication
without leaving Claude. Two new utility skills and an updated workflow
expand pm-skills from document-centric output into presentation-ready
deliverables.

### New Skills

| Skill | What It Enables |
|-------|-----------------|
| utility-mermaid-diagrams | Create syntactically valid mermaid diagrams for PRDs, roadmaps, and stakeholder docs. Includes a catalog of all 15 diagram types with PM-specific examples and a syntax validation checklist. |
| utility-slideshow-creator | Generate on-brand presentations (.pptx and PDF) from a JSON deck spec. Supports 18 slide types with content-to-layout decision logic and character limit enforcement -- zero design decisions at generation time. |

### Updated Skills

| Skill | What Improved | Why It Matters |
|-------|---------------|----------------|
| utility-pm-skill-validate | Added HISTORY.md format validation (v1.1.0) | Catches version history formatting issues before they reach CI, saving iteration cycles during skill development. |

### New Workflows

| Workflow | What It Connects |
|----------|-----------------|
| discover-to-present | Chains discovery synthesis -> problem statement -> solution brief -> slideshow, producing a stakeholder-ready deck from research inputs. |

### Other Changes

- Updated AGENTS.md with new skill entries and workflow references
- Added `commands/mermaid-diagrams.md` and `commands/slideshow-creator.md`
- Updated CI scripts for HISTORY.md validation

### Opportunities

With mermaid-diagrams, you can now embed validated diagrams directly in
your PRDs and specs -- try starting with a flowchart for your next
approval workflow or a Gantt chart for your release timeline. The
slideshow-creator pairs naturally with any skill that produces structured
content: run `/prd` then `/slideshow-creator` to turn your requirements
into a presentation deck. The new discover-to-present workflow automates
this full chain from research to slides.

## Files Written

| Directory | Files | New | Updated |
|-----------|-------|-----|---------|
| `skills/` | 33 | 6 (2 skills x 3 files) | 27 |
| `commands/` | 40 | 2 | 38 |
| `_workflows/` | 10 | 1 | 9 |
| Other | 7 | 0 | 7 |
| **Total** | **90** | **9** | **81** |

## Backup

Backup saved to: `_pm-skills/backups/v2.9.0_2026-04-15/`

To restore: `cp -r _pm-skills/backups/v2.9.0_2026-04-15/* .`

## Post-Update Validation

| Check | Result |
|-------|--------|
| Version consistency | PASS -- plugin.json, marketplace.json, and CHANGELOG.md all show v2.10.0 |
| File integrity | PASS -- AGENTS.md, skills/, commands/, _workflows/ all present |
| Skill count | 31 -> 33 (+2: utility-mermaid-diagrams, utility-slideshow-creator) |

## Next Steps

- Review this report for a summary of what changed
- Run `/pm-skill-validate --all` to verify skill integrity
- Run local CI: `bash scripts/lint-skills-frontmatter.sh`
- Check release notes for migration steps: [v2.10.0](https://github.com/product-on-purpose/pm-skills/releases/tag/v2.10.0)
- Try the new `/mermaid-diagrams` skill on your next PRD
- Try the new `/slideshow-creator` skill to turn a brief into slides
- Update pm-skills-mcp: `cd ../pm-skills-mcp && npm run embed-skills && npm run build`

---

# Report-Only Example

Below is the same update shown as a `--report-only` output.

---

# PM Skills Update Report

> **Report only -- update was not applied.**
> Run `/update-pm-skills` to apply this update.

---

## Update Summary

| Field | Value |
|-------|-------|
| Date | 2026-04-15 |
| Local version (before) | v2.9.0 |
| Latest version (after) | v2.10.0 |
| Update type | minor |
| Version source | .claude-plugin/plugin.json |
| Release date | 2026-04-14 |
| Release notes | [v2.10.0](https://github.com/product-on-purpose/pm-skills/releases/tag/v2.10.0) |

## Pre-Flight Results

| Check | Result |
|-------|--------|
| Network access | PASS |
| Local version detected | PASS -- .claude-plugin/plugin.json |
| Latest version fetched | PASS |
| Version comparison | update-available |

## What's New

### Headline

This update adds mermaid diagramming and slideshow creation to your
toolkit, letting you go from analysis directly to visual communication
without leaving Claude.

### New Skills

| Skill | What It Enables |
|-------|-----------------|
| utility-mermaid-diagrams | Create syntactically valid mermaid diagrams for product documents with PM-specific examples and syntax validation. |
| utility-slideshow-creator | Generate presentations (.pptx and PDF) from structured content with 18 slide types and automatic layout decisions. |

### Updated Skills

| Skill | What Improved | Why It Matters |
|-------|---------------|----------------|
| utility-pm-skill-validate | Added HISTORY.md format validation | Catches version history issues before CI |

### New Workflows

| Workflow | What It Connects |
|----------|-----------------|
| discover-to-present | Research -> problem statement -> solution brief -> stakeholder presentation |

### Other Changes

- 2 new slash commands, updated AGENTS.md, updated CI scripts

### Opportunities

With these additions you can go from discovery research to a
presentation deck in a single workflow chain. The mermaid skill also
unlocks validated diagrams in all your existing PRDs and specs.

## Files That Would Be Written

| Directory | Files | New | Updated |
|-----------|-------|-----|---------|
| `skills/` | 33 | 6 | 27 |
| `commands/` | 40 | 2 | 38 |
| `_workflows/` | 10 | 1 | 9 |
| Other | 7 | 0 | 7 |
| **Total** | **90** | **9** | **81** |

## Next Steps

- Run `/update-pm-skills` to apply this update
- Review the release notes for any migration steps: [v2.10.0](https://github.com/product-on-purpose/pm-skills/releases/tag/v2.10.0)
