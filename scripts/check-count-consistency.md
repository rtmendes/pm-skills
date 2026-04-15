# check-count-consistency.sh / check-count-consistency.ps1

## Purpose

Detect stale hardcoded counts in documentation files. When skills, commands,
or workflows are added or removed, references like "31 skills" or "38 commands"
scattered across docs can become outdated. This script finds those mismatches.

## Usage

```bash
./scripts/check-count-consistency.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-count-consistency.ps1
```

## What It Does

1. Counts actual resources on disk:
   - Skills: directories in `skills/`
   - Commands: `.md` files in `commands/`
   - Workflows: `.md` files in `_workflows/` (excluding `README.md`)
2. Scans all tracked `.md` and `.json` files (including `plugin.json` and `marketplace.json`) for patterns like `{N} skills`, `{N} commands`, `{N} workflows` (also `{N} PM skills`, `{N} product management skills`)
3. Compares found numbers against actual counts
4. Reports mismatches with file path and line number

Exclusions (not flagged as stale):
- `CHANGELOG.md` — historical entries are correct for their time
- `docs/releases/` — same reason
- `docs/internal/` — planning docs may reference future counts
- `.github/.created-issues.json` and `.github/scripts/` — tooling state and npm manifests, not docs
- Lines containing version references like `v2.` — likely historical context

## Exit Codes

| Code | Meaning |
|------|---------|
| `0`  | All counts are consistent |
| `1`  | Stale counts detected |

## When to Use

- After adding or removing skills, commands, or workflows
- Before tagging a release
- In CI to catch outdated documentation

## Example Output

```
=== Count Consistency Check ===

Actual counts:
  Skills:    31
  Commands:  38
  Workflows: 9

PASS: No stale counts found in tracked .md files.
```

```
=== Count Consistency Check ===

Actual counts:
  Skills:    32
  Commands:  39
  Workflows: 10

Stale counts found:

  README.md:5: found '31 skills' (actual: 32)
  docs/guides/getting-started.md:12: found '38 commands' (actual: 39)

FAIL: One or more hardcoded counts are stale.
```

## Safety

Read-only. Does not modify any files.
