[CmdletBinding()]
param([string]$ValePath = 'vale')
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
$config = Join-Path (Split-Path $PSScriptRoot -Parent) '.vale.ini'
$temporary = Join-Path ([IO.Path]::GetTempPath()) ('lean-vale-' + [guid]::NewGuid().ToString('N'))
$utf8 = New-Object Text.UTF8Encoding($false)
$cases = @(
  @{ Name='canonical-sources'; Text='Use ISO 704 terminology and ASD-STE100-inspired language. Follow Diátaxis. The CDC Clear Communication Index is a task-selected diagnostic.'; Code=0; Check=$null },
  @{ Name='metadata-identifiers'; Text=('---' + [Environment]::NewLine + 'name: practice-diataxis' + [Environment]::NewLine + 'description: Diataxis routing metadata.' + [Environment]::NewLine + '---' + [Environment]::NewLine + 'Use Diátaxis. Read [`diataxis-primer.html.txt`](references/diataxis-primer.html.txt).'); Code=0; Check=$null },
  @{ Name='terminology-iso'; Text='Use ISO704 terminology.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='terminology-ste'; Text='Use ASD STE100 language.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='terminology-diataxis'; Text='Follow Diataxis organization.'; Code=1; Check='LeanAgent.Terminology' },
  @{ Name='long-sentence'; Text=((1..54 | ForEach-Object { 'word' }) -join ' ') + '.'; Code=0; Check='LeanAgent.SentenceLength' }
)
try {
  $null = New-Item -ItemType Directory -Path $temporary
  foreach ($case in $cases) {
    $path = Join-Path $temporary ($case.Name + '.md')
    [IO.File]::WriteAllText($path, $case.Text + [Environment]::NewLine, $utf8)
    $output = & $ValePath --output=JSON "--config=$config" $path
    $code = $LASTEXITCODE
    $report = ($output -join [Environment]::NewLine) | ConvertFrom-Json
    $alerts = @($report.PSObject.Properties | ForEach-Object { $_.Value })
    if ($code -ne $case.Code) { throw "Vale $($case.Name): expected exit $($case.Code), got $code" }
    if ($case.Check) {
      $severity = if ($case.Code -eq 1) { 'error' } else { 'warning' }
      if (-not ($alerts | Where-Object { $_.Check -eq $case.Check -and $_.Severity -eq $severity })) {
        throw "Vale $($case.Name): required $severity diagnostic absent"
      }
    } elseif ($alerts | Where-Object { $_.Severity -eq 'error' }) {
      throw 'Vale rejected canonical terminology or a legitimate domain source'
    }
    Write-Host "PASS: $($case.Name)"
  }
  Write-Host 'PASS: Vale terminology errors block; sentence warnings do not; source identities remain valid'
} finally {
  if (Test-Path -LiteralPath $temporary) { Remove-Item -LiteralPath $temporary -Recurse -Force }
}
