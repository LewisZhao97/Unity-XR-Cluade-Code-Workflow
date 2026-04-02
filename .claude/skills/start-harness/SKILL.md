---
name: start-harness
description: "Entry point for every session. Discovers project state, ensures CLAUDE.md is harness-compliant, then routes you to the right workflow."
argument-hint: "[no arguments]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, AskUserQuestion, Bash
---

# Start Harness

Single entry point: discover → ensure harness compliance → route to workflow.

---

## Step 1 — Discover Project State (Silent)

Before asking anything, silently gather context.

### Unity Project
- **Unity version**: Read `ProjectSettings/ProjectVersion.txt`
- **Render pipeline**: Check `ProjectSettings/ProjectSettings.asset` for URP/HDRP/Built-in
- **Rendering mode**: Check XR settings for Single Pass Instanced / Multi-pass

### XR Stack
- **XR packages**: Read `Packages/manifest.json` — look for:
  - `com.unity.xr.interaction.toolkit` (XRI)
  - `com.unity.xr.openxr` (OpenXR plugin)
  - `com.unity.xr.arfoundation` (AR Foundation)
  - `com.unity.xr.hands` (Hand tracking)
  - Any custom SDK packages (`com.*.xr.*` or `com.*.sdk`)
- **XR platform targets**: Check build settings for Android/Windows/iOS

### SDK / Runtime
- **SDK package path**: Glob for `Packages/com.*.xr.*/package.json` or `Packages/com.*.sdk/package.json`
- **SDK structure**: If found, check `Runtime/`, `Editor/`, `Tests/` subdirectories
- **Native runtime**: Check for `.aar`, `.so`, `.dll` files inside SDK package

### Codebase
- **Script folders**: Glob `Assets/Scripts/*/`
- **Test folders**: Check `Assets/Tests/`, `Tests/`, or `*.Tests.asmdef`
- **Assembly definitions**: Glob `**/*.asmdef`
- **Existing conventions**: Sample 2-3 `.cs` files to detect naming style (m_ vs _ vs none)

### Harness State
- **CLAUDE.md exists?** Check project root
- **`.claude/` exists?** Check rules/, skills/, hooks/, agents/
- **Prototypes?** Check `Assets/Prototypes/` or `Prototypes/`

Store all findings. Do NOT output raw discovery — synthesize for later steps.

---

## Step 2 — Ensure CLAUDE.md Harness Compliance

Branch based on what Step 1 found:

### If no CLAUDE.md exists → Generate one

Ask the user ONLY what couldn't be detected:
- Target platforms (confirm detected or ask)
- Target frame rate (72/90/120Hz)
- Hand tracking, controllers, or both
- Any project-specific constraints

Then generate `CLAUDE.md` following the rules in **CLAUDE.md Generation** below.
Present the result, wait for confirmation, then write to project root.

### If CLAUDE.md exists → Audit for compliance

Read the existing CLAUDE.md and check for these **required sections**:

| # | Section | What to check |
|---|---------|---------------|
| 1 | **Project Identity** | Has tech stack table with real values (not placeholders) |
| 2 | **Collaboration Protocol** | Defines authority boundaries (proceed / ask / out of scope) |
| 3 | **How to Work** | Has ordered development process (understand → plan → implement → review → commit) |
| 4 | **Session Awareness** | Mentions git status, compaction recovery |
| 5 | **Self-Correction** | Mentions flagging gaps, suggesting commands, reporting drift |
| 6 | **XR Constraints** | Has hard limits table matching actual platform targets |
| 7 | **Naming Convention** | Has quick reference matching actual codebase style |
| 8 | **Where to Find More** | Points to rules/, skills/, agents/ — paths must exist |

**Compliance check:**
- Missing section → Flag it, draft the section from discovery data
- Placeholder values (`TODO`, `<your-project>`, `com.yourcompany`) → Replace with real values
- Stale values (Unity version mismatch, missing XR packages) → Update from discovery
- Over 150 lines → Identify content that should be extracted to rules
- Duplicates rule content → Replace with quick reference + pointer

If issues found, present a summary:
> "Your CLAUDE.md is missing [sections] and has [N] stale values. Here's what I'd fix: [changes]. Apply?"

Wait for confirmation before modifying the file.

If CLAUDE.md passes all checks, say so briefly and move to Step 3.

---

## Step 3 — Route to Workflow

> **Welcome to Unity XR Studio!**
>
> [Summarize what was detected: Unity version, XR packages, project size]
>
> Where are you starting from?
>
> **A) New to this project** — I need to understand the codebase and architecture.
>
> **B) Continuing work** — I have a specific feature, bug, or task.
>
> **C) Setting up** — I need to configure packages or build targets.
>
> **D) Reviewing/Refactoring** — I want to review quality or clean up debt.

Wait for the user's answer.

### Route A: New to this project
1. Share discovery findings from Step 1
2. Recommend `/onboard xr-developer` for contextual overview
3. Suggest: `/project-stage-detect` → `/architecture-decision` → pick a task

### Route B: Continuing work
1. Ask what they want to work on
2. Route to workflow:
   - Feature → `/plan` → implement → `/code-review`
   - Bug → `/bug-report` → fix → test
   - XR interaction → involve `xr-specialist` agent
   - Performance → `/xr-perf-profile`
   - Platform build → `/build-platform`

### Route C: Setting up
1. Check what's already configured from Step 1
2. Guide through: XR packages, OpenXR settings, platform targets
3. Suggest: `/build-platform validate` to verify

### Route D: Reviewing/Refactoring
1. `/code-review` for specific files
2. `/tech-debt scan` for debt audit
3. `/xr-perf-profile full` for performance review
4. `/asset-audit` for asset compliance

After presenting recommendations, ask which step they'd like first.
Never auto-run the next skill.

---

## CLAUDE.md Generation

When generating a new CLAUDE.md (Step 2, no existing file), follow these rules:

### Required Sections (in order)

1. **Project Identity** — Compact table. Only facts from discovery. No aspirations.
2. **Collaboration Protocol** — Standard: collaborative implementer, authority boundary table. Adjust "out of scope" based on detected native runtime / platform-specific code.
3. **How to Work** — 5-step process (understand → plan → implement → review → commit). Reference actual project frameworks and paths.
4. **Session Awareness** — Standard: git status check, compaction recovery, `/start-harness` to re-orient.
5. **Self-Correction** — Standard: flag gaps, suggest commands, report drift.
6. **XR Constraints** — Hard limits from confirmed platform targets. Frame time, draw calls, GC.
7. **Naming Convention** — Quick reference (5 rows max) matching detected codebase style. Point to rule for full details.
8. **Where to Find More** — Pointers to rules/, skills/, agents/, docs/. Verify paths exist.

### Design Principles

- **Guidebook, not wiki.** Each section scannable in 5 seconds.
- **Process, not dump.** "How to Work" is a sequence, not a list of facts.
- **References, not duplication.** If a rule covers it, point there.
- **Project-specific.** Every value from discovery. No `<placeholder>`.
- **Under 150 lines.** If longer, extract to rules.

---

## Rules

- **NEVER skip Step 1.** Discovery is mandatory — even if you think you know the project.
- **NEVER auto-write CLAUDE.md.** Always present and get confirmation first.
- **If no Unity project detected** (no ProjectSettings/), inform the user and ask if they want a generic template or want to set up the project first.
- **Preserve user customizations.** When auditing existing CLAUDE.md, don't overwrite sections that are correct — only fix what's missing or stale.
- **Ask first, present options, user decides, no auto-execution.**
