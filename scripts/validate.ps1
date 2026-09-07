[CmdletBinding()]
param([string]$ArtifactsDirectory, [switch]$FunctionsOnly)
$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$failures = New-Object System.Collections.Generic.List[string]
$quietFailures = $false
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Add-Failure([string]$Message) {
    $failures.Add($Message)
    if (-not $quietFailures) { Write-Host "FAIL: $Message" }
}
function Read-Text([string]$Path) { return [IO.File]::ReadAllText($Path, [Text.Encoding]::UTF8) }
function Assert-Same([object[]]$Expected, [object[]]$Actual, [string]$Label) {
    if ($Expected.Count -ne $Actual.Count) { Add-Failure "$Label mismatch"; return }
    if ($Expected.Count -gt 0 -and (Compare-Object @($Expected | Sort-Object) @($Actual | Sort-Object))) { Add-Failure "$Label mismatch" }
}
function Get-SourceFiles {
    return @(Get-ChildItem -LiteralPath $repoRoot -File -Recurse -Force | Where-Object {
        $relative = Get-RelativePath $repoRoot $_.FullName
        $relative -notmatch '^(\.git($|/)|artifacts/|\.agent-state/|\.audit-work/)'
    })
}
function Get-RelativePath([string]$BasePath, [string]$Path) {
    $baseUri = New-Object Uri(([IO.Path]::GetFullPath($BasePath).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar))
    $pathUri = New-Object Uri([IO.Path]::GetFullPath($Path))
    return [Uri]::UnescapeDataString($baseUri.MakeRelativeUri($pathUri).ToString())
}

function Get-StreamHash([IO.Stream]$Stream) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [BitConverter]::ToString($sha.ComputeHash($Stream)).Replace('-', '').ToLowerInvariant() }
    finally { $sha.Dispose() }
}

function Get-FileSha256([string]$Path) {
    $stream = [IO.File]::OpenRead($Path)
    try { return Get-StreamHash $stream }
    finally { $stream.Dispose() }
}

function Test-IsSymlinkAttributes([int]$ExternalAttributes) {
    $unsignedAttributes = [BitConverter]::ToUInt32([BitConverter]::GetBytes($ExternalAttributes), 0)
    return ((($unsignedAttributes -shr 16) -band 0xF000) -eq 0xA000)
}

function Read-ZipEntryText([IO.Compression.ZipArchiveEntry]$Entry) {
    $stream = $Entry.Open()
    try {
        $reader = New-Object IO.StreamReader($stream, (New-Object Text.UTF8Encoding($false)), $true)
        try { return $reader.ReadToEnd() } finally { $reader.Dispose() }
    } finally { $stream.Dispose() }
}

