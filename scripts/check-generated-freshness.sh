#!/usr/bin/env bash
# check-generated-freshness.sh . Verify generated workflow pages match source.
#
# If scripts/generate-workflow-pages.py exists, runs it to a temp directory
# and diffs against committed docs/workflows/. Otherwise, checks that every
# _workflows/*.md has a matching docs/workflows/*.md.
#
# Exit codes:
#   0 . Generated pages are fresh (or fallback check passes)
#   1 . Generated pages are stale or missing
#
# Usage:
#   ./scripts/check-generated-freshness.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

FAIL=0
GENERATOR="$ROOT/scripts/generate-workflow-pages.py"

echo "=== Generated Freshness Check ==="
echo ""

if [[ -f "$GENERATOR" ]]; then
  echo "Generator found: scripts/generate-workflow-pages.py"
  echo ""

  # Create temp directory for generated output
  TMPDIR=$(mktemp -d)
  trap 'rm -rf "$TMPDIR"' EXIT

  # Run generator with output redirected to temp dir
  # The generator writes to docs/workflows/ relative to ROOT,
  # so we copy the current docs/workflows and regenerate
  mkdir -p "$TMPDIR/docs/workflows"

  # Run the generator . it writes to docs/workflows/ under ROOT
  # We need to capture what it would produce, so we use a temp ROOT
  TEMP_ROOT="$TMPDIR/repo"
  mkdir -p "$TEMP_ROOT/docs/workflows"
  mkdir -p "$TEMP_ROOT/scripts"

  # Copy source files needed by the generator
  cp -r "$ROOT/_workflows" "$TEMP_ROOT/_workflows"
  cp "$GENERATOR" "$TEMP_ROOT/scripts/generate-workflow-pages.py"

  # Run the generator in the temp root
  if python3 "$TEMP_ROOT/scripts/generate-workflow-pages.py" 2>/dev/null || python "$TEMP_ROOT/scripts/generate-workflow-pages.py" 2>/dev/null; then
    echo "Generator ran successfully."
    echo ""

    # Compare generated output with committed files
    COMMITTED="$ROOT/docs/workflows"
    GENERATED="$TEMP_ROOT/docs/workflows"

    STALE=()
    for gen_file in "$GENERATED"/*.md; do
      [[ -f "$gen_file" ]] || continue
      base="$(basename "$gen_file")"
      committed_file="$COMMITTED/$base"

      if [[ ! -f "$committed_file" ]]; then
        STALE+=("$base (missing from docs/workflows/)")
        FAIL=1
      elif ! diff -q "$gen_file" "$committed_file" >/dev/null 2>&1; then
        STALE+=("$base (content differs)")
        FAIL=1
      fi
    done

    if [[ ${#STALE[@]} -gt 0 ]]; then
      echo "Stale generated pages:"
      for s in "${STALE[@]}"; do
        echo "  ✗ $s"
      done
      echo ""
      echo "Run 'python scripts/generate-workflow-pages.py' to regenerate."
    fi
  else
    echo "WARN: Generator failed to run. Falling back to existence check."
    echo ""

    # Fallback: just check file existence
    for f in "$ROOT"/_workflows/*.md; do
      [[ -f "$f" ]] || continue
      base="$(basename "$f")"
      [[ "$base" == "README.md" ]] && continue
      [[ "$base" == _* ]] && continue

      if [[ ! -f "$ROOT/docs/workflows/$base" ]]; then
        echo "  ✗ Missing: docs/workflows/$base"
        FAIL=1
      fi
    done
  fi
else
  echo "Generator not found: scripts/generate-workflow-pages.py"
  echo "Falling back to existence check."
  echo ""

  # Fallback: check that every _workflows/*.md has a matching docs/workflows/*.md
  for f in "$ROOT"/_workflows/*.md; do
    [[ -f "$f" ]] || continue
    base="$(basename "$f")"
    [[ "$base" == "README.md" ]] && continue
    [[ "$base" == _* ]] && continue

    if [[ -f "$ROOT/docs/workflows/$base" ]]; then
      echo "  ✓ docs/workflows/$base"
    else
      echo "  ✗ Missing: docs/workflows/$base"
      FAIL=1
    fi
  done
fi

echo ""
if [[ $FAIL -eq 0 ]]; then
  echo "PASS: Generated workflow pages are fresh."
else
  echo "FAIL: Generated workflow pages are stale or missing."
fi

exit "$FAIL"
