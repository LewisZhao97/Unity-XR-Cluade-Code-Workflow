#!/bin/bash
# Claude Code SubagentStart hook: Log agent invocations for audit trail

INPUT=$(cat)

if command -v jq >/dev/null 2>&1; then
    AGENT_NAME=$(echo "$INPUT" | jq -r '.agent_name // "unknown"' 2>/dev/null)
else
    AGENT_NAME=$(echo "$INPUT" | grep -oE '"agent_name"[[:space:]]*:[[:space:]]*"[^"]*"' | sed 's/"agent_name"[[:space:]]*:[[:space:]]*"//;s/"$//')
    [ -z "$AGENT_NAME" ] && AGENT_NAME="unknown"
fi

LOG_DIR="${CLAUDE_PROJECT_DIR:-.}/.claude/logs"
mkdir -p "$LOG_DIR" 2>/dev/null

echo "$(date +%Y%m%d_%H%M%S) | agent: $AGENT_NAME" >> "$LOG_DIR/session.log" 2>/dev/null

exit 0
