# Technical Preferences

## Engine & Language

- **Engine**: Unity 6.0.27f1
- **Language**: C# (Unity app), C++/Java (native OpenXR runtime)
- **Render Pipeline**: URP (Universal Render Pipeline)
- **Rendering**: Single Pass Instanced (mandatory for XR)
- **XR Framework**: XR Interaction Toolkit (XRI)
- **XR Runtime**: OpenXR runtime (native `.aar`)
- **SDK**: XR SDK (UPM package)

## Naming Conventions (Unity Style)

- **Classes/Structs**: PascalCase (`ARTrackedImageManager`)
- **Interfaces**: `I` + PascalCase (`IReferenceImageLibrary`)
- **Constants**: `k_` + PascalCase (`k_MaxRetries`)
- **Static fields**: `s_` + PascalCase (`s_Instance`)
- **Instance private fields**: `m_` + PascalCase (`m_Camera`)
- **Properties/Events**: camelCase (`referenceLibrary`, `trackablesChanged`)
- **Methods**: PascalCase (`TryGetRenderingParameters()`)
- **Parameters/Locals**: camelCase (`commandBuffer`)

## Performance Budgets

| Metric | XR Glasses (standalone) | PC Streaming |
|--------|------------------------|--------------|
| Frame time | 11ms (90Hz) | 11ms (90Hz) |
| Draw calls | < 100 | < 300 |
| Triangles | < 750K | < 2M |
| Texture memory | < 1GB | < 4GB |
| GC Alloc/frame | 0 bytes | 0 bytes |

## Testing

- **Framework**: Unity Test Framework (NUnit-based)
- **Minimum Coverage**: 80% for core logic and SDK public API
- **Required Tests**: Edit Mode (pure logic), Play Mode (XR interactions via `XRDeviceSimulator`)
- **Naming**: `[MethodUnderTest]_[Scenario]_[ExpectedResult]`

## Forbidden Patterns (Hot Paths)

- `GetComponent<>()` in Update — cache in Awake
- `Find()`, `FindObjectOfType()`, `SendMessage()`
- String concatenation, LINQ, closures (GC allocation)
- `new List<>()`, `new Dictionary<>()` — pre-allocate and reuse
- `Physics.Raycast()` (allocating variant) — use NonAlloc
- Moving camera programmatically without user control (motion sickness)

## Allowed Libraries / Packages

- Unity XR Interaction Toolkit (XRI)
- XR SDK (UPM)
- UniTask (if available, for async/await)
- Unity Test Framework

## Architecture Decisions Log

- Use `/architecture-decision` to create new ADRs
