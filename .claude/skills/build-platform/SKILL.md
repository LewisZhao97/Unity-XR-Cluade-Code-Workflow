---
name: build-platform
description: "Cross-platform Unity XR build management: configure, validate, and trigger builds for target XR platforms (Quest, Pico, PCVR). Checks platform-specific settings, quality levels, and Addressables groups."
argument-hint: "[quest|pico|pcvr|all|validate]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
---

When this skill is invoked:

1. **Determine target platform** from argument:
   - `quest` — Meta Quest (Android, Vulkan/GLES, arm64)
   - `pico` — Pico (Android, Vulkan/GLES, arm64)
   - `pcvr` — PC VR (Windows, DirectX/Vulkan, x86_64)
   - `all` — validate all platform configurations
   - `validate` — check current settings without building

2. **Read project configuration**:
   - `ProjectSettings/ProjectSettings.asset` — build targets, company/product name
   - `ProjectSettings/QualitySettings.asset` — quality levels per platform
   - `Packages/manifest.json` — XR packages installed
   - OpenXR settings and feature groups per platform

3. **Validate platform settings**:

   **Quest/Pico (Android)**:
   - [ ] Target API level ≥ 29
   - [ ] ARM64 architecture selected
   - [ ] Vulkan as primary graphics API
   - [ ] Texture compression: ASTC
   - [ ] Minimum SDK version appropriate
   - [ ] OpenXR features: hand tracking, passthrough (if needed)
   - [ ] Fixed Foveated Rendering configured
   - [ ] Quality level appropriate for mobile

   **PCVR (Windows)**:
   - [ ] DirectX 11/12 or Vulkan selected
   - [ ] x86_64 architecture
   - [ ] Higher quality settings enabled
   - [ ] SteamVR/OpenXR runtime configured

   **All Platforms**:
   - [ ] Single Pass Instanced rendering enabled
   - [ ] XR Plugin Management configured
   - [ ] OpenXR interaction profiles set
   - [ ] Addressables groups per platform

4. **Output validation report**:

```markdown
## Build Validation: [Platform]

### Settings Check
| Setting | Expected | Current | Status |
|---------|----------|---------|--------|
| Graphics API | Vulkan | [current] | [OK/WARN] |
| Architecture | ARM64 | [current] | [OK/WARN] |
| ...

### Missing Configuration
- [List any missing or incorrect settings]

### Recommendations
- [Platform-specific optimization suggestions]
```

5. **Offer to fix** any configuration issues found.
