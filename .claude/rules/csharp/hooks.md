---
paths:
  - "**/*.cs"
  - "**/*.csx"
  - "**/*.csproj"
  - "**/*.sln"
  - "**/Directory.Build.props"
  - "**/Directory.Build.targets"
---
# C# Hooks

> This file extends [common/hooks.md](../common/hooks.md) with C#-specific content.

## PostToolUse Hooks

- **dotnet format**: Auto-format edited C# files (for SDK/Runtime non-Unity projects)
- **Unity Build**: For Unity scripts, verify compilation through Unity Editor console
- **dotnet test --no-build**: Re-run nearest relevant test project after behavior changes

## Stop Hooks

- Run a final build verification before ending a session with broad C# changes
- Warn on modified config files that may contain credentials
