---
name: team-ui
description: "Orchestrate the UI team: coordinates game-designer, ui-programmer, and technical-artist to design, implement, and polish a user interface feature from wireframe to final."
argument-hint: "[UI feature description]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, Task, AskUserQuestion, TodoWrite
---
When this skill is invoked, orchestrate the UI team through a structured pipeline.

**Decision Points:** At each phase transition, use `AskUserQuestion` to present
the user with the subagent's proposals as selectable options. The user must
approve before moving to the next phase.

## Team Composition
- **game-designer** — User flows, wireframes, interaction patterns
- **ui-programmer** — UI framework, screens, widgets, data binding, implementation
- **technical-artist** — Visual style, shaders, polish

## How to Delegate

Use the Task tool to spawn each team member as a subagent:
- `subagent_type: game-designer` — User flows, wireframes, interaction
- `subagent_type: ui-programmer` — Implementation
- `subagent_type: technical-artist` — Visual style, shader polish

Always provide full context. Launch independent agents in parallel where possible.

## Pipeline

### Phase 1: UX + Visual Design
Delegate to **game-designer** (flow + wireframes) and **technical-artist** (visual treatment) in parallel.
- Flows, states, wireframes, interaction patterns
- Colors, typography, spacing, animation style
- Output: UX spec + visual spec

### Phase 2: Implementation
Delegate to **ui-programmer**:
- Implement UI following specs
- UI never owns game state — display only, events for actions
- All text through localization
- Support controllers and hand tracking
- Output: implemented UI feature

### Phase 3: Review & Polish (parallel)
- **game-designer**: Verify flows match spec; test input paths
- **technical-artist**: Verify visual consistency; check at all resolutions
- Address feedback, finalize animations

## Output
Summary report: design status, implementation status, input support, outstanding issues.
