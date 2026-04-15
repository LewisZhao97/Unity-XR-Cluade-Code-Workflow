# XRStack Harness Test Plan

> **⚠️ OUT OF DATE**: This plan was written against the original 43-skill / 30-agent inventory. Both have since been trimmed — current state is **24 skills, 18 agents** (see [skills-reference.md](skills-reference.md) and [agent-roster.md](agent-roster.md)). Skip or adapt any case that references removed skills (`/retrospective`, `/changelog`, `/tech-debt`, `/reverse-document`, `/onboard`, `/continuous-learning-v2`, `/perf-profile`, `/estimate`, `/scope-check`, `/milestone-review`, `/gate-check`, `/hotfix`, `/localize`, `/prune`, `/strategic-compact`, `/team-release`, `/release-checklist`) or removed agents (`qa-tester`, `release-manager`, `ux-designer`, `devops-engineer`, `accessibility-specialist`, `localization-lead`, `analytics-engineer`, `network-programmer`, `prototyper`, `unity-dots-specialist`, `unity-ui-specialist`, `unity-addressables-specialist`). Use `/milestone-gate` and `qa-lead` as replacements where applicable.
>
> **Purpose**: Systematically test all harness components using a single empty Unity project and one continuous scenario.
>
> **Scenario**: Build a simple "XR Object Grabber" — a minimal XR app where the user grabs and throws cubes. Small enough to complete, complex enough to exercise the full harness.
>
> **Prerequisites**:
> - Unity 6.x installed with Android + Windows build support
> - XR Interaction Toolkit (XRI) package installed
> - OpenXR package installed
> - Node.js installed (for session scripts)
> - Empty Unity project created (just default scene)

---

## Coverage Matrix

Each phase lists exactly which items it tests. Items marked with `*` are tested implicitly (rules auto-loaded, agents auto-routed).

| Phase | Skills Tested | Agents Tested | Rules Tested | Hooks Tested | Templates Tested |
|-------|--------------|---------------|--------------|--------------|-----------------|
| 0 — Bootstrap | 2 | 0 | 25* | 2 | 0 |
| 1 — Design | 5 | 3 | 2* | 0 | 4 |
| 2 — Implement | 7 | 7 | 10* | 1 | 1 |
| 3 — Quality | 5 | 4 | 4* | 0 | 1 |
| 4 — Production | 6 | 3 | 1* | 0 | 4 |
| 5 — Session & Learning | 11 | 0 | 0 | 1 | 0 |
| 6 — Maintenance | 6 | 4 | 2* | 0 | 0 |
| 7 — Release | 4 | 4 | 1* | 2 | 3 |
| 8 — Teardown | 1 | 0 | 0 | 2 | 0 |
| **Total unique** | **43** | **~25+** | **25** | **8** | **13+** |

> Remaining templates (5) are production artifacts best tested organically — listed in Phase 7 notes.

---

## Phase 0 — Bootstrap (Session Start)

**Goal**: Verify the harness boots correctly in an empty project and detects its state.

### Steps

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 0.1 | Open a new Claude Code session in the empty Unity project | **Hooks**: `session-start.sh`, `detect-gaps.sh` | Session context printed (branch, commits). Gap detection runs and reports "NEW PROJECT" or missing items | |
| 0.2 | Run `/start-harness` | **Skill**: `start-harness` | Discovers Unity version, render pipeline, XR packages. Audits CLAUDE.md (or offers to generate one). Presents routing menu (A/B/C/D) | |
| 0.3 | Run `/project-stage-detect` | **Skill**: `project-stage-detect` | Detects project stage (likely "Pre-production" or "Setup"). Lists gaps and recommends next steps | |
| 0.4 | Verify all 25 rules are loaded | **Rules**: all 25 (auto-loaded) | Check that CLAUDE.md references the rules. Coding style, XR constraints, testing requirements should be active in responses | |

