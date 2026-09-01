[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$ArtifactsDirectory
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) { $script:failures.Add($Message) }
function Add-Pass([string]$Message) { $script:passes.Add($Message) }
function Read-Json([string]$RelativePath) {
    $path = Join-Path $RepositoryRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Failure "missing required JSON file: $RelativePath"
        return $null
    }
    try { return Get-Content -Raw -LiteralPath $path | ConvertFrom-Json }
    catch { Add-Failure "invalid JSON in ${RelativePath}: $($_.Exception.Message)"; return $null }
}
function Get-Sha256([string]$Path) {
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLowerInvariant()
}
function Assert-TextFile([string]$RelativePath) {
    $path = Join-Path $RepositoryRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return }
    $bytes = [System.IO.File]::ReadAllBytes($path)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        Add-Failure "UTF-8 BOM is not allowed: $RelativePath"
    }
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    if ($text.Contains("`r")) { Add-Failure "CR or CRLF line endings found: $RelativePath" }
    if ($text -match "(?m)[ `t]+$") { Add-Failure "trailing whitespace found: $RelativePath" }
    if ($bytes.Length -gt 0 -and $bytes[$bytes.Length - 1] -ne 0x0A) { Add-Failure "missing final newline: $RelativePath" }
    if ($text -match '(?m)^(<<<<<<<|=======|>>>>>>>)') { Add-Failure "merge-conflict marker found: $RelativePath" }
}

$profiles = Read-Json 'release-profiles.json'
$package = Read-Json 'PACKAGE-VALIDATION.json'
$plugin = Read-Json '.codex-plugin/plugin.json'
if ($null -eq $profiles -or $null -eq $package -or $null -eq $plugin) {
    foreach ($failure in $failures) { Write-Host "FAIL: $failure" }
    exit 1
}

$version = [string]$profiles.version
$release = [string]$profiles.release
if ([string]::IsNullOrWhiteSpace($version)) { Add-Failure 'release-profiles.json has no version' }
if ($release -ne "v$version") { Add-Failure "release tag '$release' does not match version '$version'" }
if ([string]$package.version -ne $version) { Add-Failure 'PACKAGE-VALIDATION.json version does not match release-profiles.json' }
if ([string]$plugin.version -ne $version) { Add-Failure '.codex-plugin/plugin.json version does not match release-profiles.json' }

$citationPath = Join-Path $RepositoryRoot 'CITATION.cff'
$citation = Get-Content -Raw -LiteralPath $citationPath
if ($citation -notmatch "(?m)^version:\s*$([regex]::Escape($version))\s*$") { Add-Failure 'CITATION.cff version does not match release-profiles.json' }

$readme = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'README.md')
if ($readme -notmatch "version-v$([regex]::Escape($version))-") { Add-Failure 'README version badge is stale' }
if ($readme -notmatch "V$([regex]::Escape($version))") { Add-Failure 'README does not identify the current release' }

$changelog = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'CHANGELOG.md')
$changelogPattern = '(?m)^##\s+' + [regex]::Escape($version) + '\s+'
if ($changelog -notmatch $changelogPattern) { Add-Failure 'CHANGELOG has no current-version entry' }

$releaseNotesRelative = "releases/v$version/RELEASE-NOTES-v$version.md"
$releaseNotesPath = Join-Path $RepositoryRoot $releaseNotesRelative
if (-not (Test-Path -LiteralPath $releaseNotesPath -PathType Leaf)) { Add-Failure "current release notes are missing: $releaseNotesRelative" }
else {
    $releaseNotes = Get-Content -Raw -LiteralPath $releaseNotesPath
    if ($releaseNotes -notmatch [regex]::Escape([string]$profiles.release_title)) { Add-Failure 'release title differs between release-profiles.json and release notes' }
}

