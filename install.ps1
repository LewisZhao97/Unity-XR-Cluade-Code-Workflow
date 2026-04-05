Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $PSCommandPath
$installerScript = Join-Path -Path $scriptDir -ChildPath '.claude\scripts\install-apply.js'

& node $installerScript @args
exit $LASTEXITCODE