### Validation Criteria
- [ ] `session-start.sh` printed branch + recent commits
- [ ] `detect-gaps.sh` ran without errors
- [ ] `/start-harness` detected Unity version and XR packages (or noted their absence)
- [ ] `/project-stage-detect` produced a stage report
- [ ] Rules are influencing behavior (test: ask Claude to write a variable — should use `m_` prefix)

---

## Phase 1 — Design

**Goal**: Use design skills to plan the "XR Object Grabber" feature before writing code.

### Steps

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 1.1 | Run `/brainstorm` with prompt: "A simple XR demo where the user grabs cubes and throws them" | **Skill**: `brainstorm`, **Agent**: `game-designer` | Structured concept exploration with player psychology, core loop analysis. Should produce a concept document | |
| 1.2 | Run `/plan` with: "Implement an XR grab-and-throw system using XRI" | **Skill**: `plan`, **Agent**: `technical-director` | Step-by-step implementation plan with XR constraints identified (frame budget, input methods, GC). Waits for confirmation | |
| 1.3 | Run `/architecture-decision` with: "Choose between XRI direct interactor vs custom grab system" | **Skill**: `architecture-decision` | ADR document with context, alternatives, consequences. References **Template**: `architecture-decision-record.md` | |
| 1.4 | Run `/estimate` with: "Estimate effort for the XR grab-and-throw implementation plan" | **Skill**: `estimate` | Structured estimate with complexity analysis, risk factors, confidence levels | |
| 1.5 | Write a brief GDD for the grabber feature, then run `/design-review` on it | **Skill**: `design-review`, **Agent**: `producer` | Reviews for completeness, consistency, implementability. References **Templates**: `game-design-document.md`, `game-concept.md`, `technical-design-document.md` | |

### Validation Criteria
- [ ] `/brainstorm` produced structured output (not just freeform text)
- [ ] `/plan` identified XR-specific constraints (frame time, draw calls, input methods)
- [ ] `/architecture-decision` followed ADR template structure
- [ ] `/estimate` included confidence levels
- [ ] `/design-review` flagged gaps or confirmed completeness
- [ ] Agent routing worked (game-designer, technical-director invoked when appropriate)

---

## Phase 2 — Implement

**Goal**: Build the grab-and-throw feature using TDD, exercising implementation skills and coding rules.

### Pre-Implementation

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 2.1 | Run `/xr-test interaction` to generate test cases before coding | **Skill**: `xr-test` | Test plan covering hover→select→grab→release lifecycle, hand tracking vs controller, interaction layers | |
| 2.2 | Run `/eval-harness` to define evals for the grab system | **Skill**: `eval-harness` | Eval definition with capability evals (grab works, throw physics, zero GC) and regression evals | |

### Implementation

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 2.3 | Ask Claude to create the GrabThrowManager MonoBehaviour | **Rules**: `coding-style.md`, `csharp/coding-style.md`, `csharp/unity-xr.md`, `xr-development.md` | Code uses `m_` prefix, `[SerializeField] private`, Allman braces, no GC in Update. Should mention XRI components | |
| 2.4 | Ask Claude to create a ThrowableObject script | **Rules**: `csharp/patterns.md`, `gameplay-code.md`, `engine-code.md` | Follows Unity patterns, proper component architecture | |
| 2.5 | Verify `.meta` file handling | **Hook**: `validate-assets.sh` | After Write/Edit of .cs files, hook validates naming conventions. Should warn if meta files are missing | |
| 2.6 | Ask Claude to review the code it wrote | **Skill**: `code-review`, **Agents**: `lead-programmer`, `xr-specialist` | Code review with severity levels (CRITICAL/HIGH/MEDIUM/LOW). XR specialist checks for XR safety | |
| 2.7 | Ask Claude to write EditMode tests for the grab logic | **Rules**: `testing.md`, `test-standards.md`, `csharp/testing.md` | Tests follow TDD, use Unity Test Framework, NUnit. 80% coverage target mentioned | |
| 2.8 | Run `/checkpoint "grab-system-v1"` | **Skill**: `checkpoint` | Creates named git checkpoint, logs to `.claude/checkpoints.log` | |
| 2.9 | Run `/verification-loop` | **Skill**: `verification-loop` | 6-phase verification: Build → Compile → Analysis → Tests → XR Perf → Diff. Produces PASS/FAIL report | |

