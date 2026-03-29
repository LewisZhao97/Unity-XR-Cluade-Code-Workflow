---
paths:
  - "Assets/Scripts/**/*.cs"
---

# Unity XR C# Patterns

## XRI Component Patterns
- Use `ActionBasedController` over `DeviceBasedController`
- Custom interactables extend `XRBaseInteractable`, not raw MonoBehaviour
- Use XRI interaction events (`selectEntered`, `hoverEntered`) not Update() polling
- One `XRInteractionManager` per scene — never multiple
- Set interaction layers to prevent unintended cross-interaction

## Unity C# in XR Context
- `[SerializeField] private` over `public` for inspector fields
- Cache `GetComponent<>()` results in `Awake()` — never in `Update()`
- Use `Physics.RaycastNonAlloc()`, `OverlapSphereNonAlloc()` — avoid allocating variants
- Use `ObjectPool<T>` for frequently instantiated objects
- Prefer events/`UnityEvent` over `Update()` polling
- Use `readonly` and `const` where applicable
- Use assembly definitions (`.asmdef`) for all code folders

## Naming Conventions
- `PascalCase` for public members, types, methods
- `_camelCase` for private fields
- `camelCase` for local variables and parameters
- `I` prefix for interfaces (`IInteractable`, `ITrackable`)
- `XR` prefix for XR-specific components (`XRGrabHandler`, `XRTeleportFilter`)

## Common XR Pitfalls
- Using `== null` vs `is null` — Unity overloads `==` for destroyed objects, use `== null`
- Forgetting stereo rendering in custom shaders (`unity_StereoEyeIndex`)
- Allocating in `Update()` / `FixedUpdate()` — GC spikes cause frame drops in XR
- Not handling `XRInputSubsystem` device connection/disconnection events
- Hardcoding controller-specific logic instead of using OpenXR action bindings
