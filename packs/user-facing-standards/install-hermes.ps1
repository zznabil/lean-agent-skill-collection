<#
.SYNOPSIS
Installs this extracted pack into one user's Hermes home. No administrator access is needed.
.DESCRIPTION
Global policy appends this pack's AGENTS.md to SOUL.md after confirmation.
Project policy copies AGENTS.md into the selected project. None installs skills only.
Existing skills and project instructions are never overwritten. Restart Hermes afterward.
#>
[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [string]$HermesHome,
    [ValidateSet('Global', 'Project', 'None')][string]$PolicyScope = 'Global',
    [string]$ProjectDirectory
)
$ErrorActionPreference = 'Stop'
function Get-SkillIdentity([IO.FileInfo]$File) {
    $content = [IO.File]::ReadAllText($File.FullName)
    $header = [regex]::Match($content, '\A---(?<body>[\s\S]*?)\n---\s*\n')
    if (-not $header.Success) { return $File.Directory.Name }
    $body = $header.Groups['body'].Value
    foreach ($line in ($body -split '\r?\n')) {
        if ($line -match '^[^\s#]' -and $line -notmatch '^[a-zA-Z0-9_-]+\s*:') {
            throw "Unsupported skill metadata at $($File.FullName). Review its declared name before installing."
        }
    }
    $names = [regex]::Matches($body, '(?m)^[ \t]*name[ \t]*:[ \t]*(?<value>[^\r\n]*)')
    if ($names.Count -eq 0) { return $File.Directory.Name }
    if ($names.Count -ne 1) { throw "Ambiguous skill name at $($File.FullName). Use a separate Hermes home." }
    $value = $names[0].Groups['value'].Value.Trim()
    $literal = [regex]::Match($value, '^(?:([a-z0-9][a-z0-9_-]*)|''([a-z0-9][a-z0-9_-]*)''|"([a-z0-9][a-z0-9_-]*)")(?:[ \t]+#.*)?$')
    if (-not $literal.Success -or $literal.Groups[1].Value -match '^(null|true|false|yes|no|on|off)$') {
        throw "Unsupported skill name at $($File.FullName). Use a plain or quoted literal name, or a separate Hermes home."
    }
    foreach ($group in 1..3) { if ($literal.Groups[$group].Success) { return $literal.Groups[$group].Value } }
}
try {
    if ([string]::IsNullOrWhiteSpace($HermesHome)) {
        $HermesHome = $env:HERMES_HOME
        if ([string]::IsNullOrWhiteSpace($HermesHome)) {
            if ($env:OS -eq 'Windows_NT') {
                $base = $env:LOCALAPPDATA
                if ([string]::IsNullOrWhiteSpace($base)) { $base = Join-Path $HOME 'AppData/Local' }
                $HermesHome = Join-Path $base 'hermes'
            } else { $HermesHome = Join-Path $HOME '.hermes' }
        }
    }
    $homePath = [IO.Path]::GetFullPath($HermesHome)
    $sourceSkills = Join-Path $PSScriptRoot 'skills'
    $agentsPath = Join-Path $PSScriptRoot 'AGENTS.md'
    if (-not (Test-Path -LiteralPath $sourceSkills -PathType Container)) { throw 'Extract the entire pack first: skills/ is missing.' }
    if (-not (Test-Path -LiteralPath $agentsPath -PathType Leaf)) { throw 'Extract the entire pack first: AGENTS.md is missing.' }
    $skills = @(Get-ChildItem -LiteralPath $sourceSkills -Directory)
    if ($skills.Count -eq 0) { throw 'This pack contains no installable skills.' }
    foreach ($skill in $skills) {
        if (-not (Test-Path -LiteralPath (Join-Path $skill.FullName 'SKILL.md') -PathType Leaf)) { throw "Missing SKILL.md: $($skill.Name)" }
    }
    $packName = 'lean-' + ((Split-Path -Leaf $PSScriptRoot) -replace '[^a-zA-Z0-9-]', '-').ToLowerInvariant()
    $skillsHome = Join-Path $homePath 'skills'
    $destination = Join-Path $skillsHome $packName
    if (Test-Path -LiteralPath $destination) { throw "Pack already exists: $destination. Use a separate Hermes home or remove the previous installation after review." }
    $incomingNames = @($skills | ForEach-Object { Get-SkillIdentity (Get-Item -LiteralPath (Join-Path $_.FullName 'SKILL.md')) })
    if (Test-Path -LiteralPath $skillsHome) {
        $existing = @(Get-ChildItem -LiteralPath $skillsHome -Filter SKILL.md -File -Recurse)
        foreach ($file in $existing) {
            $identity = Get-SkillIdentity $file
            if ($incomingNames -contains $identity -or $skills.Name -contains $file.Directory.Name) { throw "Skill collision: $identity at $($file.Directory.FullName). Use a separate Hermes home." }
        }
    }
    $policy = [IO.File]::ReadAllText($agentsPath)
    $engineeringPath = Join-Path $PSScriptRoot 'ENGINEERING-CORE.md'
    if (Test-Path -LiteralPath $engineeringPath -PathType Leaf) {
        $companion = Join-Path $destination 'ENGINEERING-CORE.md'
        $policy += "`n`nFor material engineering work, read the relevant sections of the engineering companion at: $companion`n"
    }
    $policyTarget = $null
    $oldPolicy = $null
    $newPolicy = $null
    if ($PolicyScope -eq 'Global') {
        $policyTarget = Join-Path $homePath 'SOUL.md'
        if (Test-Path -LiteralPath $policyTarget) {
            $oldPolicy = [IO.File]::ReadAllBytes($policyTarget)
            $policyReader = [IO.StreamReader]::new([IO.MemoryStream]::new($oldPolicy, $false), [Text.Encoding]::UTF8, $true)
            try { $existingPolicy = $policyReader.ReadToEnd() } finally { $policyReader.Dispose() }
        } else { $existingPolicy = '' }
        $marker = "<!-- ${packName}:begin -->"
        if ($existingPolicy.Contains($marker)) { throw 'This pack already has a global policy block. Review the existing installation first.' }
        $newPolicy = $existingPolicy + "`n`n$marker`n$policy`n<!-- ${packName}:end -->`n"
    } elseif ($PolicyScope -eq 'Project') {
        if ([string]::IsNullOrWhiteSpace($ProjectDirectory)) { throw '-ProjectDirectory is required for Project policy.' }
        $projectPath = [IO.Path]::GetFullPath($ProjectDirectory)
        if (-not (Test-Path -LiteralPath $projectPath -PathType Container)) { throw 'ProjectDirectory must be an existing directory.' }
        $policyTarget = Join-Path $projectPath 'AGENTS.md'
        if (Test-Path -LiteralPath $policyTarget) { throw "Existing project instructions are not overwritten: $policyTarget" }
        $newPolicy = $policy
    }
    # Reject linked paths before any copy or policy write.
    $paths = @($PSScriptRoot, $homePath, $destination)
    if ($policyTarget) { $paths += $policyTarget }
    foreach ($path in $paths) {
        $cursor = [IO.Path]::GetFullPath($path)
        while ($cursor) {
            if (Test-Path -LiteralPath $cursor) {
                if ((Get-Item -LiteralPath $cursor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Linked paths are not supported: $cursor" }
            }
            $cursor = Split-Path -Parent $cursor
        }
    }
    $entries = @(Get-ChildItem -LiteralPath $PSScriptRoot -File -Force)
    foreach ($name in @('skills', 'audit', 'provenance', 'docs', 'references', 'official', 'licences', 'licenses')) {
        $path = Join-Path $PSScriptRoot $name
        if (Test-Path -LiteralPath $path -PathType Container) {
            $entries += Get-Item -LiteralPath $path
            foreach ($item in Get-ChildItem -LiteralPath $path -Recurse -Force) {
                if ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) { throw "Linked payload is not supported: $($item.FullName)" }
            }
        }
    }
    $action = "Install $($skills.Count) skills and $PolicyScope policy"
    if ($policyTarget) { $action += " at $policyTarget (preserve existing persona; back up SOUL.md)" }
    if (-not $PSCmdlet.ShouldProcess($destination, $action)) { return }
    $stage = Join-Path ([IO.Path]::GetTempPath()) ('lean-hermes-' + [guid]::NewGuid().ToString('N'))
    $installed = $false
    $backup = $null
    $createdPolicy = $false
    try {
        New-Item -ItemType Directory -Path $stage | Out-Null
        foreach ($entry in $entries) { Copy-Item -LiteralPath $entry.FullName -Destination $stage -Recurse -Force }
        New-Item -ItemType Directory -Path $skillsHome -Force | Out-Null
        Move-Item -LiteralPath $stage -Destination $destination
        $installed = $true
        if ($policyTarget) {
            $mode = [IO.FileMode]::CreateNew
            if ($null -ne $oldPolicy) { $mode = [IO.FileMode]::Open }
            $policyStream = [IO.File]::Open($policyTarget, $mode, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
            try {
                if ($null -eq $oldPolicy) { $createdPolicy = $true }
                else {
                    $sha = [Security.Cryptography.SHA256]::Create()
                    try {
                        $expected = [Convert]::ToBase64String($sha.ComputeHash($oldPolicy))
                        $actual = [Convert]::ToBase64String($sha.ComputeHash($policyStream))
                    } finally { $sha.Dispose() }
                    if ($actual -cne $expected) { throw "Policy changed after confirmation: $policyTarget. Review it and run the installer again." }
                    $backup = $policyTarget + '.lean-backup-' + [guid]::NewGuid().ToString('N')
                    [IO.File]::WriteAllBytes($backup, $oldPolicy)
                }
                $policyBytes = (New-Object Text.UTF8Encoding($false)).GetBytes($newPolicy)
                $policyStream.Position = 0
                $policyStream.Write($policyBytes, 0, $policyBytes.Length)
                $policyStream.SetLength($policyBytes.Length)
                $policyStream.Flush()
            } finally { $policyStream.Dispose() }
        }
    } catch {
        if ($installed) { Remove-Item -LiteralPath $destination -Recurse -Force }
        if ($backup) { [IO.File]::WriteAllBytes($policyTarget, $oldPolicy) }
        elseif ($createdPolicy) { Remove-Item -LiteralPath $policyTarget -Force }
        throw
    } finally {
        if (Test-Path -LiteralPath $stage) { Remove-Item -LiteralPath $stage -Recurse -Force }
    }
    Write-Host "INSTALLED: $($skills.Count) skills in $destination"
    Write-Host "Policy: $PolicyScope. AGENTS.md remains with the installed pack; Hermes does not load it globally."
    if ($backup) { Write-Host "Persona backup: $backup" }
    Write-Host 'Restart Hermes, then run hermes skills list in this Hermes home.'
} catch {
    Write-Error $_ -ErrorAction Continue
    exit 1
}
