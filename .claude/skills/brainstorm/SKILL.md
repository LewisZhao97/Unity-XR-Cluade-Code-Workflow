---
name: brainstorm
description: "Guided game concept ideation — from zero idea to a structured game concept document. Uses professional studio ideation techniques, player psychology frameworks, and structured creative exploration."
argument-hint: "[genre or theme hint, or 'open' for fully open brainstorm]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, WebSearch, AskUserQuestion
---

When this skill is invoked:

1. **Parse the argument** for an optional genre/theme hint (e.g., `roguelike`,
   `space survival`, `cozy farming`). If `open` or no argument, start from
   scratch.

2. **Check for existing concept work**:
   - Read `docs/app design docs/game-concept.md` if it exists (resume, don't restart)
   - Read `docs/app design docs/game-pillars.md` if it exists (build on established pillars)
   - Read `docs/app design docs/xr-constraints.md` if it exists (resume device envelope)

3. **Run through ideation phases** interactively, asking the user questions at
   each phase. **Always start with Phase 0 (XR Pre-Phase)** — this harness is
   XR-only, so device discovery is mandatory before concept work. Do NOT
   generate everything silently — the goal is **collaborative exploration**
   where the AI acts as a creative facilitator, not a replacement for the
   human's vision.

   **Use `AskUserQuestion`** at key decision points throughout brainstorming:
   - Constrained taste questions (genre preferences, scope, team size)
   - Concept selection ("Which 2-3 concepts resonate?") after presenting options
   - Direction choices ("Develop further, explore more, or prototype?")
   - Pillar ranking after concepts are refined
   Write full creative analysis in conversation text first, then use
   `AskUserQuestion` to capture the decision with concise labels.

   Professional studio brainstorming principles to follow:
   - Withhold judgment — no idea is bad during exploration
   - Encourage unusual ideas — outside-the-box thinking sparks better concepts
   - Build on each other — "yes, and..." responses, not "but..."
   - Use constraints as creative fuel — limitations often produce the best ideas
   - Time-box each phase — keep momentum, don't over-deliberate early

---

### Phase 0: XR Device Discovery

XR design constraints aren't generic — they cascade from the specific device's
display, input, tracking, and performance class. **Concept generation without
this discovery produces concepts that look great on paper and fail on
hardware.** Run this phase before Phase 1.

Gather these facts before any concepts are generated:

**Display type**:
- Optical see-through (transparent panels — additive blending, no true black,
  real world always visible). Most AR glasses.
- Passthrough / camera-MR (camera-based composition — opaque visuals possible,
  some latency, mid-FOV).
- Immersive (full VR, no real world).

Each has dramatically different implications for art direction (additive
displays cannot render black; opaque visuals open the full palette), session
type (immersion supports longer sessions; AR glasses support shorter ones),
and content scale (AR favors tabletop; VR supports room-scale).

**Input modalities**:
- Controllers (6DOF) — precise pointing, button input, optional haptics.
- Hand tracking — full per-joint pose, or recognized gestures only? Is pinch
  detected as a discrete event or inferred from thumb-index distance? Is
  two-handed simultaneous tracking robust, or does one hand drop out when
  they're close?
- Eye tracking, voice input.

Hand-tracking fidelity is often the most consequential and most uncertain
input variable. If unknown at this stage, flag it as the **#1 blocking
question** to resolve before Phase 7 architecture.

**Tracking and form factor**:
- 3DOF (rotation only) vs 6DOF (position + rotation).
- Stationary, room-scale, or world-scale.
- Tethered (PC) vs standalone (mobile-class compute).

**Performance class**:
- Refresh rate target (60 / 72 / 90 / 120 Hz).
- Frame budget = 1000 ms ÷ refresh rate. Standalone glasses are typically
  10–13 ms; tethered VR can be more generous.
- GPU/CPU class (mobile-class chip vs full PC GPU).

**Session profile** (sets expectations for Phase 3):
- AR glasses: 5–15 min typical, often shorter.
- Standalone VR: 20–45 min before fatigue.
- Tethered VR: 30–90 min possible.

**Comfort defaults** the device imposes:
- Arm fatigue (gorilla arm) on hands-only devices.
- Neck strain risk if content sits above eye line.
- Motion sickness risk on VR/MR with camera movement.
- Eye strain on small text, dense detail, or low refresh rate.

**Synthesize the XR Envelope**

After collecting these facts, articulate **what kinds of experiences fit
this device class and what does not**. Examples of valid envelopes:

- *"Optical-see-through AR glasses, hand-tracking, 50° FOV, ~11 ms budget,
  5–15 min sessions. Envelope: tabletop creator toys, productivity, light
  utilities. Bright stylized art only. Content within arm's reach.
  Anti-envelope: room-scale immersion, photorealism, dark atmospheres,
  long sessions."*
- *"Passthrough MR with controllers, 110° FOV, ~13 ms budget, 30 min
  sessions. Envelope: room-scale interactive content, mid-fidelity 3D,
  controller-precision input. Anti-envelope: subtle hand interaction,
  ultra-tight perf, low latency requirements."*

Read the envelope back to the user. Confirm before Phase 1.

**The envelope is a hard filter on Phase 2.** Concepts that don't fit are
not considered.

---

### Phase 1: Creative Discovery

Start by understanding the person, not the game. Ask these questions
conversationally (not as a checklist):

**Emotional anchors**:
- What's a moment in a game that genuinely moved you, thrilled you, or made
  you lose track of time? What specifically created that feeling?
- Is there a fantasy or power trip you've always wanted in a game but never
  quite found?

**Taste profile**:
- What 3 games have you spent the most time with? What kept you coming back?
- Are there genres you love? Genres you avoid? Why?
- Do you prefer games that challenge you, relax you, tell you stories,
  or let you express yourself?

**Practical constraints** (shape the sandbox before brainstorming):
- Solo developer or team? What skills are available?
- Timeline: weeks, months, or years?
- Any platform constraints? (PC only? Mobile? Console?)
- First game or experienced developer?

**Synthesize** the answers into a **Creative Brief** — a 3-5 sentence
summary of the person's emotional goals, taste profile, and constraints.
Read the brief back and confirm it captures their intent.

---

### Phase 2: Concept Generation

Using the creative brief as a foundation, generate **3 distinct concepts**
that each take a different creative direction. Use these ideation techniques:

**Technique 1: Verb-First Design**
Start with the core player verb (build, fight, explore, solve, survive,
create, manage, discover) and build outward from there. The verb IS the game.

**Technique 2: Mashup Method**
Combine two unexpected elements: [Genre A] + [Theme B]. The tension between
the two creates the unique hook. (e.g., "farming sim + cosmic horror",
"roguelike + dating sim", "city builder + real-time combat")

**Technique 3: Experience-First Design (MDA Backward)**
Start from the desired player emotion (aesthetic goal from MDA framework:
sensation, fantasy, narrative, challenge, fellowship, discovery, expression,
submission) and work backward to the dynamics and mechanics that produce it.

For each concept, present:
- **Working Title**
- **Elevator Pitch** (1-2 sentences — must pass the "10-second test")
- **Core Verb** (the single most common player action)
- **Core Fantasy** (the emotional promise)
- **Unique Hook** (passes the "and also" test: "Like X, AND ALSO Y")
- **Primary MDA Aesthetic** (which emotion dominates?)
- **Estimated Scope** (small / medium / large)
- **Why It Could Work** (1 sentence on market/audience fit)
- **Biggest Risk** (1 sentence on the hardest unanswered question)
- **Why XR?** What does the device add that flat-screen can't deliver?
  Does it use spatial perception, embodied interaction, or scale in ways
  flat-screen structurally cannot?
- **Survives flat-screen test**: If forced to ship as a non-XR app, would
  the experience survive intact? **If yes, the concept is wasting the
  medium — reject or rework.**
- **Fits the XR Envelope**: Given Phase 0's device constraints, is this
  concept buildable on the target hardware? If not, reject or rework.

Be honest in the XR-native check. Most "XR concepts" turn out to be
flat-screen ideas with a headset gimmick. Strong XR concepts use the
medium structurally — pluck a planet out of orbit, reach into a tiny
diorama, lean down to peer through a window — actions whose
information density disappears on a 2D screen.

Present all three. Ask the user to pick one, combine elements, or request
new concepts. Never pressure toward a choice — let them sit with it.

---

### Phase 3: Core Loop Design

For the chosen concept, use structured questioning to build the core loop.
The core loop is the beating heart of the game — if it isn't fun in
isolation, no amount of content or polish will save the game.

**30-Second Loop** (moment-to-moment):
- What is the player physically doing most often?
- Is this action intrinsically satisfying? (Would they do it with no
  rewards, no progression, no story — just for the feel of it?)
- What makes this action feel good? (Audio feedback, visual juice,
  timing satisfaction, tactical depth?)

**5-Minute Loop** (short-term goals):
- What structures the moment-to-moment play into cycles?
- Where does "one more turn" / "one more run" psychology kick in?
- What choices does the player make at this level?

**Session Loop**:
XR sessions are SHORTER than typical PC/console sessions. Use the device's
session profile from Phase 0 as the upper bound, not 30–120 min:
- AR glasses: 5–15 min typical, often shorter
- Standalone VR: 20–45 min before fatigue
- Tethered VR: 30–90 min possible

Design implications that follow:
- **2-minute entry value**: meaningful satisfaction within the first 2 min.
  No long onboarding, no required tutorials.
- **Save aggressively**: device removal is unpredictable. Continuous save
  on key events; visible save options for the player.
- **No "session length" assumptions**: the player decides when to stop.
  Don't structure around "clear this dungeon then quit" beats.

Then ask:
- What does a complete session look like at this length?
- Where are the natural stopping points?
- What's the "hook" that makes them think about the experience when not
  wearing the device?

**Comfort considerations** (apply to every loop level):
- Arm fatigue (gorilla arm) on hands-only devices — allow rest poses
- Neck strain — keep content at or below eye line
- Eye strain — readable text sizes, avoid dense detail
- Motion sickness (VR/MR) — never move the camera without player input
- Display-driven art constraints from Phase 0 — additive blending limits

**Progression Loop** (days/weeks):
- How does the player grow? (Power? Knowledge? Options? Story?)
- What's the long-term goal? When is the game "done"?

**Player Motivation Analysis** (based on Self-Determination Theory):
- **Autonomy**: How much meaningful choice does the player have?
- **Competence**: How does the player feel their skill growing?
- **Relatedness**: How does the player feel connected (to characters,
  other players, or the world)?

---

### Phase 4: Pillars and Boundaries

Game pillars are used by real studios to keep teams making decisions that
all point the same direction. AAA action-narrative examples (God of War,
Hades, The Last of Us) work; sandbox/creator examples (Townscaper, Cloud
Gardens, Tilt Brush, Animal Crossing) work too — pick the canon that
matches your concept's genre. Even for solo developers, pillars prevent
scope creep and keep the vision sharp.

Collaboratively define **3-5 pillars**:
- Each pillar has a **name** and **one-sentence definition**
- Each pillar has a **design test**: "If we're debating between X and Y,
  this pillar says we choose __"
- Pillars should feel like they create tension with each other — if all
  pillars point the same way, they're not doing enough work

Then define **3+ anti-pillars** (what this game is NOT):
- Anti-pillars prevent the most common form of scope creep: "wouldn't it
  be cool if..." features that don't serve the core vision
- Frame as: "We will NOT do [thing] because it would compromise [pillar]"

---

### Phase 5: Player Type Validation

Using the Bartle taxonomy and Quantic Foundry motivation model, validate
who this game is actually for:

- **Primary player type**: Who will LOVE this game? (Achievers, Explorers,
  Socializers, Competitors, Creators, Storytellers)
- **Secondary appeal**: Who else might enjoy it?
- **Who is this NOT for**: Being clear about who won't like this game is as
  important as knowing who will
- **Market validation**: Are there successful games that serve a similar
  player type? What can we learn from their audience size?

---

### Phase 6: Scope and Feasibility

Ground the concept in reality:

- **Art pipeline**: What's the art style and how labor-intensive is it?
  Remember the display constraint from Phase 0 — additive optical displays
  reward bright stylized art and punish photorealism.
- **Content scope**: Estimate level/area count, item count, gameplay hours
- **MVP definition**: What's the absolute minimum build that tests "is the
  core loop fun?"
- **Biggest risks**: Technical, design, market — *plus the XR-specific
  categories below*
- **Scope tiers**: What's the full vision vs. what ships if time runs out?

**XR-specific risk categories** (add to the standard ranked risk list):

- **Input fidelity risk**: Hand tracking / gesture detection reliability on
  the target hardware. If pinch/grab/poke aren't reliable, the interaction
  model breaks. **Mitigation**: validate with the actual SDK before Phase 7
  architecture commits.
- **Frame budget risk**: XR budgets are 5–10× tighter than typical games
  (10–13 ms on standalone). Profile from day 1; establish ceiling counts
  (entities, draw calls, triangles) before scaling content.
- **Display constraint risk**: Optical-see-through can't render black;
  passthrough has FOV and latency limits; immersive VR has motion-sickness
  ceilings. **Mitigation**: test art direction on the actual device before
  authoring at scale.
- **Comfort risk**: Sustained sessions cause physical fatigue (arm, neck,
  eye). If the comfort window is shorter than the design assumes, the
  experience can't be played at intended length.
- **Hardware fragmentation risk**: Different XR SDKs expose different
  capabilities. Cross-platform support multiplies engineering work
  non-linearly. Decide early whether the project commits to one device or
  multiple.

---

### Phase 7: Architecture Overview

Translate the concept into a high-level code architecture. This bridges design
and implementation — developers use this as the blueprint before writing code.

Note on templates: `technical-design-document.md` is shaped for a *single
subsystem*. For the architecture-overview produced here, adapt it as a
top-down decomposition with subsystem summaries, then author per-subsystem
detailed tech designs separately as each subsystem is implemented.

Collaboratively define:

- **System decomposition**: What major systems does this app need?
  (e.g., XR Interaction, Session Management, Progression, UI, Audio)
- **Component breakdown**: For each system, what are the key components
  and their responsibilities?
- **Data flow**: How does data move between systems during a typical frame?
- **Dependencies**: Which systems depend on which? What's the build order?
- **XR-specific architecture**: Input pipeline (OpenXR → XRI → app logic),
  rendering pipeline (URP, Single Pass Instanced), spatial anchoring
- **Implementation phases**: What to build first (MVP), second, third?

Ask the user about:
- Preferred architecture patterns (ECS vs MonoBehaviour, event-driven vs polling)
- Existing code or packages to integrate
- Performance-critical paths that need special attention

---

## Document Generation

After all phases are complete, generate **4 documents**:

4. **XR Constraints Document** — using the template at
   `.claude/docs/templates/xr-constraints.md`. Capture device capabilities,
   input modalities, performance budget, comfort design rules, display-driven
   art direction, and session design assumptions from Phase 0.
   **Save to** `docs/app design docs/xr-constraints.md`.

5. **Game Concept Document** — using the template at
   `.claude/docs/templates/game-concept.md`. Fill in ALL sections from the
   brainstorm conversation, including the MDA analysis, player motivation
   profile, and flow state design sections.
   **Save to** `docs/app design docs/game-concept.md`.

6. **Game Pillars Document** — using the template at
   `.claude/docs/templates/game-pillars.md`. Fill in pillars, anti-pillars,
   conflict resolution priority, MDA aesthetics ranking, SDT alignment, and
   emotional arc from Phase 4 discussion.
   **Save to** `docs/app design docs/game-pillars.md`.

7. **Game Architecture Document** — using the template at
   `.claude/docs/templates/technical-design-document.md` adapted as a
   top-down architecture overview (subsystems summarised; per-subsystem
   detail follows later as separate tech designs). Fill in system
   decomposition, component breakdown, data flow, dependencies, and
   implementation phases from Phase 7 discussion.
   **Save to** `docs/app design docs/game-architecture.md`.

Create the `docs/app design docs/` directory if needed. Ask for approval
before writing each document.

8. **Suggest next steps**:
   - "Use `/design-review` to validate each document"
   - "Prototype the core loop with `/prototype [core-mechanic]`"
   - "If validated, plan the first sprint with `/sprint-plan new`"

9. **Output a summary** with the chosen concept's elevator pitch, pillars,
   primary player type, biggest risk, the XR envelope, and paths to all
   4 documents.