[CmdletBinding()]
param([string]$Installer)
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
if ([string]::IsNullOrWhiteSpace($Installer)) { $Installer = Join-Path $repo 'install-hermes.ps1' }
$engine = (Get-Process -Id $PID).Path
$work = Join-Path ([IO.Path]::GetTempPath()) ('lean-hermes-test-' + [guid]::NewGuid().ToString('N'))
function Assert([bool]$Condition, [string]$Message) { if (-not $Condition) { throw $Message } }
function Get-TestDigest([string]$Path) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [pscustomobject]@{ Hash = [BitConverter]::ToString($sha.ComputeHash([IO.File]::ReadAllBytes($Path))).Replace('-', '') } }
    finally { $sha.Dispose() }
}
function Invoke-Installer([string]$HomePath, [string[]]$Extra = @()) {
    $ErrorActionPreference = 'Continue'
    $command = "& '" + $script:fixtureInstaller.Replace("'", "''") + "' -HermesHome '" + $HomePath.Replace("'", "''") + "' -Confirm:" + '$false'
    foreach ($argument in $Extra) {
        if ($argument.StartsWith('-')) { $command += ' ' + $argument }
        else { $command += " '" + $argument.Replace("'", "''") + "'" }
    }
    $encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($command))
    $output = & $engine -NoLogo -NoProfile -ExecutionPolicy Bypass -EncodedCommand $encoded 2>&1 | Out-String
    return [pscustomobject]@{ Code = $LASTEXITCODE; Output = $output }
}
try {
    $pack = Join-Path $work 'pack with spaces'
    New-Item -ItemType Directory -Path (Join-Path $pack 'skills') -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $repo 'skills/wait-what') -Destination (Join-Path $pack 'skills') -Recurse
    Copy-Item -LiteralPath (Join-Path $repo 'AGENTS.md') -Destination $pack
    Copy-Item -LiteralPath (Resolve-Path $Installer).Path -Destination (Join-Path $pack 'install-hermes.ps1')
    $script:fixtureInstaller = Join-Path $pack 'install-hermes.ps1'
    $homePath = Join-Path $work 'home with spaces'
    New-Item -ItemType Directory -Path $homePath | Out-Null
    $soul = Join-Path $homePath 'SOUL.md'
    $persona = 'User persona: retain this text and Unicode: ' + [char]0x00e9 + [Environment]::NewLine
    [IO.File]::WriteAllText($soul, $persona, (New-Object Text.UTF8Encoding($false)))
    $personaBytes = [IO.File]::ReadAllBytes($soul)
    $result = Invoke-Installer $homePath @('-WhatIf')
    Assert ($result.Code -eq 0) "WhatIf failed: $($result.Output)"
    Assert (-not (Test-Path (Join-Path $homePath 'skills'))) 'WhatIf installed skills.'
    Assert ([IO.File]::ReadAllText($soul) -ceq $persona) 'WhatIf changed persona.'
    $result = Invoke-Installer $homePath
    Assert ($result.Code -eq 0 -and $result.Output.Contains('INSTALLED:')) "Global install failed: $($result.Output)"
    $installed = Join-Path $homePath 'skills/lean-pack-with-spaces'
    $sourceHash = (Get-TestDigest (Join-Path $pack 'skills/wait-what/SKILL.md')).Hash
    Assert ((Get-TestDigest (Join-Path $installed 'skills/wait-what/SKILL.md')).Hash -eq $sourceHash) 'Installed skill bytes differ.'
    $globalPolicy = [IO.File]::ReadAllText($soul)
    Assert ($globalPolicy.StartsWith($persona)) 'Existing persona was replaced.'
    Assert ($globalPolicy.Contains([IO.File]::ReadAllText((Join-Path $pack 'AGENTS.md')))) 'Global AGENTS policy is missing.'
    $backups = @(Get-ChildItem -LiteralPath $homePath -Filter 'SOUL.md.lean-backup-*')
    Assert ($backups.Count -eq 1) 'Persona backup missing.'
    Assert ([Convert]::ToBase64String([IO.File]::ReadAllBytes($backups[0].FullName)) -ceq [Convert]::ToBase64String($personaBytes)) 'Backup bytes differ.'
    $before = (Get-TestDigest $soul).Hash
    $result = Invoke-Installer $homePath
    Assert ($result.Code -ne 0) 'Duplicate installation was accepted.'
    Assert ((Get-TestDigest $soul).Hash -eq $before) 'Duplicate install changed persona.'
    $collisionHome = Join-Path $work 'collision'
    New-Item -ItemType Directory -Path (Join-Path $collisionHome 'skills/other/wait-what') -Force | Out-Null
    $existingSkill = Join-Path $collisionHome 'skills/other/wait-what/SKILL.md'
    [IO.File]::WriteAllText($existingSkill, 'Existing user skill')
    $result = Invoke-Installer $collisionHome
    Assert ($result.Code -ne 0) 'Duplicate skill name was accepted.'
    Assert ([IO.File]::ReadAllText($existingSkill) -ceq 'Existing user skill') 'Existing skill changed.'
    Assert (-not (Test-Path (Join-Path $collisionHome 'SOUL.md'))) 'Collision wrote policy.'
    Assert (-not (Test-Path (Join-Path $collisionHome 'skills/lean-pack-with-spaces'))) 'Collision partially installed pack.'
    $project = Join-Path $work 'project'
    New-Item -ItemType Directory -Path $project | Out-Null
    $projectHome = Join-Path $work 'project-home'
    $result = Invoke-Installer $projectHome @('-PolicyScope', 'Project', '-ProjectDirectory', $project)
    Assert ($result.Code -eq 0) "Project install failed: $($result.Output)"
    Assert ((Get-TestDigest (Join-Path $project 'AGENTS.md')).Hash -eq (Get-TestDigest (Join-Path $pack 'AGENTS.md')).Hash) 'Project instructions differ.'
    Assert (-not (Test-Path (Join-Path $projectHome 'SOUL.md'))) 'Project scope wrote global policy.'
    $blockedHome = Join-Path $work 'blocked-project'
    $result = Invoke-Installer $blockedHome @('-PolicyScope', 'Project', '-ProjectDirectory', $project)
    Assert ($result.Code -ne 0) 'Existing project instructions were accepted.'
    Assert (-not (Test-Path $blockedHome)) 'Project collision created a home.'
    $noneHome = Join-Path $work 'no-policy'
    $result = Invoke-Installer $noneHome @('-PolicyScope', 'None')
    Assert ($result.Code -eq 0) "Skills-only install failed: $($result.Output)"
    Assert (Test-Path (Join-Path $noneHome 'skills/lean-pack-with-spaces/skills/wait-what/SKILL.md')) 'Skills-only install omitted skill.'
    Assert (-not (Test-Path (Join-Path $noneHome 'SOUL.md'))) 'None scope wrote policy.'
    Remove-Item -LiteralPath (Join-Path $pack 'AGENTS.md')
    $missingHome = Join-Path $work 'missing-payload'
    $result = Invoke-Installer $missingHome
    Assert ($result.Code -ne 0) 'Missing AGENTS payload was accepted.'
    Assert (-not (Test-Path $missingHome)) 'Missing payload created a home.'
    Write-Host 'HERMES_INSTALL_BOUNDARIES_PASS: preview, global, persona backup, duplicates, project, skills-only, missing payload'
} finally {
    if (Test-Path -LiteralPath $work) { Remove-Item -LiteralPath $work -Recurse -Force }
}
