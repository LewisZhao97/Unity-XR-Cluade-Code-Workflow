---
paths:
  - "**/*.cs"
  - "**/*.csx"
---
# C# Coding Style

> This file extends [common/coding-style.md](../common/coding-style.md) with Unity C#-specific content.

## Standards

- Follow .NET conventions with Unity-specific adjustments
- Nullable reference types enabled where supported (SDK/Runtime projects)
- Explicit access modifiers always (`private`, `public`, `internal`, `protected`)
- `[SerializeField] private` over `public` for Unity inspector fields

## Types and Models

- `record` / `record struct` for immutable data models (SDK layer)
- `class` for MonoBehaviours and stateful entities
- `ScriptableObject` for data-driven configuration (items, configs, events)
- `interface` for service boundaries and abstractions

```csharp
[CreateAssetMenu(fileName = "InteractionConfig", menuName = "XR/InteractionConfig")]
public class InteractionConfig : ScriptableObject
{
    [Header("Grab Settings")]
    [SerializeField] private float _grabRange = 0.5f;
    [Tooltip("Force applied when throwing grabbed objects")]
    [SerializeField] private float _throwForce = 10f;

    public float GrabRange => _grabRange;
    public float ThrowForce => _throwForce;
}
```

## Immutability

- Prefer `init` setters, constructor parameters, and `IReadOnlyList<T>` for shared state
- Do not mutate input models in-place when producing updated state
- Use `readonly` fields and `const` where applicable

## Async and Coroutines

- `async`/`await` with `UniTask` (if available) or `Task` for complex async operations
- Coroutines for simple frame-based sequences in MonoBehaviours
- Pass `CancellationToken` through async APIs
- Never use `.Result` or `.Wait()` — Unity main thread will deadlock

## Formatting

- 4-space indentation (Unity default)
- Allman brace style (opening brace on new line)
- Use `dotnet format` or EditorConfig enforcement
- Remove unused `using` directives
