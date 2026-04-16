---
---

# Agent Orchestration

## Available Agents

### Core Unity XR Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| unity-specialist | Unity Engine authority | Unity API, subsystems, Addressables, project config |
| xr-specialist | XR development authority | XR interaction, tracking, spatial UI |
| unity-xri-specialist | XRI implementation | XR Interaction Toolkit components |
| unity-technical-artist | Shaders, VFX, render pipeline | Shader Graph, HLSL, compute, VFX Graph, render features, post-processing |
| openxr-runtime-specialist | OpenXR runtime/SDK | Runtime layer, OpenXR compliance |
| platform-specialist | Platform builds | XR glasses (standalone) and PC streaming deployment |
| sdk-developer | SDK architecture | Public API, versioning, documentation |

### Development Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| lead-programmer | Code architecture | API design, code review, refactoring |
| gameplay-programmer | Feature implementation | Interaction systems, app logic |
| technical-director | Technical authority | Architecture decisions, tech choices |
| performance-analyst | Profiling | XR performance, frame budget analysis |
| tools-programmer | Internal tools | Editor extensions, pipeline automation |
| ui-programmer | UI systems | Spatial UI, world-space canvas |
| game-designer | Game design | Mechanics, progression, player experience |

### Support Agents

| Agent | Purpose | When to Use |
|-------|---------|-------------|
| qa-lead | Test strategy & execution | Test plans, test cases, bug reports, quality gates |
| producer | Coordination & release | Sprint planning, milestones, release readiness |

## Immediate Agent Usage

No user prompt needed:
1. XR feature requests → Use **xr-specialist** agent
2. Code just written/modified → Use **lead-programmer** for review
3. Performance concerns → Use **performance-analyst** agent
4. Platform-specific issues → Use **platform-specialist** agent
5. SDK API changes → Use **sdk-developer** agent

## Parallel Task Execution

ALWAYS use parallel agent execution for independent operations:

```markdown
# GOOD: Parallel execution
Launch 3 agents in parallel:
1. Agent 1: XR interaction review
2. Agent 2: Performance analysis
3. Agent 3: Cross-platform compatibility check

# BAD: Sequential when unnecessary
First agent 1, then agent 2, then agent 3
```
