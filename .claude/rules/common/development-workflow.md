# Development Workflow

> This file extends [git-workflow.md](./git-workflow.md) with the full feature development process.

## Feature Implementation Workflow

0. **Research & Reuse** _(mandatory before any new implementation)_
   - **Unity documentation first:** Check Unity 6.x docs, XRI docs, OpenXR spec
   - **GitHub code search:** Run `gh search code` to find existing patterns
   - **Check Unity Asset Store / UPM:** Search for existing packages before writing utility code
   - **Search for adaptable implementations:** Look for open-source XR projects that solve 80%+ of the problem
   - Prefer adopting a proven approach over writing net-new code

1. **Plan First**
   - Use `/plan` command or planner agent for implementation plan
   - Identify XR-specific constraints (platform, performance, input)
   - Identify dependencies and risks
   - Break down into phases

2. **TDD Approach**
   - Write tests first (RED) — use Unity Test Framework
   - Implement to pass tests (GREEN)
   - Refactor (IMPROVE)
   - Verify 80%+ coverage
   - Use `/xr-test` for XR-specific test generation

3. **Code Review**
   - Use `/code-review` immediately after writing code
   - Address CRITICAL and HIGH issues
   - Fix MEDIUM issues when possible

4. **XR Validation**
   - Run `/build-platform validate` for platform checks
   - Run `/xr-perf-profile` for performance verification
   - Test on target hardware when possible

5. **Commit & Push**
   - Detailed commit messages
   - Follow conventional commits format
   - See [git-workflow.md](./git-workflow.md) for commit message format and PR process
