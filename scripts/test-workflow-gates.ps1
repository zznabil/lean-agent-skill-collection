[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$workflow = [IO.File]::ReadAllText((Join-Path $root '.github/workflows/validate.yml'))
$blocks = [regex]::Matches($workflow, '(?m)^    - name: Validate (?:remaining standards|controlled-execution) review pack\r?\n      shell: (?:pwsh|powershell)\r?\n      run: \|\r?\n(?<body>(?:        [^\r\n]*\r?\n)+)')
if ($blocks.Count -ne 4) { throw 'Expected both pack gates on both PowerShell hosts.' }

# Model successful and failed native processes at the workflow's exit-code boundary.
function python { $script:calls++; $global:LASTEXITCODE = if ($script:calls -eq $script:failedCall) { 1 } else { 0 } }
function Get-FileHash { return [pscustomobject]@{ Hash = 'same-controlled-hash' } }
function git { $global:LASTEXITCODE = 0 }
try {
    foreach ($block in $blocks) {
        $body = [regex]::Replace($block.Groups['body'].Value, '(?m)^        ', '')
        $total = [regex]::Matches($body, '(?m)^python ').Count
        if ($total -notin @(4, 5)) { throw 'Pack gate command inventory changed; review the controls.' }
        for ($index = 0; $index -le $total; $index++) {
            $script:calls = 0
            $script:failedCall = $index
            $rejected = $false
            try { & ([scriptblock]::Create($body)) | Out-Null } catch { $rejected = $true }
            if ($index -eq 0) {
                if ($rejected -or $script:calls -ne $total) { throw 'Clean workflow positive control failed.' }
            } elseif (-not $rejected -or $script:calls -ne $index) {
                throw "Workflow failed to stop at native command $index of $total."
            }
        }
    }
    if ([regex]::Matches($workflow, '(?m)^        \./scripts/compare-release-artifacts\.ps1 -ReferenceDirectory ./artifacts/repro-a -CandidateDirectory ./artifacts/repro-b\s*$').Count -ne 2) {
        throw 'Both release builds must use the calibrated artifact comparator.'
    }
    Write-Host 'WORKFLOW_GATES_PASS: both hosts accept clean pack checks and stop at every failed native command; both use the calibrated comparator.'
} finally {
    Remove-Item Function:python, Function:Get-FileHash, Function:git
    $global:LASTEXITCODE = 0
}
