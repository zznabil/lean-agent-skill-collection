[CmdletBinding()]
param([string]$ArtifactsDirectory)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
. (Join-Path $root 'scripts/release-inventory.ps1')
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Read-Utf8([string]$Path)
{ [IO.File]::ReadAllText($Path, [Text.Encoding]::UTF8)
}
function Hash-Stream([IO.Stream]$Stream)
{
  $hash = [Security.Cryptography.SHA256]::Create()
  try
  { [BitConverter]::ToString($hash.ComputeHash($Stream)).Replace('-','').ToLowerInvariant()
  } finally
  { $hash.Dispose()
  }
}
function Hash-FileRecord([string]$Path)
{
  $item = Get-Item -LiteralPath $Path -Force -ErrorAction Stop
  $stream = [IO.File]::OpenRead($Path)
  try
  { [pscustomobject]@{ Length=[int64]$item.Length; Hash=(Hash-Stream $stream) }
  } finally
  { $stream.Dispose()
  }
}
function Hash-EntryRecord([IO.Compression.ZipArchiveEntry]$Entry)
{
  $stream = $Entry.Open()
  try
  { [pscustomobject]@{ Length=[int64]$Entry.Length; Hash=(Hash-Stream $stream) }
  } finally
  { $stream.Dispose()
  }
}
function Entry-Text([IO.Compression.ZipArchiveEntry]$Entry)
{
  $stream = $Entry.Open(); $reader = New-Object IO.StreamReader($stream,[Text.Encoding]::UTF8,$true)
  try
  { return $reader.ReadToEnd()
  } finally
  { $reader.Dispose(); $stream.Dispose()
  }
}
function Assert-SameSequence([object[]]$Expected, [object[]]$Actual, [string]$Label)
{
  if ($Expected.Count -ne $Actual.Count)
  { throw "PRESERVATION: $Label count"
  }
  for ($i=0; $i -lt $Expected.Count; $i++)
  {
    if ([string]$Expected[$i] -cne [string]$Actual[$i])
    { throw "PRESERVATION: $Label at $i"
    }
  }
}
function Assert-CommunicationKernel([string]$Text)
{
  $starts = [regex]::Matches($Text, '<!-- communication-kernel:start -->')
  $ends = [regex]::Matches($Text, '<!-- communication-kernel:end -->')
  if ($starts.Count -ne 1 -or $ends.Count -ne 1 -or $starts[0].Index -ge $ends[0].Index)
  {
    throw 'PRESERVATION: exactly one ordered communication kernel is required'
  }
  $kernel=$Text.Substring($starts[0].Index,$ends[0].Index-$starts[0].Index)
  $drivers=@('ASD-STE100','ISO 704',('Di'+[char]0x00e1+'taxis'))
  foreach ($driver in $drivers)
  {
    if (-not $kernel.Contains($driver))
    {
      throw "PRESERVATION: communication kernel lost $driver driver"
    }
  }
}
function Package-Name([string]$Profile,[string]$Version)
{
  switch ($Profile)
  {
    'communication'
    { "user-facing-communication-mini-openai-v$Version"
    }
    'get-it-done'
    { "get-it-done-pack-openai-v$Version"
    }
    'gauntlet'
    { "gauntlet-loop-pack-openai-v$Version"
    }
    default
    { "lean-agent-skills-$Profile-openai-v$Version"
    }
  }
}
function Assert-Package([string]$Path, [string]$Profile, [object]$Definition, [string]$Version)
{
  $prefix=(Package-Name $Profile $Version)+'/'
  $expected=New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
  $expected.Add('USER-FACING-STANDARDS-NOTICES.md',$script:proseInventory.RightsPath)
  foreach ($relative in @('LICENSE','THIRD_PARTY_NOTICES.md','install-hermes.ps1','install-hermes.bat'))
  { $expected.Add($relative,(Join-Path $root $relative))
  }
  if ($Definition.include_engineering_core)
  { $expected.Add('ENGINEERING-CORE.md',(Join-Path $root 'ENGINEERING-CORE.md'))
  }
  foreach ($skill in $Definition.skills)
  {
    $skillRoot=Join-Path $root "skills/$skill"
    foreach ($file in @(Get-ReleaseInventorySafeFileTree $skillRoot "base package source $skill"))
    {
      $relative='skills/'+$skill+'/'+$file.FullName.Substring($skillRoot.Length+1).Replace('\','/')
      $expected.Add($relative,$file.FullName)
    }
  }
  foreach ($skill in $script:proseInventory.Names)
  {
    $skillRoot=Join-Path $script:proseInventory.SourceRoot $skill
    foreach ($file in @(Get-ReleaseInventorySafeFileTree $skillRoot "supplemental package source $skill"))
    {
      $relative='skills/'+$skill+'/'+$file.FullName.Substring($skillRoot.Length+1).Replace('\','/')
      $expected.Add($relative,$file.FullName)
    }
  }
  foreach ($relative in @('AGENTS.md','README.md','.codex-plugin/plugin.json','PACKAGE-VALIDATION.json','CHECKSUMS.sha256'))
  { $expected.Add($relative,'')
  }
  $zip=[IO.Compression.ZipFile]::OpenRead($Path)
  try
  {
    $entries=New-Object 'System.Collections.Generic.Dictionary[string,System.IO.Compression.ZipArchiveEntry]' ([StringComparer]::Ordinal)
    foreach ($entry in $zip.Entries)
    {
      $rawName=[string]$entry.FullName
      if ($rawName.Contains([char]92))
      { throw "PRESERVATION: backslash packaged member in $Profile"
      }
      $name=$rawName.Replace([char]92,'/')
      if ([string]::IsNullOrEmpty($entry.Name) -or $name.EndsWith('/',[StringComparison]::Ordinal))
      { throw "PRESERVATION: directory-only packaged member in $Profile"
      }
      if (-not $name.StartsWith($prefix,[StringComparison]::Ordinal))
      { throw "PRESERVATION: package root in $Profile"
      }
      $relative=$name.Substring($prefix.Length)
      if ($entries.ContainsKey($relative) -or -not $expected.ContainsKey($relative))
      { throw "PRESERVATION: unexpected or duplicate packaged file in $Profile"
      }
      $entries.Add($relative,$entry)
      if (-not [string]::IsNullOrEmpty($expected[$relative]))
      {
        $sourceRecord=Hash-FileRecord $expected[$relative]
        $entryRecord=Hash-EntryRecord $entry
        if ($entryRecord.Length -ne $sourceRecord.Length -or $entryRecord.Hash -cne $sourceRecord.Hash)
        { throw "PRESERVATION: packaged source differs: $Profile/$relative"
        }
      }
    }
    Assert-SameSequence @($expected.Keys | Sort-Object) @($entries.Keys | Sort-Object) "package inventory $Profile"
    $declared=New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    foreach ($line in ((Entry-Text $entries['CHECKSUMS.sha256']) -split '\r?\n'))
    {
      if (-not $line)
      { continue
      }
      $match=[regex]::Match($line,'^([0-9a-f]{64})  (.+)$')
      if (-not $match.Success)
      { throw "PRESERVATION: malformed package checksum in $Profile"
      }
      $relative=$match.Groups[2].Value
      if ($relative -eq 'CHECKSUMS.sha256' -or $declared.ContainsKey($relative) -or -not $entries.ContainsKey($relative))
      { throw "PRESERVATION: invalid package checksum target in $Profile"
      }
      $declared.Add($relative,$match.Groups[1].Value)
      if ((Hash-EntryRecord $entries[$relative]).Hash -cne $declared[$relative])
      { throw "PRESERVATION: package checksum mismatch in $Profile"
      }
    }
    Assert-SameSequence @($entries.Keys | Where-Object { $_ -ne 'CHECKSUMS.sha256' } | Sort-Object) @($declared.Keys | Sort-Object) "checksum coverage $Profile"
    $expectedPolicy = Get-ProfileAgentInstructions $agents @($Definition.skills) @($profiles.profiles.complete.skills) @($script:proseInventory.Names)
    if ((Entry-Text $entries['AGENTS.md']) -cne $expectedPolicy) { throw "PRESERVATION: profile agent skill map differs: $Profile" }
    Assert-CommunicationKernel (Entry-Text $entries['AGENTS.md'])
  } finally
  { $zip.Dispose()
  }
}
function Expect-Rejection([string]$Name,[scriptblock]$Action)
{
  $rejected=$false
  try
  { & $Action
  } catch
  {
    if (-not $_.Exception.Message.StartsWith('PRESERVATION:',[StringComparison]::Ordinal))
    { throw
    }
    $rejected=$true
  }
  if (-not $rejected)
  { throw "Negative control did not reject: $Name"
  }
  $script:controls++
  Write-Host "PASS rejection: $Name"
}

$profiles=(Read-Utf8 (Join-Path $root 'release-profiles.json')) | ConvertFrom-Json
$script:proseInventory=Get-ReleaseUserFacingInventory $root $profiles
$agents=Read-Utf8 (Join-Path $root 'AGENTS.md')
Assert-CommunicationKernel $agents
Write-Host 'PASS: source communication kernel has ordered boundaries and all three drivers'
$controls=0
Expect-Rejection 'kernel start missing' { Assert-CommunicationKernel ($agents.Replace('<!-- communication-kernel:start -->','')) }
Expect-Rejection 'kernel duplicated' { Assert-CommunicationKernel ($agents+$agents) }
Expect-Rejection 'kernel obligations removed' { Assert-CommunicationKernel ([regex]::Replace($agents,'(?s)(<!-- communication-kernel:start -->).*?(<!-- communication-kernel:end -->)','$1$2')) }
foreach ($driver in @('ASD-STE100','ISO 704',('Di'+[char]0x00e1+'taxis')))
{
  Expect-Rejection "kernel driver missing: $driver" { Assert-CommunicationKernel ($agents.Replace($driver,'')) }
}

if ($ArtifactsDirectory)
{
  $artifacts=[IO.Path]::GetFullPath($ArtifactsDirectory)
  foreach ($profile in $profiles.profiles.PSObject.Properties)
  {
    $path=Join-Path $artifacts ((Package-Name $profile.Name $profiles.version)+'.zip')
    Assert-Package $path $profile.Name $profile.Value $profiles.version
  }
  $temporary=Join-Path ([IO.Path]::GetTempPath()) ('lean-prose-'+[guid]::NewGuid().ToString('N')+'.zip')
  $original=Join-Path $artifacts ((Package-Name 'communication' $profiles.version)+'.zip')
  try
  {
    Copy-Item -LiteralPath $original -Destination $temporary
    $archive=[IO.Compression.ZipFile]::Open($temporary,[IO.Compression.ZipArchiveMode]::Update)
    try
    { $archive.GetEntry((Package-Name 'communication' $profiles.version)+'/skills/writing/INSTRUCTION-EDITING.md').Delete()
    } finally
    { $archive.Dispose()
    }
    Expect-Rejection 'standalone authoring reference missing from ZIP' { Assert-Package $temporary 'communication' $profiles.profiles.communication $profiles.version }
    Copy-Item -LiteralPath $original -Destination $temporary -Force
    $archive=[IO.Compression.ZipFile]::Open($temporary,[IO.Compression.ZipArchiveMode]::Update)
    try
    {
      $entry=$archive.GetEntry((Package-Name 'communication' $profiles.version)+'/CHECKSUMS.sha256');$entry.Delete()
      $null=$archive.CreateEntry((Package-Name 'communication' $profiles.version)+'/CHECKSUMS.sha256')
    } finally
    { $archive.Dispose()
    }
    Expect-Rejection 'empty packaged checksum inventory' { Assert-Package $temporary 'communication' $profiles.profiles.communication $profiles.version }
    Assert-Package $original 'communication' $profiles.profiles.communication $profiles.version
    Write-Host 'PASS: six package inventories, source bytes, checksum coverage and communication core; restored positive control'
  } finally
  { if (Test-Path -LiteralPath $temporary)
    { Remove-Item -LiteralPath $temporary -Force
    }
  }
}
Write-Host "PASS: $controls contract, structural and package rejection controls; live behaviour evaluated separately."
