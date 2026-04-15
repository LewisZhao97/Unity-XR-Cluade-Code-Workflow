# Active Hooks

Hooks are configured in `.claude/settings.json` and fire automatically:

## Core Hooks

| Hook | Event | Trigger | Action |
| ---- | ----- | ------- | ------ |
| `validate-commit.sh` | PreToolUse (Bash) | `git commit` commands | Validates design doc sections, JSON data files, hardcoded values, TODO format |
| `validate-push.sh` | PreToolUse (Bash) | `git push` commands | Warns on pushes to protected branches (develop/main) |
| `validate-assets.sh` | PostToolUse (Write/Edit) | Asset file changes | Checks naming conventions and JSON validity for files in `assets/` |
| `session-start.sh` | SessionStart | Session begins | Loads sprint context, milestone, git activity |
| `detect-gaps.sh` | SessionStart | Session begins | Detects fresh projects (suggests /start-harness) and missing documentation |
| `pre-compact.sh` | PreCompact | Context compression | Dumps session state (modified files, WIP design docs) before compaction |
| `session-stop.sh` | Stop | Session ends | Summarizes accomplishments and updates session log |
| `log-agent.sh` | SubagentStart | Agent spawned | Audit trail of all subagent invocations with timestamps |

### Instinct Storage

Observations and instincts are stored at `~/.claude/homunculus/`:
- `projects/<hash>/instincts/personal/` — Project-scoped learned instincts
- `instincts/personal/` — Global instincts (promoted from projects)

See `/learn-eval`, `/instinct-status`, and `/evolve` skills for the learning workflow.