function Get-PackageBaseName([string]$ProfileDefinition, [string]$Version) {
    switch ($ProfileDefinition) {
        'communication' { return "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { return "get-it-done-pack-openai-v$Version" }
        'gauntlet' { return "gauntlet-loop-pack-openai-v$Version" }
        default { return "lean-agent-skills-$ProfileDefinition-openai-v$Version" }
    }
}


function Test-MetadataContracts {
    try {
        $profiles = (Read-Text (Join-Path $repoRoot 'release-profiles.json')) | ConvertFrom-Json
        $contract = (Read-Text (Join-Path $repoRoot 'PACKAGE-VALIDATION.json')) | ConvertFrom-Json
        $plugin = (Read-Text (Join-Path $repoRoot '.codex-plugin/plugin.json')) | ConvertFrom-Json
    } catch { Add-Failure 'metadata parse failure'; return $null }
    if ($profiles.version -notmatch '^9\.\d+\.\d+$' -or $profiles.release -ne "v$($profiles.version)") { Add-Failure 'release identity mismatch' }
    if ($plugin.version -ne $profiles.version -or $plugin.name -ne 'lean-agent-skills-complete' -or $plugin.skills -ne './skills/') { Add-Failure 'plugin identity mismatch' }
    if ($contract.version -ne $profiles.version -or $contract.schema_version -ne 2 -or $contract.behavioural_evaluation -ne 'not_run' -or $contract.PSObject.Properties.Name -contains 'passed') { Add-Failure 'source contract misstates evidence or version' }
    $counts = @{ complete=17; engineering=14; core=8; communication=3; 'get-it-done'=5; gauntlet=4 }
    Assert-Same @($counts.Keys) @($profiles.profiles.PSObject.Properties.Name) 'profile names'
    $complete = @($profiles.profiles.complete.skills)
    if ($complete.Count -ne $contract.skills_expected -or $complete.Count -gt 19) { Add-Failure 'skill count violates declaration or ceiling' }
    foreach ($p in $profiles.profiles.PSObject.Properties) {
        $names = @($p.Value.skills)
        if ($names.Count -ne @($names | Sort-Object -Unique).Count) { Add-Failure "duplicate profile member: $($p.Name)" }
        if ($names.Count -ne $counts[$p.Name]) { Add-Failure "profile count mismatch: $($p.Name)" }
        foreach ($name in $names) { if ($complete -notcontains $name) { Add-Failure "unknown profile member: $name" } }
        $needsCore = $p.Name -in @('complete','engineering','core','get-it-done')
        if ($p.Value.include_engineering_core -ne $needsCore) { Add-Failure "engineering-core inclusion mismatch: $($p.Name)" }
    }
    Assert-Same @($complete | Where-Object { $_ -notin @('teach','writing','office-files') }) @($profiles.profiles.engineering.skills) 'engineering inventory'
    Assert-Same @('gauntlet-loop','get-it-done','handoff','plan','research','review','skill-design','wait-what') @($profiles.profiles.core.skills) 'core inventory'
    $trio = @('teach','wait-what','writing')
    Assert-Same $trio @($profiles.profiles.communication.skills) 'communication inventory'
    Assert-Same ($trio + @('get-it-done','gauntlet-loop')) @($profiles.profiles.'get-it-done'.skills) 'task-pack inventory'
    Assert-Same ($trio + @('gauntlet-loop')) @($profiles.profiles.gauntlet.skills) 'gauntlet inventory'
    Assert-Same @('gauntlet-loop','get-it-done','handoff','wait-what') @($contract.manual_only_skills) 'manual-only inventory'
    $citation = Read-Text (Join-Path $repoRoot 'CITATION.cff')
    if ($citation -notmatch ("(?m)^version: " + [regex]::Escape($profiles.version) + '$') -or $citation -notmatch '(?m)^license: MIT$') { Add-Failure 'citation version or licence mismatch' }
    return $profiles
}

function Test-SkillTree([object]$Profiles) {
    $contract = (Read-Text (Join-Path $repoRoot 'PACKAGE-VALIDATION.json')) | ConvertFrom-Json
    $limits = $contract.limits
    # Ceilings themselves are guarded: changing the declaration cannot silently disable the budget.
    if ($limits.max_skills -ne 19 -or $limits.agents_words -gt 550 -or $limits.engineering_words -gt 600 -or $limits.skill_words -gt 400 -or $limits.description_characters -gt 170 -or $limits.adapter_prompt_characters -gt 100) { Add-Failure 'instruction budget contract widened' }
    $dirs = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot 'skills') -Directory)
    Assert-Same @($Profiles.profiles.complete.skills) @($dirs.Name) 'canonical skill inventory'
    foreach ($dir in $dirs) {
        $path = Join-Path $dir.FullName 'SKILL.md'
        $adapterPath = Join-Path $dir.FullName 'agents/openai.yaml'
        if (-not (Test-Path $path) -or -not (Test-Path $adapterPath)) { Add-Failure "missing skill or adapter: $($dir.Name)"; continue }
        $text = Read-Text $path
        $match = [regex]::Match($text, '(?s)\A---\nname: ([a-z][a-z0-9-]*)\ndescription: "([^"\r\n]+)"\n---\n')
        if (-not $match.Success -or $match.Groups[1].Value -ne $dir.Name) { Add-Failure "frontmatter mismatch: $($dir.Name)" }
        if ($match.Groups[2].Value.Length -gt $limits.description_characters) { Add-Failure "description budget exceeded: $($dir.Name)" }
        if (@($text.Trim() -split '\s+').Count -gt $limits.skill_words) { Add-Failure "skill budget exceeded: $($dir.Name)" }
        $adapter = Read-Text $adapterPath
        $a = [regex]::Match($adapter, '(?s)\Ainterface:\n  display_name: "[^"\n]+"\n  short_description: "([^"\n]+)"\n  default_prompt: "([^"\n]+)"\npolicy:\n  allow_implicit_invocation: (true|false)\n\z')
        if (-not $a.Success) { Add-Failure "adapter schema mismatch: $($dir.Name)"; continue }
        $expectedImplicit = -not (@($contract.manual_only_skills) -contains $dir.Name)
        if ($a.Groups[3].Value -ne $expectedImplicit.ToString().ToLowerInvariant()) { Add-Failure "manual invocation mismatch: $($dir.Name)" }
        if ($a.Groups[1].Value -ne $match.Groups[2].Value -or $a.Groups[2].Value -ne ('Use $' + $dir.Name + ' for this task.') -or $a.Groups[2].Value.Length -gt $limits.adapter_prompt_characters) { Add-Failure "adapter content mismatch: $($dir.Name)" }
        # Standalone local references must stay within this skill, not depend on another profile.
        foreach ($file in Get-ChildItem $dir.FullName -Filter '*.md' -Recurse) {
            foreach ($link in [regex]::Matches((Read-Text $file.FullName), '\[[^\]]+\]\(([^)]+)\)')) {
                $target = $link.Groups[1].Value.Split('#')[0]
                if (-not $target -or $target -match '^https?://') { continue }
                $resolved = [IO.Path]::GetFullPath((Join-Path $file.DirectoryName $target))
                if (-not $resolved.StartsWith($dir.FullName + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $resolved -PathType Leaf)) { Add-Failure "standalone reference invalid: $($dir.Name)/$target" }
            }
        }
    }
    foreach ($record in @(@('AGENTS.md',[int]$limits.agents_words),@('ENGINEERING-CORE.md',[int]$limits.engineering_words))) {
        if (@((Read-Text (Join-Path $repoRoot $record[0])).Trim() -split '\s+').Count -gt $record[1]) { Add-Failure "root budget exceeded: $($record[0])" }
    }
}

