---
paths:
  - "Assets/Scripts/Gameplay/**"
  - "Assets/Scripts/Interaction/**"
---

# Gameplay / Interaction Code Rules

- ALL gameplay values MUST come from ScriptableObjects or config files, NEVER hardcoded
- Use `Time.deltaTime` for ALL time-dependent calculations (frame-rate independence)
- NO direct references to UI code — use events/UnityEvents for cross-system communication
- Every gameplay system must implement a clear interface
- State machines must have explicit transition tables with documented states
- Write unit tests for all gameplay logic — separate logic from presentation
- Document which spec/design doc each feature implements in code comments
- No static singletons for game state — use dependency injection or service locator

## Examples

**Correct** (data-driven):

```csharp
// Config from ScriptableObject
float damage = combatConfig.BaseDamage;
float speed = statsConfig.MovementSpeed * Time.deltaTime;
```

**Incorrect** (hardcoded):

```csharp
float damage = 25.0f;   // VIOLATION: hardcoded gameplay value
float speed = 5.0f;      // VIOLATION: not from config, not using deltaTime
```
