# Agent Coordination and Delegation Map

## Organizational Hierarchy

```
                        [Human Developer]
                              |
                +-------------+-------------+
                |                           |
        technical-director              producer
                |                    (coordinates all)
                |
         lead-programmer ─── xr-specialist ─── qa-lead
                |                  |
     +----------+----------+       |
     |    |    |    |    |         |
    gp   tl   ui   ta  perf        |
                                   |
                     +-------------+-------------+
                     |      |      |      |
                    xri   openxr  plat   sdk
                                  unity
                                    |
                                 shader

  Additional support agents:
    security-engineer  — Security, data privacy
    game-designer      — Mechanics, progression, player experience
```

### Legend
```
gp     = gameplay-programmer     xri    = unity-xri-specialist
tl     = tools-programmer        openxr = openxr-runtime-specialist
ui     = ui-programmer           plat   = platform-specialist
ta     = technical-artist        sdk    = sdk-developer
perf   = performance-analyst     unity  = unity-specialist
                                 shader = unity-shader-specialist
```

## Delegation Rules

### Who Can Delegate to Whom

| From | Can Delegate To |
|------|----------------|
| technical-director | lead-programmer, xr-specialist, performance-analyst |
| producer | Any agent (task assignment within their domain only) |
| lead-programmer | gameplay-programmer, tools-programmer, ui-programmer, technical-artist |
| xr-specialist | unity-xri-specialist, openxr-runtime-specialist, platform-specialist, sdk-developer |
| unity-specialist | unity-shader-specialist |
| security-engineer | lead-programmer (secure patterns) |

### Escalation Paths

| Situation | Escalate To |
|-----------|------------|
| Code architecture disagreement | technical-director |
| Cross-system code conflict | lead-programmer, then technical-director |
| XR interaction design conflict | xr-specialist |
| SDK public API change | sdk-developer + technical-director |
| Performance budget violation | performance-analyst flags, technical-director decides |
| Schedule / scope conflict | producer |
| Quality gate disagreement | qa-lead, then technical-director |

## Common Workflow Patterns

### Pattern 1: New XR Feature

```
1. producer            — Schedules work, identifies dependencies
2. xr-specialist       — Reviews XR constraints (platform, input, comfort)
3. lead-programmer     — Designs code architecture
4. [specialist]        — Implements the feature
5. lead-programmer     — Code review
6. qa-lead             — Writes test cases, executes tests
7. performance-analyst — Verifies frame budget
8. producer            — Marks task complete
```

### Pattern 2: SDK API Change

```
1. sdk-developer       — Proposes API design
2. technical-director  — Reviews architecture impact
3. lead-programmer     — Reviews integration with app layer
4. sdk-developer       — Implements the change
5. lead-programmer     — Code review
6. qa-lead             — SDK test coverage
7. producer            — Version bump (semver)
```

### Pattern 3: Bug Fix

```
1. qa-lead             — Files bug report with /bug-report, triages
2. lead-programmer     — Identifies root cause, assigns to programmer
3. [specialist]        — Fixes the bug
4. lead-programmer     — Code review
5. qa-lead             — Verifies fix and runs regression
```

### Pattern 4: Sprint Cycle

```
1. producer            — Plans sprint with /sprint-plan
2. [All agents]        — Execute assigned tasks
3. qa-lead             — Continuous testing during sprint
4. lead-programmer     — Continuous code review during sprint
5. producer            — Sprint milestone review with /milestone-gate
```

### Pattern 5: Release Pipeline

```
1. producer            — Declares release candidate, cuts release branch
2. qa-lead             — Full regression, signs off on quality
3. performance-analyst — Confirms performance within budgets
4. producer            — Builds release artifacts, tags release
5. technical-director  — Final sign-off
```

### Pattern 6: Rapid Prototype

```
1. producer            — Defines hypothesis and success criteria
2. gameplay-programmer — Scaffolds prototype with /prototype
3. xr-specialist       — Evaluates XR feasibility
4. technical-director  — Go/no-go decision on production
```

## Anti-Patterns to Avoid

1. **Bypassing the hierarchy**: A specialist should never make decisions that belong to their lead without consultation.
2. **Cross-domain implementation**: An agent should never modify files outside their area without explicit delegation.
3. **Shadow decisions**: All decisions must be documented.
4. **Monolithic tasks**: Every task should be completable in 1-3 days.
5. **Assumption-based implementation**: If a spec is ambiguous, ask rather than guess.
