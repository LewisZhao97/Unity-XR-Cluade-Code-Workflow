#!/bin/bash
# Claude Code SessionStart hook: Load Unity XR project context
# Outputs context information that Claude sees when a session begins

echo "=== XRStack — Session Context ==="

# Current branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    echo "Branch: $BRANCH"

    echo ""
    echo "Recent commits:"
    git log --oneline -5 2>/dev/null | while read -r line; do
        echo "  $line"
    done
fi

# Unity version
if [ -f "ProjectSettings/ProjectVersion.txt" ]; then
    UNITY_VER=$(head -1 ProjectSettings/ProjectVersion.txt 2>/dev/null | sed 's/m_EditorVersion: //')
    echo ""
    echo "Unity: $UNITY_VER"
fi

# XR packages
if [ -f "Packages/manifest.json" ]; then
    PYTHON_CMD=""
    for cmd in python python3 py; do
        if command -v "$cmd" >/dev/null 2>&1; then
            PYTHON_CMD="$cmd"
            break
        fi
    done

    if [ -n "$PYTHON_CMD" ]; then
        XR_PKGS=$("$PYTHON_CMD" -c "
import json
m = json.load(open('Packages/manifest.json'))
xr = {k: v for k, v in m.get('dependencies', {}).items() if 'xr' in k.lower() or 'openxr' in k.lower()}
for k, v in xr.items(): print(f'  {k}: {v}')
" 2>/dev/null)
        if [ -n "$XR_PKGS" ]; then
            echo "XR Packages:"
            echo "$XR_PKGS"
        fi
    fi
fi

# Code health quick check
if [ -d "Assets/Scripts" ]; then
    TODO_COUNT=$(grep -r "TODO" Assets/Scripts/ 2>/dev/null | wc -l)
    FIXME_COUNT=$(grep -r "FIXME" Assets/Scripts/ 2>/dev/null | wc -l)
    TODO_COUNT=$(echo "$TODO_COUNT" | tr -d ' ')
    FIXME_COUNT=$(echo "$FIXME_COUNT" | tr -d ' ')
    if [ "$TODO_COUNT" -gt 0 ] || [ "$FIXME_COUNT" -gt 0 ]; then
        echo ""
        echo "Code health: ${TODO_COUNT} TODOs, ${FIXME_COUNT} FIXMEs"
    fi
fi

echo "==================================="
exit 0
