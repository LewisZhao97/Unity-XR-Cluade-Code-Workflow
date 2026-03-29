---
name: xr-perf-profile
description: "XR-specific performance profiling: frame budget analysis for 72/90/120Hz targets, GPU/CPU split, draw call counts, stereo rendering overhead, and XR-specific bottleneck identification."
argument-hint: "[system-name|full|frame-budget]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Determine scope and target refresh rate**:
   - Frame budget: 13.9ms (72Hz), 11.1ms (90Hz), 8.3ms (120Hz)
   - If system name: focus on that system's XR performance
   - If `full`: comprehensive XR performance profile
   - If `frame-budget`: focused frame budget analysis

2. **Read XR performance budgets** from project config:
   - Target refresh rate per platform
   - Draw call budget (mobile XR: <100, PCVR: <300)
   - Memory budget per platform
   - Texture memory budget

3. **Analyze XR-specific performance concerns**:

   **CPU Profiling Targets**:
   - `Update()` / `FixedUpdate()` total cost
   - XRI interaction processing overhead
   - Physics queries per frame (raycasts, overlaps)
   - Tracking data processing and pose prediction
   - GC allocations in hot paths (critical for XR)

   **GPU Profiling Targets**:
   - Draw call count (Single Pass Instanced efficiency)
   - Shader complexity per platform
   - Overdraw from transparent objects
   - Post-processing cost (bloom, SSAO — expensive on mobile XR)
   - Stereo rendering overhead
   - Fixed Foveated Rendering utilization

   **XR-Specific Concerns**:
   - Motion-to-photon latency sources
   - Late frame detection patterns
   - Compositor overhead
   - Eye buffer resolution vs render scale
   - Application SpaceWarp / ASW eligibility

   **Memory**:
   - Texture memory per eye buffer
   - Asset loading patterns (streaming vs preload)
   - Object pool utilization
   - Native plugin memory usage

4. **Generate XR performance report**:

```markdown
## XR Performance Profile: [System or Full]

### Frame Budget (Target: [X]Hz = [Y]ms)
| Component | Budget | Estimated | Status |
|-----------|--------|-----------|--------|
| CPU Total | [budget] | [est] | [OK/OVER] |
| GPU Total | [budget] | [est] | [OK/OVER] |
| Compositor | [budget] | [est] | [OK/OVER] |
| Headroom | [remaining] | — | [OK/TIGHT/NONE] |

### XR-Specific Hotspots
| # | Location | Issue | Platform | Fix Effort |
|---|----------|-------|----------|------------|
| 1 | [file:line] | [description] | [Quest/PCVR/All] | [S/M/L] |

### Platform-Specific Recommendations
#### Quest/Pico (Mobile)
- [Mobile-specific optimizations]

#### PCVR
- [Desktop-specific optimizations]
```

### Rules
- XR frame drops are MORE visible than flat-screen — treat budget as hard limit
- Always profile per-platform — mobile XR and PCVR have very different bottlenecks
- GC spikes are XR's worst enemy — any allocation in hot paths is critical priority
- Consider worst case: maximum tracked objects, both hands active, UI visible