### Agent Routing (observe during implementation)

| Agent | How It Gets Tested | What to Watch For |
|-------|--------------------|-------------------|
| `unity-specialist` | Auto-routed when Unity API questions arise | Correct Unity 6.x guidance |
| `unity-xri-specialist` | Auto-routed for XRI interaction setup | XRI component recommendations |
| `gameplay-programmer` | Auto-routed for feature implementation | Clean implementation code |
| `lead-programmer` | Via `/code-review` | Code quality feedback |
| `xr-specialist` | Via XR-related implementation questions | XR safety checks |
| `unity-shader-specialist` | If material/shader work needed for cubes | Shader guidance |
| `performance-analyst` | Via `/verification-loop` Phase 5 | Performance analysis |

### Validation Criteria
- [ ] Code follows Unity naming conventions (`m_`, `k_`, `s_`)
- [ ] `[SerializeField] private` used instead of public fields
- [ ] No GC allocations in Update/FixedUpdate (rule enforced)
- [ ] XRI components used correctly (not custom from scratch)
- [ ] `validate-assets.sh` hook fired on file creation
- [ ] `/code-review` produced structured severity report
- [ ] `/verification-loop` ran all 6 phases and produced report
- [ ] `/checkpoint` created a git tag/commit
- [ ] Tests were written before or alongside implementation

---

## Phase 3 — Quality & Performance

**Goal**: Deep quality and performance validation.

### Steps

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 3.1 | Run `/xr-perf-profile full` | **Skill**: `xr-perf-profile`, **Agent**: `performance-analyst` | Frame budget analysis for 90Hz, GPU/CPU split, draw call count, GC analysis. Checks against hard limits (<11ms, <100 draws, 0 GC) | |
| 3.2 | Run `/perf-profile` (generic) | **Skill**: `perf-profile` | General performance profiling, bottleneck identification, optimization recommendations with priority | |
| 3.3 | Run `/build-platform validate` | **Skill**: `build-platform`, **Agent**: `platform-specialist` | Validates Android build settings for XR glasses, PC streaming config, quality levels, Addressables groups | |
| 3.4 | Ask Claude to review shaders/materials for the throwable cubes | **Agent**: `technical-artist` | Rendering optimization advice, URP compatibility check | |
| 3.5 | Ask about accessibility for the grab interaction | **Agent**: `accessibility-specialist` | Comfort settings, seated mode support, input remapping recommendations. References **Template**: `test-plan.md` | |

### Validation Criteria
- [ ] `/xr-perf-profile` reported against all 4 metrics (frame time, draws, GC, triangles)
- [ ] `/perf-profile` identified at least one optimization area
- [ ] `/build-platform validate` checked both XR glasses and PC streaming targets
- [ ] Technical artist agent gave rendering advice
- [ ] Accessibility specialist identified comfort considerations

---

## Phase 4 — Production Planning

**Goal**: Exercise production and sprint management skills.

### Steps

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 4.1 | Run `/sprint-plan` for a 2-week sprint | **Skill**: `sprint-plan`, **Agent**: `producer` | Sprint plan with capacity, priorities, task breakdown. References **Template**: `sprint-plan.md` | |
| 4.2 | Run `/scope-check` against the original plan from Phase 1 | **Skill**: `scope-check` | Scope analysis comparing current vs planned. Flags any additions, quantifies bloat | |
| 4.3 | Run `/milestone-review` | **Skill**: `milestone-review` | Progress review: feature completeness %, quality metrics, risk assessment, go/no-go. References **Template**: `milestone-definition.md` | |
| 4.4 | Run `/retrospective` | **Skill**: `retrospective` | Sprint retrospective analyzing work done, velocity, blockers, patterns | |
| 4.5 | Run `/tech-debt` | **Skill**: `tech-debt` | Scans codebase for debt indicators, categorizes, prioritizes. Creates debt register | |
| 4.6 | Run `/gate-check` for "pre-production → production" transition | **Skill**: `gate-check` | Phase gate validation with PASS/CONCERNS/FAIL verdict. Lists blockers and required artifacts. References **Template**: `project-stage-report.md` | |

