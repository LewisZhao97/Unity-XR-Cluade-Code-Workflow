# Agent Roster

16 specialist agents organized into three tiers. Each has a definition file in `.claude/agents/`.

## Tier 1 — Directors (Opus)

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `technical-director` | Technical vision | Architecture decisions, technology choices, performance strategy |
| `producer` | Production & release | Sprint planning, milestones, release coordination |

## Tier 2 — Leads (Sonnet)

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `lead-programmer` | Code architecture | System design, code review, API design, refactoring |
| `xr-specialist` | XR authority | XR interaction, tracking, spatial UI, cross-platform XR |
| `qa-lead` | Quality assurance | Test strategy, test cases, bug reports, release readiness |

## Tier 3 — Specialists (Sonnet)

### Design
| Agent | Domain | When to Use |
|-------|--------|-------------|
| `game-designer` | Game mechanics | Gamification, core loops, spatial puzzles, player experience |

### XR Specialists

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `unity-xri-specialist` | XR Interaction Toolkit | XRI components, interactors, locomotion |
| `openxr-runtime-specialist` | OpenXR runtime/SDK | Runtime layer, OpenXR compliance, API layers |
| `platform-specialist` | Platform builds | XR glasses and PC streaming deployment |
| `sdk-developer` | SDK architecture | Public API design, versioning, UPM packaging |

### Unity Engine Specialists

| Agent | Subsystem | When to Use |
|-------|-----------|-------------|
| `unity-specialist` | Unity Engine (lead) | Unity APIs, project config, Addressables, UI systems |
| `unity-technical-artist` | Shaders, VFX, render pipeline | Shader Graph, HLSL, compute shaders, VFX Graph, render features, post-processing |

### Programming Specialists

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `gameplay-programmer` | Feature code | XR interaction systems, application logic |
| `tools-programmer` | Dev tools | Editor extensions, pipeline automation |
| `ui-programmer` | UI implementation | Spatial UI, world-space canvas |

### Quality & Support

| Agent | Domain | When to Use |
|-------|--------|-------------|
| `performance-analyst` | Performance | Profiling, frame budget analysis, optimization |
