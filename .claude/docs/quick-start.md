# Quick Start Guide

## What Is This?

A pre-built Claude Code workflow for Unity XR development. 18 specialist agents,
24 slash commands, 25 auto-loaded rules, and 8 lifecycle hooks — all tuned for
XR applications targeting XR glasses and PC streaming.

## How to Use

### 1. Understand the Hierarchy

Three tiers of agents, from strategic to tactical:

- **Tier 1 (Opus)**: Directors
  - `technical-director` — architecture and technology decisions
  - `producer` — scheduling, coordination, release

- **Tier 2 (Sonnet)**: Leads
  - `lead-programmer`, `xr-specialist`, `qa-lead`

- **Tier 3 (Sonnet/Haiku)**: Specialists — XR, Unity engine, programming, quality

### 2. Pick the Right Agent

| I need to... | Use this agent |
|-------------|---------------|
| Design XR interaction architecture | `xr-specialist` |
| Implement an XR feature | `gameplay-programmer` |
| Review code quality | `lead-programmer` |
| Write a shader for XR | `unity-shader-specialist` |
| Fix a performance problem | `performance-analyst` |
| Design SDK public API | `sdk-developer` |
| Write test cases | `qa-lead` |
| Make an architecture decision | `technical-director` |
| Plan a sprint / manage release | `producer` |
| Work with XRI components | `unity-xri-specialist` |
| Review security | `security-engineer` |
| Design game mechanics | `game-designer` |

### 3. Use Slash Commands

| Command | What it does |
|---------|-------------|
| `/start-harness` | Discover project, ensure CLAUDE.md compliance, route workflow |
| `/plan` | Create implementation plan (waits for confirmation) |
| `/code-review` | Review code for quality and architecture |
| `/xr-test` | Generate XR interaction and comfort tests |
| `/xr-perf-profile` | XR frame budget analysis |
| `/build-platform` | Validate build settings for glasses or PC streaming |
| `/sprint-plan` | Create or update sprint plans |
| `/architecture-decision` | Create an ADR |
| `/prototype` | Scaffold a throwaway prototype |
| `/bug-report` | Create structured bug report |
| `/milestone-gate` | Phase readiness check |

See `skills-reference.md` for the full list of 24 commands.

### 4. Follow the Coordination Rules

1. Work flows down the hierarchy: Directors -> Leads -> Specialists
2. Conflicts escalate up the hierarchy
3. Cross-system work is coordinated by the `producer`
4. Agents do not modify files outside their domain without delegation
5. All decisions are documented

## First Steps

**Don't know where to begin?** Run `/start-harness`. It discovers your project,
ensures CLAUDE.md is harness-compliant, and routes you to the right workflow.

### Path A: Starting a New XR Feature

1. Run `/plan [feature description]` — creates implementation plan
2. Confirm the plan
3. Implement with TDD (write tests first, then code)
4. Run `/code-review` on your changes
5. Run `/xr-perf-profile` to verify frame budget
6. Run `/build-platform validate` to check platform settings

### Path B: Existing Project, First Time Using This Workflow

1. Run `/start-harness` or `/project-stage-detect` — analyzes what exists
2. Run `/milestone-gate` to validate phase readiness
3. Run `/sprint-plan new` to plan next work

### Path C: Bug Fix

1. Run `/bug-report [description]` to create structured report
2. Use `lead-programmer` to identify root cause
3. Fix with TDD approach
4. Run `/code-review` on the fix

## File Structure

```
CLAUDE.md                           — Project instructions (~100 lines)
.claude/
  settings.json                     — Permissions, hooks, safety rules
  agents/                           — 18 agent definitions
  skills/                           — 24 slash command definitions
  rules/
    common/                         — 19 rules (always active)
    csharp/                         — 6 rules (active for *.cs files)
  hooks/                            — 8 lifecycle scripts
  docs/                             — references and guides
```
