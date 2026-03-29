---
paths:
  - "Assets/Scripts/UI/**"
---

# UI Code Rules

- UI must NEVER own or directly modify application state — display only, use events to request changes
- All UI text must go through the localization system — no hardcoded user-facing strings
- Support both controller ray interaction AND hand poke interaction for all XR UI elements
- All animations must be skippable and respect user accessibility preferences
- UI must never block the main thread
- Scalable text and colorblind modes are mandatory, not optional
- Test all screens at minimum and maximum supported resolutions
- XR: Use world-space Canvas with `TrackedDeviceGraphicRaycaster` — avoid screen-space overlay in XR
- XR: Minimum text size 1.5mm per meter of viewing distance for readability