### Validation Criteria
- [ ] `/sprint-plan` produced actionable sprint backlog
- [ ] `/scope-check` compared against plan (even if scope unchanged)
- [ ] `/milestone-review` gave a go/no-go recommendation
- [ ] `/retrospective` produced actionable insights
- [ ] `/tech-debt` identified at least one category of debt
- [ ] `/gate-check` produced a clear verdict with rationale

---

## Phase 5 — Session Management & Learning

**Goal**: Test the continuous learning pipeline and session management.

### Session Management

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 5.1 | Run `/save-session` | **Skill**: `save-session` | Saves session state to `~/.claude/session-data/YYYY-MM-DD-<id>-session.tmp` | |
| 5.2 | Run `/sessions list` | **Skill**: `sessions` | Lists saved sessions with dates, IDs, sizes. Node.js scripts execute without errors | |
| 5.3 | Run `/sessions alias <id> "grab-feature-test"` | **Skill**: `sessions` (alias subcommand) | Creates alias in `~/.claude/session-aliases.json`. Alias appears in subsequent list | |
| 5.4 | Run `/sessions info <id>` | **Skill**: `sessions` (info subcommand) | Shows session details: date, size, summary | |

### Continuous Learning

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 5.5 | Run `/continuous-learning-v2` to review setup instructions | **Skill**: `continuous-learning-v2` | Explains instinct architecture, shows hook setup for observe.sh, config.json settings | |
| 5.6 | Run `/instinct-status` | **Skill**: `instinct-status` | Shows current instincts (likely empty for new project). Displays project hash, scope info | |
| 5.7 | Run `/learn-eval` on the grab feature work from Phase 2 | **Skill**: `learn-eval` | Extracts patterns from session. Quality gate checklist. Holistic verdict (Save/Improve/Absorb/Drop) | |
| 5.8 | Run `/evolve` | **Skill**: `evolve` | Analyzes instincts (if any) and suggests evolution into skills/commands/agents | |
| 5.9 | Run `/prune` | **Skill**: `prune` | Checks for stale instincts (>30 days). Reports pruned count or "nothing to prune" | |
| 5.10 | Run `/instinct-export` | **Skill**: `instinct-export` | Exports instincts to shareable format (even if empty, should not error) | |
| 5.11 | Run `/instinct-import` with a sample instinct file | **Skill**: `instinct-import` | Imports instinct(s) into project scope | |

### Context Management

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 5.12 | Trigger `/compact` after enough tool calls | **Hook**: `pre-compact.sh` | Hook dumps session state before compaction. State includes git status, WIP markers, recovery info | |
| 5.13 | Run `/strategic-compact` | **Skill**: `strategic-compact` | Suggests whether compaction is appropriate at current phase. References suggest-compact.sh | |

### Validation Criteria
- [ ] `/save-session` created a file in `~/.claude/session-data/`
- [ ] `/sessions list` executed Node.js scripts without errors
- [ ] `/sessions alias` created entry in `~/.claude/session-aliases.json`
- [ ] `/instinct-status` ran without errors (empty is OK)
- [ ] `/learn-eval` produced a pattern extraction with quality gate
- [ ] `/evolve` ran without errors
- [ ] `/prune` ran without errors
- [ ] `/instinct-export` and `/instinct-import` ran without errors
- [ ] `pre-compact.sh` fired during compaction

---

## Phase 6 — Maintenance & Cross-Cutting

**Goal**: Test remaining utility skills and specialist agents.

