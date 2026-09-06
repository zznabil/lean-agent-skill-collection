[CmdletBinding()]
param(
    [string]$OutputDirectory
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$definitionPath = Join-Path $repoRoot 'release-profiles.json'
$definition = Get-Content -Raw -Encoding UTF8 -LiteralPath $definitionPath | ConvertFrom-Json
$version = [string]$definition.version
$releaseName = [string]$definition.release

if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path $repoRoot (Join-Path 'artifacts' $releaseName)
}
$outputFullPath = [IO.Path]::GetFullPath($OutputDirectory)
$artifactsRoot = [IO.Path]::GetFullPath((Join-Path $repoRoot 'artifacts')).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
if (-not $outputFullPath.StartsWith($artifactsRoot, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing unsafe output directory: $outputFullPath"
}

$ancestor = $outputFullPath
while ($ancestor) {
    if (Test-Path -LiteralPath $ancestor) {
        $item = Get-Item -Force -LiteralPath $ancestor
        if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Refusing linked output path: $ancestor" }
    }
    $parent = Split-Path -Parent $ancestor
    if ($parent -eq $ancestor) { break }
    $ancestor = $parent
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Get-Sha256File([string]$Path) {
    $sha = [Security.Cryptography.SHA256]::Create()
    $stream = [IO.File]::OpenRead($Path)
    try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
    finally { $stream.Dispose(); $sha.Dispose() }
}

function Write-Utf8File([string]$Path, [string]$Content) {
    $normalized = $Content.Replace("`r`n", "`n").TrimEnd("`r", "`n") + "`n"
    [IO.File]::WriteAllText($Path, $normalized, $utf8NoBom)
}

function ConvertTo-JsonString([string]$Value) {
    if ($Value -match '[\x00-\x1F]') { throw 'Control character in generated JSON string' }
    return '"' + $Value.Replace('\', '\\').Replace('"', '\"') + '"'
}

function Get-RelativePath([string]$BasePath, [string]$Path) {
    $baseUri = New-Object Uri(([IO.Path]::GetFullPath($BasePath).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar))
    $pathUri = New-Object Uri([IO.Path]::GetFullPath($Path))
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString())
}

function Get-Crc32([byte[]]$Bytes) {
    [uint32]$crc = [uint32]::MaxValue
    [uint32]$polynomial = [uint32]::Parse('EDB88320', [Globalization.NumberStyles]::HexNumber)
    foreach ($byte in $Bytes) {
        $crc = [uint32]($crc -bxor [uint32]$byte)
        for ($bit = 0; $bit -lt 8; $bit++) {
            if (($crc -band 1) -ne 0) { $crc = [uint32](($crc -shr 1) -bxor $polynomial) }
            else { $crc = [uint32]($crc -shr 1) }
        }
    }
    return [uint32]($crc -bxor [uint32]::MaxValue)
}

function New-DeterministicZip([string]$SourceDirectory, [string]$ZipPath) {
    # Write the ZIP Store format directly. ZipArchive uses different compression
    # methods on .NET Framework and modern .NET, even for NoCompression.
    $stream = [IO.File]::Open($ZipPath, [IO.FileMode]::Create, [IO.FileAccess]::Write, [IO.FileShare]::None)
    $writer = New-Object IO.BinaryWriter($stream, (New-Object Text.UTF8Encoding($false)), $true)
    $records = New-Object System.Collections.Generic.List[object]
    try {
        $files = @(Get-ChildItem -LiteralPath $SourceDirectory -Recurse -File -Force | Sort-Object { Get-RelativePath $SourceDirectory $_.FullName })
        foreach ($file in $files) {
            $entryName = Get-RelativePath $SourceDirectory $file.FullName
            $nameBytes = [Text.Encoding]::UTF8.GetBytes($entryName)
            $data = [IO.File]::ReadAllBytes($file.FullName)
            $crc = Get-Crc32 $data
            $offset = [uint32]$stream.Position
            $writer.Write([uint32]0x04034b50)
            $writer.Write([uint16]20)
            $writer.Write([uint16]0x0800)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0x5D19)
            $writer.Write([uint32]$crc)
            $writer.Write([uint32]$data.Length)
            $writer.Write([uint32]$data.Length)
            $writer.Write([uint16]$nameBytes.Length)
            $writer.Write([uint16]0)
            $writer.Write($nameBytes)
            $writer.Write($data)
            $records.Add([pscustomobject]@{ NameBytes=$nameBytes; Crc=$crc; Size=[uint32]$data.Length; Offset=$offset })
        }

        $centralOffset = [uint32]$stream.Position
        foreach ($record in $records) {
            $writer.Write([uint32]0x02014b50)
            $writer.Write([uint16]20)
            $writer.Write([uint16]20)
            $writer.Write([uint16]0x0800)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0x5D19)
            $writer.Write([uint32]$record.Crc)
            $writer.Write([uint32]$record.Size)
            $writer.Write([uint32]$record.Size)
            $writer.Write([uint16]$record.NameBytes.Length)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0)
            $writer.Write([uint16]0)
            $writer.Write([uint32]0)
            $writer.Write([uint32]$record.Offset)
            $writer.Write([byte[]]$record.NameBytes)
        }
        $centralSize = [uint32]($stream.Position - $centralOffset)
        $writer.Write([uint32]0x06054b50)
        $writer.Write([uint16]0)
        $writer.Write([uint16]0)
        $writer.Write([uint16]$records.Count)
        $writer.Write([uint16]$records.Count)
        $writer.Write([uint32]$centralSize)
        $writer.Write([uint32]$centralOffset)
        $writer.Write([uint16]0)
    }
    finally {
        $writer.Dispose()
        $stream.Dispose()
    }
}

