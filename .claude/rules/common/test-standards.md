---
paths:
  - "Assets/Tests/**"
  - "Tests/**"
---

# Test Standards

- Test naming: `[MethodUnderTest]_[Scenario]_[ExpectedResult]` pattern
- Every test must have a clear Arrange/Act/Assert structure
- Unit tests must not depend on external state (filesystem, network, database)
- Integration tests must clean up after themselves
- Performance tests must specify acceptable thresholds and fail if exceeded
- Test data must be defined in the test or in dedicated fixtures, never shared mutable state
- Mock external dependencies — tests should be fast and deterministic
- Every bug fix must have a regression test that would have caught the original bug
- XR tests: use `XRDeviceSimulator` or mock `InputDevice` for automated XR input testing

## Examples

**Correct** (proper naming + Arrange/Act/Assert):

```csharp
[Test]
public void TakeDamage_WithPositiveAmount_ReducesHealth()
{
    // Arrange
    var health = new HealthComponent { MaxHealth = 100, CurrentHealth = 100 };

    // Act
    health.TakeDamage(25);

    // Assert
    Assert.AreEqual(75, health.CurrentHealth);
}
```

**Incorrect**:

```csharp
[Test]
public void Test1() // VIOLATION: no descriptive name
{
    var h = new HealthComponent();
    h.TakeDamage(25); // VIOLATION: no arrange step
    Assert.IsTrue(h.CurrentHealth < 100); // VIOLATION: imprecise assertion
}
```
