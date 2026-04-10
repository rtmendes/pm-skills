# check-stale-bundle-refs.sh / check-stale-bundle-refs.ps1

## Purpose

Terminology guard for the bundles → workflows rename (v2.9.0). Scans tracked
files for stale "bundle" references that should now say "workflow." Helps
ensure the rename is complete across all documentation.

## Usage

```bash
./scripts/check-stale-bundle-refs.sh            # advisory mode
./scripts/check-stale-bundle-refs.sh --strict    # fail on any match
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-stale-bundle-refs.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\check-stale-bundle-refs.ps1 -Strict
```

## What It Does

1. Uses `git grep` to find case-insensitive `bundle`/`bundles` across tracked files
2. Excludes known exceptions:
   - Historical release notes (v2.0 through v2.8.0)
   - Archived effort docs from the rename effort (M-19)
   - Sample library content
   - This script itself
3. Reports any remaining matches
4. In advisory mode (default): exits 0 with warnings
5. In strict mode (`--strict`): exits 1 on any match

## Exit Codes

| Code | Meaning |
|------|---------|
| `0` | No stale references found (or advisory mode with warnings) |
| `1` | Stale references found in strict mode |

## When to Use

- In CI on push/PR (advisory during transition, strict post-v2.9.0)
- After editing docs that previously mentioned "bundles"
- During release verification

## Example Output

```
=== Terminology Guard: checking for stale 'bundle' references ===

PASS: No stale 'bundle' references found.
```

```
Found 2 potential stale reference(s):

docs/guides/using-skills.md:45:  Three bundles are available
docs/concepts/skill-anatomy.md:12:  organized into bundles

WARN: 2 stale 'bundle' reference(s) found (advisory mode).
  Run with --strict to treat as failure.
```

## Safety

Read-only. Does not modify any files.
