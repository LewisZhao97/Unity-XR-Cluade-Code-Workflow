# XR Constraints: [Project Name]

*Created: [Date]*
*Status: [Draft / Approved]*

---

## Purpose

This document captures the device-level facts and platform constraints that
shape every other design decision. It is the output of brainstorm Phase 0
(XR Pre-Phase) and acts as a hard filter on concept, art direction, and
architecture choices.

**Read order**: this document is the foundation. `game-concept.md`,
`game-pillars.md`, and `game-architecture.md` all reference and depend on
the facts captured here. Update this document first whenever the device
target changes.

---

## Target Device Class

| Attribute | Value |
| ---- | ---- |
| **Device category** | [AR glasses / passthrough MR / immersive VR] |
| **Compute class** | [Standalone (mobile-class chip) / PC-tethered] |
| **Refresh rate target** | [60 / 72 / 90 / 120 Hz] |
| **Frame budget (primary)** | [ms — calculated from refresh rate] |
| **Frame budget (fallback)** | [ms — for lower refresh rate fallback] |
| **Field of view** | [degrees, horizontal] |
| **Tracking** | [3DOF / 6DOF] |
| **Form factor** | [Stationary / Seated / Room-scale] |

---

## Display Type

**Type**: [Optical see-through / Passthrough camera-MR / Immersive VR]

**Implications for art direction**:

- [Can render true black? Yes/No. If no, all dark areas appear transparent
  to the real world.]
- [Additive blending only? Yes/No]
- [Real world always visible? Yes/No]
- [Color shift based on environmental lighting? Yes/No]

**Resulting art-direction rules**:

- [e.g., "Bright, high-saturation, emissive-friendly stylized art only"]
- [e.g., "No dark atmospheres, no fog, no volumetrics, no night scenes"]
- [e.g., "All text on illuminated backings, never on pure black"]

---

## Input Capabilities

### Modalities Supported

- [ ] **Controllers (6DOF)** — buttons, triggers, haptics
- [ ] **Hand tracking** — full per-joint pose / recognized-gesture only / not supported
- [ ] **Eye tracking** — gaze direction available / not supported
- [ ] **Voice** — wake word + transcription / not supported

### Hand-Tracking Fidelity Detail

[Required if hand tracking is the primary input. Validate by testing the
SDK directly before relying on these answers.]

| Capability | Status |
| ---- | ---- |
| Full per-joint hand pose (25+ joints) | [Yes / No / Unknown] |
| Pinch detected as discrete event | [Yes / No / Inferred from thumb-index distance] |
| Pinch start/end timing precision | [< 16 ms / variable / unknown] |
| Poke depth measurable | [Yes / Binary intersection only] |
| Two-handed simultaneous tracking | [Robust / Drops out when close / Unknown] |
| Tracking frequency | [Hz] |

### Recognized Gesture Vocabulary

[List the gestures the SDK reliably recognises. If hand tracking is at
recognized-gesture level (not full pose), this is the entire input alphabet.]

- [Gesture 1 — e.g., "Pinch (thumb-index touch)"]
- [Gesture 2 — e.g., "Grab (closed fist)"]
- [Gesture 3 — e.g., "Point (extended index finger)"]

---

## Performance Budget

### Frame-Time Targets

| Component | Budget | Notes |
| ---- | ---- | ---- |
| Total frame | [X ms @ Y Hz] | Hard ceiling — beyond this, frames drop |
| GPU | [X ms] | |
| CPU | [X ms] | |
| Render pipeline overhead | [X ms] | Stereo rendering, post-processing |
| Application logic | [X ms] | Game systems, AI, physics |

### Resource Ceilings

| Resource | Limit |
| ---- | ---- |
| Draw calls / frame | [< X] |
| Triangles / frame | [< X] |
| Materials in scene | [< X] |
| Textures in memory | [< X MB] |
| GC alloc / frame | **0 bytes (non-negotiable on standalone)** |

---

## Comfort Design Rules

[Hardware-imposed rules that supersede creative preferences. Violating these
makes the experience physically uncomfortable, regardless of design quality.]

### Physical Comfort

- **Maximum sustained arm-up duration**: [seconds — the gorilla-arm threshold]
- **Maximum content height above eye line**: [degrees — beyond this, neck strain]
- **Minimum content distance from eyes**: [cm — focal-distance comfort]
- **Maximum head rotation required to see all content**: [degrees]
- **Rest poses supported**: [How can the player rest their hands and still
  interact?]

### Motion / Sickness (VR/MR)

- **Camera movement controlled exclusively by player head movement**: [required for VR]
- **Snap turn vs smooth turn**: [policy if locomotion exists]
- **Acceleration limits in player-driven motion**: [m/s² ceiling]

### Eye Strain

- **Minimum readable text size**: [point size or angular size]
- **Maximum scene complexity in foveal area**: [guideline]
- **Refresh rate minimum for sustained reading**: [Hz]

---

## Session Design Assumptions

| Assumption | Value | Implication |
| ---- | ---- | ---- |
| Typical session length | [5–15 / 20–45 / 30–90 min] | Hard upper bound for content design |
| Time-to-meaningful-interaction | < 2 min | No long onboarding tutorials |
| Save aggression | Continuous + key-event triggers | Player removes device unpredictably |
| Required recovery time between sessions | [None / 30 min / etc.] | Limits daily play frequency |
| Content that requires uninterrupted focus | None | Real-world interruptions are common |

---

## The XR Envelope

[A short paragraph synthesising the above into a usable design heuristic. This
is the version other documents should refer back to.]

> Example envelope (AR glasses):
> *"This device supports a TABLETOP-SCALE creator/utility envelope.
> Content lives within arm's reach (20–60 cm); art is bright stylized
> emissive with no true blacks; sessions are short (5–15 min); input is
> hand-only (pinch, grab, point) without controllers. The device does NOT
> support: room-scale immersion, photorealism, dark atmospheres, sustained
> >30-min experiences, or precise dual-stick-style interaction."*

---

## Concepts the Envelope Supports

[List concept categories that fit cleanly within the envelope. Useful as a
sanity check during Phase 2 brainstorming.]

- [e.g., "Tabletop creator toys (Townscaper-likes)"]
- [e.g., "Productivity / utility apps (note-taking, dashboards)"]
- [e.g., "Light gaming with object-on-desk framing"]

## Concepts the Envelope Does NOT Support

[List anti-patterns. Concepts that fall here must be rejected or radically
rethought.]

- [e.g., "Room-scale immersive horror"]
- [e.g., "Photorealistic atmospheric experiences"]
- [e.g., "Action games requiring sub-100ms input precision"]

---

## Open Validation Questions

[Items in this document that are *assumed* but need to be confirmed by
hands-on testing with the actual SDK and hardware. Prioritise resolving
these before brainstorm Phase 7 architecture commits.]

- [ ] [e.g., "Confirm pinch is a discrete SDK event, not inferred"]
- [ ] [e.g., "Confirm two-handed tracking robustness when hands < 10 cm apart"]
- [ ] [e.g., "Profile frame budget on actual hardware with placeholder content"]

---

## Cross-References

- **Concept built within these constraints**: `game-concept.md`
- **Pillars derived under these constraints**: `game-pillars.md`
- **Architecture targeting this performance budget**: `game-architecture.md`

---

*This document is the device-level north star. Update first whenever the
target hardware changes — every other design document depends on it.*
