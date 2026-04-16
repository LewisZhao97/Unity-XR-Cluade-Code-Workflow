---
name: evolve
description: Analyze instincts and suggest or generate evolved structures (skills, commands, agents)
command: true
---

# Evolve Command

## Implementation

Read instincts from `~/.claude/homunculus/` (project + global scopes) and cluster them manually.

Analyzes instincts and clusters related ones into higher-level structures:
- **Commands**: When instincts describe user-invoked actions
- **Skills**: When instincts describe auto-triggered behaviors
- **Agents**: When instincts describe complex, multi-step processes

## Usage

```
/evolve                    # Analyze all instincts and suggest evolutions
/evolve --generate         # Also generate files under evolved/{skills,commands,agents}
```

## Evolution Rules

### -> Command (User-Invoked)
When instincts describe actions a user would explicitly request:
- Multiple instincts about "when user asks to..."
- Instincts with triggers like "when creating a new X"
- Instincts that follow a repeatable sequence

### -> Skill (Auto-Triggered)
When instincts describe behaviors that should happen automatically:
- Pattern-matching triggers
- Error handling responses
- Code style enforcement

### -> Agent (Needs Depth/Isolation)
When instincts describe complex, multi-step processes that benefit from isolation:
- Debugging workflows
- Refactoring sequences
- Research tasks

## What to Do

1. Detect current project context
2. Read project + global instincts (project takes precedence on ID conflicts)
3. Group instincts by trigger/domain patterns
4. Identify:
   - Skill candidates (trigger clusters with 2+ instincts)
   - Command candidates (high-confidence workflow instincts)
   - Agent candidates (larger, high-confidence clusters)
5. Show promotion candidates (project -> global) when applicable
6. If `--generate` is passed, write files to:
   - Project scope: `~/.claude/homunculus/projects/<project-id>/evolved/`
   - Global fallback: `~/.claude/homunculus/evolved/`

## Flags

- `--generate`: Generate evolved files in addition to analysis output

## Related

- `/instinct-status` — View current instincts
- `/learn-eval` — Extract patterns from current session
