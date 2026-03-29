---
description: Restate requirements, assess risks, and create step-by-step implementation plan for Unity XR features. WAIT for user CONFIRM before touching any code.
---

# Plan Command

This command creates a comprehensive implementation plan before writing any code.

## What This Command Does

1. **Restate Requirements** - Clarify what needs to be built
2. **Identify XR Constraints** - Platform limits, frame budgets, interaction patterns
3. **Create Step Plan** - Break down implementation into phases
4. **Wait for Confirmation** - MUST receive user approval before proceeding

## When to Use

Use `/plan` when:
- Starting a new XR feature or interaction system
- Making significant architectural changes to SDK/Runtime
- Working on cross-platform functionality
- Multiple scripts/components will be affected
- Requirements are unclear or ambiguous

## How It Works

1. **Analyze the request** and restate requirements
2. **Break down into phases** with specific, actionable steps
3. **Identify XR-specific concerns**: platform targets, performance budget, input methods
4. **Assess risks** and potential blockers
5. **Estimate complexity** (High/Medium/Low)
6. **Present the plan** and WAIT for explicit confirmation

## Important Notes

**CRITICAL**: This command will **NOT** write any code until you explicitly confirm the plan.

If you want changes, respond with:
- "modify: [your changes]"
- "different approach: [alternative]"
- "skip phase 2 and do phase 3 first"

## Integration with Other Commands

After planning:
- Use `/code-review` to review completed implementation
- Use `/xr-test` for XR-specific testing
- Use `/build-platform` for cross-platform validation
- Use `/xr-perf-profile` for performance verification
