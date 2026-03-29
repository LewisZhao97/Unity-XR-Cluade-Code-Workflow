---
paths:
  - "Assets/Prototypes/**"
  - "Prototypes/**"
---

# Prototype Code Standards (Relaxed)

Prototypes are throwaway code for validating ideas. Standards are intentionally
relaxed to maximize iteration speed. The goal is learning, not production quality.

## What's Allowed in Prototypes
- Hardcoded values (no need for data-driven config)
- Minimal or no doc comments
- Simple architecture (no dependency injection required)
- Singletons and global state
- Copy-pasted code (no need for abstraction)
- Debug output left in place
- Placeholder art and audio
- Quick-and-dirty solutions

## What's Still Required
- Each prototype lives in its own subdirectory: `Assets/Prototypes/[name]/`
- Every prototype MUST have a `README.md` with:
  - What hypothesis is being tested
  - How to run the prototype
  - Current status (in-progress / concluded)
  - Findings (updated when prototype concludes)
- No production code may reference or import from prototype assemblies
- Prototypes must not modify files outside their directory
- Use separate assembly definitions (`.asmdef`) to isolate prototype code

## When a Prototype Succeeds
If a prototype validates a concept and moves to production:
1. The prototype code is NOT migrated directly — it is rewritten to production standards
2. The prototype README findings inform the production design document
3. The prototype directory is preserved for reference but never extended
