[CmdletBinding()]
param([string]$ArtifactsDirectory = (Join-Path (Split-Path -Parent $PSScriptRoot) 'artifacts/repro-a'))
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'validate.ps1') -ArtifactsDirectory $ArtifactsDirectory -FunctionsOnly
$originalRoot = $repoRoot
$work = Join-Path ([IO.Path]::GetTempPath()) ('lean-validator-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $work | Out-Null
$quietFailures = $true
$controls = 0
function Expect-Rejection([string]$Name, [scriptblock]$Check, [string]$Message) {
    $failures.Clear()
    & $Check
    if (-not ($failures | Where-Object { $_ -match $Message })) { throw "Control failed to detect ${Name}: $($failures -join '; ')" }
    $script:controls++
    Write-Host "PASS negative control: $Name"
}
function Write-Text([string]$Path,[string]$Text) { [IO.File]::WriteAllText($Path,$Text,(New-Object Text.UTF8Encoding($false))) }
function Edit-Json([string]$Path,[scriptblock]$Edit) {
    $value=(Read-Text $Path) | ConvertFrom-Json
    & $Edit $value
    Write-Text $Path (($value | ConvertTo-Json -Depth 20) + "`n")
}
function New-Zip([string]$Path,[string[]]$Names,[switch]$Symlink) {
    $archive=[IO.Compression.ZipFile]::Open($Path,[IO.Compression.ZipArchiveMode]::Create)
    try {
        foreach ($name in $Names) {
            $entry=$archive.CreateEntry($name)
            if ($Symlink) { $entry.ExternalAttributes = [BitConverter]::ToInt32([BitConverter]::GetBytes([uint32]2684354560),0) }
            $stream=$entry.Open();try {$bytes=[Text.Encoding]::UTF8.GetBytes('fixture');$stream.Write($bytes,0,$bytes.Length)}finally{$stream.Dispose()}
        }
    } finally { $archive.Dispose() }
}
function Rewrite-ZipEntry([string]$Path,[string]$Name,[string]$Text,[switch]$Delete) {
    $archive=[IO.Compression.ZipFile]::Open($Path,[IO.Compression.ZipArchiveMode]::Update)
    try {
        $entry=$archive.GetEntry($Name)
        if ($entry) { $entry.Delete() }
        if (-not $Delete) {
            $entry=$archive.CreateEntry($Name);$stream=$entry.Open()
            try {$bytes=[Text.Encoding]::UTF8.GetBytes($Text);$stream.Write($bytes,0,$bytes.Length)} finally {$stream.Dispose()}
        }
    } finally { $archive.Dispose() }
}
try {
    # Positive controls run the same observers against real source and real built packages.
    $profiles=Test-MetadataContracts
    Test-SkillTree $profiles
    Test-StandardsContracts
    Test-SourceIntegrity
    Test-RepositoryHygiene
    Test-ReleaseArtifacts $ArtifactsDirectory $profiles
    if ($failures.Count) { throw "Positive source/package control failed: $($failures -join '; ')" }
    Write-Host 'PASS positive control: actual source and all built packages'
    foreach ($case in @(
        @('traversal',@('root/../escape.txt'),'unsafe ZIP path'),
        @('absolute',@('/escape.txt'),'unsafe ZIP path'),
        @('drive',@('C:/escape.txt'),'unsafe ZIP path'),
        @('backslash',@('root\escape.txt'),'unsafe ZIP path'),
        @('duplicate',@('root/a.txt','root/a.txt'),'duplicate ZIP member'),
        @('case collision',@('root/A.txt','root/a.txt'),'case-colliding ZIP members'),
        @('executable',@('root/run.ps1'),'executable ZIP member')
    )) {
        $zip=Join-Path $work ($controls.ToString()+'.zip')
        New-Zip $zip $case[1]
        Expect-Rejection $case[0] { Test-ZipArchive $zip $null $null '9.0.0' } $case[2]
    }
    $zip=Join-Path $work 'symlink.zip';New-Zip $zip @('root/link') -Symlink
    Expect-Rejection 'symlink' { Test-ZipArchive $zip $null $null '9.0.0' } 'symlink ZIP member'
    $masterDir=Join-Path $work 'master';New-Item -ItemType Directory $masterDir | Out-Null
    Write-Text (Join-Path $masterDir 'expected.txt') 'expected'
    $zip=Join-Path $masterDir 'master.zip';New-Zip $zip @('wrong-root/expected.txt')
    Expect-Rejection 'master root' { Test-MasterArchive $zip $masterDir '9.0.0' } 'master archive inventory'

    $sourceCopy=Join-Path $work 'source';New-Item -ItemType Directory $sourceCopy | Out-Null
    foreach ($file in Get-SourceFiles) {
        $relative=Get-RelativePath $originalRoot $file.FullName
        $destination=Join-Path $sourceCopy $relative
        New-Item -ItemType Directory (Split-Path -Parent $destination) -Force | Out-Null
        Copy-Item -LiteralPath $file.FullName -Destination $destination
    }
    $repoRoot=$sourceCopy
    $profilePath=Join-Path $repoRoot 'release-profiles.json';$profileText=Read-Text $profilePath
    Edit-Json $profilePath { param($x) $x.profiles.communication.skills += 'teach' }
    Expect-Rejection 'duplicate profile member' { $null=Test-MetadataContracts } 'duplicate profile member'
    Write-Text $profilePath $profileText
    Edit-Json $profilePath { param($x) $x.profiles.gauntlet.skills = @('gauntlet-loop','teach','writing','research') }
    Expect-Rejection 'missing communication member' { $null=Test-MetadataContracts } 'gauntlet inventory'
    Write-Text $profilePath $profileText
    Edit-Json $profilePath { param($x) $x.profiles.communication.include_engineering_core=$true }
    Expect-Rejection 'wrong core inclusion' { $null=Test-MetadataContracts } 'engineering-core inclusion'
    Write-Text $profilePath $profileText
    $contractPath=Join-Path $repoRoot 'PACKAGE-VALIDATION.json';$contractText=Read-Text $contractPath
    Edit-Json $contractPath { param($x) $x | Add-Member -NotePropertyName passed -NotePropertyValue $true }
    Expect-Rejection 'self-awarded pass' { $null=Test-MetadataContracts } 'misstates evidence'
    Write-Text $contractPath $contractText
    Edit-Json $contractPath { param($x) $x.limits.skill_words=9000 }
    Expect-Rejection 'widened instruction budget' { Test-SkillTree $profiles } 'budget contract widened'
    Write-Text $contractPath $contractText
    $rootPath=Join-Path $repoRoot 'AGENTS.md';$rootText=Read-Text $rootPath
    Write-Text $rootPath ($rootText + (' excess' * 600) + "`n")
    Expect-Rejection 'overlong root' { Test-SkillTree $profiles } 'root budget exceeded'
    Write-Text $rootPath $rootText
    $skillPath=Join-Path $repoRoot 'skills/implement/SKILL.md';$skillText=Read-Text $skillPath
    Write-Text $skillPath ($skillText + "`n[Missing](missing.md)`n")
    Expect-Rejection 'missing standalone reference' { Test-SkillTree $profiles } 'standalone reference invalid'
    Write-Text $skillPath ($skillText + "`n[Outside](../../AGENTS.md)`n")
    Expect-Rejection 'hidden cross-profile dependency' { Test-SkillTree $profiles } 'standalone reference invalid'
    Write-Text $skillPath $skillText
    $adapterPath=Join-Path $repoRoot 'skills/gauntlet-loop/agents/openai.yaml';$adapterText=Read-Text $adapterPath
    Write-Text $adapterPath ($adapterText.Replace('allow_implicit_invocation: false','allow_implicit_invocation: true'))
    Expect-Rejection 'manual-only regression' { Test-SkillTree $profiles } 'manual invocation mismatch'
    Write-Text $adapterPath $adapterText
    Write-Text $rootPath ($rootText + "`nChanged source.`n")
    Expect-Rejection 'changed source' { Test-SourceIntegrity } 'source checksum mismatch'
    Write-Text $rootPath $rootText
    $extra=Join-Path $repoRoot 'unexpected.txt';Write-Text $extra 'extra'
    Expect-Rejection 'unlisted source' { Test-SourceIntegrity } 'source checksum coverage'
    Remove-Item $extra
    $hashPath=Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256';$hashText=Read-Text $hashPath
    Write-Text $hashPath ($hashText + (($hashText -split "`n")[0]) + "`n")
    Expect-Rejection 'duplicate source checksum' { Test-SourceIntegrity } 'duplicate source checksum'
    Write-Text $hashPath $hashText
    $coveragePath=Join-Path $repoRoot 'docs/STANDARDS-COVERAGE.json';$coverageText=Read-Text $coveragePath
    $coverage=$coverageText | ConvertFrom-Json
    $first=$coverage.entries[0]
    $ownerPath=Join-Path $repoRoot $first.owner;$ownerText=Read-Text $ownerPath
    foreach ($field in @('trigger','behaviour','reference')) {
        Write-Text $ownerPath ($ownerText.Replace([string]$first.$field,'REMOVED'))
        Expect-Rejection ("missing standards "+$field) { Test-StandardsContracts } ("standards "+$field+" missing")
        Write-Text $ownerPath $ownerText
    }
    Edit-Json $coveragePath { param($x) $x.entries=@($x.entries | Select-Object -Skip 1) }
    Expect-Rejection 'missing standards row' { Test-StandardsContracts } 'standards coverage'
    Write-Text $coveragePath $coverageText
    Edit-Json $coveragePath { param($x) $x.entries[1]=$x.entries[0] }
    Expect-Rejection 'duplicate standards row' { Test-StandardsContracts } 'duplicate standards coverage'
    Write-Text $coveragePath $coverageText
    Edit-Json $coveragePath { param($x) ($x.entries | Where-Object { $_.candidate -eq 'OWASP SAMM' }).mode='scoped' }
    Expect-Rejection 'activate excluded standard' { Test-StandardsContracts } 'standards scope promotion'
    Write-Text $coveragePath $coverageText
    Edit-Json $coveragePath { param($x) $x.entries[0].owner='skills/absent/SKILL.md' }
    Expect-Rejection 'missing standards owner' { Test-StandardsContracts } 'standards owner missing'
    Write-Text $coveragePath $coverageText
    Write-Text $skillPath ($skillText.Replace('ASD-STE100-inspired','REMOVED'))
    Expect-Rejection 'missing specialist fallback' { Test-StandardsContracts } 'standalone communication fallback missing'
    Write-Text $skillPath $skillText
    $registerPath=Join-Path $repoRoot 'docs/STANDARDS-REGISTER.md';$registerText=Read-Text $registerPath
    Write-Text $registerPath ($registerText.Replace('[AGENTS.md](../AGENTS.md)','[Wrong](../ENGINEERING-CORE.md)'))
    Expect-Rejection 'stale register owner' { Test-StandardsContracts } 'standards register owner mismatch'
    Write-Text $registerPath $registerText
    # Changing a task trigger while retaining the valid link must still be rejected.
    $applicationPath=Join-Path $repoRoot 'docs/STANDARDS-APPLICATIONS.json';$applicationText=Read-Text $applicationPath
    Write-Text $skillPath ($skillText.Replace('For changes to API/event contracts, security, personal data, user interfaces or instructions, AI, persistent state, operations or regulated behaviour,','Only for a formal architecture review,'))
    Expect-Rejection 'narrowed direct-task trigger with retained link' { Test-StandardsContracts } 'standards application activation missing'
    Write-Text $skillPath $skillText
    $earsPath=Join-Path $repoRoot 'skills/plan/REQUIREMENTS.md';$earsText=Read-Text $earsPath
    Write-Text $earsPath ($earsText.Replace('When <event>, the <system> shall <response>.','Event rule omitted.'))
    Expect-Rejection 'missing concrete EARS mechanism' { Test-StandardsContracts } 'standards application mechanism missing'
    Write-Text $earsPath $earsText
    Edit-Json $applicationPath { param($x) ($x.routes | Where-Object { $_.owner -eq 'skills/implement/BOUNDARIES.md' }).entrypoint='skills/plan/SKILL.md' }
    Expect-Rejection 'cross-profile direct-task route' { Test-StandardsContracts } 'standards application cross-profile route'
    Write-Text $applicationPath $applicationText
    Edit-Json $applicationPath { param($x) foreach ($case in $x.cases) { $case.standards=@($case.standards | Where-Object { $_ -ne 'S69' }) } }
    Expect-Rejection 'missing application coverage' { Test-StandardsContracts } 'standards application source coverage'
    Write-Text $applicationPath $applicationText
    Edit-Json $applicationPath { param($x) ($x.cases | Where-Object { $_.id -eq 'A49' }).standards += 'S71' }
    Expect-Rejection 'activate excluded source in direct task' { Test-StandardsContracts } 'standards application promotes inactive source'
    Write-Text $applicationPath $applicationText
    $repoRoot=$originalRoot

    $profileName='communication';$profile=$profiles.profiles.communication
    $packageName=(Get-PackageBaseName $profileName $profiles.version)
    $originalZip=Join-Path $ArtifactsDirectory ($packageName+'.zip')
    $zip=Join-Path $work 'changed.zip';Copy-Item $originalZip $zip
    Rewrite-ZipEntry $zip ($packageName+'/AGENTS.md') "Changed instructions.`n"
    Expect-Rejection 'changed packaged policy' { Test-ZipArchive $zip $profileName $profile $profiles.version } 'package source mismatch'
    Copy-Item $originalZip $zip -Force
    Rewrite-ZipEntry $zip ($packageName+'/CHECKSUMS.sha256') ''
    Expect-Rejection 'empty package checksums' { Test-ZipArchive $zip $profileName $profile $profiles.version } 'package checksum coverage'
    Copy-Item $originalZip $zip -Force
    Rewrite-ZipEntry $zip ($packageName+'/CHECKSUMS.sha256') "malformed`n"
    Expect-Rejection 'malformed package checksums' { Test-ZipArchive $zip $profileName $profile $profiles.version } 'malformed package checksum'
    Copy-Item $originalZip $zip -Force
    Rewrite-ZipEntry $zip ($packageName+'/skills/teach/SKILL.md') '' -Delete
    Expect-Rejection 'missing packaged skill' { Test-ZipArchive $zip $profileName $profile $profiles.version } 'package inventory'
    Copy-Item $originalZip $zip -Force
    Rewrite-ZipEntry $zip ($packageName+'/unexpected.md') 'extra'
    Expect-Rejection 'unlisted packaged file' { Test-ZipArchive $zip $profileName $profile $profiles.version } 'package inventory'
    $failures.Clear()
    Test-MetadataContracts | Out-Null
    Test-SkillTree $profiles
    Test-StandardsContracts
    Test-SourceIntegrity
    Test-ReleaseArtifacts $ArtifactsDirectory $profiles
    if ($failures.Count) { throw "Restored positive control failed: $($failures -join '; ')" }
    Write-Host "PASS: $controls isolated rejection controls and restored positive controls; not live model evaluation"
} finally {
    $repoRoot=$originalRoot
    if ($work -and (Split-Path -Leaf $work) -match '^lean-validator-[a-f0-9]{32}$') { Remove-Item -LiteralPath $work -Recurse -Force }
}
