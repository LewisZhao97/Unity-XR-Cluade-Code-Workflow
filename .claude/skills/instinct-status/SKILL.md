---
name: instinct-status
description: Show learned instincts (project + global) with confidence scores
command: true
---

# Instinct Status Command

Shows learned instincts for the current project plus global instincts, grouped by domain.

## Implementation

Read instincts directly from `~/.claude/homunculus/projects/<project-id>/instincts/` and `~/.claude/homunculus/instincts/`, then display grouped by domain with confidence scores. The previous auto-CLI was removed when continuous-learning-v2 was cut.

## Usage

```
/instinct-status
```

## What to Do

1. Detect current project context (git remote/path hash)
2. Read project instincts from `~/.claude/homunculus/projects/<project-id>/instincts/`
3. Read global instincts from `~/.claude/homunculus/instincts/`
4. Merge with precedence rules (project overrides global when IDs collide)
5. Display grouped by domain with confidence bars and observation stats

## Output Format

```
============================================================
  INSTINCT STATUS - 12 total
============================================================

  Project: unity-xr-workflow (a1b2c3d4e5f6)
  Project instincts: 8
  Global instincts:  4

## PROJECT-SCOPED (unity-xr-workflow)
  ### XR-PERFORMANCE (3)
    ███████░░░  70%  zero-gc-in-update [project]
              trigger: when writing Update/FixedUpdate methods

## GLOBAL (apply to all projects)
  ### WORKFLOW (2)
    █████████░  85%  grep-before-edit [global]
              trigger: when modifying code
```

## Related

- `/evolve` — Cluster instincts into skills/commands/agents
- `/learn-eval` — Extract patterns from current session
