---
name: start
description: "First-time onboarding for Unity XR development — detects project state, asks where you are, then guides you to the right workflow."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, AskUserQuestion
---

# Unity XR Project Onboarding

This skill is the entry point for new sessions. It detects your project state
and routes you to the right workflow.

---

## Workflow

### 1. Detect Project State (Silent)

Before asking anything, silently gather context:

Check:
- **Unity project exists?** Look for `ProjectSettings/ProjectSettings.asset`
- **Unity version?** Read `ProjectSettings/ProjectVersion.txt`
- **XR packages?** Check `Packages/manifest.json` for XR-related packages
- **Source code exists?** Glob for `Assets/Scripts/**/*.cs`
- **SDK/Runtime code?** Check for SDK or Runtime directories
- **Tests exist?** Check for `Assets/Tests/` or `Tests/`
- **Build targets?** Check for Android/Windows build settings
- **Prototypes?** Check `Assets/Prototypes/` or `Prototypes/`

Store findings internally.

---

### 2. Ask Where the User Is

> **Welcome to Unity XR Studio!**
>
> This project is configured for Unity 6.0.27f1 with XR development (XRI, OpenXR, self-developed SDK/Runtime).
>
> Where are you starting from?
>
> **A) New to this project** — I need to understand the codebase, architecture,
> and what's been built so far.
>
> **B) Continuing work** — I have a specific feature, bug, or task to work on.
>
> **C) Setting up** — I need to configure the project, packages, or build targets.
>
> **D) Reviewing/Refactoring** — I want to review code quality, performance,
> or clean up technical debt.

Wait for the user's answer.

---

### 3. Route Based on Answer

#### If A: New to this project
1. Share what you found in Step 1
2. Recommend `/onboard xr-developer` for a contextual overview
3. Suggest: `/project-stage-detect` → `/architecture-decision` → pick a task

#### If B: Continuing work
1. Ask what they want to work on
2. Route to appropriate workflow:
   - Feature: `/plan` → implement → `/code-review`
   - Bug: `/bug-report` → fix → test
   - XR interaction: involve `xr-specialist` agent
   - Performance: `/xr-perf-profile`
   - Platform build: `/build-platform`

#### If C: Setting up
1. Check what's already configured
2. Guide through: XR packages, OpenXR settings, platform targets
3. Suggest: `/build-platform validate` to verify configuration

#### If D: Reviewing/Refactoring
1. Suggest: `/code-review` for specific files
2. `/tech-debt scan` for technical debt audit
3. `/xr-perf-profile full` for performance review
4. `/asset-audit` for asset compliance

---

### 4. Confirm Before Proceeding

After presenting recommendations, ask which step they'd like first.
Never auto-run the next skill.

---

## Collaborative Protocol

1. **Ask first** — never assume the user's state or intent
2. **Present options** — give clear paths, not mandates
3. **User decides** — they pick the direction
4. **No auto-execution** — recommend, don't run without asking