function Test-SourceIntegrity {
    $manifest = Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256'
    $seen = @{}
    foreach ($line in (Read-Text $manifest) -split '\r?\n') {
        if (-not $line) { continue }
        if ($line -notmatch '^([0-9a-f]{64})  ([^\r\n]+)$') { Add-Failure 'malformed source checksum'; continue }
        $hash = $matches[1]; $relative = $matches[2]
        if ($seen.ContainsKey($relative)) { Add-Failure "duplicate source checksum: $relative" }
        $seen[$relative] = $true
        if ($relative -match '(^/|:|\\)' -or $relative.Split('/') -contains '..') { Add-Failure "unsafe source checksum path: $relative"; continue }
        $path = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $path -PathType Leaf) -or (Get-FileSha256 $path) -ne $hash) { Add-Failure "source checksum mismatch: $relative" }
    }
    $actual = @(Get-SourceFiles | ForEach-Object { Get-RelativePath $repoRoot $_.FullName } | Where-Object { $_ -ne 'UPSTREAM-CHECKSUMS.sha256' })
    Assert-Same $actual @($seen.Keys) 'source checksum coverage'
}

function Test-RepositoryHygiene {
    foreach ($file in Get-SourceFiles) {
        $relative = Get-RelativePath $repoRoot $file.FullName
        if ($file.Attributes -band [IO.FileAttributes]::ReparsePoint) { Add-Failure "linked source: $relative" }
        if ($relative -match '^\.github/.*(snapshot|publish-v|overlay|apply-v|recover-v)') { Add-Failure "operational scaffold in canonical source: $relative" }
        if ($file.Extension -notin @('.md','.json','.yaml','.yml','.ps1','.cff','.sha256','.csv')) { continue }
        $bytes = [IO.File]::ReadAllBytes($file.FullName)
        $decoder = New-Object Text.UTF8Encoding($false, $true)
        try { $text = $decoder.GetString($bytes) } catch { Add-Failure "invalid UTF-8: $relative"; continue }
        if ($text.StartsWith([string][char]0xFEFF, [StringComparison]::Ordinal) -or $text.Contains("`r") -or ($bytes.Length -gt 0 -and $bytes[-1] -ne 10)) { Add-Failure "text encoding or newline mismatch: $relative" }
        if ($text -match '(?m)^(<<<<<<<|=======|>>>>>>>)' -or $text -match '(?m)[ \t]+$') { Add-Failure "text hygiene mismatch: $relative" }
        foreach ($pattern in @('ghp_[A-Za-z0-9]{20,}','github_pat_[A-Za-z0-9_]{20,}','AKIA[0-9A-Z]{16}','-----BEGIN (RSA|OPENSSH|EC) PRIVATE KEY-----')) { if ($text -match $pattern) { Add-Failure "possible secret: $relative" } }
        if ($file.Extension -eq '.md') {
            foreach ($link in [regex]::Matches($text, '\[[^\]]+\]\(([^)]+)\)')) {
                $target = $link.Groups[1].Value.Split('#')[0]
                if (-not $target -or $target -match '^(https?://|mailto:)') { continue }
                if (-not (Test-Path -LiteralPath (Join-Path $file.DirectoryName $target))) { Add-Failure "broken local link: $relative -> $target" }
            }
        }
    }
}

