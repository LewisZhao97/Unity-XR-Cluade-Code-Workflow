---
name: xr-test
description: "XR-specific testing workflow: validates XR interactions, tracking, locomotion, comfort settings, and cross-platform input using XRDeviceSimulator and mock input devices."
argument-hint: "[system-name|interaction|locomotion|comfort|full]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash
---

When this skill is invoked:

1. **Determine scope** from the argument:
   - `interaction` — test grab, poke, ray, and gaze interactions
   - `locomotion` — test teleport, continuous move, snap turn, climb
   - `comfort` — test vignette, seated mode, boundary respect
   - `full` — comprehensive XR test suite
   - System name — focused tests for a specific XR system

2. **Analyze existing test coverage**:
   - Glob for test files in `Assets/Tests/`
   - Check for `XRDeviceSimulator` usage in Play Mode tests
   - Identify untested XR interaction paths

3. **Generate test cases** for the scope:

   **Interaction Tests**:
   - [ ] Hover → Select → Activate → Deselect lifecycle
   - [ ] Grab with both hands simultaneously
   - [ ] Hand tracking grab vs controller grab
   - [ ] Socket snap interactions
   - [ ] Interaction layer filtering
   - [ ] Tracking loss during interaction

   **Locomotion Tests**:
   - [ ] Teleport to valid/invalid surfaces
   - [ ] Continuous move respects boundaries
   - [ ] Snap turn angles are correct
   - [ ] Locomotion disabled during grab
   - [ ] Seated mode locomotion constraints

   **Comfort Tests**:
   - [ ] Vignette activates during movement
   - [ ] No programmatic camera movement
   - [ ] Horizon stays stable
   - [ ] Guardian/boundary system respected

   **Cross-Platform Tests**:
   - [ ] Controller input mapping per platform
   - [ ] Hand tracking fallback to controllers
   - [ ] Feature availability detection

4. **Output test plan** with prioritized test cases and estimated coverage improvement.

5. **Optionally generate test code** — offer to write Unity Test Framework tests for the identified cases.

### Rules
- XR tests must use `XRDeviceSimulator` or mock input — never require a headset for automated tests
- Test both controller and hand tracking input paths
- Include frame timing assertions for performance-sensitive interactions
- Test on all target platforms when possible
