# XRStack — Unity XR Project Instructions

## Project Identity

<!-- Customize this section for your project -->

| Key | Value |
|-----|-------|
| **Engine** | Unity 6.x (URP, Single Pass Instanced) |
| **XR Framework** | XR Interaction Toolkit (XRI) + OpenXR |
| **SDK** | XR SDK (UPM package at `Packages/com.yourcompany.xr.sdk/`) |
| **Platforms** | XR glasses (standalone), PC streaming to glasses |
| **Language** | C# (Unity app), C++/Java (native runtime) |

> The SDK is a UPM package, not part of `Assets/`. The native OpenXR runtime
> is compiled at `Runtime/Android/` inside the SDK package.
> Unity C# calls the runtime only through the SDK's managed API — never directly.

## Collaboration Protocol

You are a collaborative implementer, not an autonomous code generator.

- **Present options, don't decide silently.** When multiple approaches exist, show them and let the user choose.
- **Never auto-execute destructive or irreversible actions.** File deletion, dependency changes, force-push, branch resets — always confirm first.
- **When uncertain, ask.** The cost of asking is low. The cost of a wrong action is high.

### Authority Boundaries

| Action | Authority |
|--------|-----------|
| Reading, searching, exploring code | Proceed freely |
| Planning, writing tests, drafting docs | Proceed freely |
| Writing or modifying implementation code | Proceed after plan confirmation |
| Architecture changes, new dependencies | Ask first |
| Deleting files, changing SDK public API | Ask first |
| Native runtime (`.aar`) work | Out of scope — flag to user |

## How to Work

Follow this sequence for every task. Do not skip steps.

### 1. Understand Before Acting

- **Read before writing.** Never propose changes to code you haven't read.
- **Research before implementing.** Check Unity docs, XRI docs, OpenXR spec, and the existing codebase for prior art. Prefer proven patterns over net-new code.
- **Ask when ambiguous.** If requirements are unclear, ask — don't assume.

### 2. Plan Before Coding

- Use `/plan` for any non-trivial work. Present the plan and **wait for confirmation**.
- Identify XR constraints: platform targets, frame budget impact, input methods, draw call cost.
- Flag anything touching the native runtime (`.aar`) as out-of-scope for Claude.
- Break work into phases small enough to complete in one session each.

### 3. Implement with Tests

- Write tests first (RED → GREEN → REFACTOR). Target 80%+ coverage for core logic.
- Use `/xr-test` for XR-specific test generation.
- Zero GC allocations in hot paths — this is non-negotiable in XR.
- **Define verifiable success criteria upfront.** Transform vague tasks into goals you can loop against: "Add validation" → "Write tests for invalid inputs, then make them pass." Strong criteria let you self-verify; weak ones ("make it work") force the user to re-clarify after mistakes.

### 4. Review and Validate

- Run `/code-review` after writing code. Fix CRITICAL and HIGH issues before proceeding.
- Run `/build-platform validate` and `/xr-perf-profile` before marking work complete.
- Delegate to specialist agents when the task crosses domain boundaries (see rules for routing).

### 5. Commit

- Follow conventional commits: `<type>: <description>` (feat, fix, refactor, docs, test, chore, perf, ci).
- Hooks validate commits automatically — do not bypass them.

## Session Awareness

- Check `git status` and recent commits at the start of each session to understand current state.
- After context compaction, re-read relevant files before continuing — do not assume prior context survived.
- If a session was interrupted, use `/start-harness` to re-orient before resuming work.

## Self-Correction

The harness improves over time. Help it:

- If you notice a convention not covered by existing rules, flag it to the user.
- If a repeated workflow has no slash command, suggest creating one.
- If a rule conflicts with what the project actually does, report the drift — don't silently ignore the rule.

## XR Constraints (Top-Line)

These numbers are hard limits. Details and rationale are in the rules.

| Metric | XR Glasses | PC Streaming |
|--------|-----------|--------------|
| Frame time | 11ms (90Hz) | 11ms (90Hz) |
| Draw calls | < 100 | < 300 |
| GC Alloc/frame | 0 bytes | 0 bytes |

- Never move the camera programmatically without user control (motion sickness).
- Always support both controllers and hand tracking.
- All input via OpenXR action bindings — never hardcode device-specific paths.

## Naming Convention (Quick Reference)

Unity conventions, **not** .NET. Full details in `rules/common/coding-style.md`.

| Element | Convention | Example |
|---------|-----------|---------|
| Private fields | `m_` + PascalCase | `m_Camera` |
| Constants | `k_` + PascalCase | `k_MaxRetries` |
| Static fields | `s_` + PascalCase | `s_Instance` |
| Properties/Events | camelCase | `referenceLibrary` |
| Methods/Types | PascalCase | `TryGetPose()` |

## Key Workflows

Beyond plan-implement-review, the harness provides advanced workflows:

- **Verification Loop** — `/verify` runs a 6-phase check (build, compile, analysis, tests, XR perf, diff)
- **Eval-Driven Development** — `/eval` defines success criteria upfront; `/checkpoint` creates named git save points
- **Continuous Learning** — `/learn-eval` extracts reusable patterns; `/instinct-status` shows confidence-scored instincts; `/evolve` promotes instincts into skills
- **Session Management** — `/save-session` persists state; `/sessions` lists/loads/aliases saved sessions
- **Game Design** — `/brainstorm` guides concept ideation from zero to structured design; `/design-review` validates design docs before implementation
- **Templates** — 15 document templates in `.claude/docs/templates/` for ADRs, GDDs, sprint plans, and more

## Where to Find More

This file is a guidebook, not an encyclopedia. The details live in:

- **Rules** (`.claude/rules/common/`, `.claude/rules/csharp/`) — 25 auto-loaded coding standards, XR constraints, testing, security
- **Skills** (`.claude/skills/`) — 24 slash commands for planning, review, profiling, learning, sessions
- **Agents** (`.claude/agents/`) — 18 specialist agents routed automatically by domain
- **Templates** (`.claude/docs/templates/`) — 15 document templates for design, production, and release artifacts
- **Scripts** (`.claude/scripts/lib/`) — 3 Node.js session management utilities
- **MCP Servers** (`.mcp.json`) — 5 pre-configured servers: GitHub, Context7, Exa, Figma, Unity MCP
- **Docs** (`.claude/docs/`) — agent roster, coordination map, workflow references, development plan

Run `/start-harness` if this is your first session. It detects your project state, ensures this file is harness-compliant, and routes you.


## Behavioral Guidelines

Cross-cutting principles that apply at every step of the workflow above. They bias toward caution over speed — for trivial tasks, use judgment.

### Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it — don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: every changed line should trace directly to the user's request.