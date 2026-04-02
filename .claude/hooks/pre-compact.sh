#!/bin/bash
# Claude Code PreCompact hook: Dump session state before context compression
# Output appears in conversation right before compaction, helping critical
# state survive the summarization process.

echo "=== SESSION STATE BEFORE COMPACTION ==="
echo "Timestamp: $(date)"

# --- Files modified this session (unstaged + staged + untracked) ---
echo ""
echo "## Files Modified (git working tree)"

CHANGED=$(git diff --name-only 2>/dev/null)
STAGED=$(git diff --staged --name-only 2>/dev/null)
UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null)

if [ -n "$CHANGED" ]; then
    echo "Unstaged changes:"
    echo "$CHANGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$STAGED" ]; then
    echo "Staged changes:"
    echo "$STAGED" | while read -r f; do echo "  - $f"; done
fi
if [ -n "$UNTRACKED" ]; then
    echo "New untracked files:"
    echo "$UNTRACKED" | while read -r f; do echo "  - $f"; done
fi
if [ -z "$CHANGED" ] && [ -z "$STAGED" ] && [ -z "$UNTRACKED" ]; then
    echo "  (no uncommitted changes)"
fi

# --- Work-in-progress design/app docs ---
echo ""
echo "## App Docs — Work In Progress"

WIP_FOUND=false
for f in "docs/app design docs"/*.md; do
    [ -f "$f" ] || continue
    INCOMPLETE=$(grep -n -E "TODO|WIP|PLACEHOLDER|\[TO BE|\[TBD\]" "$f" 2>/dev/null)
    if [ -n "$INCOMPLETE" ]; then
        WIP_FOUND=true
        echo "  $f:"
        echo "$INCOMPLETE" | while read -r line; do echo "    $line"; done
    fi
done

if [ "$WIP_FOUND" = false ]; then
    echo "  (no WIP markers found)"
fi

# --- Log compaction event ---
LOG_DIR=".claude/logs"
mkdir -p "$LOG_DIR" 2>/dev/null
echo "$(date) | context compaction" >> "$LOG_DIR/session.log" 2>/dev/null

echo ""
echo "## Recovery"
echo "Re-read any files listed above that are being actively worked on."
echo "=== END SESSION STATE ==="

exit 0
