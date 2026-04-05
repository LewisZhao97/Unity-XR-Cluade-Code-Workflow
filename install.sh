#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$0"
while [ -L "$SCRIPT_PATH" ]; do
    link_dir="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"
    SCRIPT_PATH="$(readlink "$SCRIPT_PATH")"
    [[ "$SCRIPT_PATH" != /* ]] && SCRIPT_PATH="$link_dir/$SCRIPT_PATH"
done
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" && pwd)"

# On MSYS2/Git Bash, convert the POSIX path to a Windows path for Node.js
if command -v cygpath &>/dev/null; then
    NODE_SCRIPT="$(cygpath -w "$SCRIPT_DIR/.claude/scripts/install-apply.js")"
else
    NODE_SCRIPT="$SCRIPT_DIR/.claude/scripts/install-apply.js"
fi

exec node "$NODE_SCRIPT" "$@"
