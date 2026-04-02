# Quick Start Guide

## What Is This?

A pre-built Claude Code workflow for Unity XR development. It provides 29 specialist
agents, 27 slash commands, 25 auto-loaded rules, and 8 lifecycle hooks — all tuned
for developing XR applications targeting XR glasses and PC streaming.

## How to Use

### 1. Understand the Hierarchy

Three tiers of agents, from strategic to tactical:

- **Tier 1 (Opus)**: Directors — high-level decisions
  - `technical-director` — architecture and technology decisions
  - `producer` — scheduling, coordination, risk management

- **Tier 2 (Sonnet)**: Leads — domain ownership
  - `lead-programmer`, `xr-specialist`, `qa-lead`, `release-manager`

- **Tier 3 (Sonnet/Haiku)**: Specialists — implementation
  - XR, Unity engine, programming, quality, and production specialists

### 2. Pick the Right Agent

| I need to... | Use this agent |
|-------------|---------------|
| Design XR interaction architecture | `xr-specialist` |
| Implement an XR feature | `gameplay-programmer` |
| Review code quality | `lead-programmer` |
| Write a shader for XR | `unity-shader-specialist` |
| Fix a performance problem | `performance-analyst` |
| Design SDK public API | `sdk-developer` |
| Write test cases | `qa-tester` |
| Make an architecture decision | `technical-director` |
| Plan a sprint | `producer` |
| Set up CI/CD | `devops-engineer` |
| Work with XRI components | `unity-xri-specialist` |
| Manage Addressable assets | `unity-addressables-specialist` |
| Test a concept quickly | `prototyper` |
| Review security | `security-engineer` |
| Check XR accessibility | `accessibility-specialist` |
| Manage a release | `release-manager` |
| Prepare strings for translation | `localization-lead` |

### 3. Use Slash Commands

| Command | What it does |
|---------|-------------|
| `/start-harness` | Discover project, ensure CLAUDE.md harness compliance, route to workflow |
| `/plan` | Create implementation plan (waits for confirmation) |
| `/code-review` | Review code for quality and architecture |
| `/xr-test` | Generate XR interaction and comfort tests |
| `/xr-perf-profile` | XR frame budget analysis |
| `/build-platform` | Validate build settings for glasses or PC streaming |
| `/sprint-plan` | Create or update sprint plans |
| `/architecture-decision` | Create an ADR |
| `/prototype` | Scaffold a throwaway prototype |
| `/bug-report` | Create structured bug report |
| `/tech-debt` | Scan and prioritize technical debt |
| `/release-checklist` | Pre-release validation |

See `skills-reference.md` for the full list of 27 commands.

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

1. Run `/start-harness` or `/project-stage-detect` — analyzes what exists, identifies gaps
2. Run `/gate-check` to validate phase readiness
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
  agents/                           — 29 agent definitions
  skills/                           — 27 slash command definitions
  rules/
    common/                         — 19 rules (always active)
    csharp/                         — 6 rules (active for *.cs files)
  hooks/                            — 8 lifecycle scripts
  docs/
    quick-start.md                  — This file
    agent-roster.md                 — Full agent list with tiers
    agent-coordination-map.md       — Delegation and workflow patterns
    skills-reference.md             — All slash commands
    rules-reference.md              — Path-specific rules
    hooks-reference.md              — Active hooks
    technical-preferences.md        — Engine, naming, performance budgets
    coordination-rules.md           — Agent coordination principles
    context-management.md           — Context window strategy
    review-workflow.md              — Review and sign-off process
    setup-requirements.md           — System prerequisites
    settings-local-template.md      — Personal settings guide
    CLAUDE-local-template.md        — Personal CLAUDE.md guide
    agent-development-plan.md       — Workflow development roadmap
```
