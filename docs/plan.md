# Unity XR Studio — Workflow Plan

## Status Legend

- [x] Done
- [ ] Planned / Not yet implemented

---

## 1. Foundation — Project Configuration

- [x] `CLAUDE.md` at project root with full project instructions
- [x] `.claude/settings.json` with permissions, hooks, and safety rules
- [ ] `.claude/settings.local.json` template for personal overrides
- [ ] `.gitignore` entries for Claude Code local files

---

## 2. Agents (29 active)

### XR-Specific Agents (5)
- [x] `xr-specialist` — XR interaction, tracking, spatial UI authority
- [x] `unity-xri-specialist` — XRI component architecture and patterns
- [x] `openxr-runtime-specialist` — OpenXR runtime and SDK layer
- [x] `platform-specialist` — Cross-platform build, certification, optimization
- [x] `sdk-developer` — SDK public API design, versioning, documentation

### Unity Core Agents (5)
- [x] `unity-specialist` — Unity Engine patterns, APIs, project config
- [x] `unity-shader-specialist` — Shader Graph, VFX Graph, URP
- [x] `unity-ui-specialist` — UI Toolkit, UGUI, data binding
- [x] `unity-dots-specialist` — ECS, Jobs, Burst compiler
- [x] `unity-addressables-specialist` — Asset loading, bundles, memory

### Development Agents (10)
- [x] `lead-programmer` — Code architecture, code review
- [x] `gameplay-programmer` — Feature/interaction implementation
- [x] `technical-director` — High-level technical decisions
- [x] `performance-analyst` — Performance profiling
- [x] `technical-artist` — Shaders, VFX, rendering optimization
- [x] `tools-programmer` — Editor extensions, pipeline automation
- [x] `ui-programmer` — Spatial UI implementation
- [x] `network-programmer` — Multiplayer networking
- [x] `devops-engineer` — CI/CD, build automation
- [x] `prototyper` — Rapid prototyping

### Quality, Release & Support Agents (9)
- [x] `qa-lead` — Test strategy, quality gates
- [x] `qa-tester` — Test cases, bug reports
- [x] `security-engineer` — Security analysis
- [x] `accessibility-specialist` — XR accessibility, comfort settings
- [x] `release-manager` — Platform certification, store submission
- [x] `producer` — Sprint planning, milestone tracking
- [x] `analytics-engineer` — Telemetry, data analysis
- [x] `localization-lead` — i18n, string management
- [x] `ux-designer` — User experience, interaction design

### Potential Future Agents
- [ ] `xr-comfort-specialist` — Dedicated comfort/motion sickness analysis agent
- [ ] `ar-specialist` — AR/MR-specific passthrough, spatial mapping, scene understanding
- [ ] `multiplayer-xr-specialist` — Shared XR spaces, avatar sync, co-presence
- [ ] `unity-testing-specialist` — Deep Unity Test Framework expertise
- [ ] `ci-cd-unity-specialist` — Unity-specific CI/CD (Cloud Build, GameCI)
- [ ] `documentation-writer` — API docs, guides, changelog prose

---

## 3. Skills / Slash Commands (26 active)

### XR-Specific Skills (3)
- [x] `/xr-test` — XR interaction, locomotion, comfort test generation
- [x] `/build-platform` — Cross-platform build validation (Quest, Pico, PCVR)
- [x] `/xr-perf-profile` — XR frame budget analysis (72/90/120Hz)

### Development Skills (7)
- [x] `/plan` — Implementation planning with confirmation gate
- [x] `/code-review` — Architectural and quality review
- [x] `/perf-profile` — General performance profiling
- [x] `/architecture-decision` — ADR creation
- [x] `/prototype` — Rapid prototyping workflow
- [x] `/reverse-document` — Generate docs from existing code
- [x] `/bug-report` — Structured bug report creation

### Production Skills (7)
- [x] `/sprint-plan` — Sprint planning
- [x] `/estimate` — Task effort estimation
- [x] `/scope-check` — Scope creep detection
- [x] `/milestone-review` — Milestone progress review
- [x] `/gate-check` — Phase readiness validation
- [x] `/retrospective` — Sprint/milestone retrospective
- [x] `/changelog` — Changelog generation from git

