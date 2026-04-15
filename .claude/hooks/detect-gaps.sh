#!/bin/bash
# Hook: detect-gaps.sh
# Event: SessionStart
# Purpose: Detect missing documentation and configuration for Unity XR project
# Cross-platform: Windows Git Bash compatible

set +e

echo "=== Checking for Documentation Gaps ==="

# --- Check 0: Fresh project detection ---
FRESH_PROJECT=true

# Check if Unity project exists
if [ -f "ProjectSettings/ProjectSettings.asset" ]; then
  FRESH_PROJECT=false
fi

# Check if source code exists
if [ -d "Assets/Scripts" ]; then
  SRC_CHECK=$(find Assets/Scripts -type f -name "*.cs" 2>/dev/null | head -1)
  if [ -n "$SRC_CHECK" ]; then
    FRESH_PROJECT=false
  fi
fi

if [ "$FRESH_PROJECT" = true ]; then
  echo ""
  echo "NEW PROJECT: No Unity project detected."
  echo "   Run: /start-harness to begin setup"
  echo ""
  echo "To get a comprehensive project analysis, run: /project-stage-detect"
  echo "==================================="
  exit 0
fi

# --- Check 1: Codebase vs documentation ratio ---
SRC_FILES=0
if [ -d "Assets/Scripts" ]; then
  SRC_FILES=$(find Assets/Scripts -type f -name "*.cs" 2>/dev/null | wc -l)
fi
SRC_FILES=$(echo "$SRC_FILES" | tr -d ' ')

DOC_FILES=0
if [ -d "docs" ] || [ -d "Documentation" ]; then
  DOC_FILES=$(find docs Documentation -type f -name "*.md" 2>/dev/null | wc -l)
fi
DOC_FILES=$(echo "$DOC_FILES" | tr -d ' ')

if [ "$SRC_FILES" -gt 50 ] && [ "$DOC_FILES" -lt 5 ]; then
  echo "GAP: Substantial codebase ($SRC_FILES C# files) but sparse docs ($DOC_FILES files)"
  echo "    Suggested action: /architecture-decision to capture key architectural choices"
fi

# --- Check 2: Prototypes without documentation ---
for proto_dir in Assets/Prototypes Prototypes; do
  if [ -d "$proto_dir" ]; then
    PROTOTYPE_DIRS=$(find "$proto_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
    if [ -n "$PROTOTYPE_DIRS" ]; then
      while IFS= read -r pdir; do
        pdir=$(echo "$pdir" | sed 's|\\|/|g')
        if [ ! -f "${pdir}/README.md" ]; then
          proto_name=$(basename "$pdir")
          echo "GAP: Prototype '$proto_name' has no README.md"
        fi
      done <<< "$PROTOTYPE_DIRS"
    fi
  fi
done

# --- Check 3: XR packages check ---
if [ -f "Packages/manifest.json" ]; then
  PYTHON_CMD=""
  for cmd in python python3 py; do
    if command -v "$cmd" >/dev/null 2>&1; then
      PYTHON_CMD="$cmd"
      break
    fi
  done

  if [ -n "$PYTHON_CMD" ]; then
    HAS_XRI=$("$PYTHON_CMD" -c "import json; m=json.load(open('Packages/manifest.json')); print('yes' if any('xr.interaction' in k for k in m.get('dependencies',{})) else 'no')" 2>/dev/null)
    HAS_OPENXR=$("$PYTHON_CMD" -c "import json; m=json.load(open('Packages/manifest.json')); print('yes' if any('openxr' in k for k in m.get('dependencies',{})) else 'no')" 2>/dev/null)

    if [ "$HAS_XRI" != "yes" ]; then
      echo "GAP: XR Interaction Toolkit not found in Packages/manifest.json"
    fi
    if [ "$HAS_OPENXR" != "yes" ]; then
      echo "GAP: OpenXR plugin not found in Packages/manifest.json"
    fi
  fi
fi

# --- Check 4: Missing tests ---
TEST_COUNT=0
if [ -d "Assets/Tests" ]; then
  TEST_COUNT=$(find Assets/Tests -type f -name "*.cs" 2>/dev/null | wc -l)
fi
TEST_COUNT=$(echo "$TEST_COUNT" | tr -d ' ')

if [ "$SRC_FILES" -gt 20 ] && [ "$TEST_COUNT" -lt 5 ]; then
  echo "GAP: $SRC_FILES source files but only $TEST_COUNT test files"
  echo "    Suggested: /xr-test full"
fi

echo ""
echo "To get a comprehensive project analysis, run: /project-stage-detect"
echo "==================================="

exit 0
