[CmdletBinding()]

param([string]$Installer)

$ErrorActionPreference = 'Stop'

$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path

if ([string]::IsNullOrWhiteSpace($Installer))

{ $Installer = Join-Path $repo 'install-hermes.ps1'

}

$engine = (Get-Process -Id $PID).Path

$work = Join-Path ([IO.Path]::GetTempPath()) ('lean-hermes-test-' + [guid]::NewGuid().ToString('N'))

function Assert([bool]$Condition, [string]$Message)

{ if (-not $Condition)

  { throw $Message

  }

}

function Get-TestDigest([string]$Path)

{

  $sha = [Security.Cryptography.SHA256]::Create()

  try

  { return [pscustomobject]@{ Hash = [BitConverter]::ToString($sha.ComputeHash([IO.File]::ReadAllBytes($Path))).Replace('-', '') }

  } finally

  { $sha.Dispose()

  }

}

function Invoke-Installer([string]$HomePath, [string[]]$Extra = @(), [string]$ConcurrentPolicyPath = '', [string]$ConcurrentDestination = '', [string]$Setup = '')

{

  $ErrorActionPreference = 'Continue'

  $command = "& '" + $script:fixtureInstaller.Replace("'", "''") + "' -HermesHome '" + $HomePath.Replace("'", "''") + "' -Confirm:" + '$false'

  foreach ($argument in $Extra)

  {

    if ($argument.StartsWith('-'))

    { $command += ' ' + $argument

    } else

    { $command += " '" + $argument.Replace("'", "''") + "'"

    }

  }

  if ($ConcurrentPolicyPath)

  {

    $checkpoint = "Set-PSBreakpoint -Script '" + $script:fixtureInstaller.Replace("'", "''") + "' -Variable stage -Mode Write -Action { [IO.File]::WriteAllText('" + $ConcurrentPolicyPath.Replace("'", "''") + "', 'Concurrent user policy') } | Out-Null; "

    $command = $checkpoint + $command

  }

  if ($ConcurrentDestination)

  {

    $racePath = $ConcurrentDestination.Replace("'", "''")

    $checkpoint = "Set-PSBreakpoint -Script '" + $script:fixtureInstaller.Replace("'", "''") + "' -Variable stage -Mode Write -Action { [IO.Directory]::CreateDirectory('" + $racePath + "') | Out-Null; [IO.File]::WriteAllText('" + $racePath + "/other-writer.txt', 'Concurrent user payload') } | Out-Null; "

    $command = $checkpoint + $command

  }

  $command = $Setup + $command
  $encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($command))

  $output = & $engine -NoLogo -NoProfile -ExecutionPolicy Bypass -EncodedCommand $encoded 2>&1 | Out-String

  return [pscustomobject]@{ Code = $LASTEXITCODE; Output = $output }

}

try

