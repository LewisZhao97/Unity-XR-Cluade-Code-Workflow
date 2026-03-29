---
paths:
  - "Assets/Data/**"
  - "Assets/Resources/Data/**"
  - "Assets/StreamingAssets/**"
---

# Data File Rules

- All JSON files must be valid JSON — broken JSON blocks the build pipeline
- File naming: lowercase with underscores only, following `[system]_[name].json` pattern
- Every data file must have a documented schema
- Numeric values must include comments or companion docs explaining what the numbers mean
- Use consistent key naming: camelCase for keys within JSON files
- No orphaned data entries — every entry must be referenced by code or another data file
- Version data files when making breaking schema changes
- Include sensible defaults for all optional fields
- Prefer ScriptableObjects over JSON for Unity-native configuration data