### Steps

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 6.1 | Run `/asset-audit` on the project | **Skill**: `asset-audit` | Audits naming conventions, file sizes, formats, orphaned assets. Even on small project, should produce a report | |
| 6.2 | Run `/localize` | **Skill**: `localize`, **Agent**: `localization-lead` | Scans for hardcoded strings, checks i18n readiness. Reports what needs extraction | |
| 6.3 | Run `/bug-report "Cubes sometimes fall through floor on fast throw"` | **Skill**: `bug-report`, **Agent**: `qa-tester` | Structured bug report with reproduction steps, expected vs actual, severity | |
| 6.4 | Run `/reverse-document` on the grab system code | **Skill**: `reverse-document` | Generates design/architecture doc from existing implementation (reverse engineering) | |
| 6.5 | Run `/onboard xr-developer` | **Skill**: `onboard` | Contextual onboarding doc: project state, architecture, conventions, current priorities | |
| 6.6 | Run `/prototype` with: "Quick test of physics-based hand throwing" | **Skill**: `prototype`, **Agent**: `prototyper` | Rapid prototype with relaxed standards. Produces throwaway code + prototype report | |

### Additional Agent Testing

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 6.7 | Ask about network sync for multiplayer grab | **Agent**: `network-programmer` | Networking advice for state replication of grab interactions | |
| 6.8 | Ask about security for a leaderboard (throw distance) | **Agent**: `security-engineer` | Security review: anti-cheat, data validation, input sanitization. References **Rule**: `security.md`, `csharp/security.md` | |
| 6.9 | Ask Claude to create an editor tool for placing throwable objects | **Agent**: `tools-programmer` | Editor extension code with proper Editor/ folder structure | |
| 6.10 | Ask about UI for a score display | **Agent**: `ui-programmer`, `unity-ui-specialist` | UI implementation guidance (Canvas/UI Toolkit), world-space for XR | |

### Validation Criteria
- [ ] `/asset-audit` produced structured audit report
- [ ] `/localize` identified hardcoded strings (if any)
- [ ] `/bug-report` followed structured format with reproduction steps
- [ ] `/reverse-document` generated a document from code
- [ ] `/onboard` produced role-specific onboarding content
- [ ] `/prototype` explicitly relaxed normal standards for speed
- [ ] Specialist agents responded with domain-appropriate expertise

---

## Phase 7 — Release & Git

**Goal**: Test release workflow, git hooks, and orchestration skills.

### Release Workflow

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 7.1 | Run `/release-checklist` | **Skill**: `release-checklist` | Pre-release validation checklist: build, certification, store metadata, launch readiness. References **Template**: `release-checklist-template.md` | |
| 7.2 | Run `/changelog` | **Skill**: `changelog` | Auto-generates changelog from git commits. Both internal and player-facing versions. References **Template**: `changelog-template.md`, `release-notes.md` | |
| 7.3 | Run `/hotfix "Fix physics collision layer on grab release"` | **Skill**: `hotfix` | Emergency fix workflow: creates hotfix branch, audit trail, backport plan | |
| 7.4 | Run `/skill-create` to see if it detects patterns from this session | **Skill**: `skill-create` | Analyzes git log, detects patterns, generates or suggests SKILL.md creation | |

### Orchestration Skills

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 7.5 | Run `/team-release` | **Skill**: `team-release`, **Agents**: `release-manager`, `qa-lead`, `devops-engineer`, `producer` | Multi-agent orchestration: coordinates release from candidate to deployment | |
| 7.6 | Run `/team-ui` with: "Create a throw-distance scoreboard UI" | **Skill**: `team-ui`, **Agents**: `ux-designer`, `ui-programmer` | Multi-agent orchestration: wireframe → implementation → polish | |

### Git Hooks

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 7.7 | Ask Claude to commit the grab feature code | **Hook**: `validate-commit.sh` | Hook validates commit message format (conventional commits). Blocks bad format | |
| 7.8 | Ask Claude to push to remote | **Hook**: `validate-push.sh` | Hook warns about protected branch pushes. Validates push target | |

### Remaining Templates (verify existence, tested organically)

