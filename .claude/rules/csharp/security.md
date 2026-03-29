---
paths:
  - "**/*.cs"
  - "**/*.csx"
  - "**/*.csproj"
---
# C# Security

> This file extends [common/security.md](../common/security.md) with Unity C#-specific content.

## Secret Management

- Never hardcode API keys, tokens, or credentials in source code
- Use environment variables or platform-specific secure storage
- Keep config files free of real credentials — use .gitignore

```csharp
// BAD
const string ApiKey = "sk-live-123";

// GOOD
var apiKey = Environment.GetEnvironmentVariable("XR_API_KEY")
    ?? throw new InvalidOperationException("XR_API_KEY is not configured.");
```

## Input Validation

- Validate all network input before processing
- Validate tracked device input ranges (position, rotation bounds)
- Sanitize user-generated content (spatial anchors, shared world data)
- Reject invalid data before running logic

## Network Security

- Never trust data from network peers without validation
- Validate packet sizes and field ranges
- Use TLS for all network communication
- Never log tokens, passwords, or PII

## XR-Specific Security

- Protect save data with integrity checks
- Handle platform permissions for camera, microphone, spatial mapping
- Validate OpenXR extension data from untrusted sources

## Error Handling

- Safe error messages to users — never expose stack traces or internal paths
- Log detailed exceptions with structured context for debugging
- Never silently catch and ignore exceptions
