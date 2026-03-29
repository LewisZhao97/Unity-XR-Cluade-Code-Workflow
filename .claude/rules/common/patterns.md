# Common Patterns

## Unity XR Project Patterns

When implementing new XR functionality:
1. Search for existing XRI components that solve the problem
2. Check Unity's XR samples and templates
3. Evaluate if custom implementation is truly needed
4. Follow XRI's component architecture patterns

## Design Patterns

### ScriptableObject Event Channel
Decouple systems using ScriptableObject-based events:
- Create event assets for cross-system communication
- Listeners register/unregister in OnEnable/OnDisable
- No direct references between systems needed

### Service Locator / DI
- Register services in a composition root
- Depend on interfaces, not concrete implementations
- Use for XR subsystem access abstraction

### Repository Pattern
Encapsulate data access behind a consistent interface:
- Define standard operations: FindAll, FindById, Create, Update, Delete
- Business logic depends on the abstract interface
- Enables easy swapping of data sources and testing with mocks

### State Machine Pattern
- Explicit state transitions with validation
- Used for: XR session lifecycle, interaction states, app flow
- Document all states and valid transitions