# Empty or malformed manifests must produce ordinary rejection evidence, not a null-record exception.
function Test-PackageChecksums([string]$ManifestText, [object]$Entries, [string]$Root, [string[]]$Expected, [string]$ProfileName) {
    $seen = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    foreach ($line in ($ManifestText -split '\r?\n')) {
        if (-not $line) { continue }
        $match = [regex]::Match($line, '^([0-9a-f]{64})  (.+)$')
        if (-not $match.Success) { Add-Failure "malformed package checksum: $ProfileName"; continue }
        $hash = $match.Groups[1].Value
        $relative = $match.Groups[2].Value
        if ($seen.ContainsKey($relative)) { Add-Failure "duplicate package checksum: $relative"; continue }
        $seen.Add($relative, $hash)
        if (-not $Entries.ContainsKey($Root+$relative)) { Add-Failure "checksum target missing: $relative"; continue }
        $stream = $Entries[$Root+$relative].Open()
        try { $actual = Get-StreamHash $stream } finally { $stream.Dispose() }
        if ($actual -ne $hash) { Add-Failure "package checksum mismatch: $relative" }
    }
    # Explicit arrays avoid pipeline scalar/null shape changes in both supported PowerShell hosts.
    [object[]]$expectedNames = @($Expected | Where-Object { $_ -ne 'CHECKSUMS.sha256' })
    [object[]]$actualNames = @($seen.Keys | ForEach-Object { [string]$_ })
    Assert-Same $expectedNames $actualNames "package checksum coverage: $ProfileName"
}