$skillsRoot = Join-Path $RepositoryRoot 'skills'
$actualSkills = @(Get-ChildItem -LiteralPath $skillsRoot -Directory | Sort-Object Name | ForEach-Object Name)
$completeSkills = @($profiles.profiles.complete.skills | ForEach-Object { [string]$_ } | Sort-Object)
if ($actualSkills.Count -ne 23) { Add-Failure "expected 23 canonical skills, found $($actualSkills.Count)" }
if ((Compare-Object $actualSkills $completeSkills).Count -ne 0) { Add-Failure 'Complete profile does not match the canonical skills directory' }

$communicationSkills = @($profiles.profiles.communication.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
$getItDoneSkills = @($profiles.profiles.'get-it-done'.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
$gauntletSkills = @($profiles.profiles.gauntlet.skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
if ($communicationSkills.Count -ne 3) { Add-Failure "Communication profile must contain 3 unique skills; found $($communicationSkills.Count)" }
if ($getItDoneSkills.Count -ne 5) { Add-Failure "Get It Done profile must contain 5 unique skills; found $($getItDoneSkills.Count)" }
if ($gauntletSkills.Count -ne 4) { Add-Failure "Gauntlet profile must contain 4 unique skills; found $($gauntletSkills.Count)" }
foreach ($skill in $communicationSkills) {
    if (-not ($getItDoneSkills -contains $skill)) { Add-Failure "Get It Done profile lacks Communication skill: $skill" }
    if (-not ($gauntletSkills -contains $skill)) { Add-Failure "Gauntlet profile lacks Communication skill: $skill" }
}
if (-not ($getItDoneSkills -contains 'get-it-done') -or -not ($getItDoneSkills -contains 'gauntlet-loop')) { Add-Failure 'Get It Done profile lacks a required task controller' }
if (-not ($gauntletSkills -contains 'gauntlet-loop')) { Add-Failure 'Gauntlet profile lacks gauntlet-loop' }
$composition = $package.profile_composition
if ($null -eq $composition -or -not $composition.communication_embedded_in_get_it_done -or -not $composition.communication_embedded_in_gauntlet) {
    Add-Failure 'PACKAGE-VALIDATION.json lacks the communication-complete task-pack contract'
} else {
    $metadataCommunication = @($composition.communication_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    $metadataGetItDone = @($composition.get_it_done_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    $metadataGauntlet = @($composition.gauntlet_skills | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    if ((Compare-Object $communicationSkills $metadataCommunication).Count -ne 0) { Add-Failure 'Communication profile metadata differs from release-profiles.json' }
    if ((Compare-Object $getItDoneSkills $metadataGetItDone).Count -ne 0) { Add-Failure 'Get It Done profile metadata differs from release-profiles.json' }
    if ((Compare-Object $gauntletSkills $metadataGauntlet).Count -ne 0) { Add-Failure 'Gauntlet profile metadata differs from release-profiles.json' }
}


$proof = $package.proof_integrity
if ($null -eq $proof -or -not $proof.global_principles -or $proof.source_project -ne 'Leonxlnx/unlazy' -or $proof.source_commit -ne '473d4b80421c36d733042434cd4b938f81a19ef1' -or $proof.runtime_vendored -ne $false -or -not $proof.oracle_must_be_falsifiable -or -not $proof.status_is_not_reexecution -or -not $proof.required_gate_abandonment_is_not_completion -or -not $proof.native_parallel_claim_requires_launch_barrier) {
    Add-Failure 'PACKAGE-VALIDATION.json lacks the V8.4 proof-integrity contract'
} else {
    $proofScenarioRelative = [string]$proof.scenario_file
    $proofScenarioPath = Join-Path $RepositoryRoot $proofScenarioRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $proofMirrorRelative = 'releases/v8.4.0/proof-integrity-scenarios-v8.4.0.csv'
    $proofMirrorPath = Join-Path $RepositoryRoot $proofMirrorRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    if (-not (Test-Path -LiteralPath $proofScenarioPath -PathType Leaf)) { Add-Failure "proof-integrity scenario file missing: $proofScenarioRelative" }
    elseif (-not (Test-Path -LiteralPath $proofMirrorPath -PathType Leaf)) { Add-Failure "proof-integrity release mirror missing: $proofMirrorRelative" }
    else {
        $proofScenarioCount = @(Import-Csv -LiteralPath $proofScenarioPath).Count
        if ($proofScenarioCount -ne [int]$proof.static_scenarios) { Add-Failure "proof-integrity metadata says $($proof.static_scenarios) but CSV contains $proofScenarioCount rows" }
        if ((Get-Sha256 $proofScenarioPath) -ne (Get-Sha256 $proofMirrorPath)) { Add-Failure 'proof-integrity scenario mirror drift' }
    }
}


$rigor = $package.proportional_rigor
$expectedModes = @('ADVERSARIAL','DEEP','DIRECT','STANDARD')
if ($null -eq $rigor -or -not $rigor.global_principles -or -not $rigor.direct_for_single_decisive_check -or -not $rigor.extra_scrutiny_requires_distinct_evidence_gap -or -not $rigor.safety_and_correctness_floor_immutable -or -not $rigor.no_new_routed_skill) {
    Add-Failure 'PACKAGE-VALIDATION.json lacks the V8.5 proportional-rigor contract'
} else {
    $actualModes = @($rigor.modes | ForEach-Object { [string]$_ } | Sort-Object -Unique)
    if ((Compare-Object $expectedModes $actualModes).Count -ne 0) { Add-Failure 'proportional-rigor mode inventory is inaccurate' }
    $rigorScenarioRelative = [string]$rigor.scenario_file
    $rigorScenarioPath = Join-Path $RepositoryRoot $rigorScenarioRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $rigorMirrorRelative = 'releases/v8.5.0/proportional-rigor-scenarios-v8.5.0.csv'
    $rigorMirrorPath = Join-Path $RepositoryRoot $rigorMirrorRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    if (-not (Test-Path -LiteralPath $rigorScenarioPath -PathType Leaf)) { Add-Failure "proportional-rigor scenario file missing: $rigorScenarioRelative" }
    elseif (-not (Test-Path -LiteralPath $rigorMirrorPath -PathType Leaf)) { Add-Failure "proportional-rigor release mirror missing: $rigorMirrorRelative" }
    else {
        $rigorRows = @(Import-Csv -LiteralPath $rigorScenarioPath)
        if ($rigorRows.Count -ne [int]$rigor.static_scenarios) { Add-Failure "proportional-rigor metadata says $($rigor.static_scenarios) but CSV contains $($rigorRows.Count) rows" }
        if (@($rigorRows.id | Sort-Object -Unique).Count -ne $rigorRows.Count) { Add-Failure 'proportional-rigor scenario IDs are not unique' }
        foreach ($mode in $expectedModes) {
            if (@($rigorRows | Where-Object { $_.expected_mode -eq $mode }).Count -ne 12) { Add-Failure "proportional-rigor scenario corpus must contain 12 $mode cases" }
        }
        if ((Get-Sha256 $rigorScenarioPath) -ne (Get-Sha256 $rigorMirrorPath)) { Add-Failure 'proportional-rigor scenario mirror drift' }
    }
}

$scenarioExpected = [int]$package.human_usable_information.static_scenarios
$scenarioPairs = @(
    @('docs/evals/usable-information-scenarios-v8.3.0.csv', 'releases/v8.3.0/usable-information-scenarios-v8.3.0.csv'),
    @('docs/evals/usable-information-decisions-v8.3.0.csv', 'releases/v8.3.0/usable-information-decisions-v8.3.0.csv')
)
foreach ($pair in $scenarioPairs) {
    $left = Join-Path $RepositoryRoot $pair[0]
    $right = Join-Path $RepositoryRoot $pair[1]
    if (-not (Test-Path -LiteralPath $left -PathType Leaf)) { Add-Failure "missing evaluation file: $($pair[0])"; continue }
    if (-not (Test-Path -LiteralPath $right -PathType Leaf)) { Add-Failure "missing release evaluation mirror: $($pair[1])"; continue }
    if ((Get-Sha256 $left) -ne (Get-Sha256 $right)) { Add-Failure "evaluation mirror drift: $($pair[0]) != $($pair[1])" }
}
$scenarioPath = Join-Path $RepositoryRoot 'docs/evals/usable-information-scenarios-v8.3.0.csv'
if (Test-Path -LiteralPath $scenarioPath -PathType Leaf) {
    $scenarioActual = @(Import-Csv -LiteralPath $scenarioPath).Count
    if ($scenarioActual -ne $scenarioExpected) { Add-Failure "scenario metadata says $scenarioExpected but CSV contains $scenarioActual rows" }
}

$userInfoPath = Join-Path $RepositoryRoot 'skills/writing/USER-INFORMATION.md'
if (-not (Test-Path -LiteralPath $userInfoPath -PathType Leaf)) { Add-Failure 'skills/writing/USER-INFORMATION.md is missing' }
$writing = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'skills/writing/SKILL.md')
if ($writing -notmatch [regex]::Escape('USER-INFORMATION.md')) { Add-Failure 'writing skill does not reference USER-INFORMATION.md' }

$temporaryPatterns = @(
    '.github/*overlay*.b64',
    '.github/*overlay*.tar.*',
    '.github/apply-v*.py',
    '.github/workflows/apply-v*.yml',
    '.github/workflows/recover-v*.yml',
    '.github/workflows/publish-v*.yml'
)
foreach ($pattern in $temporaryPatterns) {
    $matches = @(Get-ChildItem -Path (Join-Path $RepositoryRoot $pattern) -File -ErrorAction SilentlyContinue)
    foreach ($match in $matches) { Add-Failure "temporary release or recovery scaffold remains: $($match.FullName.Substring($RepositoryRoot.Length + 1))" }
}

$currentTextFiles = @(
    'README.md','AGENTS.md','ENGINEERING-CORE.md','CHANGELOG.md','CITATION.cff',
    'PACKAGE-VALIDATION.json','release-profiles.json','.codex-plugin/plugin.json',
    'docs/AUDIT.md','docs/SKILL-CATALOG.md','docs/STANDARDS-REGISTER.md','docs/REPOSITORY-AUDIT.md','docs/UNLAZY-REVIEW-v8.4.0.md','docs/MINIMUM-SCRUTINY-REVIEW-v8.5.0.md',
    'scripts/audit-repository.ps1'
)
$currentTextFiles += @(Get-ChildItem -LiteralPath $skillsRoot -Recurse -File | ForEach-Object { $_.FullName.Substring($RepositoryRoot.Length + 1) })
foreach ($relative in $currentTextFiles | Sort-Object -Unique) { Assert-TextFile $relative }

if ($ArtifactsDirectory) {
    $artifactRoot = [System.IO.Path]::GetFullPath($ArtifactsDirectory)
    if (-not (Test-Path -LiteralPath $artifactRoot -PathType Container)) { Add-Failure "artifact directory does not exist: $artifactRoot" }
    else {
        $expectedArchives = @(
            "lean-agent-skills-core-openai-v$version.zip",
            "lean-agent-skills-engineering-openai-v$version.zip",
            "lean-agent-skills-complete-openai-v$version.zip",
            "user-facing-communication-mini-openai-v$version.zip",
            "get-it-done-pack-openai-v$version.zip",
            "gauntlet-loop-pack-openai-v$version.zip",
            "openai-native-skill-collections-v$version-all.zip"
        )
        foreach ($name in $expectedArchives) {
            if (-not (Test-Path -LiteralPath (Join-Path $artifactRoot $name) -PathType Leaf)) { Add-Failure "built release asset is missing: $name" }
        }
    }
}

if ($failures.Count -eq 0) {
    Add-Pass 'repository metadata, current release, 23-skill inventory, profile composition, proof-integrity and proportional-rigor scenarios, evaluation mirrors, text hygiene, and temporary-file checks'
    if ($ArtifactsDirectory) { Add-Pass 'expected release archives are present' }
    foreach ($pass in $passes) { Write-Host "PASS: $pass" }
    exit 0
}
foreach ($failure in $failures) { Write-Host "FAIL: $failure" }
Write-Host "Repository audit failed with $($failures.Count) issue(s)."
exit 1
