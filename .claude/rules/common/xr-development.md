---
paths:
  - "Assets/Scripts/XR/**"
  - "Assets/Scripts/Interaction/**"
  - "Assets/XR/**"
---

# XR Development Rules

## Performance (Non-Negotiable)
- Frame budget: 11ms at 90Hz, 8.3ms at 120Hz — XR drops are visible and cause nausea
- Use Single Pass Instanced rendering — never multi-pass for XR
- Mobile XR draw calls: < 100 (Quest/Pico), PCVR: < 300
- Use Fixed Foveated Rendering on supported mobile platforms
- Avoid dynamic shadows on mobile XR — use baked lighting + light probes
- Profile on target hardware, not just editor — XR perf varies dramatically

## Interaction Patterns
- Use XRI's action-based input — never poll raw device state in Update()
- All interactions must work with both controllers AND hand tracking
- Use OpenXR action paths — never hardcode device-specific bindings
- Handle tracking loss gracefully — pause interaction, show visual indicator
- Cache `InputAction` references — never `FindAction()` per frame

## Comfort and Safety (Mandatory)
- NEVER move the camera programmatically without user control
- Provide comfort options: vignette during locomotion, snap/smooth turn
- Maintain stable horizon — no camera roll
- Respect guardian/boundary system
- Provide seated mode alternative for all experiences
- Default to teleportation locomotion with continuous move as option

## Spatial UI
- Use world-space Canvas — avoid screen-space overlay in XR
- Minimum text size: 1.5mm per meter of viewing distance
- Support both ray and poke interaction for all UI elements
- Anchor UI to world or hand — never to head (causes discomfort)
- Use `TrackedDeviceGraphicRaycaster` for XR UI interaction

## Cross-Platform
- Abstract platform-specific features behind interfaces
- Use OpenXR feature groups for capability detection
- Handle missing features gracefully (no hand tracking → controller fallback)
- Test on all target platforms — behavior differs significantly
