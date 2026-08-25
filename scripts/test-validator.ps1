[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'validate.ps1') -FunctionsOnly
$quietFailures = $true

$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('lean-agent-validator-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $fixtureRoot -Force | Out-Null
Add-Type -AssemblyName System.IO.Compression

function Add-Entry([IO.Compression.ZipArchive]$Archive, [string]$Name, [string]$Content, [Nullable[int]]$ExternalAttributes) {
    $entry = $Archive.CreateEntry($Name)
    if ($null -ne $ExternalAttributes) { $entry.ExternalAttributes = $ExternalAttributes.Value }
    $stream = $entry.Open()
    try {
        $bytes = [Text.Encoding]::UTF8.GetBytes($Content)
        $stream.Write($bytes, 0, $bytes.Length)
    }
    finally { $stream.Dispose() }
}

try {
    $fixturePath = Join-Path $fixtureRoot 'unsafe.zip'
    $fileStream = [IO.File]::Open($fixturePath, [IO.FileMode]::Create)
    try {
        $archive = New-Object IO.Compression.ZipArchive($fileStream, [IO.Compression.ZipArchiveMode]::Create, $false)
        try {
            Add-Entry $archive 'root/../escape.txt' 'escape' $null
            Add-Entry $archive 'root/Case.txt' 'one' $null
            Add-Entry $archive 'root/case.txt' 'two' $null
            Add-Entry $archive 'root/run.ps1' 'Write-Host unsafe' $null
            $symlinkMode = [uint32]::Parse('A0000000', [Globalization.NumberStyles]::HexNumber)
            $symlinkAttributes = [BitConverter]::ToInt32([BitConverter]::GetBytes($symlinkMode), 0)
            Add-Entry $archive 'root/link' 'target' $symlinkAttributes
        }
        finally { $archive.Dispose() }
    }
    finally { $fileStream.Dispose() }

    Test-ZipArchive $fixturePath $null $null '0.0.0'
    $requiredFindings = @('unsafe ZIP path', 'case-colliding ZIP members', 'executable ZIP member')
    foreach ($finding in $requiredFindings) {
        if (-not ($failures | Where-Object { $_ -match [regex]::Escape($finding) })) {
            throw "Validator self-test did not detect: $finding"
        }
    }
    if (-not (Test-IsSymlinkAttributes $symlinkAttributes)) {
        throw 'Validator self-test did not detect Unix symlink mode attributes.'
    }
    Write-Host "PASS: validator rejects unsafe paths, case collisions, executables, and symlinks" -ForegroundColor Green
}
finally {
    $resolvedFixture = [IO.Path]::GetFullPath($fixtureRoot)
    $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if ($resolvedFixture.StartsWith($resolvedTemp) -and (Split-Path $resolvedFixture -Leaf) -like 'lean-agent-validator-*') {
        Remove-Item -LiteralPath $resolvedFixture -Recurse -Force
    }
}
