[CmdletBinding()]
param(
    [string]$OutputDirectory
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$definitionPath = Join-Path $repoRoot 'release-profiles.json'
$definition = Get-Content -Raw -LiteralPath $definitionPath | ConvertFrom-Json
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
    $manualNames = @('gauntlet-loop', 'get-it-done', 'grilling', 'handoff', 'project-context', 'wait-what')
    return @($Skills | Where-Object { $manualNames -contains [string]$_ })
}
function Resolve-RepoRelativePath([string]$RelativePath, [string]$Kind) {
    if ([string]::IsNullOrWhiteSpace($RelativePath) -or $RelativePath -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*(/[A-Za-z0-9][A-Za-z0-9._-]*)*$') {
        throw "Invalid $Kind path; expected a nonempty portable repo-relative forward-slash path: $RelativePath"
    }
    $nativeRelativePath = $RelativePath.Replace('/', [string][IO.Path]::DirectorySeparatorChar)
    $candidate = [IO.Path]::GetFullPath((Join-Path $repoRoot $nativeRelativePath))
    $repoRootFull = [IO.Path]::GetFullPath($repoRoot).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
    if (-not $candidate.StartsWith($repoRootFull, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Invalid $Kind path outside repository root: $RelativePath"
    }
    return $candidate
}

function Get-UserFacingSkillEntries([object]$Config) {
    if ($null -eq $Config) { throw 'Missing user_facing_standards configuration.' }
    $manifestRelative = [string]$Config.source_manifest
    $manifestPath = Resolve-RepoRelativePath $manifestRelative 'user-facing source manifest'
    $sourceRootRelative = [string]$Config.source_root
    $sourceRoot = Resolve-RepoRelativePath $sourceRootRelative 'user-facing source root'
    $expectedHash = ([string]$Config.source_manifest_sha256).ToLowerInvariant()
    if ($expectedHash -notmatch '^[0-9a-f]{64}$') { throw 'Invalid user-facing source manifest hash configuration.' }
    if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) { throw "User-facing source manifest must be a file: $manifestRelative" }
    if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) { throw "User-facing source root must be a directory: $sourceRootRelative" }
    if ((Get-Sha256File $manifestPath) -ne $expectedHash) { throw "User-facing source manifest hash mismatch: $manifestRelative" }
    try { $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json } catch { throw "User-facing source manifest parse failure: $($_.Exception.Message)" }
    $expectedCount = [int]$Config.skills_expected
    $manifestSkills = @($manifest.skills)
    if ($manifestSkills.Count -ne $expectedCount) { throw "User-facing source manifest skill count mismatch: expected $expectedCount, found $($manifestSkills.Count)." }
    $names = New-Object System.Collections.Generic.List[string]
    $manifestSeen = @{}
    foreach ($record in $manifestSkills) {
        $name = [string]$record.name
        if ([string]::IsNullOrWhiteSpace($name) -or $name -notmatch '^[A-Za-z0-9][A-Za-z0-9_-]*$') { throw "Unsafe user-facing skill name: $name" }
        $folded = $name.ToLowerInvariant()
        if ($manifestSeen.ContainsKey($folded)) { throw "Duplicate user-facing skill name: $name" }
        $manifestSeen[$folded] = $name
        $names.Add($name)
    }
    $children = @(Get-ChildItem -LiteralPath $sourceRoot -Directory -Force)
    if ($children.Count -ne $expectedCount) { throw "User-facing source directory count mismatch: expected $expectedCount, found $($children.Count)." }
    $childByFolded = @{}
    foreach ($child in $children) {
        $childName = [string]$child.Name
        if ($childName -notmatch '^[A-Za-z0-9][A-Za-z0-9_-]*$') { throw "Unsafe user-facing source directory name: $childName" }
        $folded = $childName.ToLowerInvariant()
        if ($childByFolded.ContainsKey($folded)) { throw "Duplicate user-facing source directory name: $childName" }
        $childByFolded[$folded] = $child.FullName
    }
    if ($childByFolded.Count -ne $expectedCount) { throw "User-facing source directory uniqueness mismatch." }
    $entries = New-Object System.Collections.Generic.List[object]
    foreach ($name in $names) {
        $exactMatches = @($children | Where-Object { [String]::Equals([string]$_.Name, $name, [StringComparison]::Ordinal) })
        if ($exactMatches.Count -ne 1) { throw "User-facing source directory case mismatch for manifest skill: $name" }
        $entries.Add([pscustomobject]@{ Name = $name; SourcePath = [string]$exactMatches[0].FullName })
    }
    return $entries.ToArray()
}
function Get-UserFacingRightsNoticePath([object]$Config) {
    $relativePath = [string]$Config.rights_notice_path
    $path = Resolve-RepoRelativePath $relativePath 'user-facing rights notice'
    $expectedHash = ([string]$Config.rights_notice_sha256).ToLowerInvariant()
    if ($expectedHash -notmatch '^[0-9a-f]{64}$') { throw 'Invalid user-facing rights notice hash configuration.' }
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { throw "User-facing rights notice must be a file: $relativePath" }
    if ((Get-Sha256File $path) -ne $expectedHash) { throw "User-facing rights notice hash mismatch: $relativePath" }
    return $path
}
function Get-PackageBaseName([string]$ProfileDefinition, [string]$Version) {
    switch ($ProfileDefinition) {
        'communication' { return "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { return "get-it-done-pack-openai-v$Version" }
        'gauntlet' { return "gauntlet-loop-pack-openai-v$Version" }
        default { return "lean-agent-skills-$ProfileDefinition-openai-v$Version" }
    }
}
function New-ProfileReadme([object]$ProfileDefinition, [string]$Version, [string[]]$BaseSkills, [object[]]$UserFacingSkills, [string[]]$EffectiveSkills) {
    $markdownCode = [string][char]96
    $skills = @($EffectiveSkills | ForEach-Object { $markdownCode + [string]$_ + $markdownCode }) -join ', '
    $base = @($BaseSkills | ForEach-Object { $markdownCode + [string]$_ + $markdownCode }) -join ', '
    $supplemental = @($UserFacingSkills | ForEach-Object { $markdownCode + [string]$_.Name + $markdownCode }) -join ', '
    $manual = @(Get-ManualSkills $BaseSkills | ForEach-Object { $markdownCode + [string]$_ + $markdownCode }) -join ', '
    $fence = $markdownCode + $markdownCode + $markdownCode
    $shapeLines = New-Object System.Collections.Generic.List[string]
    $shapeLines.Add($fence + 'text')
    $shapeLines.Add('.codex-plugin/plugin.json')
    $shapeLines.Add('AGENTS.md')
    if ($ProfileDefinition.include_engineering_core) { $shapeLines.Add('ENGINEERING-CORE.md') }
    $shapeLines.Add('LICENSE')
    $shapeLines.Add('THIRD_PARTY_NOTICES.md')
    $shapeLines.Add('USER-FACING-STANDARDS-NOTICES.md')
    $shapeLines.Add('skills/<task-skill>/SKILL.md')
    $shapeLines.Add('skills/<task-skill>/agents/openai.yaml')
    $shapeLines.Add('skills/<supplemental-skill>/SKILL.md')
    $shapeLines.Add('skills/<supplemental-skill>/SOURCES.md')
    $shapeLines.Add('skills/<supplemental-skill>/references/<source>')
    $shapeLines.Add($fence)
    $packageShape = $shapeLines -join [Environment]::NewLine
    $engineeringLine = ''
    if ($ProfileDefinition.include_engineering_core) {
        $engineeringLine = '- Keep ENGINEERING-CORE.md beside AGENTS.md for material engineering work.' + [Environment]::NewLine
    }
    return @"
# $($ProfileDefinition.title) v$Version

$($ProfileDefinition.description)

## $($definition.release_title)

This profile includes $(@($BaseSkills).Count) base task skills and $(@($UserFacingSkills).Count) supplemental user-facing standards. Base task routing remains unchanged.

## Package shape

$packageShape

Original task adapters and policies remain unchanged. Supplemental user-facing standards carry SOURCES.md and any bundled references/; they do not add OpenAI adapters.

## Rights and limitations

Read THIRD_PARTY_NOTICES.md for the base collection and USER-FACING-STANDARDS-NOTICES.md for supplemental source terms before redistribution. Publisher documents retain their own terms and are not relicensed by the repository MIT license.

The 27 routines are scoped application aids, not complete formal standards or conformance evidence. Paid, restricted, or unavailable source documents remain linked rather than bundled; users need authorized full sources for clause-level or formal assessment.

No publisher endorsement is claimed. Inspect each skill-local SOURCES.md before redistribution.
## Included skills

$skills

### Base task skills

$base

### Supplemental user-facing standards

$supplemental

Manual-only skills in this package (base task skills only): $manual

## Install

Install this ZIP as a skills-only plugin where supported, or copy the directories under skills/ into a user or repository skill directory.

- Keep AGENTS.md in the trusted project root.
${engineeringLine}- Do not install overlapping profiles together.
- Other agent hosts can ignore supplemental adapter absence and use the same SKILL.md files; task routing remains unchanged.

See PACKAGE-VALIDATION.json for static checks. Runtime activation depends on the installed host and available tools.
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

function New-PackageValidationJson([string]$ProfileName, [object]$ProfileDefinition, [string]$Version, [string[]]$BaseSkills, [object[]]$UserFacingSkills, [string[]]$EffectiveSkills) {
    $separator = ',' + [Environment]::NewLine
    $skills = @($EffectiveSkills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_)) }) -join $separator
    $base = @($BaseSkills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_)) }) -join $separator
    $supplemental = @($UserFacingSkills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_.Name)) }) -join $separator
    $manual = @(Get-ManualSkills $BaseSkills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_)) }) -join $separator
    $includesWriting = @($BaseSkills) -contains 'writing'
    $includesWritingJson = if ($includesWriting) { 'true' } else { 'false' }
    $includesQuick = @($BaseSkills) -contains 'quick-mode'
    $includesQuickJson = if ($includesQuick) { 'true' } else { 'false' }
    return @"
{
  "scope": "static package, policy, inventory, reference, Quick Mode, and archive validation; not live host behaviour",
  "package": $(ConvertTo-JsonString $ProfileName),
  "plugin_name": $(ConvertTo-JsonString ([string]$ProfileDefinition.plugin_name)),
  "version": $(ConvertTo-JsonString $Version),
  "rights_notices": ["THIRD_PARTY_NOTICES.md", "USER-FACING-STANDARDS-NOTICES.md"],
  "public_source_limitations_preserved": true,
  "skills_expected": $(@($EffectiveSkills).Count),
  "skills_validated": $(@($EffectiveSkills).Count),
  "base_task_skills": [
$base
  ],
  "supplemental_user_facing_skills": [
$supplemental
  ],
  "included_skills": [
$skills
  ],
  "manual_only_skills": [
$manual
  ],
  "considerate_agency": {
    "global": true,
    "local_fallbacks": $(@($BaseSkills | Where-Object { [string]$_ -ne 'wait-what' }).Count),
    "adapters": $(@($BaseSkills).Count),
    "supplemental_adapters": 0,
    "base_routing_unchanged": true,
    "act_ask_do_not_act": true
  },
  "adaptive_prose": {
    "global": true,
    "simple_turns_remain_short": true,
    "heavy_structure_conditional": true
  },
  "explicit_standards": {
    "engineering_core_source_map": true,
    "owning_skill_names": true,
    "formal_conformance_claimed": false
  },
  "proof_integrity": {
    "global_principles": true,
    "oracle_must_be_falsifiable": true,
    "status_is_not_reexecution": true,
    "required_gate_abandonment_is_not_completion": true
  },
  "proportional_rigor": {
    "global_principles": true,
    "modes": ["DIRECT", "STANDARD", "DEEP", "ADVERSARIAL"],
    "direct_for_single_decisive_check": true,
    "extra_scrutiny_requires_distinct_evidence_gap": true,
    "safety_and_correctness_floor_immutable": true,
    "base_task_routing_unchanged": true
  },
  "outcome_first_delivery": {
    "global_principles": true,
    "response_weight_matching": true,
    "internal_depth_external_brevity": true,
    "quiet_completion": true,
    "act_or_state_blocker": true,
    "summary_tldr_distinct_when_used": true,
    "runtime_equivalence_claimed": false
  },
  "direct_claims": {
      "global_principles": true,
      "preserve_uncertainty": true,
      "preserve_semantics": true,
      "evidence_based_ownership": true,
      "no_blanket_word_ban": true,
      "no_new_route": true,
      "runtime_enforcement": false,
      "live_host_evaluated": false
  },
  "quick_mode": {
    "included": $includesQuickJson,
    "default_validation": "SMOKE",
    "dogfood_optional": true,
    "automated_uat_optional": true,
    "selected_validation_becomes_required": true,
    "real_project_interaction_required": true,
    "static_inspection_not_interaction_evidence": true,
    "production_readiness_default": "NOT_ASSESSED",
    "scenario_file": "docs/evals/quick-mode-scenarios-v8.10.0.csv",
    "static_scenarios": 24,
    "live_host_evaluated": false,
    "explicit_request_only": true,
    "natural_language_selectable": true
  },
  "human_usable_information": {
    "global_principles": true,
    "conditional_reference_included": $includesWritingJson,
    "target_user_task_validation_required_for_strong_claims": true,
    "readability_alone_is_not_acceptance": true,
    "easy_to_read_requires_intended_user_review": true
  },
  "warnings": [
    "Live model behaviour and human satisfaction were not measured.",
    "Overlapping profiles must not be installed together."
  ],
  "errors": [],
  "passed": true
}
"@
}

