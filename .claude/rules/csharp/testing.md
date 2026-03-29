---
paths:
  - "**/*.cs"
  - "**/*.csx"
  - "**/*.csproj"
---
# C# Testing for Unity XR

> This file extends [common/testing.md](../common/testing.md) with Unity-specific content.

## Test Framework

- **Unity Test Framework** (NUnit-based) for Edit Mode and Play Mode tests
- `[Test]` for synchronous tests, `[UnityTest]` for coroutine-based tests
- Use `Assert.AreEqual`, `Assert.IsTrue`, `Assert.That` with constraints
- Mock with **NSubstitute** or manual test doubles

## Test Organization

- Mirror `Assets/Scripts/` structure under `Assets/Tests/`
- Separate Edit Mode tests (pure logic) from Play Mode tests (MonoBehaviour, XR)
- Use assembly definitions (`.asmdef`) to reference production code from test assemblies

```csharp
public class GrabInteractionTests
{
    [Test]
    public void SelectInteractable_WhenInRange_AttachesToHand()
    {
        // Arrange
        // Act
        // Assert
    }
}
```

## XR Test Patterns

- Use `XRDeviceSimulator` for automated XR input simulation in Play Mode
- Mock `InputDevice` and `XRInputSubsystem` for Edit Mode unit tests
- Test interaction sequences: hover → select → activate → deselect
- Test locomotion boundaries and guardian interaction
- Test cross-platform input mapping differences

## Coverage

- 80%+ coverage target for core logic and SDK public API
- Focus coverage on: interaction logic, state machines, SDK API contracts, data validation
- Performance tests for frame-sensitive code paths
- Run tests in CI with coverage collection enabled
