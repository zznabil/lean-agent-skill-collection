[CmdletBinding()]
param([string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot), [string]$ArtifactsDirectory)
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'validate.ps1') -ArtifactsDirectory $ArtifactsDirectory -FunctionsOnly
$repoRoot = [IO.Path]::GetFullPath($RepositoryRoot)
$profiles=Test-MetadataContracts
if (-not $profiles) { throw 'Cannot audit invalid metadata' }
$version=[string]$profiles.version
foreach ($item in @(
    @('README.md',"V$version"),
    @('CHANGELOG.md',"## $version -"),
    @('docs/SKILL-CATALOG.md',"V$version"),
    @("releases/v$version/RELEASE-NOTES-v$version.md",[string]$profiles.release_title)
)) {
    $path=Join-Path $repoRoot $item[0]
    if (-not (Test-Path -LiteralPath $path) -or (Read-Text $path).IndexOf($item[1],[StringComparison]::Ordinal) -lt 0) { Add-Failure "current release surface mismatch: $($item[0])" }
}
$corpus=(Read-Text (Join-Path $repoRoot 'docs/evals/v9-scenarios.json')) | ConvertFrom-Json
if ($corpus.schema_version -ne 1 -or $corpus.status -ne 'authored_not_executed') { Add-Failure 'scenario evidence status mismatch' }
$cases=@($corpus.cases)
if ($cases.Count -ne 64 -or @($cases.id | Sort-Object -Unique).Count -ne 64) { Add-Failure 'scenario count or duplicate IDs' }
foreach ($case in $cases) {
    foreach ($field in @('id','kind','prompt','expected_owner','expect','reject')) { if ([string]::IsNullOrWhiteSpace([string]$case.$field)) { Add-Failure "scenario $($case.id) lacks $field" } }
    if ($case.kind -notin @('routing','behaviour') -or $profiles.profiles.complete.skills -notcontains $case.expected_owner) { Add-Failure "invalid scenario owner or kind: $($case.id)" }
    if ($case.expect -eq $case.reject) { Add-Failure "non-discriminating scenario: $($case.id)" }
}
# Earlier fixture mirrors remain historical, byte-identical records.
foreach ($pair in @(
    @('v8.3.0','usable-information-scenarios-v8.3.0.csv'),
    @('v8.3.0','usable-information-decisions-v8.3.0.csv'),
    @('v8.4.0','proof-integrity-scenarios-v8.4.0.csv'),
    @('v8.5.0','proportional-rigor-scenarios-v8.5.0.csv'),
    @('v8.6.0','outcome-first-delivery-scenarios-v8.6.0.csv'),
    @('v8.7.0','direct-claims-scenarios-v8.7.0.csv')
)) {
    $left=Join-Path $repoRoot ('docs/evals/'+$pair[1]);$right=Join-Path $repoRoot ('releases/'+$pair[0]+'/'+$pair[1])
    if (-not (Test-Path $left) -or -not (Test-Path $right) -or (Get-FileSha256 $left) -ne (Get-FileSha256 $right)) { Add-Failure "historical fixture mirror mismatch: $($pair[1])" }
}
$size=(Read-Text (Join-Path $repoRoot 'docs/V9-SIZE.json')) | ConvertFrom-Json
if ($size.candidate_version -ne $version -or $size.candidate.skills -ne 17) { Add-Failure 'size report identity mismatch' }
$sets=@{
    agents=@(Get-Item (Join-Path $repoRoot 'AGENTS.md'))
    engineering_core=@(Get-Item (Join-Path $repoRoot 'ENGINEERING-CORE.md'))
    skill_roots=@(Get-ChildItem (Join-Path $repoRoot 'skills/*/SKILL.md'))
    adapters=@(Get-ChildItem (Join-Path $repoRoot 'skills/*/agents/openai.yaml'))
    all_skill_files=@(Get-ChildItem (Join-Path $repoRoot 'skills') -File -Recurse -Force)
}
foreach ($key in $sets.Keys) {
    $bytes=0;$words=0
    foreach ($file in $sets[$key]) { $bytes+=$file.Length;$words+=@((Read-Text $file.FullName).Trim() -split '\s+').Count }
    if ($size.candidate.$key.bytes -ne $bytes -or $size.candidate.$key.words -ne $words) { Add-Failure "size report measurement mismatch: $key" }
}
Test-StandardsContracts
Test-RepositoryHygiene
if ($ArtifactsDirectory) { Test-ReleaseArtifacts ([IO.Path]::GetFullPath($ArtifactsDirectory)) $profiles }
if ($failures.Count) { throw "Repository audit failed: $($failures.Count) issue(s)" }
Write-Host 'PASS: current release surfaces, authored scenario structure, historical mirrors and independently recalculated size; live behaviour NOT TESTED'