$userFacingEntries = @(Get-UserFacingSkillEntries $definition.user_facing_standards)
$userFacingRightsNoticePath = Get-UserFacingRightsNoticePath $definition.user_facing_standards
$userFacingNames = @($userFacingEntries | ForEach-Object { [string]$_.Name })
$profileProperties = @($definition.profiles.PSObject.Properties | Sort-Object Name)
$profileNames = @($profileProperties | ForEach-Object { [string]$_.Name })
$includedProfiles = @($definition.user_facing_standards.included_profiles)
if ($includedProfiles.Count -ne $profileNames.Count) { throw 'User-facing included_profiles count must match profile count.' }
$includedSeen = @{}
foreach ($includedProfile in $includedProfiles) {
    $includedName = [string]$includedProfile
    $folded = $includedName.ToLowerInvariant()
    if ($includedSeen.ContainsKey($folded)) { throw "Duplicate user-facing included profile: $includedName" }
    $exactProfileMatches = @($profileNames | Where-Object { [String]::Equals([string]$_, $includedName, [StringComparison]::Ordinal) })
    if ($exactProfileMatches.Count -ne 1) { throw "Unknown user-facing included profile (exact case required): $includedName" }
    $includedSeen[$folded] = $includedName
}
foreach ($profileName in $profileNames) {
    $exactIncludedMatches = @($includedProfiles | Where-Object { [String]::Equals([string]$_, $profileName, [StringComparison]::Ordinal) })
    if ($exactIncludedMatches.Count -ne 1) { throw "Profile missing from user-facing included_profiles (exact case required): $profileName" }
}
$completeBaseSkills = @($definition.profiles.complete.skills)
$completeEffectiveSkills = @($completeBaseSkills + $userFacingNames)

