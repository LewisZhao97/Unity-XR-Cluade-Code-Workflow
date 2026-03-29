---
paths:
  - "**/*.cs"
  - "**/*.csx"
---
# C# Patterns for Unity XR

> This file extends [common/patterns.md](../common/patterns.md) with Unity XR-specific content.

## ScriptableObject Configuration

Use ScriptableObjects for data-driven configuration:

```csharp
[CreateAssetMenu(fileName = "XRConfig", menuName = "XR/Configuration")]
public class XRConfiguration : ScriptableObject
{
    [Header("Locomotion")]
    [SerializeField] private float _moveSpeed = 3f;
    [SerializeField] private float _snapTurnAngle = 45f;

    public float MoveSpeed => _moveSpeed;
    public float SnapTurnAngle => _snapTurnAngle;
}
```

## ScriptableObject Event Channel

Decouple systems using event channels:

```csharp
[CreateAssetMenu(fileName = "GameEvent", menuName = "Events/GameEvent")]
public class GameEvent : ScriptableObject
{
    private readonly List<IGameEventListener> _listeners = new();
    public void Raise() { foreach (var l in _listeners) l.OnEventRaised(); }
    public void Register(IGameEventListener listener) => _listeners.Add(listener);
    public void Unregister(IGameEventListener listener) => _listeners.Remove(listener);
}
```

## Service Locator / Dependency Injection

- Use interfaces at system boundaries
- Register services in a central composition root
- Focused constructors — inject only what's needed
- Consider Zenject/VContainer for complex dependency graphs

## Repository Pattern

Encapsulate data access behind consistent interfaces for save/load, config, and persistence.

## SDK API Pattern

For public SDK APIs, use result types instead of exceptions:

```csharp
public readonly struct XRResult<T>
{
    public bool IsSuccess { get; }
    public T Value { get; }
    public string Error { get; }
}
```