{

  $pack = Join-Path $work 'pack with spaces'

  New-Item -ItemType Directory -Path (Join-Path $pack 'skills') -Force | Out-Null

  Copy-Item -LiteralPath (Join-Path $repo 'skills/wait-what') -Destination (Join-Path $pack 'skills') -Recurse

  Copy-Item -LiteralPath (Join-Path $repo 'AGENTS.md') -Destination $pack

  Copy-Item -LiteralPath (Resolve-Path $Installer).Path -Destination (Join-Path $pack 'install-hermes.ps1')

  $script:fixtureInstaller = Join-Path $pack 'install-hermes.ps1'

  $resources = @('audit', 'provenance', 'docs', 'references', 'official', 'licences', 'licenses')

  foreach ($name in $resources)

  {

    $resource = Join-Path $pack "$name/nested"

    New-Item -ItemType Directory -Path $resource -Force | Out-Null

    [IO.File]::WriteAllBytes((Join-Path $resource 'resource.bin'), [byte[]]@(0, 127, 128, 255))

  }

  [IO.File]::WriteAllText((Join-Path $pack 'ENGINEERING-CORE.md'), 'Engineering companion fixture')

  New-Item -ItemType Directory -Path (Join-Path $pack 'gated-skills') | Out-Null

  [IO.File]::WriteAllText((Join-Path $pack 'gated-skills/excluded.txt'), 'Not installable')

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

  foreach ($name in $resources)

  {

    Assert ((Get-TestDigest (Join-Path $installed "$name/nested/resource.bin")).Hash -eq (Get-TestDigest (Join-Path $pack "$name/nested/resource.bin")).Hash) "Resource bytes differ: $name"

  }

  Assert ((Get-TestDigest (Join-Path $installed 'ENGINEERING-CORE.md')).Hash -eq (Get-TestDigest (Join-Path $pack 'ENGINEERING-CORE.md')).Hash) 'Engineering companion bytes differ.'

  Assert (-not (Test-Path (Join-Path $installed 'gated-skills'))) 'Gated skills were installed.'

  $globalPolicy = [IO.File]::ReadAllText($soul)

  Assert ($globalPolicy.StartsWith($persona)) 'Existing persona was replaced.'

  Assert ($globalPolicy.Contains([IO.File]::ReadAllText((Join-Path $pack 'AGENTS.md')))) 'Global AGENTS policy is missing.'

  Assert ($globalPolicy.Contains((Join-Path $installed 'ENGINEERING-CORE.md'))) 'Global policy omitted the installed companion path.'

  $backups = @(Get-ChildItem -LiteralPath $homePath -Filter 'SOUL.md.lean-backup-*')

  Assert ($backups.Count -eq 1) 'Persona backup missing.'

  Assert ([Convert]::ToBase64String([IO.File]::ReadAllBytes($backups[0].FullName)) -ceq [Convert]::ToBase64String($personaBytes)) 'Backup bytes differ.'

  $before = (Get-TestDigest $soul).Hash

  $result = Invoke-Installer $homePath

  Assert ($result.Code -ne 0) 'Duplicate installation was accepted.'

  Assert ((Get-TestDigest $soul).Hash -eq $before) 'Duplicate install changed persona.'

  $collisionHome = Join-Path $work 'collision'

  New-Item -ItemType Directory -Path (Join-Path $collisionHome 'skills/other/custom-folder') -Force | Out-Null

  $existingSkill = Join-Path $collisionHome 'skills/other/custom-folder/SKILL.md'

  $existingSkillText = "---`nname: 'wait-what'`ndescription: Existing user skill`n---`nExisting user skill`n"

  [IO.File]::WriteAllText($existingSkill, $existingSkillText)

  $result = Invoke-Installer $collisionHome

  Assert ($result.Code -ne 0) 'Duplicate skill name was accepted.'

  Assert ([IO.File]::ReadAllText($existingSkill) -ceq $existingSkillText) 'Existing skill changed.'

  Assert (-not (Test-Path (Join-Path $collisionHome 'SOUL.md'))) 'Collision wrote policy.'

  Assert (-not (Test-Path (Join-Path $collisionHome 'skills/lean-pack-with-spaces'))) 'Collision partially installed pack.'

  $project = Join-Path $work 'project'

  New-Item -ItemType Directory -Path $project | Out-Null

  $projectHome = Join-Path $work 'project-home'

  $result = Invoke-Installer $projectHome @('-PolicyScope', 'Project', '-ProjectDirectory', $project)

  Assert ($result.Code -eq 0) "Project install failed: $($result.Output)"

  $projectPolicy = [IO.File]::ReadAllText((Join-Path $project 'AGENTS.md'))

  Assert ($projectPolicy.StartsWith([IO.File]::ReadAllText((Join-Path $pack 'AGENTS.md')))) 'Project instructions differ.'

  Assert ($projectPolicy.Contains((Join-Path $projectHome 'skills/lean-pack-with-spaces/ENGINEERING-CORE.md'))) 'Project policy omitted the installed companion path.'

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

  foreach ($scope in @('None', 'Global'))

  {

    $raceHome = Join-Path $work ('destination-race-' + $scope)

    $raceDestination = Join-Path $raceHome 'skills/lean-pack-with-spaces'

    $result = Invoke-Installer -HomePath $raceHome -Extra @('-PolicyScope', $scope) -ConcurrentDestination $raceDestination

    Assert ($result.Code -ne 0 -and -not $result.Output.Contains('INSTALLED:')) "Concurrent $scope destination was accepted: $($result.Output)"

    Assert ([IO.File]::ReadAllText((Join-Path $raceDestination 'other-writer.txt')) -ceq 'Concurrent user payload') 'Concurrent destination payload changed.'

    Assert (@(Get-ChildItem -LiteralPath $raceDestination -Force).Count -eq 1) 'Staged pack was nested inside the concurrent destination.'

    Assert (@(Get-ChildItem -LiteralPath (Join-Path $raceHome 'skills') -Filter 'lean-hermes-*' -Force).Count -eq 0) 'Destination race left a staged pack.'

    Assert (-not (Test-Path -LiteralPath (Join-Path $raceHome 'SOUL.md'))) 'Destination race wrote global policy.'

  }

  foreach ($case in @('existing-global', 'new-global', 'project'))

  {

    $raceHome = Join-Path $work ('race-' + $case)

    New-Item -ItemType Directory -Path $raceHome | Out-Null

    $racePolicy = Join-Path $raceHome 'SOUL.md'

    $raceExtra = @()

    if ($case -eq 'existing-global')

    { [IO.File]::WriteAllText($racePolicy, 'Initial persona')

    }

    if ($case -eq 'project')

    {

      $raceProject = Join-Path $work 'race-project-files'

      New-Item -ItemType Directory -Path $raceProject | Out-Null

      $racePolicy = Join-Path $raceProject 'AGENTS.md'

      $raceExtra = @('-PolicyScope', 'Project', '-ProjectDirectory', $raceProject)

    }

    $result = Invoke-Installer -HomePath $raceHome -Extra $raceExtra -ConcurrentPolicyPath $racePolicy

    Assert ($result.Code -ne 0) "Post-confirmation $case policy change was accepted."

    Assert ([IO.File]::ReadAllText($racePolicy) -ceq 'Concurrent user policy') "Post-confirmation $case policy was overwritten."

    Assert (-not (Test-Path (Join-Path $raceHome 'skills/lean-pack-with-spaces'))) "Policy race partially installed the $case pack."

    Assert (@(Get-ChildItem -LiteralPath $raceHome -Filter 'SOUL.md.lean-backup-*').Count -eq 0) 'Policy race created a stale persona backup.'

  }

  $installerLines = [IO.File]::ReadAllLines($script:fixtureInstaller)
  $confirmationEnd = -1
  for ($line = 0; $line -lt $installerLines.Length; $line++) {
    if ($installerLines[$line].Contains('$PSCmdlet.ShouldProcess(')) { $confirmationEnd = $line + 3; break }
  }
  Assert ($confirmationEnd -gt 0) 'Confirmation fault-injection boundary is unavailable.'
  foreach ($boundary in @('home', 'resource')) {
    $swapHome = Join-Path $work ('post-confirmation-' + $boundary)
    $swapTarget = Join-Path $work ('outside-' + $boundary)
    New-Item -ItemType Directory -Path $swapHome, $swapTarget | Out-Null
    [IO.File]::WriteAllText((Join-Path $swapTarget 'preserve.txt'), 'Outside content')
    $swapPath = $swapHome
    if ($boundary -eq 'resource') { $swapPath = Join-Path $pack 'references' }
    $movedPath = $swapPath + '.original'
    $linkType = if ($env:OS -eq 'Windows_NT') { 'Junction' } else { 'SymbolicLink' }
    $setup = "Set-PSBreakpoint -Script '" + $script:fixtureInstaller.Replace("'", "''") + "' -Line $($confirmationEnd + 1) -Action { [IO.Directory]::Move('" + $swapPath.Replace("'", "''") + "', '" + $movedPath.Replace("'", "''") + "'); New-Item -ItemType $linkType -Path '" + $swapPath.Replace("'", "''") + "' -Target '" + $swapTarget.Replace("'", "''") + "' | Out-Null } | Out-Null; "
    try {
      $result = Invoke-Installer -HomePath $swapHome -Setup $setup
      Assert ($result.Code -ne 0 -and $result.Output.Contains('Linked paths are not supported')) "Post-confirmation $boundary swap was accepted: $($result.Output)"
      Assert (@(Get-ChildItem -LiteralPath $swapTarget -Force).Count -eq 1 -and [IO.File]::ReadAllText((Join-Path $swapTarget 'preserve.txt')) -ceq 'Outside content') 'A post-confirmation swap wrote outside the confirmed paths.'
    } finally {
      if ((Get-Item -LiteralPath $swapPath -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { [IO.Directory]::Delete($swapPath) }
      [IO.Directory]::Move($movedPath, $swapPath)
    }
  }
  foreach ($existing in @($true, $false)) {
    $failureHome = Join-Path $work ('cleanup-failure-' + $existing)
    New-Item -ItemType Directory -Path $failureHome | Out-Null
    $failurePolicy = Join-Path $failureHome 'SOUL.md'
    $personaBytes = [byte[]](239,187,191,80,101,114,115,111,110,97,32,240,159,152,128,13,10)
    if ($existing) { [IO.File]::WriteAllBytes($failurePolicy, $personaBytes) }
    $setup = "function Remove-Item { [CmdletBinding()]param([string]" + '$LiteralPath' + ",[switch]" + '$Recurse' + ",[switch]" + '$Force' + "); if (" + '$LiteralPath' + " -like '*lean-pack-with-spaces') { throw 'Injected payload cleanup failure' }; Microsoft.PowerShell.Management\Remove-Item @PSBoundParameters }; Set-PSBreakpoint -Script '" + $script:fixtureInstaller.Replace("'", "''") + "' -Variable policyBytes -Mode Read -Action { if (" + '$policyStream.CanWrite' + ") { " + '$policyStream.WriteByte(88); $policyStream.Dispose()' + " } } | Out-Null; "
    $result = Invoke-Installer -HomePath $failureHome -Setup $setup
    Assert ($result.Code -ne 0 -and $result.Output.Contains('Injected payload cleanup failure')) 'Cleanup failure injection did not reach rollback.'
    if ($existing) {
      Assert ([Convert]::ToBase64String([IO.File]::ReadAllBytes($failurePolicy)) -ceq [Convert]::ToBase64String($personaBytes)) 'Payload cleanup failure prevented exact persona restoration.'
      $backups = @(Get-ChildItem -LiteralPath $failureHome -Filter 'SOUL.md.lean-backup-*')
      Assert ($backups.Count -eq 1 -and [Convert]::ToBase64String([IO.File]::ReadAllBytes($backups[0].FullName)) -ceq [Convert]::ToBase64String($personaBytes)) 'Failure lost the persona backup.'
    } else {
      Assert (-not (Test-Path -LiteralPath $failurePolicy)) 'Payload cleanup failure left a new policy file.'
    }
  }

  $linkedTarget = Join-Path $work 'linked-resource-target'

  New-Item -ItemType Directory -Path $linkedTarget | Out-Null

  [IO.File]::WriteAllText((Join-Path $linkedTarget 'preserve.txt'), 'Linked target content')

  foreach ($relative in @('docs/linked-child', 'official'))

  {

    $linkPath = Join-Path $pack $relative

    if ($relative -eq 'official')

    {

      Remove-Item -LiteralPath $linkPath -Recurse -Force

    }

    $linkType = 'SymbolicLink'

    if ($env:OS -eq 'Windows_NT')

    { $linkType = 'Junction'

    }

    New-Item -ItemType $linkType -Path $linkPath -Target $linkedTarget | Out-Null

    try

    {

      $linkedHome = Join-Path $work ('linked-' + (Split-Path -Leaf $relative))

      $result = Invoke-Installer $linkedHome @('-PolicyScope', 'None', '-WhatIf')

      Assert ($result.Code -ne 0 -and $result.Output.Contains('Linked paths are not supported')) "Linked payload accepted: $relative"

      Assert (-not (Test-Path $linkedHome)) 'Linked payload created a home.'

      Assert ([IO.File]::ReadAllText((Join-Path $linkedTarget 'preserve.txt')) -ceq 'Linked target content') 'Linked target changed.'

    } finally

    { [IO.Directory]::Delete($linkPath)

    }

  }

  Remove-Item -LiteralPath (Join-Path $pack 'AGENTS.md')

  $missingHome = Join-Path $work 'missing-payload'

  $result = Invoke-Installer $missingHome

  Assert ($result.Code -ne 0) 'Missing AGENTS payload was accepted.'

  Assert (-not (Test-Path $missingHome)) 'Missing payload created a home.'

  Write-Host 'HERMES_INSTALL_BOUNDARIES_PASS: preview, global, resources, companion, gated exclusion, linked payload, persona backup, declared-name collisions, project, skills-only, destination races, policy races, post-confirmation swaps, partial-write and cleanup recovery, missing payload'

} finally

{

  if (Test-Path -LiteralPath $work)

  { Remove-Item -LiteralPath $work -Recurse -Force

  }

}

exit 0