function Test-ZipArchive([string]$Path,[string]$ProfileName,[object]$ProfileDefinition,[string]$Version) {
    $archive = [IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $exact = New-Object 'System.Collections.Generic.Dictionary[string,System.IO.Compression.ZipArchiveEntry]' ([StringComparer]::Ordinal)
        $folded = @{}
        foreach ($entry in $archive.Entries) {
            $name = $entry.FullName
            if ($exact.ContainsKey($name)) { Add-Failure "duplicate ZIP member: $name" } else { $exact.Add($name,$entry) }
            if ($folded.ContainsKey($name) -and $folded[$name] -cne $name) { Add-Failure "case-colliding ZIP members: $name" } else { $folded[$name]=$name }
            if ($name -match '(^/|:|\\)' -or $name.Split('/') -contains '..' -or $name.Split('/') -contains '.') { Add-Failure "unsafe ZIP path: $name" }
            if (Test-IsSymlinkAttributes ([int]$entry.ExternalAttributes)) { Add-Failure "symlink ZIP member: $name" }
            if ([IO.Path]::GetExtension($name).ToLowerInvariant() -in @('.exe','.dll','.com','.bat','.cmd','.sh','.ps1','.msi','.jar')) { Add-Failure "executable ZIP member: $name" }
            if ($entry.Length -gt 100MB) { Add-Failure "oversized ZIP member: $name"; continue }
            $stream=$entry.Open(); try { $buffer=New-Object byte[] 8192; while($stream.Read($buffer,0,$buffer.Length)-gt 0){} } catch { Add-Failure "unreadable ZIP member: $name" } finally { $stream.Dispose() }
        }
        if (-not $ProfileName) { return }
        $root=(Get-PackageBaseName $ProfileName $Version)+'/'
        $source = @('AGENTS.md','LICENSE','THIRD_PARTY_NOTICES.md')
        if ($ProfileDefinition.include_engineering_core) { $source += 'ENGINEERING-CORE.md' }
        foreach ($skill in $ProfileDefinition.skills) { $source += @(Get-ChildItem (Join-Path $repoRoot "skills/$skill") -Recurse -File -Force | ForEach-Object { Get-RelativePath $repoRoot $_.FullName }) }
        $expected = @($source + @('README.md','PACKAGE-VALIDATION.json','CHECKSUMS.sha256','.codex-plugin/plugin.json'))
        Assert-Same @($expected | ForEach-Object { $root + $_ }) @($exact.Keys) "package inventory: $ProfileName"
        foreach ($relative in $source) {
            if (-not $exact.ContainsKey($root+$relative)) { continue }
            $stream=$exact[$root+$relative].Open()
            try { $hash=Get-StreamHash $stream } finally { $stream.Dispose() }
            if ($hash -ne (Get-FileSha256 (Join-Path $repoRoot $relative))) { Add-Failure "package source mismatch: $ProfileName/$relative" }
        }
        if ($exact.ContainsKey($root+'PACKAGE-VALIDATION.json')) {
            try {
                $meta = (Read-ZipEntryText $exact[$root+'PACKAGE-VALIDATION.json']) | ConvertFrom-Json
                if ($meta.version -ne $Version -or $meta.package -ne $ProfileName -or $meta.schema_version -ne 2 -or $meta.behavioural_evaluation -ne 'not_run' -or $meta.PSObject.Properties.Name -contains 'passed' -or $meta.include_engineering_core -ne $ProfileDefinition.include_engineering_core) { Add-Failure "package metadata mismatch: $ProfileName" }
                Assert-Same @($ProfileDefinition.skills) @($meta.included_skills) "package declared skills: $ProfileName"
                Assert-Same @($ProfileDefinition.skills | Where-Object { $_ -in @('gauntlet-loop','get-it-done','handoff','wait-what') }) @($meta.manual_only_skills) "package manual skills: $ProfileName"
                $plugin = (Read-ZipEntryText $exact[$root+'.codex-plugin/plugin.json']) | ConvertFrom-Json
                if ($plugin.version -ne $Version -or $plugin.name -ne $ProfileDefinition.plugin_name -or $plugin.skills -ne './skills/') { Add-Failure "package plugin mismatch: $ProfileName" }
            } catch { Add-Failure "package metadata parse failure: $ProfileName" }
        }
        $manifestText = ''
        if ($exact.ContainsKey($root+'CHECKSUMS.sha256')) {
            $manifestText = Read-ZipEntryText $exact[$root+'CHECKSUMS.sha256']
        }
        Test-PackageChecksums $manifestText $exact $root $expected $ProfileName
    } finally { $archive.Dispose() }
}

