[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ReferenceDirectory,
    [Parameter(Mandatory = $true)]
    [string]$CandidateDirectory
)

$ErrorActionPreference = 'Stop'

function Get-FileSha256([string]$Path) {
    $stream = [System.IO.File]::OpenRead($Path)
    try {
        $sha = [System.Security.Cryptography.SHA256]::Create()
        if ($null -eq $sha) { throw 'SHA-256 capability unavailable' }
        try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
        finally { $sha.Dispose() }
    }
    finally { $stream.Dispose() }
}

function Compare-ReleaseArtifacts([string]$ReferenceRoot, [string]$CandidateRoot) {
    if (-not (Test-Path -LiteralPath $ReferenceRoot -PathType Container)) { throw "Reference directory is missing: $ReferenceRoot" }
    if (-not (Test-Path -LiteralPath $CandidateRoot -PathType Container)) { throw "Candidate directory is missing: $CandidateRoot" }
    $referenceFiles = @(Get-ChildItem -LiteralPath $ReferenceRoot -Force -File | Sort-Object Name)
    $candidateFiles = @(Get-ChildItem -LiteralPath $CandidateRoot -Force -File | Sort-Object Name)
    if ($referenceFiles.Count -ne $candidateFiles.Count) { throw 'Release artifact file counts differ' }
    for ($index = 0; $index -lt $referenceFiles.Count; $index++) {
        if ($referenceFiles[$index].Name -cne $candidateFiles[$index].Name) {
            throw "Release artifact file sets differ: $($referenceFiles[$index].Name) versus $($candidateFiles[$index].Name)"
        }
        $referenceHash = Get-FileSha256 $referenceFiles[$index].FullName
        $candidateHash = Get-FileSha256 $candidateFiles[$index].FullName
        if ([string]::IsNullOrWhiteSpace($referenceHash) -or [string]::IsNullOrWhiteSpace($candidateHash)) {
            throw "Missing SHA-256 hash: $($referenceFiles[$index].Name)"
        }
        if ($referenceHash -cne $candidateHash) {
            throw "Non-deterministic output: $($referenceFiles[$index].Name)"
        }
    }
}

try {
    Compare-ReleaseArtifacts $ReferenceDirectory $CandidateDirectory
    Write-Host 'PASS: release artifact files and streaming SHA-256 hashes match' -ForegroundColor Green
    exit 0
}
catch {
    Write-Error $_
    Write-Output ('ERROR: release artifact comparison failed: ' + $_.Exception.Message)
    exit 1
}
