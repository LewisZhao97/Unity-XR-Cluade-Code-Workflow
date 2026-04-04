# Changelog

All notable changes to XRStack will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2026-04-05

### Added

- **30 specialist agents** organized in 3 tiers (Directors, Leads, Specialists)
  - 5 XR-specific: `xr-specialist`, `unity-xri-specialist`, `openxr-runtime-specialist`, `platform-specialist`, `sdk-developer`
  - 5 Unity core: `unity-specialist`, `unity-shader-specialist`, `unity-ui-specialist`, `unity-dots-specialist`, `unity-addressables-specialist`
  - 11 development: `lead-programmer`, `gameplay-programmer`, `technical-director`, `performance-analyst`, `technical-artist`, `tools-programmer`, `ui-programmer`, `network-programmer`, `devops-engineer`, `prototyper`, `game-designer`
  - 9 quality/release/support: `qa-lead`, `qa-tester`, `security-engineer`, `accessibility-specialist`, `release-manager`, `producer`, `analytics-engineer`, `localization-lead`, `ux-designer`

- **43 slash commands** across 8 categories
  - XR-specific: `/xr-test`, `/build-platform`, `/xr-perf-profile`
  - Development: `/plan`, `/code-review`, `/perf-profile`, `/architecture-decision`, `/prototype`, `/reverse-document`, `/bug-report`, `/design-review`, `/brainstorm`
  - Production: `/sprint-plan`, `/estimate`, `/scope-check`, `/milestone-review`, `/gate-check`, `/retrospective`, `/changelog`
  - Quality & release: `/tech-debt`, `/asset-audit`, `/release-checklist`, `/hotfix`, `/localize`
  - Verification: `/verify`, `/eval`, `/checkpoint`
  - Continuous learning: `/learn-eval`, `/instinct-status`, `/evolve`, `/prune`, `/instinct-import`, `/instinct-export`, `/skill-create`
  - Session management: `/save-session`, `/sessions`, `/strategic-compact`
  - Onboarding: `/start-harness`, `/onboard`, `/team-ui`, `/team-release`, `/project-stage-detect`

- **25 auto-loaded rules**
  - 19 common rules (always active): coding style, XR development, git workflow, code review, testing, security, patterns, performance, and more
  - 6 C# rules (active for `*.cs` files): Unity conventions, XRI patterns, ScriptableObject patterns, Unity Test Framework, security, hooks

- **8 lifecycle hooks + 2 optional learning hooks**
  - Core: `session-start`, `detect-gaps`, `validate-commit`, `validate-push`, `validate-assets`, `pre-compact`, `session-stop`, `log-agent`
  - Optional: `observe` (tool use capture), `suggest-compact` (phase transition detection)

- **18 document templates** for ADRs, GDDs, sprint plans, release checklists, and more

- **3 Node.js session management scripts** for state persistence and retrieval

- **Claude Code plugin format** (`.claude-plugin/plugin.json` + `marketplace.json`) for distribution

- **CLAUDE.md template** with Unity XR project instructions, XR constraints, naming conventions, and workflow guidance

- **settings.json** with permissions, hook wiring, and safety deny-list

[0.0.1]: https://github.com/LewisZhao97/XRStack/releases/tag/v0.0.1
