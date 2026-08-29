[CmdletBinding()]
param(
    [string]$ArtifactsDirectory,
    [switch]$FunctionsOnly
)

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$failures = New-Object System.Collections.Generic.List[string]
$passes = New-Object System.Collections.Generic.List[string]
$quietFailures = $false
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Add-Failure([string]$Message) { $failures.Add($Message); if (-not $quietFailures) { Write-Host "FAIL: $Message" -ForegroundColor Red } }
function Add-Pass([string]$Message) { $passes.Add($Message); Write-Host "PASS: $Message" -ForegroundColor Green }

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

function Get-PackageBaseName([string]$Profile, [string]$Version) {
    switch ($Profile) {
        'communication' { return "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { return "get-it-done-pack-openai-v$Version" }
        'gauntlet' { return "gauntlet-loop-pack-openai-v$Version" }
        default { return "lean-agent-skills-$Profile-openai-v$Version" }
    }
}

function Test-MetadataContracts {
    try {
        $plugin = Get-Content -Raw (Join-Path $repoRoot '.codex-plugin/plugin.json') | ConvertFrom-Json
        $profiles = Get-Content -Raw (Join-Path $repoRoot 'release-profiles.json') | ConvertFrom-Json
        $citation = Get-Content -Raw (Join-Path $repoRoot 'CITATION.cff')
        $validation = Get-Content -Raw (Join-Path $repoRoot 'PACKAGE-VALIDATION.json') | ConvertFrom-Json
    } catch { Add-Failure "metadata parse failure: $($_.Exception.Message)"; return $null }

    if ($plugin.name -ne 'lean-agent-skills-complete' -or $plugin.skills -ne './skills/' -or $plugin.version -ne $profiles.version) { Add-Failure 'root plugin manifest does not match the release definition' }
    if ($profiles.release -ne ('v' + $profiles.version) -or @($profiles.profiles.PSObject.Properties).Count -ne 6) { Add-Failure 'release profile definition has an invalid version or profile count' }
    if ($citation -notmatch "(?m)^version:\s*$([regex]::Escape([string]$profiles.version))\s*$" -or $citation -notmatch '(?m)^license:\s*MIT\s*$') { Add-Failure 'CITATION.cff does not match release version and license' }
    $agency = $validation.considerate_agency
    $completeCount = @($profiles.profiles.complete.skills).Count
    if ($validation.scope -notmatch 'static' -or $validation.scope -notmatch 'not live' -or -not $validation.passed -or $validation.version -ne $profiles.version -or $validation.skills_expected -ne $completeCount -or $validation.skills_validated -ne $completeCount -or -not $agency.global -or $agency.local_fallbacks -ne ($completeCount - 1) -or $agency.adapters -ne $completeCount -or $agency.act_ask_do_not_act -ne $true) { Add-Failure 'PACKAGE-VALIDATION.json scope, status, version, inventory, or considerate-agency contract is inaccurate' }
    $licensePath = Join-Path $repoRoot 'LICENSE'
    if (-not (Test-Path -LiteralPath $licensePath) -or (Get-Content -Raw $licensePath) -notmatch '^MIT License') { Add-Failure 'MIT LICENSE is missing or malformed' }
    if (-not ($failures | Where-Object { $_ -match 'manifest|profile definition|CITATION|PACKAGE-VALIDATION|LICENSE|metadata parse' })) { Add-Pass 'metadata, version, validation-scope, and license contracts' }
    return $profiles
}

function Test-SkillTree([object]$Profiles) {
    $skillRoot = Join-Path $repoRoot 'skills'
    $skillDirs = @(Get-ChildItem -LiteralPath $skillRoot -Directory | Sort-Object Name)
    $expected = @($Profiles.profiles.complete.skills | ForEach-Object { [string]$_ } | Sort-Object)
    $actual = @($skillDirs | ForEach-Object { $_.Name } | Sort-Object)
    if ($actual.Count -ne $expected.Count -or (Compare-Object $expected $actual)) { Add-Failure 'canonical skill inventory does not match the Complete profile' }
    $supportFiles = @{
        'gauntlet-loop'=@('AI-ASSURANCE.md','CRITIC-LANES.md','STATE-FORMAT.md');
        'get-it-done'=@('ORCHESTRATION.md','STATE.md'); 'project-context'=@('AI-ASSET-CARDS.md');
        'release'=@('SUPPLY-CHAIN.md'); 'review'=@('LANES.md'); 'skill-design'=@('PLAYBOOKS.md'); 'triage'=@('INCIDENT.md')
    }
    foreach ($dir in $skillDirs) {
        $skillPath = Join-Path $dir.FullName 'SKILL.md'; $adapterPath = Join-Path $dir.FullName 'agents/openai.yaml'
        if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) { Add-Failure "missing skills/$($dir.Name)/SKILL.md"; continue }
        if (-not (Test-Path -LiteralPath $adapterPath -PathType Leaf)) { Add-Failure "missing adapter for $($dir.Name)"; continue }
        $text = Get-Content -Raw -LiteralPath $skillPath
        $frontmatter = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---\r?\n')
        if (-not $frontmatter.Success) { Add-Failure "invalid frontmatter for $($dir.Name)"; continue }
        $name = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^name:\s*["'']?([^"''\r\n]+)').Groups[1].Value.Trim()
        $description = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^description:\s*["'']?(.+?)["'']?\s*$').Groups[1].Value.Trim()
        if ($name -ne $dir.Name -or [string]::IsNullOrWhiteSpace($description)) { Add-Failure "frontmatter failure for $($dir.Name)" }
        $adapter = Get-Content -Raw -LiteralPath $adapterPath
        $defaultPromptRule = '(?m)^\s{2}default_prompt:\s*.*\$' + [regex]::Escape($dir.Name) + '.+$'
        $rules = @('(?m)^interface:\s*$','(?m)^\s{2}display_name:\s*.+$','(?m)^\s{2}short_description:\s*.+$',$defaultPromptRule,'(?ms)^policy:\s*\r?\n\s{2}products:\s*\r?\n\s{2}-\s*CHAT\s*\r?\n\s{2}-\s*CODEX\s*\r?\n\s{2}allow_implicit_invocation:\s*(true|false)\s*$')
        foreach ($rule in $rules) { if ($adapter -notmatch $rule) { Add-Failure "adapter schema failure for $($dir.Name)"; break } }
        if ($dir.Name -ne 'wait-what' -and $text -notmatch '(?m)^\*\*User-facing:\*\*') { Add-Failure "missing user-facing fallback for $($dir.Name)" }
        if ($adapter -notmatch 'considerate-agency' -and -not ($dir.Name -eq 'wait-what' -and $adapter -match 'considerate follow-through')) { Add-Failure "missing adapter considerate-agency reinforcement for $($dir.Name)" }
        $manualNames = @('gauntlet-loop', 'get-it-done', 'grilling', 'handoff', 'project-context', 'wait-what')
        $allowImplicit = [regex]::Match($adapter, '(?m)^\s{2}allow_implicit_invocation:\s*(true|false)\s*$').Groups[1].Value
        if (($manualNames -contains $dir.Name) -and $allowImplicit -ne 'false') { Add-Failure "manual skill allows implicit invocation: $($dir.Name)" }
        if ($dir.Name -eq 'wait-what' -and $allowImplicit -ne 'false') { Add-Failure 'wait-what must require explicit invocation' }
        if ($supportFiles.ContainsKey($dir.Name)) {
            foreach ($support in $supportFiles[$dir.Name]) {
                if (-not (Test-Path -LiteralPath (Join-Path $dir.FullName $support)) -or $text -notmatch [regex]::Escape($support)) { Add-Failure "required support reference missing for $($dir.Name)/$support" }
            }
        }
    }
    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback' })) { Add-Pass "$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, and support references" }
}