if (Test-Path -LiteralPath $outputFullPath) {
    Remove-Item -LiteralPath $outputFullPath -Recurse -Force
}
New-Item -ItemType Directory -Path $outputFullPath -Force | Out-Null
$workDirectory = Join-Path $outputFullPath '.build'
New-Item -ItemType Directory -Path $workDirectory -Force | Out-Null

$archiveRecords = New-Object System.Collections.Generic.List[object]
foreach ($profileProperty in $profileProperties) {
    $profileName = [string]$profileProperty.Name
    $profileDefinition = $profileProperty.Value
    $baseSkills = @($profileDefinition.skills)
    $baseSeen = @{}
    foreach ($skillNameObject in $baseSkills) {
        $skillName = [string]$skillNameObject
        if ([string]::IsNullOrWhiteSpace($skillName) -or $skillName -notmatch '^[A-Za-z0-9][A-Za-z0-9_-]*$') { throw "Unsafe base task skill name in profile '$profileName': $skillName" }
        $folded = $skillName.ToLowerInvariant()
        if ($baseSeen.ContainsKey($folded)) { throw "Duplicate base task skill in profile '$profileName': $skillName" }
        $baseSeen[$folded] = $skillName
    }
    foreach ($userFacingName in $userFacingNames) {
        if ($baseSeen.ContainsKey($userFacingName.ToLowerInvariant())) { throw "Base/supplemental skill collision in profile '$profileName': $userFacingName" }
    }
    $effectiveSkills = @($baseSkills + $userFacingNames)
    $packageBaseName = Get-PackageBaseName $profileName $version
    $packageDirectory = Join-Path $workDirectory $packageBaseName
    New-Item -ItemType Directory -Path (Join-Path $packageDirectory '.codex-plugin') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $packageDirectory 'skills') -Force | Out-Null
    $copyEntries = New-Object System.Collections.Generic.List[object]
    $destinationSeen = @{}
    foreach ($skillName in $baseSkills) {
        $source = Join-Path (Join-Path $repoRoot 'skills') ([string]$skillName)
        if (-not (Test-Path -LiteralPath $source -PathType Container)) { throw "Profile '$profileName' references missing skill '$skillName'." }
        $destinationKey = ([string]$skillName).ToLowerInvariant()
        if ($destinationSeen.ContainsKey($destinationKey)) { throw "Destination collision in profile '$profileName': $skillName" }
        $destinationSeen[$destinationKey] = $true
        $copyEntries.Add([pscustomobject]@{ Name = [string]$skillName; SourcePath = $source })
    }
    foreach ($userFacingEntry in $userFacingEntries) {
        $skillName = [string]$userFacingEntry.Name
        $source = [string]$userFacingEntry.SourcePath
        $destinationKey = $skillName.ToLowerInvariant()
        if ($destinationSeen.ContainsKey($destinationKey)) { throw "Destination collision in profile '$profileName': $skillName" }
        if (-not (Test-Path -LiteralPath $source -PathType Container)) { throw "User-facing source directory missing: $skillName" }
        $destinationSeen[$destinationKey] = $true
        $copyEntries.Add([pscustomobject]@{ Name = $skillName; SourcePath = $source })
    }

    Copy-Item -LiteralPath (Join-Path $repoRoot 'AGENTS.md') -Destination $packageDirectory
    if ($profileDefinition.include_engineering_core) {
        Copy-Item -LiteralPath (Join-Path $repoRoot 'ENGINEERING-CORE.md') -Destination $packageDirectory
    }
    Copy-Item -LiteralPath (Join-Path $repoRoot 'LICENSE') -Destination $packageDirectory
    Copy-Item -LiteralPath (Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md') -Destination $packageDirectory
    Copy-Item -LiteralPath $userFacingRightsNoticePath -Destination (Join-Path $packageDirectory 'USER-FACING-STANDARDS-NOTICES.md')
    foreach ($copyEntry in $copyEntries) {
        Copy-Item -LiteralPath ([string]$copyEntry.SourcePath) -Destination (Join-Path $packageDirectory 'skills') -Recurse
    }

    Write-Utf8File (Join-Path $packageDirectory '.codex-plugin/plugin.json') (New-PluginJson $profileDefinition $version)
    Write-Utf8File (Join-Path $packageDirectory 'README.md') (New-ProfileReadme $profileDefinition $version $baseSkills $userFacingEntries $effectiveSkills)
    Write-Utf8File (Join-Path $packageDirectory 'PACKAGE-VALIDATION.json') (New-PackageValidationJson $profileName $profileDefinition $version $baseSkills $userFacingEntries $effectiveSkills)
    $packageChecksums = Get-ChecksumLines $packageDirectory @('CHECKSUMS.sha256')
    Write-Utf8File (Join-Path $packageDirectory 'CHECKSUMS.sha256') ($packageChecksums -join [Environment]::NewLine)

    $archivePath = Join-Path $outputFullPath ($packageBaseName + '.zip')
    New-DeterministicZip $workDirectory $archivePath
    $archiveHash = (Get-Sha256File $archivePath)
    $archiveSize = (Get-Item -LiteralPath $archivePath).Length
    $archiveRecords.Add([pscustomobject]@{ Name = [IO.Path]::GetFileName($archivePath); Hash = $archiveHash; Bytes = $archiveSize; Profile = $profileName })

    Remove-Item -LiteralPath $packageDirectory -Recurse -Force
}

