---
name: perf-profile
description: "Structured performance profiling workflow. Identifies bottlenecks, measures against budgets, and generates optimization recommendations with priority rankings."
argument-hint: "[system-name or 'full']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---
When this skill is invoked:

1. **Determine scope** from the argument:
   - If a system name: focus profiling on that specific system
   - If `full`: run a comprehensive profile across all systems
   - For XR-specific profiling, use `/xr-perf-profile` instead

2. **Read performance budgets** — Check for existing performance targets:
   - Target FPS / frame budget (XR: 11ms at 90Hz, 8.3ms at 120Hz)
   - Memory budget (total and per-system)
   - Load time targets
   - Draw call budgets (mobile XR: <100, PCVR: <300)
   - Network bandwidth limits (if multiplayer)

3. **Analyze the codebase** for common performance issues:

   **CPU Profiling Targets**:
   - `Update()` / `FixedUpdate()` / `LateUpdate()` — list all and estimate cost
   - Nested loops over large collections
   - String operations in hot paths
   - GC allocations in per-frame code (`new`, LINQ, closures, boxing)
   - Expensive physics queries (raycasts, overlaps) every frame

   **Memory Profiling Targets**:
   - Large data structures and their growth patterns
   - Texture/asset memory footprint estimates
   - Object pool vs Instantiate/Destroy patterns
   - Leaked references (objects that should be freed but aren't)
   - Native plugin memory usage

   **Rendering Targets**:
   - Draw call estimates
   - Overdraw from overlapping transparent objects
   - Shader complexity (especially on mobile XR)
   - Particle system cost
   - Missing LODs or occlusion culling

   **I/O Targets**:
   - Save/load performance
   - Asset loading patterns (sync vs async via Addressables)
   - Network message frequency and size

4. **Generate the profiling report**:

   ```markdown
   ## Performance Profile: [System or Full]
   Generated: [Date]

   ### Performance Budgets
   | Metric | Budget | Estimated Current | Status |
   |--------|--------|-------------------|--------|
   | Frame time | [budget] | [estimate] | [OK/WARNING/OVER] |
   | Memory | [target] | [estimate] | [OK/WARNING/OVER] |
   | Draw calls | [target] | [estimate] | [OK/WARNING/OVER] |

   ### Hotspots Identified
   | # | Location | Issue | Impact | Fix Effort |
   |---|----------|-------|--------|------------|
   | 1 | [file:line] | [description] | [High/Med/Low] | [S/M/L] |

   ### Optimization Recommendations (Priority Order)
   1. **[Title]** — [Description]
      - Location: [file:line]
      - Expected gain: [estimate]
      - Approach: [How to implement]

   ### Quick Wins (< 1 hour each)
   - [Simple optimization 1]
   ```

5. **Output summary**: top 3 hotspots, headroom vs budget, recommended next action.

### Rules
- Never optimize without measuring first
- Recommendations must include estimated impact
- Profile on target hardware, not just development machines
- Distinguish CPU-bound, GPU-bound, and I/O-bound bottlenecks