### Quality & Release Skills (5)
- [x] `/tech-debt` — Technical debt tracking
- [x] `/asset-audit` — Asset compliance audit
- [x] `/release-checklist` — Pre-release validation
- [x] `/hotfix` — Emergency fix workflow
- [x] `/localize` — Localization workflow

### Onboarding & Team Skills (4)
- [x] `/start` — Project onboarding and routing
- [x] `/onboard` — New contributor onboarding
- [x] `/team-ui` — UI team orchestration
- [x] `/team-release` — Release team orchestration
- [x] `/project-stage-detect` — Auto-detect project stage

### Potential Future Skills
- [ ] `/xr-comfort-check` — Validate comfort settings (vignette, locomotion, snap turn)
- [ ] `/xr-accessibility-audit` — XR-specific accessibility review (seated mode, one-handed, visual aids)
- [ ] `/sdk-release` — SDK-specific release workflow (semver, changelog, UPM publish)
- [ ] `/platform-cert` — Platform certification checklist (Meta, Pico store requirements)
- [ ] `/scene-audit` — Unity scene analysis (hierarchy depth, component count, draw calls)
- [ ] `/shader-review` — Shader performance review (variant count, precision, platform compat)
- [ ] `/team-xr` — Orchestrate XR team (xr-specialist + unity-xri + platform + perf)
- [ ] `/dependency-check` — Package version audit and compatibility matrix
- [ ] `/migrate-unity` — Unity version migration guide and breaking change check
- [ ] `/openxr-compliance` — OpenXR spec compliance validation for runtime code

---

## 4. Rules (25 active)

