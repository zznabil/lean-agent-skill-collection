[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'release-inventory.ps1')
$fixture = Join-Path ([IO.Path]::GetTempPath()) ('lean-build-output-test-' + [guid]::NewGuid().ToString('N'))
function Expect-UnsafeOutput([string]$Path) {
    $rejected = $false
    try { [void](Assert-ReleaseBuildOutputPath $fixture $Path) } catch { $rejected = $true }
    if (-not $rejected) { throw "Unsafe output was accepted: $Path" }
}
try {
    $artifacts = Join-Path $fixture 'artifacts'
    $safe = Join-Path $artifacts 'safe'
    New-Item -ItemType Directory -Path $safe -Force | Out-Null
    [IO.File]::WriteAllText((Join-Path $safe 'keep.txt'), 'Positive fixture')
    if ((Assert-ReleaseBuildOutputPath $fixture $safe) -cne [IO.Path]::GetFullPath($safe)) { throw 'Existing safe directory rejected.' }
    [void](Assert-ReleaseBuildOutputPath $fixture (Join-Path $artifacts 'new/nested'))
    Expect-UnsafeOutput $artifacts
    Expect-UnsafeOutput (Join-Path $fixture 'outside')
    Expect-UnsafeOutput (Join-Path $artifacts '../outside')
    Expect-UnsafeOutput (Join-Path $safe 'keep.txt')
    $outside = Join-Path $fixture 'outside'
    New-Item -ItemType Directory -Path $outside | Out-Null
    $sentinel = Join-Path $outside 'keep.txt'
    [IO.File]::WriteAllText($sentinel, 'Outside payload')
    $linkType = if ($env:OS -eq 'Windows_NT') { 'Junction' } else { 'SymbolicLink' }
    $parentLink = Join-Path $artifacts 'linked-parent'
    New-Item -ItemType $linkType -Path $parentLink -Target $outside | Out-Null
    try {
        Expect-UnsafeOutput (Join-Path $parentLink 'new-output')
        Expect-UnsafeOutput $parentLink
    } finally { [IO.Directory]::Delete($parentLink) }
    $childLink = Join-Path $safe 'linked-child'
    New-Item -ItemType $linkType -Path $childLink -Target $outside | Out-Null
    try { Expect-UnsafeOutput $safe } finally { [IO.Directory]::Delete($childLink) }
    if ([IO.File]::ReadAllText($sentinel) -cne 'Outside payload') { throw 'Guard changed the outside payload.' }
    Write-Host 'BUILD_OUTPUT_GUARDS_PASS: safe existing and new paths accepted; outside paths, files, linked parents and linked descendants rejected without writes.'
} finally {
    $resolvedFixture = [IO.Path]::GetFullPath($fixture)
    $tempPrefix = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    if (-not $resolvedFixture.StartsWith($tempPrefix) -or (Split-Path $resolvedFixture -Leaf) -notlike 'lean-build-output-test-*') { throw 'Unsafe fixture cleanup path.' }
    if (Test-Path -LiteralPath $resolvedFixture) { Remove-Item -LiteralPath $resolvedFixture -Recurse -Force }
}
