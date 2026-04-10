# check-generated-freshness.sh / check-generated-freshness.ps1

## Purpose

Verify that generated workflow pages in `docs/workflows/` match their source
files in `_workflows/`. Catches cases where source workflows were edited but
the generated pages were not regenerated.

## Usage

```bash
./scripts/check-generated-freshness.sh
```

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\check-generated-freshness.ps1
```

## What It Does

1. Checks if `scripts/generate-workflow-pages.py` exists
2. If the generator exists:
   - Runs it in a temporary directory
   - Diffs the generated output against committed `docs/workflows/` pages
   - Reports any files that differ or are missing
3. If the generator does not exist (or fails to run):
   - Falls back to checking that every `_workflows/*.md` has a matching `docs/workflows/*.md`
4. Reports differences with actionable guidance

## Exit Codes

| Code | Meaning |
|------|---------|
| `0`  | Generated pages are fresh (or fallback check passes) |
| `1`  | Generated pages are stale or missing |

## When to Use

- After editing workflow source files in `_workflows/`
- Before tagging a release
- In CI to ensure generated docs are up to date

## Example Output

```
=== Generated Freshness Check ===

Generator found: scripts/generate-workflow-pages.py
Generator ran successfully.

PASS: Generated workflow pages are fresh.
```

```
=== Generated Freshness Check ===

Generator found: scripts/generate-workflow-pages.py
Generator ran successfully.

Stale generated pages:
  [FAIL] feature-kickoff.md (content differs)
  [FAIL] new-workflow.md (missing from docs/workflows/)

Run 'python scripts/generate-workflow-pages.py' to regenerate.

FAIL: Generated workflow pages are stale or missing.
```

## Safety

Read-only. Does not modify any files. The generator runs against a temporary
copy and the results are compared without touching committed files.
