# Scripts Guide

## Table of Contents
- [Overview](#overview)
- [Script Catalog](#script-catalog)
  - [sync-claude.sh / sync-claude.ps1](#sync-claudesh--sync-claudeps1)
  - [build-release.sh / build-release.ps1](#build-releasesh--build-releaseps1)
  - [validate-commands.sh / validate-commands.ps1](#validate-commandssh--validate-commandps1)
  - [lint-skills-frontmatter.sh / lint-skills-frontmatter.ps1](#lint-skills-frontmattersh--lint-skills-frontmatterps1)
  - [validate-agents-md.sh / validate-agents-md.ps1](#validate-agents-mdsh--validate-agents-mdps1)
  - [check-mcp-impact.sh / check-mcp-impact.ps1](#check-mcp-impactsh--check-mcp-impactps1)
- [When to use what](#when-to-use-what)
- [FAQ](#faq)
- [Tips](#tips)
- [Troubleshooting](#troubleshooting)
- [Detailed Documentation](#detailed-documentation)

---

## Overview
The `scripts/` folder contains small utilities to keep the repo consistent, reproducible, and discoverable across AI tools. They are safe to run locally; `build-release` writes to `dist/` and refreshes `.claude/` via `sync-claude`.

CI-only automation scripts live in `.github/scripts/` (for example, `validate-mcp-sync.js`).

## Script Catalog

### sync-claude.sh / sync-claude.ps1
**Purpose:** Populate `.claude/skills` and `.claude/commands` from the canonical flat `skills/` and `commands/`, with validation.

**Why:** Some tools (openskills CLI, certain Claude Code setups) auto-discover only in `.claude/`. Releases do **not** ship populated `.claude/`; this is a local convenience.

**Use when:** You need Claude Code / openskills discovery. Skip if your tool reads `skills/` directly.

**Commands:**
- Bash: `./scripts/sync-claude.sh`
- PowerShell: `./scripts/sync-claude.ps1`

**Validation:** Fails if any skill is missing `SKILL.md`, `references/TEMPLATE.md`, or `references/EXAMPLE.md`.

### build-release.sh / build-release.ps1
**Purpose:** Create `dist/pm-skills-vX.Y.Z.zip` with manifest + SHA256.

**Why:** Reproducible packaging for releases; ensures sample library content is included while populated `.claude/` and internal governance docs under `docs/internal/` are excluded from the shipped ZIP.

**Use when:** Cutting a release tag or testing the release bundle.

**Commands:**
- Bash: `./scripts/build-release.sh`
- PowerShell: `./scripts/build-release.ps1`

**Outputs:** `dist/pm-skills-vX.Y.Z.zip`, `.zip.sha256`, `manifest.txt`.

### validate-commands.sh / validate-commands.ps1
**Purpose:** Ensure each command points to an existing `skills/{phase-skill}/SKILL.md` and has `references/TEMPLATE.md` and `EXAMPLE.md`.

**Why:** Guardrail after edits/renames; lightweight lint before tagging.

**Use when:** After editing commands or skills; before release; in CI.

**Commands:**
- Bash: `./scripts/validate-commands.sh`
- PowerShell: `./scripts/validate-commands.ps1`

**Outputs:** Console pass/fail per command; exit non-zero on failure.

### lint-skills-frontmatter.sh / lint-skills-frontmatter.ps1
**Purpose:** Validate YAML frontmatter and file structure of every skill in `skills/`.

**Why:** Enforces naming conventions, required fields (`name`, `version`, `updated`, `license`), phase/classification consistency, reference file completeness, description length, and minimum template structure.

**Use when:** After editing skill frontmatter or adding a new skill; before release; in CI.

**Commands:**
- Bash: `./scripts/lint-skills-frontmatter.sh`
- PowerShell: `./scripts/lint-skills-frontmatter.ps1`

**Outputs:** Console pass/fail per skill; exit non-zero on failure.

### validate-agents-md.sh / validate-agents-md.ps1
**Purpose:** Verify that `AGENTS.md` stays in sync with actual skill directories.

**Why:** Prevents public discovery docs from drifting when skills are added, renamed, or removed.

**Use when:** After editing `AGENTS.md`; after adding, renaming, or deleting a skill; in CI.

**Commands:**
- Bash: `./scripts/validate-agents-md.sh`
- PowerShell: `./scripts/validate-agents-md.ps1`

**Outputs:** Console pass/fail for missing, orphaned, or duplicate `AGENTS.md` skill paths; exit non-zero on failure.

### check-mcp-impact.sh / check-mcp-impact.ps1
**Purpose:** Emit a non-blocking advisory when a change may require follow-up in `pm-skills-mcp`.

**Why:** New or renamed skills can require MCP pin refreshes, tool inventory updates, or sync work in the companion repo.

**Use when:** Before opening a PR that adds or renames skills; in CI on push/PR.

**Commands:**
- Bash: `./scripts/check-mcp-impact.sh`
- PowerShell: `./scripts/check-mcp-impact.ps1`

**Outputs:** Warning-only advisory for MCP-impacting skill additions or renames; always exits successfully.

## When to use what
- Day-to-day: no scripts needed unless using openskills/Claude Code → run `sync-claude`.
- Pre-release: `sync-claude` (sanity) → `validate-commands` → `lint-skills-frontmatter` → `validate-agents-md` → `check-mcp-impact` → `build-release`.
- CI candidate: add `validate-commands`, `lint-skills-frontmatter`, `validate-agents-md`, and `check-mcp-impact` to validation jobs.
- Cross-repo drift guardrail: use `.github/workflows/validate-mcp-sync.yml` (observe first, block later).

## FAQ
**Q: Do I need `.claude/` populated?**  
A: Only if your tool requires it. Otherwise ignore; it stays gitignored.

**Q: Will build-release ship my local `.claude/`?**  
A: No. It copies only `.claude/pm-skills-for-claude.md` and explicitly removes `.claude/skills` + `.claude/commands` from the staging tree.

**Q: Can I delete `dist/`?**  
A: Yes. It’s build output and gitignored; delete anytime.

## Tips
- Keep `.claude/` untracked. Regenerate via `sync-claude` when needed.
- Run `validate-commands` after command or skill renames.
- Run `validate-agents-md` after skill inventory edits.
- Run `check-mcp-impact` when adding or renaming skills that may affect the MCP repo.
- Use `build-release` from a clean tree to avoid pulling in stray files.

## Troubleshooting
- `sync-claude` fails missing refs → ensure each skill has `SKILL.md`, `references/TEMPLATE.md`, `references/EXAMPLE.md`.
- Hash mismatch after build → delete `dist/` and rebuild.
- Command not found in tool → ensure command file points to correct flat path; rerun `validate-commands`.
- Frontmatter lint failure → check `SKILL.md` has `name` matching the directory name, plus `version`, `updated`, `license` fields.
- `AGENTS.md` drift failure → rerun `validate-agents-md` and reconcile missing/orphan skill paths.
- MCP advisory appears → review whether `pm-skills-mcp` needs a matching sync or release-pin update.

## Detailed Documentation

Each script has a dedicated documentation file with full usage details, options, and behavior descriptions:

| Script Pair | Documentation |
|---|---|
| `sync-claude.sh` / `.ps1` | [sync-claude.md](sync-claude.md) |
| `build-release.sh` / `.ps1` | [build-release.md](build-release.md) |
| `validate-commands.sh` / `.ps1` | [validate-commands.md](validate-commands.md) |
| `lint-skills-frontmatter.sh` / `.ps1` | [lint-skills-frontmatter.md](lint-skills-frontmatter.md) |
| `validate-agents-md.sh` / `.ps1` | [validate-agents-md.md](validate-agents-md.md) |
| `check-mcp-impact.sh` / `.ps1` | [check-mcp-impact.md](check-mcp-impact.md) |
