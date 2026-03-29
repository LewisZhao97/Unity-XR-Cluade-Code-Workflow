---
paths:
  - "Assets/Scripts/Core/**"
  - "Assets/Scripts/SDK/**"
  - "Assets/Scripts/Runtime/**"
---

# Core / SDK / Runtime Code Rules

- ZERO allocations in hot paths (Update, FixedUpdate, rendering, physics) — pre-allocate, pool, reuse
- All public APIs must be thread-safe OR explicitly documented as single-thread-only
- Profile before AND after every optimization — document the measured numbers
- Core/SDK code must NEVER depend on application-layer code (strict dependency direction: core ← app)
- Every public API must have XML doc comments with usage examples
- Changes to public interfaces require `[Obsolete]` deprecation and migration guide
- Use `IDisposable` / deterministic cleanup for all native resources
- All core systems must support graceful degradation

## Examples

**Correct** (zero-alloc hot path):

```csharp
// Pre-allocated array reused each frame
private readonly Collider[] _nearbyCache = new Collider[32];

void FixedUpdate()
{
    int count = Physics.OverlapSphereNonAlloc(transform.position, radius, _nearbyCache);
    for (int i = 0; i < count; i++) { /* process */ }
}
```

**Incorrect** (allocating in hot path):

```csharp
void FixedUpdate()
{
    // VIOLATION: allocates every frame
    Collider[] nearby = Physics.OverlapSphere(transform.position, radius);
}
```