function Test-SourceIntegrity {
    $manifestSkillPaths = New-Object System.Collections.Generic.List[string]
    foreach ($line in Get-Content -LiteralPath (Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256')) {
        if ($line -notmatch '^([0-9a-fA-F]{64})\s+(.+)$') { Add-Failure "malformed upstream checksum line: $line"; continue }
        $expected = $matches[1].ToLowerInvariant(); $relative = $matches[2].Trim().Replace('/', [IO.Path]::DirectorySeparatorChar)
        if ($relative.StartsWith('skills' + [IO.Path]::DirectorySeparatorChar)) { $manifestSkillPaths.Add($relative.Replace('\', '/')) }
        if ($relative -in @('README.md','PACKAGE-VALIDATION.json',('.codex-plugin'+[IO.Path]::DirectorySeparatorChar+'plugin.json'))) { continue }
        $path = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $path)) { Add-Failure "upstream checksum target missing: $relative"; continue }
        if ((Get-FileSha256 $path) -ne $expected) { Add-Failure "upstream checksum mismatch: $relative" }
    }
    $actualSkillPaths = @(Get-ChildItem -LiteralPath (Join-Path $repoRoot 'skills') -Recurse -File | ForEach-Object { Get-RelativePath $repoRoot $_.FullName } | Sort-Object)
    $expectedSkillPaths = @($manifestSkillPaths | Sort-Object)
    if (Compare-Object $expectedSkillPaths $actualSkillPaths) { Add-Failure 'upstream checksum skill coverage does not match the canonical source tree' }
    if (-not ($failures | Where-Object { $_ -match 'upstream checksum' })) { Add-Pass 'V8.1.0 canonical source integrity' }
}

function Test-RepositoryHygiene {
    $excludedPrefixes = @('.git/','dist/','artifacts/','.audit-work/','.agent-state/')
    $files = @(Get-ChildItem -LiteralPath $repoRoot -Recurse -File | Where-Object {
        $relative = Get-RelativePath $repoRoot $_.FullName; $excluded = $false
        foreach ($prefix in $excludedPrefixes) { if ($relative.StartsWith($prefix)) { $excluded = $true } }
        -not $excluded -and $_.Extension -in @('.md','.json','.yaml','.yml','.ps1','.cff','.sha256')
    })
    $secretPatterns = @('ghp_[A-Za-z0-9]{20,}','github_pat_[A-Za-z0-9_]{20,}','AKIA[0-9A-Z]{16}','-----BEGIN (RSA|OPENSSH|EC) PRIVATE KEY-----')
    $placeholderPattern = '(?i)\b(' + ((@(('TO'+'DO'),('T'+'BD'),('FIX'+'ME'),('X'+'XX'))) -join '|') + ')\b'
    foreach ($file in $files) {
        $text = Get-Content -Raw -LiteralPath $file.FullName; $relative = Get-RelativePath $repoRoot $file.FullName
        if ($text -match $placeholderPattern) { Add-Failure "placeholder marker in $relative" }
        foreach ($pattern in $secretPatterns) { if ($text -match $pattern) { Add-Failure "possible secret in $relative" } }
        if ($file.Extension -eq '.md') {
            foreach ($match in [regex]::Matches($text, '\[[^\]]+\]\(([^)]+)\)')) {
                $target = $match.Groups[1].Value
                if ($target -match '^(https?://|mailto:|#)') { continue }
                $pathPart = $target.Split('#')[0].Replace('/', [IO.Path]::DirectorySeparatorChar)
                if (-not [string]::IsNullOrWhiteSpace($pathPart) -and -not (Test-Path -LiteralPath (Join-Path $file.DirectoryName $pathPart))) { Add-Failure "broken local link '$target' in $relative" }
            }
        }
    }
    if (-not ($failures | Where-Object { $_ -match 'placeholder|secret|broken local link' })) { Add-Pass 'placeholder, secret-pattern, and local Markdown-link checks' }
}

function Test-ZipArchive([string]$Path,[string]$ProfileName,[object]$Profile,[string]$Version) {
    $archive = [IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $exact = New-Object 'System.Collections.Generic.Dictionary[string,System.IO.Compression.ZipArchiveEntry]' ([StringComparer]::Ordinal)
        $caseFolded=@{}; $entries=@($archive.Entries | Where-Object { -not [string]::IsNullOrEmpty($_.Name) })
        foreach ($entry in $entries) {
            $name=$entry.FullName.Replace('\','/'); $lower=$name.ToLowerInvariant()
            if ($exact.ContainsKey($name)) { Add-Failure "duplicate ZIP member '$name'" } else { $exact.Add($name,$entry) }
            if ($caseFolded.ContainsKey($lower) -and $caseFolded[$lower] -cne $name) { Add-Failure "case-colliding ZIP members '$($caseFolded[$lower])' and '$name'" } else { $caseFolded[$lower]=$name }
            if ($name.StartsWith('/') -or $name -match '^[A-Za-z]:' -or $name.Split('/') -contains '..') { Add-Failure "unsafe ZIP path '$name'" }
            if (Test-IsSymlinkAttributes ([int]$entry.ExternalAttributes)) { Add-Failure "symlink ZIP member '$name'" }
            if ([IO.Path]::GetExtension($name).ToLowerInvariant() -in @('.exe','.dll','.com','.bat','.cmd','.sh','.ps1','.msi','.jar')) { Add-Failure "executable ZIP member '$name'" }
            $stream=$entry.Open(); try { $buffer=New-Object byte[] 8192; while($stream.Read($buffer,0,$buffer.Length)-gt 0){} } catch { Add-Failure "unreadable or CRC-invalid ZIP member '$name'" } finally { $stream.Dispose() }
        }
        if ($ProfileName) {
            $root=(Get-PackageBaseName $ProfileName $Version)+'/'
            foreach($required in @('LICENSE','THIRD_PARTY_NOTICES.md','PACKAGE-VALIDATION.json','CHECKSUMS.sha256','.codex-plugin/plugin.json')) { if(-not $exact.ContainsKey($root+$required)){ Add-Failure "package $ProfileName lacks $required" } }
            $actualSkills=@($entries | ForEach-Object { if($_.FullName.Replace('\','/') -match ('^'+[regex]::Escape($root)+'skills/([^/]+)/SKILL\.md$')){$matches[1]} } | Sort-Object -Unique)
            $expectedSkills=@($Profile.skills | ForEach-Object {[string]$_} | Sort-Object)
            if(Compare-Object $expectedSkills $actualSkills){ Add-Failure "package $ProfileName skill inventory mismatch" }
            $checksumEntry=$exact[$root+'CHECKSUMS.sha256']
            if($checksumEntry){
                foreach($line in (Read-ZipEntryText $checksumEntry)-split '\r?\n'){
                    if([string]::IsNullOrWhiteSpace($line)){continue}
                    if($line -notmatch '^([0-9a-f]{64})\s+(.+)$'){Add-Failure "malformed checksum in package $ProfileName";continue}
                    $expectedHash=$matches[1]; $targetName=$matches[2]; $targetEntry=$exact[$root+$targetName]
                    if(-not $targetEntry){Add-Failure "checksum target missing in package ${ProfileName}: $targetName";continue}
                    $targetStream=$targetEntry.Open(); try{$actualHash=Get-StreamHash $targetStream}finally{$targetStream.Dispose()}
                    if($actualHash -ne $expectedHash){Add-Failure "checksum mismatch in package ${ProfileName}: $targetName"}
                }
            }
        }
    } finally { $archive.Dispose() }
}

function Test-ReleaseArtifacts([string]$Directory,[object]$Profiles) {
    if(-not(Test-Path -LiteralPath $Directory -PathType Container)){Add-Failure "artifact directory missing: $Directory";return}
    try{$manifest=Get-Content -Raw (Join-Path $Directory 'RELEASE-MANIFEST.json')|ConvertFrom-Json}catch{Add-Failure "release manifest parse failure";return}
    if($manifest.version -ne $Profiles.version -or $manifest.profiles -ne 6 -or $manifest.unique_skills -ne @($Profiles.profiles.complete.skills).Count -or $manifest.skill_content_changed_from_v8_0_0 -ne $true -or $manifest.considerate_agency -ne $true){Add-Failure 'release manifest contract failure'}
    $declared=@{}
    foreach($line in Get-Content (Join-Path $Directory 'CHECKSUMS.sha256')){if($line -match '^([0-9a-f]{64})\s+(.+)$'){$declared[$matches[2]]=$matches[1]}else{Add-Failure "malformed release checksum line: $line"}}
    foreach($property in @($Profiles.profiles.PSObject.Properties)){
        $archiveName=(Get-PackageBaseName $property.Name $Profiles.version)+'.zip';$archivePath=Join-Path $Directory $archiveName
        if(-not(Test-Path -LiteralPath $archivePath)){Add-Failure "missing profile archive $archiveName";continue}
        $hash=(Get-FileSha256 $archivePath)
        if($declared[$archiveName] -ne $hash){Add-Failure "release checksum mismatch for $archiveName"}
        $record=$manifest.archives.PSObject.Properties[$archiveName].Value
        if(-not $record -or $record.sha256 -ne $hash -or $record.bytes -ne (Get-Item $archivePath).Length){Add-Failure "release manifest mismatch for $archiveName"}
        Test-ZipArchive $archivePath $property.Name $property.Value $Profiles.version
    }
    $master=Join-Path $Directory "openai-native-skill-collections-v$($Profiles.version)-all.zip"
    if(-not(Test-Path -LiteralPath $master)){Add-Failure 'master release archive missing'}else{Test-ZipArchive $master $null $null $Profiles.version}
    if(-not($failures|Where-Object{$_ -match 'archive|ZIP|package|release manifest|release checksum|checksum in'})){Add-Pass 'release archives, inventories, licensing, hashes, paths, CRC reads, and executable/symlink checks'}
}

if (-not $FunctionsOnly) {
    $profiles=Test-MetadataContracts
    if($profiles){Test-SkillTree $profiles;Test-SourceIntegrity;Test-RepositoryHygiene;if(-not[string]::IsNullOrWhiteSpace($ArtifactsDirectory)){Test-ReleaseArtifacts ([IO.Path]::GetFullPath($ArtifactsDirectory)) $profiles}}
    if($failures.Count -gt 0){Write-Host "`nValidation failed with $($failures.Count) issue(s)." -ForegroundColor Red;exit 1}
    Write-Host "`nValidation passed with $($passes.Count) check groups." -ForegroundColor Green
}
