# check-context-currency.sh / check-context-currency.ps1

## Purpose

Verify that all `AGENTS/*/CONTEXT.md` files reference the current release
version from `CHANGELOG.md`. Catches stale agent context files that haven't
been updated after a release.

## Usage

```bash
./scripts/check-context-currency.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-context-currency.ps1
```

## What It Does

1. Extracts the latest release version from `CHANGELOG.md` (first `## [X.Y.Z]`
   heading, skipping `[Unreleased]`)
2. Scans each `AGENTS/*/CONTEXT.md` file for a `vX.Y.Z` reference
3. Compares the first version found in each file against the CHANGELOG version
4. Reports which files are current and which are stale

## Exit Codes

| Code | Meaning |
|------|---------|
| `0` | All CONTEXT.md files reference the current version |
| `1` | One or more files are stale, or no CONTEXT.md files found |

## When to Use

- In CI on push/PR (advisory . context files may lag intentionally)
- After tagging a release (verify agent context was updated)
- When updating agent documentation

## Example Output

```
✓ AGENTS/claude/CONTEXT.md : v2.9.0
✓ All CONTEXT.md files are current (v2.9.0)
```

```
✗ AGENTS/claude/CONTEXT.md : shows v2.8.0 but CHANGELOG is at v2.9.0
```

## Safety

Read-only. Does not modify any files.
