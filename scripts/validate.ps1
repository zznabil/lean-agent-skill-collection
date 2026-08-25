[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) {
    $failures.Add($Message)
    Write-Host "FAIL: $Message" -ForegroundColor Red
}

function Add-Pass([string]$Message) {
    Write-Host "PASS: $Message" -ForegroundColor Green
}

function Test-SafeArchive([string]$Path) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($Path)
    try {
        foreach ($entry in $archive.Entries) {
            $name = $entry.FullName.Replace('\', '/')
            if ($name.StartsWith('/') -or $name -match '^[A-Za-z]:' -or $name.Split('/') -contains '..') {
                Add-Failure "Unsafe ZIP entry '$name' in $(Split-Path $Path -Leaf)"
            }
        }
    }
    finally {
        $archive.Dispose()
    }
}

$plugin = Get-Content -Raw (Join-Path $repoRoot '.codex-plugin/plugin.json') | ConvertFrom-Json
if ($plugin.version -eq '7.2.0' -and $plugin.skills -eq './skills/') {
    Add-Pass 'plugin manifest version and skills path'
}
else {
    Add-Failure 'plugin manifest version or skills path is invalid'
}

$validation = Get-Content -Raw (Join-Path $repoRoot 'VALIDATION.json') | ConvertFrom-Json
if ($validation.passed -and $validation.skills_validated -eq 30) {
    Add-Pass 'supplied Complete-profile validation metadata'
}
else {
    Add-Failure 'supplied Complete-profile validation metadata'
}

$skillDirs = @(Get-ChildItem (Join-Path $repoRoot 'skills') -Directory | Sort-Object Name)
if ($skillDirs.Count -eq 30) {
    Add-Pass '30 canonical skill directories'
}
else {
    Add-Failure "expected 30 skill directories; found $($skillDirs.Count)"
}

foreach ($dir in $skillDirs) {
    $skillPath = Join-Path $dir.FullName 'SKILL.md'
    $adapterPath = Join-Path $dir.FullName 'agents/openai.yaml'
    if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) {
        Add-Failure "missing skills/$($dir.Name)/SKILL.md"
        continue
    }
    if (-not (Test-Path -LiteralPath $adapterPath -PathType Leaf)) {
        Add-Failure "missing skills/$($dir.Name)/agents/openai.yaml"
    }

    $text = Get-Content -Raw -LiteralPath $skillPath
    if ($text -notmatch '(?s)\A---\r?\n.*?\r?\n---\r?\n') {
        Add-Failure "invalid frontmatter in skills/$($dir.Name)/SKILL.md"
    }
    $nameMatch = [regex]::Match($text, '(?m)^name:\s*["'']?([^"''\r\n]+)')
    if (-not $nameMatch.Success -or $nameMatch.Groups[1].Value.Trim() -ne $dir.Name) {
        Add-Failure "frontmatter name mismatch in skills/$($dir.Name)/SKILL.md"
    }
    if ($text -notmatch '(?m)^description:\s*.+$') {
        Add-Failure "missing description in skills/$($dir.Name)/SKILL.md"
    }

    if (Test-Path -LiteralPath $adapterPath) {
        $adapter = Get-Content -Raw -LiteralPath $adapterPath
        foreach ($required in @('display_name:', 'short_description:', 'default_prompt:', 'CHAT', 'CODEX', 'allow_implicit_invocation:')) {
            if (-not $adapter.Contains($required)) {
                Add-Failure "adapter for $($dir.Name) lacks '$required'"
            }
        }
    }
}

$rootChecksums = Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256'
foreach ($line in Get-Content -LiteralPath $rootChecksums) {
    if ($line -notmatch '^([0-9a-fA-F]{64})\s+(.+)$') {
        Add-Failure "malformed root checksum line: $line"
        continue
    }
    $expected = $matches[1].ToLowerInvariant()
    $relative = $matches[2].Trim().Replace('/', [IO.Path]::DirectorySeparatorChar)
    if ($relative -eq 'README.md') {
        continue
    }
    $path = Join-Path $repoRoot $relative
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Failure "root checksum target missing: $relative"
        continue
    }
    $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $path).Hash.ToLowerInvariant()
    if ($actual -ne $expected) {
        Add-Failure "root checksum mismatch: $relative"
    }
}
if (-not ($failures | Where-Object { $_ -like 'root checksum*' -or $_ -like 'malformed root*' })) {
    Add-Pass 'canonical source checksums'
}

$releaseDir = Join-Path $repoRoot 'dist/v7.2'
$releaseManifest = Get-Content -Raw (Join-Path $releaseDir 'openai-native-skill-collections-v7.2-validation.json') | ConvertFrom-Json
foreach ($archiveProperty in $releaseManifest.archives.PSObject.Properties) {
    $archivePath = Join-Path $releaseDir $archiveProperty.Name
    if (-not (Test-Path -LiteralPath $archivePath -PathType Leaf)) {
        Add-Failure "missing release archive: $($archiveProperty.Name)"
        continue
    }
    $file = Get-Item -LiteralPath $archivePath
    $hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $archivePath).Hash.ToLowerInvariant()
    if ($hash -ne $archiveProperty.Value.sha256 -or $file.Length -ne $archiveProperty.Value.bytes) {
        Add-Failure "release hash or size mismatch: $($archiveProperty.Name)"
    }
    Test-SafeArchive $archivePath
}

$masterArchive = Join-Path $releaseDir 'openai-native-skill-collections-v7.2-all.zip'
if (Test-Path -LiteralPath $masterArchive) {
    Test-SafeArchive $masterArchive
}
else {
    Add-Failure 'missing master release archive'
}

if ($releaseManifest.passed -and @($releaseManifest.archives.PSObject.Properties).Count -eq 7) {
    Add-Pass '7 release archives match the supplied manifest and have safe paths'
}
else {
    Add-Failure 'release manifest status or archive count'
}

if ($failures.Count -gt 0) {
    Write-Host "`nValidation failed with $($failures.Count) issue(s)." -ForegroundColor Red
    exit 1
}

Write-Host "`nValidation passed." -ForegroundColor Green
