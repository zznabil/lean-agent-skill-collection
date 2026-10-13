[CmdletBinding()]
param([string]$ValePath = 'vale')
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
$config = Join-Path (Split-Path $PSScriptRoot -Parent) '.vale.ini'
$root = Split-Path $PSScriptRoot -Parent
$selector = Join-Path $PSScriptRoot 'vale-files.py'
$temporary = Join-Path ([IO.Path]::GetTempPath()) ('lean-vale-' + [guid]::NewGuid().ToString('N'))
$utf8 = New-Object Text.UTF8Encoding($false)
function Read-Vale([string[]]$Paths) {
  $previousPreference = $ErrorActionPreference
  try {
    $ErrorActionPreference = 'Continue'
    $output = @(& $ValePath --output=JSON "--config=$config" @Paths 2>&1)
    $code = $LASTEXITCODE
  } finally { $ErrorActionPreference = $previousPreference }
  if ($code -notin @(0, 1)) { throw "Vale runtime failure (exit $code): $($output -join [Environment]::NewLine)" }
  $report = ($output -join [Environment]::NewLine) | ConvertFrom-Json
  if ($null -eq $report -or $report -isnot [pscustomobject]) { throw 'Vale did not return a JSON report object.' }
  $alerts = @(
    foreach ($file in $report.PSObject.Properties) {
      foreach ($alert in @($file.Value)) {
        if ($alert.Severity -notin @('error', 'warning', 'suggestion') -or -not $alert.Check) { throw 'Invalid Vale diagnostic.' }
        $alert | Add-Member -NotePropertyName File -NotePropertyValue $file.Name -PassThru
      }
    }
  )
  return [pscustomobject]@{ Code=$code; Alerts=$alerts }
}
function Select-Prose([string]$Directory) {
  $json = & python -B $selector --root $Directory
  if ($LASTEXITCODE -ne 0) { throw 'Vale prose selection failed.' }
  $paths = $json | ConvertFrom-Json
  foreach ($path in $paths) {
    if ($path -isnot [string]) { throw 'Invalid Vale prose path.' }
    Write-Output $path
  }
}
$cases = @(
  @{ Name='canonical-sources'; Text='Use ISO 704 terminology and ASD-STE100-inspired language. Follow Diátaxis. The CDC Clear Communication Index is a task-selected diagnostic.'; Code=0; Check=$null },
  @{ Name='metadata-identifiers'; Text=('---' + [Environment]::NewLine + 'name: practice-diataxis' + [Environment]::NewLine + 'description: Diataxis routing metadata.' + [Environment]::NewLine + '---' + [Environment]::NewLine + 'Use Diátaxis. Read [`diataxis-primer.html.txt`](references/diataxis-primer.html.txt).'); Code=0; Check=$null },
  @{ Name='code-identifiers'; Text=('```text' + [Environment]::NewLine + 'ISO704 ASD STE100 Diataxis' + [Environment]::NewLine + '```' + [Environment]::NewLine + 'Use `Diataxis` as a machine identifier.'); Code=0; Check=$null },
  @{ Name='terminology-iso'; Text='Use ISO704 terminology.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='terminology-ste'; Text='Use ASD STE100 language.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='terminology-diataxis'; Text='Follow Diataxis organization.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='case-insensitive-aliases'; Text='Use iso704 and asd ste100. Follow DIATAXIS.'; Code=1; Check='LeanAgent.Terminology'; Errors=3 },
  @{ Name='sentence-limit-35'; Text=((1..35 | ForEach-Object { 'word' }) -join ' ') + '.'; Code=0; Check=$null; Warnings=0 },
  @{ Name='sentence-limit-36'; Text=((1..36 | ForEach-Object { 'word' }) -join ' ') + '.'; Code=0; Check='LeanAgent.SentenceLength'; Warnings=1 }
)
try {
  $null = New-Item -ItemType Directory -Path $temporary
  foreach ($case in $cases) {
    $path = Join-Path $temporary ($case.Name + '.md')
    [IO.File]::WriteAllText($path, $case.Text + [Environment]::NewLine, $utf8)
    $result = Read-Vale @($path)
    $code = $result.Code
    $alerts = $result.Alerts
    if ($code -ne $case.Code) { throw "Vale $($case.Name): expected exit $($case.Code), got $code" }
    if ($case.Check) {
      $severity = if ($case.Code -eq 1) { 'error' } else { 'warning' }
      if (-not ($alerts | Where-Object { $_.Check -eq $case.Check -and $_.Severity -eq $severity })) {
        throw "Vale $($case.Name): required $severity diagnostic absent"
      }
    } elseif ($alerts | Where-Object { $_.Severity -eq 'error' }) {
      throw 'Vale rejected canonical terminology or a legitimate domain source'
    }
    if ($case.ContainsKey('Warnings') -and @($alerts | Where-Object { $_.Check -eq 'LeanAgent.SentenceLength' -and $_.Severity -eq 'warning' }).Count -ne $case.Warnings) { throw "Vale sentence threshold failed: $($case.Name)" }
    if ($case.ContainsKey('Errors') -and @($alerts | Where-Object { $_.Check -eq 'LeanAgent.Terminology' -and $_.Severity -eq 'error' }).Count -ne $case.Errors) { throw "Vale case-insensitive aliases failed: $($case.Name)" }
    Write-Host "PASS: $($case.Name)"
  }
  $scopeOutput = @(& python -B $selector --self-test)
  if ($LASTEXITCODE -ne 0 -or -not ($scopeOutput | Where-Object { $_.StartsWith('VALE_SCOPE_SELF_TEST_PASS:') })) { throw 'Vale scope calibration failed.' }
  $fixture = Join-Path $temporary 'scope'
  $badFiles = @('CONTRIBUTING.md', '.github/PULL_REQUEST_TEMPLATE.md', 'docs/SKILL-COMPOSITION.md', 'packs/example/AGENTS.md')
  foreach ($relative in @('AGENTS.md', 'ENGINEERING-CORE.md') + $badFiles) {
    $path = Join-Path $fixture $relative
    New-Item -ItemType Directory -Path (Split-Path -Parent $path) -Force | Out-Null
    $text = if ($badFiles -contains $relative) { 'Use ISO704 terminology.' } else { 'Use ISO 704 terminology.' }
    [IO.File]::WriteAllText($path, $text + [Environment]::NewLine, $utf8)
  }
  $oldSubset = Read-Vale @((Join-Path $fixture 'AGENTS.md'), (Join-Path $fixture 'ENGINEERING-CORE.md'))
  if ($oldSubset.Code -ne 0 -or @($oldSubset.Alerts | Where-Object { $_.Severity -eq 'error' }).Count -ne 0) { throw 'Clean old-scope positive control failed.' }
  $fixtureFiles = @(Select-Prose $fixture | ForEach-Object { Join-Path $fixture $_ })
  $scopeResult = Read-Vale $fixtureFiles
  $errors = @($scopeResult.Alerts | Where-Object { $_.Severity -eq 'error' })
  if ($scopeResult.Code -ne 1 -or $errors.Count -ne $badFiles.Count) { throw 'Vale scope failed to reject omitted-file terminology errors.' }
  foreach ($relative in $badFiles) {
    if (-not ($errors | Where-Object { $_.File.Replace('\','/').EndsWith('/' + $relative, [StringComparison]::Ordinal) })) { throw "Vale did not inspect $relative" }
  }
  Write-Host 'PASS rejection: contributor, PR template, composition guide and pack instructions cannot escape the shared selector'
  $files = @(Select-Prose $root)
  $warnings = 0
  $processed = 0
  for ($index = 0; $index -lt $files.Count; $index += 50) {
    $last = [Math]::Min($index + 49, $files.Count - 1)
    $batch = @($files[$index..$last] | ForEach-Object { Join-Path $root $_ })
    $result = Read-Vale $batch
    if ($result.Code -ne 0 -or ($result.Alerts | Where-Object { $_.Severity -eq 'error' })) { throw 'Full authored corpus has Vale errors.' }
    $warnings += @($result.Alerts | Where-Object { $_.Severity -eq 'warning' }).Count
    $processed += $batch.Count
  }
  if ($processed -ne $files.Count -or $processed -eq 0) { throw 'Vale did not process the complete selected corpus.' }
  Write-Host "VALE_FULL_CORPUS_PASS: $processed authored Markdown files; zero errors; $warnings advisory warnings."
  Write-Host 'PASS: Vale terminology errors block; sentence warnings do not; source identities remain valid'
} finally {
  if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Recurse -Force }
}
