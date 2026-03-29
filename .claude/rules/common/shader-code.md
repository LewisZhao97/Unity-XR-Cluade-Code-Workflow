---
paths:
  - "Assets/Shaders/**"
  - "Assets/Materials/**"
---

# Shader Code Standards

All shader files must follow these standards to maintain visual quality,
performance, and cross-platform XR compatibility.

## Naming Conventions
- Shader Graph: `SG_[Category]_[Name]` (e.g., `SG_Env_Water`)
- HLSL shaders: `[Category]_[Name].shader` (e.g., `Env_Water.shader`)
- Materials: `M_[Category]_[Name]` (e.g., `M_Env_Water`)
- Use descriptive names that indicate the material purpose

## Code Quality
- All properties must have descriptive names and `[Header]` grouping
- Comment non-obvious calculations (especially math-heavy sections)
- No magic numbers — use named constants or documented properties
- Include authorship and purpose comment at the top of each shader file

## Performance Requirements (XR Critical)
- Document the target platform and complexity budget for each shader
- Use `half` precision on mobile XR (Quest/Pico) where full precision isn't needed
- Minimize texture samples in fragment shaders
- Avoid dynamic branching in fragment shaders — use `step()`, `lerp()`, `smoothstep()`
- No texture reads inside loops
- Two-pass approach for blur effects (horizontal then vertical)
- XR: Must support Single Pass Instanced rendering (`UNITY_STEREO_INSTANCING_ENABLED`)

## Cross-Platform XR
- Test shaders on minimum spec target hardware (Quest 2/3, Pico 4)
- Provide fallback/simplified versions for lower quality tiers
- Document which render pipeline the shader targets (URP required for most XR)
- Ensure stereo rendering compatibility — use `unity_StereoEyeIndex` correctly

## Variant Management
- Minimize shader variants — each variant is a separate compiled shader
- Document all keywords/variants and their purpose
- Use feature stripping to reduce build size on mobile XR
- Log and monitor total variant count per shader