| Template | Tested Via |
|----------|-----------|
| `post-mortem.md` | `/retrospective` references it |
| `risk-register-entry.md` | `/plan` or `/estimate` risk sections |
| `systems-index.md` | `/reverse-document` output |
| `game-pillars.md` | `/brainstorm` output |
| `architecture-doc-from-code.md` | `/reverse-document` |
| `concept-doc-from-prototype.md` | `/prototype` |
| `design-doc-from-implementation.md` | `/reverse-document` |

### Validation Criteria
- [ ] `/release-checklist` produced comprehensive checklist
- [ ] `/changelog` generated from git history
- [ ] `/hotfix` created proper branch workflow
- [ ] `/team-release` spawned multiple agents in coordination
- [ ] `/team-ui` spawned UX + UI agents
- [ ] `validate-commit.sh` fired and validated commit message
- [ ] `validate-push.sh` fired and checked push target

---

## Phase 8 — Teardown & Session End

**Goal**: Verify session-end hooks and cleanup.

| # | Action | Tests | Expected Result | Pass? |
|---|--------|-------|-----------------|-------|
| 8.1 | Run `/simplify` on changed files | **Skill**: `simplify` | Reviews changed code for reuse opportunities, quality, efficiency | |
| 8.2 | End the session (exit Claude Code) | **Hook**: `session-stop.sh` | Logs session summary and recent commits for audit trail | |
| 8.3 | Verify `log-agent.sh` fired during session | **Hook**: `log-agent.sh` | Check that agent invocations were logged (review log output from earlier phases) | |

### Validation Criteria
- [ ] `session-stop.sh` produced session summary
- [ ] `log-agent.sh` logged agent invocations during session

---

## Quick Reference: Item-to-Phase Mapping

### All 43 Skills

| Skill | Phase | Step |
|-------|-------|------|
| start-harness | 0 | 0.2 |
| project-stage-detect | 0 | 0.3 |
| brainstorm | 1 | 1.1 |
| plan | 1 | 1.2 |
| architecture-decision | 1 | 1.3 |
| estimate | 1 | 1.4 |
| design-review | 1 | 1.5 |
| xr-test | 2 | 2.1 |
| eval-harness | 2 | 2.2 |
| code-review | 2 | 2.6 |
| checkpoint | 2 | 2.8 |
| verification-loop | 2 | 2.9 |
| xr-perf-profile | 3 | 3.1 |
| perf-profile | 3 | 3.2 |
| build-platform | 3 | 3.3 |
| sprint-plan | 4 | 4.1 |
| scope-check | 4 | 4.2 |
| milestone-review | 4 | 4.3 |
| retrospective | 4 | 4.4 |
| tech-debt | 4 | 4.5 |
| gate-check | 4 | 4.6 |
| save-session | 5 | 5.1 |
| sessions | 5 | 5.2–5.4 |
| continuous-learning-v2 | 5 | 5.5 |
| instinct-status | 5 | 5.6 |
| learn-eval | 5 | 5.7 |
| evolve | 5 | 5.8 |
| prune | 5 | 5.9 |
| instinct-export | 5 | 5.10 |
| instinct-import | 5 | 5.11 |
| strategic-compact | 5 | 5.13 |
| asset-audit | 6 | 6.1 |
| localize | 6 | 6.2 |
| bug-report | 6 | 6.3 |
| reverse-document | 6 | 6.4 |
| onboard | 6 | 6.5 |
| prototype | 6 | 6.6 |
| release-checklist | 7 | 7.1 |
| changelog | 7 | 7.2 |
| hotfix | 7 | 7.3 |
| skill-create | 7 | 7.4 |
| team-release | 7 | 7.5 |
| team-ui | 7 | 7.6 |
| simplify | 8 | 8.1 |

### All 8 Hooks

| Hook | Phase | Step |
|------|-------|------|
| session-start.sh | 0 | 0.1 |
| detect-gaps.sh | 0 | 0.1 |
| validate-assets.sh | 2 | 2.5 |
| pre-compact.sh | 5 | 5.12 |
| validate-commit.sh | 7 | 7.7 |
| validate-push.sh | 7 | 7.8 |
| session-stop.sh | 8 | 8.2 |
| log-agent.sh | 8 | 8.3 |

