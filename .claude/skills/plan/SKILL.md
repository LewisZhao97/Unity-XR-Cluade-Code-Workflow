---
name: plan
description: "Restate requirements, assess risks, and create step-by-step implementation plan for Unity XR features. WAIT for user CONFIRM before touching any code."
argument-hint: "[feature or task description]"
user-invocable: true
allowed-tools: Read, Glob, Grep, WebSearch
---

When this skill is invoked:

1. **Restate requirements** — Clarify what needs to be built in your own words. Ask if anything is ambiguous.

2. **Identify XR constraints**:
   - Platform targets (XR glasses standalone, PC streaming, or both)
   - Frame budget impact (11ms at 90Hz, 8.3ms at 120Hz)
   - Input methods (controllers, hand tracking, or both)
   - Draw call budget impact
   - GC allocation concerns in hot paths

3. **Research before designing**:
   - Check Unity 6.x docs, XRI docs, OpenXR spec for existing solutions
   - Search the codebase for related implementations
   - Check if the SDK already provides relevant APIs
   - Prefer adopting proven patterns over writing net-new code

4. **Create step-by-step plan**:
   - Break into phases with specific, actionable steps
   - Identify files to create or modify
   - Flag dependencies between phases
   - Note which specialist agents should be involved

5. **Assess risks**:
   - Performance risks (frame budget, memory, draw calls)
   - Platform-specific risks (glasses vs PC streaming differences)
   - SDK/Runtime boundary risks (managed ↔ native transitions)
   - Complexity estimate: High / Medium / Low

6. **Present the plan** in this format:

```markdown
## Plan: [Feature Name]

### Requirements (restated)
- [Bullet points of what will be built]

### XR Constraints
- Platform: [targets]
- Frame budget impact: [estimate]
- Input: [controller/hand tracking/both]

### Phases

#### Phase 1: [Name]
- [ ] [Step with file path]
- [ ] [Step with file path]

#### Phase 2: [Name]
- [ ] [Step with file path]

### Risks
| Risk | Severity | Mitigation |
|------|----------|------------|
| [risk] | [H/M/L] | [mitigation] |

### Agents Involved
- [agent] — [what they do in this plan]
```

7. **WAIT for explicit confirmation** before writing any code.

If the user wants changes, revise the plan. Accepted responses:
- "confirm" / "go" / "looks good" — proceed to implementation
- "modify: [changes]" — revise specific parts
- "different approach: [alternative]" — rethink the design

### Rules
- **CRITICAL**: Never write code until the user explicitly confirms the plan
- Keep phases small enough to complete in one session each
- Always consider the SDK package boundary — app code in Assets/, SDK code in Packages/
- Flag any work that touches the native runtime (.aar) as out-of-scope for Claude