function Get-ChecksumLines([string]$Directory, [string[]]$ExcludedRelativePaths) {
    $excluded = @{}
    foreach ($excludedPath in $ExcludedRelativePaths) {
        $excluded[$excludedPath.Replace('\', '/')] = $true
    }
    $lines = New-Object System.Collections.Generic.List[string]
    $files = @(Get-ChildItem -LiteralPath $Directory -Recurse -File -Force | Sort-Object { Get-RelativePath $Directory $_.FullName })
    foreach ($file in $files) {
        $relative = Get-RelativePath $Directory $file.FullName
        if (-not $excluded.ContainsKey($relative)) {
            $hash = (Get-Sha256File $file.FullName)
            $lines.Add("$hash  $relative")
        }
    }
    return $lines.ToArray()
}

function Get-ManualSkills([object[]]$Skills) {
    $manualNames = @('gauntlet-loop', 'get-it-done', 'handoff', 'wait-what')
    return @($Skills | Where-Object { $manualNames -contains [string]$_ })
}

function Get-PackageBaseName([string]$ProfileDefinition, [string]$Version) {
    switch ($ProfileDefinition) {
        'communication' { return "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { return "get-it-done-pack-openai-v$Version" }
        'gauntlet' { return "gauntlet-loop-pack-openai-v$Version" }
        default { return "lean-agent-skills-$ProfileDefinition-openai-v$Version" }
    }
}

function New-ProfileReadme([object]$ProfileDefinition, [string]$Version) {
    $skills = @($ProfileDefinition.skills | ForEach-Object { "``$_``" }) -join ', '
    $manual = @(Get-ManualSkills $ProfileDefinition.skills | ForEach-Object { "``$_``" }) -join ', '
    $engineeringShape = ''
    $engineeringLine = ''
    if ($ProfileDefinition.include_engineering_core) {
        $engineeringShape = "ENGINEERING-CORE.md`n"
        $engineeringLine = "- Keep ``ENGINEERING-CORE.md`` beside ``AGENTS.md`` for material engineering work.`n"
    }
    return @"
# $($ProfileDefinition.title) v$Version

$($ProfileDefinition.description)

## $($definition.release_title)

$($definition.release_summary)

## Package shape

``````text
.codex-plugin/plugin.json
AGENTS.md
${engineeringShape}LICENSE
THIRD_PARTY_NOTICES.md
skills/<skill>/SKILL.md
skills/<skill>/agents/openai.yaml
``````

The ``SKILL.md`` files remain vendor-neutral. Each ``agents/openai.yaml`` file is a thin OpenAI adapter for ChatGPT and Codex metadata and invocation policy.

## Included skills

$skills

Manual-only skills in this package: $manual

## Install

Install this ZIP as a skills-only plugin where supported, or copy the directories under ``skills/`` into a user or repository skill directory.

- Merge relevant ``AGENTS.md`` guidance into the intended trusted project scope after reviewing the diff; do not blindly overwrite existing policy.
$engineeringLine- Do not install overlapping profiles together.
- Other agent hosts can ignore ``agents/openai.yaml`` and use the same ``SKILL.md`` files.

``PACKAGE-VALIDATION.json`` declares the build inventory, not a passing test result. Check CI execution evidence separately. No live model improvement or cross-host activation equivalence is claimed.

## Upgrade from V8

Replace the previous Lean profile rather than overlaying this ZIP. Remove only the six retired Lean-owned skill directories after backing up local changes: ``architecture``, ``cli-design``, ``grilling``, ``merge-conflicts``, ``project-context``, ``triage``. Their mechanisms now belong to ``plan``, ``implement``, ``handoff`` and ``debug``. Do not delete unrelated user skills or overwrite a trusted project policy without reviewing its diff.

A package's root policy is not automatically injected by every host. Confirm the actual skill source and loaded instructions. Publication does not update local installations.
"@
}

function New-PluginJson([object]$ProfileDefinition, [string]$Version) {
    return @"
{
  "name": $(ConvertTo-JsonString ([string]$ProfileDefinition.plugin_name)),
  "version": $(ConvertTo-JsonString $Version),
  "description": $(ConvertTo-JsonString ([string]$ProfileDefinition.description)),
  "skills": "./skills/"
}
"@
}

function New-PackageValidationJson([string]$ProfileName, [object]$ProfileDefinition, [string]$Version) {
    $skills = @($ProfileDefinition.skills | ForEach-Object { ConvertTo-JsonString ([string]$_) }) -join ', '
    $manual = @(Get-ManualSkills $ProfileDefinition.skills | ForEach-Object { ConvertTo-JsonString ([string]$_) }) -join ', '
    $engineering = ([bool]$ProfileDefinition.include_engineering_core).ToString().ToLowerInvariant()
    return @"
{
  "schema_version": 2,
  "scope": "build inventory declaration; validation results belong in the CI execution record",
  "package": $(ConvertTo-JsonString $ProfileName),
  "version": $(ConvertTo-JsonString $Version),
  "included_skills": [$skills],
  "manual_only_skills": [$manual],
  "include_engineering_core": $engineering,
  "behavioural_evaluation": "not_run"
}
"@
}

foreach ($profile in $definition.profiles.PSObject.Properties) {
    $names = @($profile.Value.skills)
    if ($names.Count -ne @($names | Sort-Object -Unique).Count) { throw "Duplicate profile skill: $($profile.Name)" }
    foreach ($name in $names) {
        if ([string]$name -notmatch '^[a-z][a-z0-9-]*$' -or -not (Test-Path -LiteralPath (Join-Path $repoRoot "skills/$name/SKILL.md"))) { throw "Invalid profile skill: $name" }
    }
}
foreach ($item in Get-ChildItem -LiteralPath (Join-Path $repoRoot 'skills') -Force -Recurse) {
    if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Refusing linked skill content: $($item.FullName)" }
}

if (Test-Path -LiteralPath $outputFullPath) {
    Remove-Item -LiteralPath $outputFullPath -Recurse -Force
}
New-Item -ItemType Directory -Path $outputFullPath -Force | Out-Null
$workDirectory = Join-Path $outputFullPath '.build'
New-Item -ItemType Directory -Path $workDirectory -Force | Out-Null

$archiveRecords = New-Object System.Collections.Generic.List[object]
$profileProperties = @($definition.profiles.PSObject.Properties | Sort-Object Name)
foreach ($profileProperty in $profileProperties) {
    $profileName = $profileProperty.Name
    $profileDefinition = $profileProperty.Value
    $packageBaseName = Get-PackageBaseName $profileName $version
    $packageDirectory = Join-Path $workDirectory $packageBaseName
    New-Item -ItemType Directory -Path (Join-Path $packageDirectory '.codex-plugin') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $packageDirectory 'skills') -Force | Out-Null

    Copy-Item -LiteralPath (Join-Path $repoRoot 'AGENTS.md') -Destination $packageDirectory
    if ($profileDefinition.include_engineering_core) {
        Copy-Item -LiteralPath (Join-Path $repoRoot 'ENGINEERING-CORE.md') -Destination $packageDirectory
    }
    Copy-Item -LiteralPath (Join-Path $repoRoot 'LICENSE') -Destination $packageDirectory
    Copy-Item -LiteralPath (Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md') -Destination $packageDirectory
    foreach ($skillName in @($profileDefinition.skills)) {
        $skillSource = Join-Path (Join-Path $repoRoot 'skills') ([string]$skillName)
        if (-not (Test-Path -LiteralPath $skillSource -PathType Container)) {
            throw "Profile '$profileName' references missing skill '$skillName'."
        }
        Copy-Item -LiteralPath $skillSource -Destination (Join-Path $packageDirectory 'skills') -Recurse
    }

    Write-Utf8File (Join-Path $packageDirectory '.codex-plugin/plugin.json') (New-PluginJson $profileDefinition $version)
    Write-Utf8File (Join-Path $packageDirectory 'README.md') (New-ProfileReadme $profileDefinition $version)
    Write-Utf8File (Join-Path $packageDirectory 'PACKAGE-VALIDATION.json') (New-PackageValidationJson $profileName $profileDefinition $version)
    $packageChecksums = Get-ChecksumLines $packageDirectory @('CHECKSUMS.sha256')
    Write-Utf8File (Join-Path $packageDirectory 'CHECKSUMS.sha256') ($packageChecksums -join "`n")

    $archivePath = Join-Path $outputFullPath ($packageBaseName + '.zip')
    New-DeterministicZip $workDirectory $archivePath
    $archiveHash = (Get-Sha256File $archivePath)
    $archiveSize = (Get-Item -LiteralPath $archivePath).Length
    $archiveRecords.Add([pscustomobject]@{ Name = [IO.Path]::GetFileName($archivePath); Hash = $archiveHash; Bytes = $archiveSize; Profile = $profileName })

    Remove-Item -LiteralPath $packageDirectory -Recurse -Force
}

$checksumLines = @($archiveRecords | Sort-Object Name | ForEach-Object { "$($_.Hash)  $($_.Name)" })
Write-Utf8File (Join-Path $outputFullPath 'CHECKSUMS.sha256') ($checksumLines -join "`n")

$manifestArchiveLines = New-Object System.Collections.Generic.List[string]
$sortedRecords = @($archiveRecords | Sort-Object Name)
for ($index = 0; $index -lt $sortedRecords.Count; $index++) {
    $record = $sortedRecords[$index]
    $comma = ','
    if ($index -eq ($sortedRecords.Count - 1)) { $comma = '' }
    $manifestArchiveLines.Add("    $(ConvertTo-JsonString $record.Name): {`"sha256`": $(ConvertTo-JsonString $record.Hash), `"bytes`": $($record.Bytes), `"profile`": $(ConvertTo-JsonString $record.Profile)}$comma")
}
$manifest = @"
{
  "release": $(ConvertTo-JsonString $releaseName),
  "version": $(ConvertTo-JsonString $version),
  "scope": "deterministic build inventory; not a validation result or live model evaluation",
  "profiles": $($profileProperties.Count),
  "unique_skills": $(@($definition.profiles.complete.skills).Count),
  "schema_version": 2,
  "behavioural_evaluation": "not_run",
  "archives": {
$($manifestArchiveLines -join "`n")
  }
}
"@
Write-Utf8File (Join-Path $outputFullPath 'RELEASE-MANIFEST.json') $manifest
Copy-Item -LiteralPath (Join-Path $repoRoot 'LICENSE') -Destination $outputFullPath
Copy-Item -LiteralPath (Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md') -Destination $outputFullPath
Write-Utf8File (Join-Path $outputFullPath 'README.md') @"
# Lean Agent Skill Collection $releaseName

$($definition.release_summary)

Choose one profile. Do not install overlapping profiles together. Verify downloads with ``CHECKSUMS.sha256`` and read ``LICENSE`` and ``THIRD_PARTY_NOTICES.md`` before redistribution.
"@

$masterBaseName = "openai-native-skill-collections-v$version-all"
$masterDirectory = Join-Path $workDirectory $masterBaseName
New-Item -ItemType Directory -Path $masterDirectory -Force | Out-Null
Get-ChildItem -LiteralPath $outputFullPath -File | Copy-Item -Destination $masterDirectory
$masterPath = Join-Path $outputFullPath ($masterBaseName + '.zip')
New-DeterministicZip $workDirectory $masterPath

Remove-Item -LiteralPath $workDirectory -Recurse -Force
Write-Host "Built $releaseName at $outputFullPath"
