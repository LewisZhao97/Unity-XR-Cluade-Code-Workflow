# XRStack v0.0.1 — Initial Release

The first public release of XRStack, a Claude Code harness for Unity XR development.

## What's In the Box

| Component | Count |
|-----------|-------|
| Specialist agents | 30 |
| Slash commands | 43 |
| Auto-loaded rules | 25 |
| Lifecycle hooks | 8 + 2 optional |
| Document templates | 18 |
| Session scripts | 3 |

## Highlights

**XR-first workflow** — Frame budgets (11ms/90Hz), draw call limits (<100 mobile, <300 PC), zero-GC hot paths, and comfort constraints are baked into every agent, rule, and skill. Not bolted on after the fact.

**30 specialist agents** — From `xr-specialist` (hand tracking, spatial UI) to `performance-analyst` (frame budget analysis) to `sdk-developer` (UPM versioning). Organized in 3 tiers: Directors (Opus), Leads (Sonnet), Specialists (Sonnet/Haiku).

**43 slash commands** — `/plan` before coding, `/code-review` after coding, `/xr-test` for XR-specific tests, `/verify` for 6-phase validation, `/brainstorm` for concept ideation, `/save-session` for state persistence.

**Mechanical enforcement** — Hooks validate commits, block force-pushes, detect missing docs, and audit agent invocations. Rules auto-load by file type. `settings.json` deny-lists dangerous commands. Conventions are enforced, not documented and hoped for.

**Continuous learning** — `/learn-eval` extracts patterns from sessions. `/instinct-status` tracks confidence-scored learned behaviors. `/evolve` promotes instincts into skills. The harness gets better over time.

**Plugin distribution** — Install via Claude Code's plugin system (`/plugin install xrstack@xrstack`) or copy the `.claude/` folder directly. Both work.

## Installation

```bash
# Option A — Plugin (recommended, auto-updates)
/plugin marketplace add LewisZhao97/XRStack
/plugin install xrstack@xrstack

# Option B — Git submodule
git submodule add https://github.com/LewisZhao97/XRStack.git XRStack
# Then symlink .claude/ to XRStack/.claude/

# Option C — Direct copy
cp -r XRStack/.claude YourProject/.claude
cp XRStack/CLAUDE.md YourProject/CLAUDE.md
```

## Requirements

- Claude Code CLI
- Unity 6.x project
- Git, Bash (Git Bash on Windows)
- Recommended: jq, Python 3, Node.js

## Known Limitations

- MCP server integrations not yet included (planned)
- Plugin marketplace submission to Anthropic pending
- Hooks require Bash (Git Bash on Windows)
- Continuous learning observation hooks require Python 3

## What's Next

See the [development plan](.claude/docs/agent-development-plan.md) for the full roadmap. Near-term priorities:

- `/xr-comfort-check`, `/scene-audit`, `/shader-review` skills
- OpenXR runtime and SDK API rules
- `.meta` file and `.asmdef` validation hooks
- MCP server integrations
