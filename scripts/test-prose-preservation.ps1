[CmdletBinding()]
param([string]$ArtifactsDirectory)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Read-Utf8([string]$Path) { [IO.File]::ReadAllText($Path, [Text.Encoding]::UTF8) }
function Hash-Bytes([byte[]]$Bytes) {
    $hash = [Security.Cryptography.SHA256]::Create()
    try { [BitConverter]::ToString($hash.ComputeHash($Bytes)).Replace('-', '').ToLowerInvariant() }
    finally { $hash.Dispose() }
}
function Hash-Text([string]$Text) { Hash-Bytes ([Text.Encoding]::UTF8.GetBytes($Text)) }
function Normalise-Prose([string]$Text) {
    $withoutMarkers = [regex]::Replace($Text, '(?m)^[ \t]*(?:[-*]|\d+\.)[ \t]+', '')
    [regex]::Replace($withoutMarkers, '\s+', ' ').Trim()
}
function Assert-SameSequence([object[]]$Expected, [object[]]$Actual, [string]$Label) {
    if ($Expected.Count -ne $Actual.Count) { throw "PRESERVATION: $Label count" }
    for ($i=0; $i -lt $Expected.Count; $i++) {
        if ([string]$Expected[$i] -cne [string]$Actual[$i]) { throw "PRESERVATION: $Label at $i" }
    }
}
function Remove-Declared([string]$Text, [string]$Value, [int]$Count, [string]$Label) {
    if (-not $Value -or [regex]::Matches($Text, [regex]::Escape($Value)).Count -ne $Count) {
        throw "PRESERVATION: missing or repeated declared edit in $Label"
    }
    $Text.Replace($Value, '')
}
function Assert-Prose([string]$Path, [string]$Text, [object]$Record) {
    $front = [regex]::Match($Text, '(?s)\A---\n.*?\n---\n').Value
    if ($front -cne [string]$Record.frontmatter) { throw "PRESERVATION: routing frontmatter in $Path" }
    $code = @([regex]::Matches($Text, '(?ms)^```[^\n]*\n.*?^```[ \t]*$') | ForEach-Object { $_.Value })
    Assert-SameSequence @($Record.fences) $code "literal examples in $Path"
    foreach ($addition in @($Record.additions)) { $Text = Remove-Declared $Text $addition 1 $Path }
    foreach ($label in @($Record.labels)) { $Text = Remove-Declared $Text $label.text $label.count $Path }
    $numbers = @([regex]::Matches($Text, '(?m)^(\d+)\. ') | ForEach-Object { $_.Groups[1].Value })
    Assert-SameSequence @($Record.numbered_steps) $numbers "ordered steps in $Path"
    $Text = Normalise-Prose $Text
    foreach ($edit in @($Record.rewrites)) {
        $after = Normalise-Prose $edit.after
        if ([regex]::Matches($Text, [regex]::Escape($after)).Count -ne $edit.count) {
            throw "PRESERVATION: declared wording replacement in $Path"
        }
        $Text = $Text.Replace($after, (Normalise-Prose $edit.before))
    }
    if ((Hash-Text $Text) -cne $Record.baseline_canonical_sha256) {
        throw "PRESERVATION: original wording, order or scope text lost in $Path"
    }
}
function Assert-Frozen([string]$Path, [byte[]]$Bytes, [string]$Expected) {
    if ((Hash-Bytes $Bytes) -cne $Expected) { throw "PRESERVATION: frozen source changed: $Path" }
}
function Entry-Bytes([IO.Compression.ZipArchiveEntry]$Entry) {
    $inputStream=$Entry.Open(); $output=New-Object IO.MemoryStream
    try { $inputStream.CopyTo($output); return ,$output.ToArray() }
    finally { $inputStream.Dispose(); $output.Dispose() }
}
function Package-Name([string]$Profile,[string]$Version) {
    switch ($Profile) {
        'communication' { "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { "get-it-done-pack-openai-v$Version" }
        'gauntlet' { "gauntlet-loop-pack-openai-v$Version" }
        default { "lean-agent-skills-$Profile-openai-v$Version" }
    }
}
function Assert-Package([string]$Path, [string]$Profile, [object]$Definition, [string]$Version) {
    $prefix=(Package-Name $Profile $Version)+'/'
    $expected=New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    foreach ($relative in @('AGENTS.md','LICENSE','THIRD_PARTY_NOTICES.md')) { $expected.Add($relative,(Join-Path $root $relative)) }
    if ($Definition.include_engineering_core) { $expected.Add('ENGINEERING-CORE.md',(Join-Path $root 'ENGINEERING-CORE.md')) }
    foreach ($skill in $Definition.skills) {
        $skillRoot=Join-Path $root "skills/$skill"
        foreach ($file in Get-ChildItem -LiteralPath $skillRoot -Recurse -Force -File) {
            $relative='skills/'+$skill+'/'+$file.FullName.Substring($skillRoot.Length+1).Replace('\','/')
            $expected.Add($relative,$file.FullName)
        }
    }
    foreach ($relative in @('README.md','.codex-plugin/plugin.json','PACKAGE-VALIDATION.json','CHECKSUMS.sha256')) { $expected.Add($relative,'') }
    $zip=[IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $entries=New-Object 'System.Collections.Generic.Dictionary[string,byte[]]' ([StringComparer]::Ordinal)
        foreach ($entry in $zip.Entries) {
            if (-not $entry.Name) { continue }
            if (-not $entry.FullName.StartsWith($prefix,[StringComparison]::Ordinal)) { throw "PRESERVATION: package root in $Profile" }
            $relative=$entry.FullName.Substring($prefix.Length)
            if ($entries.ContainsKey($relative) -or -not $expected.ContainsKey($relative)) { throw "PRESERVATION: unexpected or duplicate packaged file in $Profile" }
            $bytes=Entry-Bytes $entry
            $entries.Add($relative,$bytes)
            if ($expected[$relative] -and (Hash-Bytes $bytes) -cne (Hash-Bytes ([IO.File]::ReadAllBytes($expected[$relative])))) { throw "PRESERVATION: packaged source differs: $Profile/$relative" }
        }
        Assert-SameSequence @($expected.Keys | Sort-Object) @($entries.Keys | Sort-Object) "package inventory $Profile"
        $declared=New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
        foreach ($line in ([Text.Encoding]::UTF8.GetString($entries['CHECKSUMS.sha256']) -split '\r?\n')) {
            if (-not $line) { continue }
            $match=[regex]::Match($line,'^([0-9a-f]{64})  (.+)$')
            if (-not $match.Success) { throw "PRESERVATION: malformed package checksum in $Profile" }
            $relative=$match.Groups[2].Value
            if ($relative -eq 'CHECKSUMS.sha256' -or $declared.ContainsKey($relative) -or -not $entries.ContainsKey($relative)) { throw "PRESERVATION: invalid package checksum target in $Profile" }
            $declared.Add($relative,$match.Groups[1].Value)
            if ((Hash-Bytes $entries[$relative]) -cne $declared[$relative]) { throw "PRESERVATION: package checksum mismatch in $Profile" }
        }
        Assert-SameSequence @($entries.Keys | Where-Object { $_ -ne 'CHECKSUMS.sha256' } | Sort-Object) @($declared.Keys | Sort-Object) "checksum coverage $Profile"
    } finally { $zip.Dispose() }
}
function Expect-Rejection([string]$Name,[scriptblock]$Action) {
    $rejected=$false
    try { & $Action } catch {
        if (-not $_.Exception.Message.StartsWith('PRESERVATION:',[StringComparison]::Ordinal)) { throw }
        $rejected=$true
    }
    if (-not $rejected) { throw "Negative control did not reject: $Name" }
    $script:controls++
    Write-Host "PASS rejection: $Name"
}

$contractPath=Join-Path $root 'docs/evals/prose-preservation-v8.8.0.json'
$contractBytes=[IO.File]::ReadAllBytes($contractPath)
# This pins the reviewed baseline and declared edits; fixture drift requires an explicit diff.
$contractHash='cc8c9889a5dad89947a5761975247affb1528cc4ed50b523f5f70b713d7a265c'
Assert-Frozen 'prose preservation contract' $contractBytes $contractHash
$contract=([Text.Encoding]::UTF8.GetString($contractBytes)) | ConvertFrom-Json
if ($contract.baseline_tree -cne 'e31c085a149438668815e00155359af5e596707d' -or $contract.version -cne '8.8.0' -or @($contract.files.PSObject.Properties).Count -ne 25) { throw 'PRESERVATION: unexpected baseline or scope' }
foreach ($file in $contract.files.PSObject.Properties) { Assert-Prose $file.Name (Read-Utf8 (Join-Path $root $file.Name)) $file.Value }
foreach ($file in $contract.unchanged.PSObject.Properties) { Assert-Frozen $file.Name ([IO.File]::ReadAllBytes((Join-Path $root $file.Name))) $file.Value }
foreach ($path in $contract.authoring_copies) { Assert-Frozen $path ([IO.File]::ReadAllBytes((Join-Path $root $path))) $contract.authoring_sha256 }
$profiles=(Read-Utf8 (Join-Path $root 'release-profiles.json')) | ConvertFrom-Json
Assert-SameSequence @($contract.profile_inventory.PSObject.Properties.Name | Sort-Object) @($profiles.profiles.PSObject.Properties.Name | Sort-Object) 'profile names'
foreach ($profile in $contract.profile_inventory.PSObject.Properties) {
    $current=$profiles.profiles.PSObject.Properties[$profile.Name].Value
    Assert-SameSequence @($profile.Value.skills) @($current.skills) "profile membership $($profile.Name)"
    if ($current.include_engineering_core -ne $profile.Value.include_engineering_core) { throw 'PRESERVATION: engineering core inclusion' }
}
Assert-SameSequence @($profiles.profiles.complete.skills | Sort-Object) @(Get-ChildItem (Join-Path $root 'skills') -Directory | ForEach-Object Name | Sort-Object) 'canonical skills'
Write-Host 'PASS: all 25 instruction roots reconstruct their pinned source; declared edits, examples, resources, adapters, register and six profiles match'

$controls=0
$gidPath='skills/get-it-done/SKILL.md';$gid=Read-Utf8 (Join-Path $root $gidPath)
$implPath='skills/implement/SKILL.md';$impl=Read-Utf8 (Join-Path $root $implPath)
$writingPath='skills/writing/SKILL.md';$writing=Read-Utf8 (Join-Path $root $writingPath)
$waitPath='skills/wait-what/SKILL.md';$wait=Read-Utf8 (Join-Path $root $waitPath)
Expect-Rejection 'standing Definition of Done omitted' { Assert-Prose $gidPath ($gid.Replace('standing Definition of Done','')) $contract.files.$gidPath }
Expect-Rejection 'required mandate weakened' { Assert-Prose $gidPath ($gid.Replace('MUST NOT report','SHOULD NOT report')) $contract.files.$gidPath }
Expect-Rejection 'standalone communication rule removed' { Assert-Prose $implPath ($impl.Replace('State supported conclusions directly','')) $contract.files.$implPath }
Expect-Rejection 'authoring reference redirected outside skill' { Assert-Prose $writingPath ($writing.Replace('(INSTRUCTION-EDITING.md)','(../skill-design/INSTRUCTION-EDITING.md)')) $contract.files.$writingPath }
Expect-Rejection 'existing reference removed' { Assert-Prose $writingPath ($writing.Replace('USER-INFORMATION.md','removed.md')) $contract.files.$writingPath }
Expect-Rejection 'step order numbering changed' { Assert-Prose $implPath ($impl.Replace('1. **Read before editing.**','2. **Read before editing.**')) $contract.files.$implPath }
Expect-Rejection 'literal progress example changed' { Assert-Prose $waitPath ($wait.Replace('60% (6/10)','70% (6/10)')) $contract.files.$waitPath }
Expect-Rejection 'unapproved generic instruction inserted' { Assert-Prose $implPath ($impl+"`nSkip required checks when brevity matters.`n") $contract.files.$implPath }
$agents=Read-Utf8 (Join-Path $root 'AGENTS.md')
Expect-Rejection 'evidence-based disagreement deleted' { Assert-Prose 'AGENTS.md' ($agents.Replace('Agree or disagree because evidence supports the conclusion','')) $contract.files.'AGENTS.md' }
Expect-Rejection 'new preservation rule deleted' { Assert-Prose 'AGENTS.md' ($agents.Replace('Do not replace a concrete mandate with broad advice.','')) $contract.files.'AGENTS.md' }
$registerPath='docs/STANDARDS-REGISTER.md';$register=Read-Utf8 (Join-Path $root $registerPath)
Expect-Rejection 'standards-register decision changed' { Assert-Frozen $registerPath ([Text.Encoding]::UTF8.GetBytes($register+"`nActivate every deferred standard.`n")) $contract.unchanged.$registerPath }
$designPath='skills/skill-design/SKILL.md';$design=Read-Utf8 (Join-Path $root $designPath)
Expect-Rejection 'required-reference deletion guard weakened' { Assert-Prose $designPath ($design.Replace('Retain every entry','Drop every entry')) $contract.files.$designPath }
Expect-Rejection 'baseline fixture tampered' { Assert-Frozen 'prose preservation contract' ([Text.Encoding]::UTF8.GetBytes(([Text.Encoding]::UTF8.GetString($contractBytes))+" ")) $contractHash }

if ($ArtifactsDirectory) {
    $artifacts=[IO.Path]::GetFullPath($ArtifactsDirectory)
    foreach ($profile in $profiles.profiles.PSObject.Properties) {
        $path=Join-Path $artifacts ((Package-Name $profile.Name $profiles.version)+'.zip')
        Assert-Package $path $profile.Name $profile.Value $profiles.version
    }
    $temporary=Join-Path ([IO.Path]::GetTempPath()) ('lean-prose-'+[guid]::NewGuid().ToString('N')+'.zip')
    $original=Join-Path $artifacts ((Package-Name 'communication' $profiles.version)+'.zip')
    try {
        Copy-Item -LiteralPath $original -Destination $temporary
        $archive=[IO.Compression.ZipFile]::Open($temporary,[IO.Compression.ZipArchiveMode]::Update)
        try { $archive.GetEntry((Package-Name 'communication' $profiles.version)+'/skills/writing/INSTRUCTION-EDITING.md').Delete() }
        finally { $archive.Dispose() }
        Expect-Rejection 'standalone authoring reference missing from ZIP' { Assert-Package $temporary 'communication' $profiles.profiles.communication $profiles.version }
        Copy-Item -LiteralPath $original -Destination $temporary -Force
        $archive=[IO.Compression.ZipFile]::Open($temporary,[IO.Compression.ZipArchiveMode]::Update)
        try {
            $entry=$archive.GetEntry((Package-Name 'communication' $profiles.version)+'/CHECKSUMS.sha256');$entry.Delete()
            $null=$archive.CreateEntry((Package-Name 'communication' $profiles.version)+'/CHECKSUMS.sha256')
        } finally { $archive.Dispose() }
        Expect-Rejection 'empty packaged checksum inventory' { Assert-Package $temporary 'communication' $profiles.profiles.communication $profiles.version }
        Assert-Package $original 'communication' $profiles.profiles.communication $profiles.version
        Write-Host 'PASS: all six package inventories, canonical bytes and complete checksum inventories; restored positive control'
    } finally { if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Force } }
}
Write-Host "PASS: $controls preservation rejection controls. Live agent behaviour, comprehension and conformance NOT TESTED."