### Common Rules (19)
- [x] `agents.md` — Agent orchestration and delegation
- [x] `code-review.md` — Review standards and checklists
- [x] `coding-style.md` — Immutability, file organization, error handling
- [x] `data-files.md` — JSON/config file standards (Unity paths)
- [x] `development-workflow.md` — Feature implementation pipeline
- [x] `engine-code.md` — Core/SDK/Runtime code standards (C# examples)
- [x] `gameplay-code.md` — Interaction code standards (C# examples)
- [x] `git-workflow.md` — Commit format, PR process
- [x] `hooks.md` — Hook types and best practices
- [x] `network-code.md` — Networking standards
- [x] `patterns.md` — ScriptableObject events, service locator, state machines
- [x] `performance.md` — Model selection, context management, thinking
- [x] `prototype-code.md` — Relaxed prototype standards (Unity paths)
- [x] `security.md` — Security checks, secret management
- [x] `shader-code.md` — Shader standards (Unity/URP, XR stereo)
- [x] `test-standards.md` — Test naming, AAA pattern (C# examples)
- [x] `testing.md` — TDD workflow, 80% coverage
- [x] `ui-code.md` — Spatial UI standards (XR-specific)
- [x] `xr-development.md` — XR performance, comfort, interaction, spatial UI

### C# / Unity Rules (6)
- [x] `coding-style.md` — Unity C# conventions, ScriptableObjects, async
- [x] `hooks.md` — dotnet format, build verification
- [x] `patterns.md` — ScriptableObject config, event channels, SDK Result<T>
- [x] `security.md` — XR input validation, network security
- [x] `testing.md` — Unity Test Framework, XRDeviceSimulator, Play/Edit mode
- [x] `unity-xr.md` — XRI component patterns, naming, common pitfalls

### Potential Future Rules
- [ ] `rules/common/openxr-runtime.md` — OpenXR spec compliance rules for runtime code
- [ ] `rules/common/sdk-api.md` — SDK public API design standards
- [ ] `rules/common/accessibility.md` — XR accessibility requirements
- [ ] `rules/common/multiplatform.md` — Cross-platform code guidelines (#if usage, abstraction)
- [ ] `rules/csharp/native-interop.md` — P/Invoke, NativeArray, unsafe code standards
- [ ] `rules/hlsl/shader-standards.md` — HLSL/ShaderLab specific rules

---

## 5. Hooks (8 active)

- [x] `session-start.sh` — Load Unity XR project context (branch, Unity version, XR packages)
- [x] `detect-gaps.sh` — Detect missing docs, tests, XR packages at session start
- [x] `validate-commit.sh` — Pre-commit: JSON validation, hardcoded values, TODO format
- [x] `validate-push.sh` — Pre-push: protected branch warning, test reminder
- [x] `validate-assets.sh` — Post-write: asset naming and JSON validation
- [x] `pre-compact.sh` — Pre-compact: dump session state for recovery
- [x] `session-stop.sh` — Stop: log session summary, archive state
- [x] `log-agent.sh` — SubagentStart: audit trail for agent invocations

### Potential Future Hooks
- [ ] `validate-asmdef.sh` — Verify assembly definition consistency after script moves
- [ ] `check-meta-files.sh` — Warn on missing .meta files for new assets
- [ ] `shader-variant-check.sh` — Warn when shader variant count exceeds budget
- [ ] `package-version-check.sh` — Verify SDK package.json version matches assembly version
- [ ] `scene-size-check.sh` — Warn when scene file exceeds size threshold

---

## 6. Commands (1 active)

- [x] `/plan` — Implementation planning with XR context

### Potential Future Commands
- [ ] `/tdd` — Test-driven development guided workflow
- [ ] `/build-fix` — Automated build error resolution
- [ ] `/refactor` — Guided refactoring with safety checks

---

## 7. Documentation (.claude/docs/)

### Existing (carried from template, needs review)
- [x] `agent-coordination-map.md` — Agent hierarchy and delegation
- [x] `agent-roster.md` — Complete agent listing (needs update for XR agents)
- [x] `coding-standards.md` — Code requirements (needs Unity XR alignment)
- [x] `context-management.md` — Context window strategy
- [x] `coordination-rules.md` — Agent coordination principles
- [x] `directory-structure.md` — Project layout (needs Unity alignment)
- [x] `hooks-reference.md` — Hook configuration reference
- [x] `quick-start.md` — Onboarding guide (needs Unity XR rewrite)
- [x] `review-workflow.md` — Review hierarchy
- [x] `rules-reference.md` — Rule enforcement table
- [x] `settings-local-template.md` — Local settings template
- [x] `setup-requirements.md` — Prerequisites
- [x] `skills-reference.md` — Slash command reference (needs update)
- [x] `technical-preferences.md` — Engine/language config template
- [x] `CLAUDE-local-template.md` — Local CLAUDE.md template

### Docs Needing Update
- [ ] Update `agent-roster.md` to reflect current 29 agents
- [ ] Update `agent-coordination-map.md` with XR agent hierarchy
- [ ] Update `directory-structure.md` to match Unity project layout
- [ ] Update `quick-start.md` for Unity XR onboarding
- [ ] Update `skills-reference.md` with current 26 skills
- [ ] Update `rules-reference.md` with current 25 rules and correct paths
- [ ] Populate `technical-preferences.md` with Unity 6.0.27f1 specifics

### Potential New Docs
- [ ] `xr-architecture.md` — XR subsystem architecture diagram and data flow
- [ ] `sdk-api-guide.md` — SDK public API usage guide and conventions
- [ ] `platform-matrix.md` — Feature support matrix across Quest/Pico/PCVR
- [ ] `performance-budgets.md` — Detailed per-platform performance budgets
- [ ] `openxr-extensions.md` — Supported OpenXR extensions and usage patterns

---

## 8. Removed Content

The following were removed as irrelevant to Unity XR development:

| Category | Removed | Reason |
|----------|---------|--------|
| Agents | 24 | Godot (4), Unreal (5), game narrative/creative (7), game design (6), engine/AI (2) |
| Skills | 13 | Game design (5), game teams (4), game ops (4) |
| Rules | 13 | Java (5), C++ (5), narrative, ai-code, design-docs |

---

## 9. Priority Roadmap

### Phase 1 — Immediate (docs alignment)
Update existing `.claude/docs/` to match the restructured workflow. Fix stale references to removed agents/skills.

### Phase 2 — Near-term (XR depth)
Add `/xr-comfort-check`, `/scene-audit`, `/shader-review` skills. Add `openxr-runtime.md` and `sdk-api.md` rules. Add `.meta` file and `.asmdef` validation hooks.

### Phase 3 — Medium-term (platform maturity)
Add `/platform-cert`, `/sdk-release`, `/migrate-unity` skills. Add `ar-specialist` and `multiplayer-xr-specialist` agents. Create platform feature matrix documentation.

### Phase 4 — Long-term (CI/CD and automation)
Add `ci-cd-unity-specialist` agent. Integrate with Unity Cloud Build or GameCI. Add automated performance regression hooks. Add shader variant budget enforcement.