function Test-MasterArchive([string]$Path,[string]$Directory,[string]$Version) {
    $archive=[IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $root="openai-native-skill-collections-v$Version-all/"
        $files=@(Get-ChildItem -LiteralPath $Directory -File | Where-Object { $_.FullName -ne $Path })
        Assert-Same @($files | ForEach-Object { $root+$_.Name }) @($archive.Entries.FullName) 'master archive inventory'
        foreach ($file in $files) {
            $entry=$archive.GetEntry($root+$file.Name)
            if (-not $entry) { continue }
            $stream=$entry.Open(); try { $hash=Get-StreamHash $stream } finally { $stream.Dispose() }
            if ($hash -ne (Get-FileSha256 $file.FullName)) { Add-Failure "master archive hash mismatch: $($file.Name)" }
        }
    } finally { $archive.Dispose() }
}

function Test-ReleaseArtifacts([string]$Directory,[object]$Profiles) {
    try { $manifest=(Read-Text (Join-Path $Directory 'RELEASE-MANIFEST.json')) | ConvertFrom-Json } catch { Add-Failure 'release manifest parse failure'; return }
    $version=$Profiles.version
    if ($manifest.version -ne $version -or $manifest.release -ne $Profiles.release -or $manifest.profiles -ne 6 -or $manifest.unique_skills -ne 17 -or $manifest.schema_version -ne 2 -or $manifest.behavioural_evaluation -ne 'not_run') { Add-Failure 'release manifest contract mismatch' }
    $expected=@('CHECKSUMS.sha256','RELEASE-MANIFEST.json','README.md','LICENSE','THIRD_PARTY_NOTICES.md',"openai-native-skill-collections-v$version-all.zip")
    $archives=@($Profiles.profiles.PSObject.Properties | ForEach-Object { (Get-PackageBaseName $_.Name $version)+'.zip' })
    Assert-Same ($expected+$archives) @(Get-ChildItem $Directory -File | ForEach-Object Name) 'release asset inventory'
    Assert-Same $archives @($manifest.archives.PSObject.Properties.Name) 'release manifest inventory'
    $declared=@{}
    foreach ($line in (Read-Text (Join-Path $Directory 'CHECKSUMS.sha256')) -split '\r?\n') {
        if (-not $line) { continue }
        if ($line -notmatch '^([0-9a-f]{64})  (.+)$') { Add-Failure 'malformed release checksum'; continue }
        if ($declared.ContainsKey($matches[2])) { Add-Failure 'duplicate release checksum' }
        $declared[$matches[2]]=$matches[1]
    }
    Assert-Same $archives @($declared.Keys) 'release checksum coverage'
    foreach ($p in $Profiles.profiles.PSObject.Properties) {
        $name=(Get-PackageBaseName $p.Name $version)+'.zip';$path=Join-Path $Directory $name
        if (-not (Test-Path $path)) { Add-Failure "missing release archive: $name"; continue }
        $hash=Get-FileSha256 $path;$record=$manifest.archives.PSObject.Properties[$name].Value
        if ($declared[$name] -ne $hash -or $record.sha256 -ne $hash -or $record.bytes -ne (Get-Item $path).Length -or $record.profile -ne $p.Name) { Add-Failure "release digest or metadata mismatch: $name" }
        Test-ZipArchive $path $p.Name $p.Value $version
    }
    $master=Join-Path $Directory "openai-native-skill-collections-v$version-all.zip"
    if (Test-Path $master) { Test-ZipArchive $master $null $null $version; Test-MasterArchive $master $Directory $version }
}

. (Join-Path $PSScriptRoot 'standards-contract.ps1')

if (-not $FunctionsOnly) {
    $profiles=Test-MetadataContracts
    if ($profiles) {
        Test-SkillTree $profiles
        Test-StandardsContracts
        Test-SourceIntegrity
        Test-RepositoryHygiene
        if ($ArtifactsDirectory) { Test-ReleaseArtifacts ([IO.Path]::GetFullPath($ArtifactsDirectory)) $profiles }
    }
    if ($failures.Count) { throw "Validation failed: $($failures.Count) issue(s)" }
    Write-Host 'PASS: source, declared contracts and supplied archives; live model behaviour NOT TESTED'
}