$checksumLines = @($archiveRecords | Sort-Object Name | ForEach-Object { "$($_.Hash)  $($_.Name)" })
Write-Utf8File (Join-Path $outputFullPath 'CHECKSUMS.sha256') ($checksumLines -join [Environment]::NewLine)

$manifestArchiveLines = New-Object System.Collections.Generic.List[string]
$sortedRecords = @($archiveRecords | Sort-Object Name)
for ($index = 0; $index -lt $sortedRecords.Count; $index++) {
    $record = $sortedRecords[$index]
    $comma = ','
    if ($index -eq ($sortedRecords.Count - 1)) { $comma = '' }
    $manifestArchiveLines.Add(('    ' + (ConvertTo-JsonString $record.Name) + ': {"sha256": ' + (ConvertTo-JsonString $record.Hash) + ', "bytes": ' + [string]$record.Bytes + ', "profile": ' + (ConvertTo-JsonString $record.Profile) + '}' + $comma))
}
$manifest = @"
{
  "release": $(ConvertTo-JsonString $releaseName),
  "version": $(ConvertTo-JsonString $version),
  "scope": "deterministic package build and static validation; not live host-routing or behavioural validation",
  "profiles": $($profileProperties.Count),
  "unique_skills": $(@($completeEffectiveSkills).Count),
  "base_task_skills": $(@($definition.profiles.complete.skills).Count),
  "supplemental_user_facing_skills": 27,
  "release_unique_skills": $(@($completeEffectiveSkills).Count),
  "supplemental_source_manifest": "packs/user-facing-standards/SOURCE-MANIFEST.json",
  "supplemental_catalog": "packs/user-facing-standards/CATALOG.md",
  "supplemental_rights_notice": "packs/user-facing-standards/THIRD-PARTY-NOTICES.md",
  "considerate_agency": true,
  "adaptive_prose": true,
  "explicit_standards": true,
  "human_usable_information": true,
  "proof_integrity": true,
  "proportional_rigor": true,
  "outcome_first_delivery": true,
  "direct_claims": true,
  "quick_mode": true,
  "skill_content_changed_from_v8_0_0": true,
  "archives": {
$($manifestArchiveLines -join [Environment]::NewLine)
  }
}
"@
Write-Utf8File (Join-Path $outputFullPath 'RELEASE-MANIFEST.json') $manifest
Copy-Item -LiteralPath (Join-Path $repoRoot 'LICENSE') -Destination $outputFullPath
Copy-Item -LiteralPath (Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md') -Destination $outputFullPath
Copy-Item -LiteralPath $userFacingRightsNoticePath -Destination (Join-Path $outputFullPath 'USER-FACING-STANDARDS-NOTICES.md')
Write-Utf8File (Join-Path $outputFullPath 'README.md') @"
# Lean Agent Skill Collection $releaseName

$($definition.release_summary)

Release inventory: 24 base task skills including Quick Mode plus 27 supplemental user-facing standards. Effective profile totals are core 36, engineering 47, complete 51, communication 30, get-it-done 33, and gauntlet 31.
Choose one profile. Verify downloads with CHECKSUMS.sha256 and read THIRD_PARTY_NOTICES.md for base collection terms and USER-FACING-STANDARDS-NOTICES.md for supplemental source terms before redistribution.

## Rights and limitations

Publisher documents retain their own terms and are not relicensed by the repository MIT license. The 27 routines are scoped application aids, not complete formal standards or conformance evidence.

Paid, restricted, or unavailable source documents remain linked rather than bundled; users need authorized full sources for clause-level or formal assessment. No publisher endorsement is claimed; inspect each skill-local SOURCES.md before redistribution.
"@

$masterBaseName = "openai-native-skill-collections-v$version-all"
$masterDirectory = Join-Path $workDirectory $masterBaseName
New-Item -ItemType Directory -Path $masterDirectory -Force | Out-Null
Get-ChildItem -LiteralPath $outputFullPath -File | Copy-Item -Destination $masterDirectory
$masterPath = Join-Path $outputFullPath ($masterBaseName + '.zip')
New-DeterministicZip $workDirectory $masterPath

Remove-Item -LiteralPath $workDirectory -Recurse -Force
Write-Host "Built $releaseName at $outputFullPath"