### Agents Tested (by routing)

| Agent | Phase | How Triggered |
|-------|-------|---------------|
| game-designer | 1 | `/brainstorm` |
| technical-director | 1 | `/plan`, `/architecture-decision` |
| producer | 1, 4 | `/design-review`, `/sprint-plan` |
| xr-specialist | 2 | XR implementation questions |
| unity-xri-specialist | 2 | XRI component setup |
| unity-specialist | 2 | Unity API questions |
| gameplay-programmer | 2 | Feature implementation |
| lead-programmer | 2 | `/code-review` |
| unity-shader-specialist | 2 | Material/shader questions |
| performance-analyst | 3 | `/xr-perf-profile` |
| platform-specialist | 3 | `/build-platform` |
| technical-artist | 3 | Rendering questions |
| accessibility-specialist | 3 | Comfort/accessibility |
| qa-tester | 6 | `/bug-report` |
| qa-lead | 7 | `/team-release` |
| localization-lead | 6 | `/localize` |
| prototyper | 6 | `/prototype` |
| network-programmer | 6 | Multiplayer questions |
| security-engineer | 6 | Security review |
| tools-programmer | 6 | Editor tool creation |
| ui-programmer | 6 | UI questions |
| unity-ui-specialist | 6 | UI implementation |
| ux-designer | 7 | `/team-ui` |
| release-manager | 7 | `/team-release` |
| devops-engineer | 7 | `/team-release` |

**Agents not explicitly tested** (require specific contexts):
- `openxr-runtime-specialist` — Needs native runtime work (out of scope per CLAUDE.md)
- `sdk-developer` — Needs SDK package at `Packages/com.*.xr.sdk/`
- `unity-dots-specialist` — Needs ECS/DOTS code
- `unity-addressables-specialist` — Needs Addressable asset groups
- `analytics-engineer` — Needs telemetry/analytics work

> These 5 agents serve specialized domains. To test them, add a mini-step: ask Claude a question in each domain and verify routing. No implementation needed.

---

## Execution Notes

### Session Strategy

This plan spans **~50+ interactions**. You have three options:

1. **Single marathon session** — Run all phases sequentially. Context will compact around Phase 4-5. Use `/save-session` before compaction points.

2. **Multi-session** (recommended) — Split into 3 sessions:
   - Session A: Phases 0–2 (Bootstrap → Implement)
   - Session B: Phases 3–5 (Quality → Learning)
   - Session C: Phases 6–8 (Maintenance → Release)
   - Use `/save-session` at end of each, `/sessions load` at start of next

3. **Cherry-pick** — Test specific phases independently. Phase 0 must always run first.

### Grading

For each step, record:

| Grade | Meaning |
|-------|---------|
| PASS | Skill/hook/agent worked as documented |
| PARTIAL | Ran but output was incomplete or had minor issues |
| FAIL | Error, didn't trigger, or wrong behavior |
| SKIP | Couldn't test (missing dependency, context limit) |

### Known Limitations

- **Build/compile phases** (verification-loop Phase 1-2, build-platform) require Unity Editor accessible via CLI. If `UNITY_PATH` is not set, these will SKIP.
- **PlayMode tests** require Unity Editor running.
- **XR performance profiling** produces estimates from code analysis, not runtime profiler data, unless connected to Unity MCP.
- **Orchestration skills** (`team-release`, `team-ui`) spawn multiple agents — costs are higher and may hit rate limits.
- **Continuous learning hooks** (observe.sh) require manual setup in `settings.json` — they're optional and won't fire unless configured.

### Tracking Results

Create a simple results file as you go:

```markdown
# Harness Test Results — [DATE]

## Phase 0
- [ ] 0.1 session-start.sh: 
- [ ] 0.2 start-harness: 
- [ ] 0.3 project-stage-detect: 
- [ ] 0.4 rules loaded: 

## Phase 1
...
```

Save to `.claude/docs/harness-test-results.md` after completion.
