[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'validate.ps1') -FunctionsOnly
$quietFailures = $true

$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('lean-agent-validator-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $fixtureRoot -Force | Out-Null
Add-Type -AssemblyName System.IO.Compression

function Add-Entry([IO.Compression.ZipArchive]$Archive, [string]$Name, [string]$Content, [Nullable[int]]$ExternalAttributes) {
    $entry = $Archive.CreateEntry($Name)
    if ($null -ne $ExternalAttributes) { $entry.ExternalAttributes = $ExternalAttributes.Value }
    $stream = $entry.Open()
    try {
        $bytes = [Text.Encoding]::UTF8.GetBytes($Content)
        $stream.Write($bytes, 0, $bytes.Length)
    }
    finally { $stream.Dispose() }
}

try {
    $fixturePath = Join-Path $fixtureRoot 'unsafe.zip'
    $fileStream = [IO.File]::Open($fixturePath, [IO.FileMode]::Create)
    try {
        $archive = New-Object IO.Compression.ZipArchive($fileStream, [IO.Compression.ZipArchiveMode]::Create, $false)
        try {
            Add-Entry $archive 'root/../escape.txt' 'escape' $null
            Add-Entry $archive 'root/Case.txt' 'one' $null
            Add-Entry $archive 'root/case.txt' 'two' $null
            Add-Entry $archive 'root/run.ps1' 'Write-Host unsafe' $null
            $symlinkMode = [uint32]::Parse('A0000000', [Globalization.NumberStyles]::HexNumber)
            $symlinkAttributes = [BitConverter]::ToInt32([BitConverter]::GetBytes($symlinkMode), 0)
            Add-Entry $archive 'root/link' 'target' $symlinkAttributes
        }
        finally { $archive.Dispose() }
    }
    finally { $fileStream.Dispose() }

    Test-ZipArchive $fixturePath $null $null '0.0.0'
    $requiredFindings = @('unsafe ZIP path', 'case-colliding ZIP members', 'executable ZIP member')
    foreach ($finding in $requiredFindings) {
        if (-not ($failures | Where-Object { $_ -match [regex]::Escape($finding) })) {
            throw "Validator self-test did not detect: $finding"
        }
    }
    if (-not (Test-IsSymlinkAttributes $symlinkAttributes)) {
        throw 'Validator self-test did not detect Unix symlink mode attributes.'
    }
    $masterDirectory = Join-Path $fixtureRoot 'master'
    New-Item -ItemType Directory -Path $masterDirectory | Out-Null
    [IO.File]::WriteAllText((Join-Path $masterDirectory 'expected.txt'), 'expected')
    $masterPath = Join-Path $masterDirectory 'openai-native-skill-collections-v0.0.0-all.zip'
    $masterStream = [IO.File]::Open($masterPath, [IO.FileMode]::Create)
    try {
        $masterArchive = New-Object IO.Compression.ZipArchive($masterStream, [IO.Compression.ZipArchiveMode]::Create, $false)
        try { Add-Entry $masterArchive 'wrong-root/expected.txt' 'expected' $null }
        finally { $masterArchive.Dispose() }
    }
    finally { $masterStream.Dispose() }
    Test-MasterArchive $masterPath $masterDirectory '0.0.0'
    if (-not ($failures | Where-Object { $_ -eq 'master archive inventory mismatch' })) {
        throw 'Validator self-test did not reject a malformed master archive.'
    }

    # These controls test policy presence and metadata guards, not live prose or tool behaviour.
    $baselineText = [IO.File]::ReadAllText((Join-Path $repoRoot 'AGENTS.md'), [Text.Encoding]::UTF8)
    $baselineMetadata = [IO.File]::ReadAllText((Join-Path $repoRoot 'PACKAGE-VALIDATION.json'), [Text.Encoding]::UTF8) | ConvertFrom-Json
    $failures.Clear()
    Test-DirectClaimsText $baselineText 'positive control'
    Test-DirectClaimsMetadata $baselineMetadata.direct_claims 'positive control'
    Test-QuickModeMetadata $baselineMetadata.quick_mode $true 'positive control'
    if ($failures.Count -ne 0) { throw 'Policy positive controls failed' }

    function Assert-BooleanTypeControl([object]$Contract, [string]$Kind, [string]$Name, [bool]$Expected, [string]$Literal) {
        $failures.Clear()
        $bad = ($Contract | ConvertTo-Json -Depth 10 | ConvertFrom-Json)
        $bad.$Name = ConvertFrom-Json -InputObject ('"' + $Literal + '"')
        if ($Kind -eq 'direct') {
            Test-DirectClaimsMetadata $bad 'type control'
        }
        else {
            Test-QuickModeMetadata $bad $Expected 'type control'
        }
        $expectedLabel = if ($Kind -eq 'direct') { "direct-claims metadata $Name in type control" } else { "quick-mode metadata $Name in type control" }
        if ($failures.Count -ne 1 -or $failures[0] -notmatch [regex]::Escape($expectedLabel) -or $failures[0] -notmatch 'must be a Boolean') {
            throw "Boolean type control did not fail on the intended message: $Kind.$Name"
        }
    }

    $booleanTypeMutationCount = 0
    foreach ($name in @('global_principles','preserve_uncertainty','preserve_semantics','evidence_based_ownership','no_blanket_word_ban','no_new_route')) {
        Assert-BooleanTypeControl $baselineMetadata.direct_claims 'direct' $name $true 'true'
        $booleanTypeMutationCount++
    }
    foreach ($name in @('runtime_enforcement','live_host_evaluated')) {
        Assert-BooleanTypeControl $baselineMetadata.direct_claims 'direct' $name $false 'false'
        $booleanTypeMutationCount++
    }
    foreach ($name in @('included','explicit_request_only','natural_language_selectable','dogfood_optional','automated_uat_optional','selected_validation_becomes_required','real_project_interaction_required','static_inspection_not_interaction_evidence')) {
        Assert-BooleanTypeControl $baselineMetadata.quick_mode 'quick' $name $true 'true'
        $booleanTypeMutationCount++
    }
    Assert-BooleanTypeControl $baselineMetadata.quick_mode 'quick' 'live_host_evaluated' $true 'false'
    $booleanTypeMutationCount++
    if ($booleanTypeMutationCount -ne 17) { throw 'Boolean type-control count drifted' }

    $directMutationCount = 0
    foreach ($needle in @('State supported conclusions directly','avoid litotes and rhetorical hedging','Preserve genuine uncertainty','evidence scope and degree','Own actual agent errors','within existing permissions')) {
        $failures.Clear()
        Test-DirectClaimsText ($baselineText.Replace($needle, 'removed guard')) 'negative control'
        if ($failures.Count -eq 0) { throw "Direct-claims guard failed to detect removal: $needle" }
        $directMutationCount++
    }
    foreach ($name in @('global_principles','preserve_uncertainty','preserve_semantics','evidence_based_ownership','no_blanket_word_ban','no_new_route','runtime_enforcement','live_host_evaluated')) {
        $failures.Clear()
        $bad = ($baselineMetadata.direct_claims | ConvertTo-Json | ConvertFrom-Json)
        $bad.$name = -not [bool]$bad.$name
        Test-DirectClaimsMetadata $bad 'negative control'
        if ($failures.Count -eq 0) { throw "Direct-claims metadata guard failed to detect mutation: $name" }
        $directMutationCount++
    }
    if ($directMutationCount -ne 14) { throw 'Direct-claims negative-control count drifted' }

    $quickMutationCount = 0
    foreach ($name in @('included','explicit_request_only','natural_language_selectable','dogfood_optional','automated_uat_optional','selected_validation_becomes_required','real_project_interaction_required','static_inspection_not_interaction_evidence','live_host_evaluated')) {
        $failures.Clear()
        $bad = ($baselineMetadata.quick_mode | ConvertTo-Json | ConvertFrom-Json)
        $bad.$name = -not [bool]$bad.$name
        Test-QuickModeMetadata $bad $true 'negative control'
        if ($failures.Count -eq 0) { throw "Quick Mode metadata guard failed to detect mutation: $name" }
        $quickMutationCount++
    }
    foreach ($case in @(
        @('default_validation','NONE'),
        @('production_readiness_default','READY')
    )) {
        $failures.Clear()
        $bad = ($baselineMetadata.quick_mode | ConvertTo-Json | ConvertFrom-Json)
        $bad.($case[0]) = $case[1]
        Test-QuickModeMetadata $bad $true 'negative control'
        if ($failures.Count -eq 0) { throw "Quick Mode metadata guard failed to detect mutation: $($case[0])" }
        $quickMutationCount++
    }
    if ($quickMutationCount -ne 11) { throw 'Quick Mode negative-control count drifted' }

    $auditPackagePath = Join-Path $repoRoot 'PACKAGE-VALIDATION.json'
    $auditScriptPath = Join-Path $repoRoot 'scripts/audit-repository.ps1'
    $auditOriginalPackage = [IO.File]::ReadAllText($auditPackagePath, [Text.Encoding]::UTF8)
    $auditShells = @('pwsh')
    if (Get-Command powershell.exe -ErrorAction SilentlyContinue) { $auditShells += 'powershell.exe' }
    $auditTypeCases = @(
        @(@('profile_composition', 'communication_embedded_in_get_it_done'), 'profile composition communication_embedded_in_get_it_done', 'true'),
        @(@('profile_composition', 'communication_embedded_in_gauntlet'), 'profile composition communication_embedded_in_gauntlet', 'true'),
        @(@('proof_integrity', 'global_principles'), 'proof-integrity global_principles', 'true'),
        @(@('proof_integrity', 'oracle_must_be_falsifiable'), 'proof-integrity oracle_must_be_falsifiable', 'true'),
        @(@('proof_integrity', 'status_is_not_reexecution'), 'proof-integrity status_is_not_reexecution', 'true'),
        @(@('proof_integrity', 'required_gate_abandonment_is_not_completion'), 'proof-integrity required_gate_abandonment_is_not_completion', 'true'),
        @(@('proof_integrity', 'native_parallel_claim_requires_launch_barrier'), 'proof-integrity native_parallel_claim_requires_launch_barrier', 'true'),
        @(@('proof_integrity', 'runtime_vendored'), 'proof-integrity runtime_vendored', 'false'),
        @(@('proportional_rigor', 'global_principles'), 'proportional-rigor global_principles', 'true'),
        @(@('proportional_rigor', 'direct_for_single_decisive_check'), 'proportional-rigor direct_for_single_decisive_check', 'true'),
        @(@('proportional_rigor', 'extra_scrutiny_requires_distinct_evidence_gap'), 'proportional-rigor extra_scrutiny_requires_distinct_evidence_gap', 'true'),
        @(@('proportional_rigor', 'safety_and_correctness_floor_immutable'), 'proportional-rigor safety_and_correctness_floor_immutable', 'true'),
        @(@('proportional_rigor', 'explicit_request_quick_mode_exception'), 'proportional-rigor explicit_request_quick_mode_exception', 'true'),
        @(@('proportional_rigor', 'v8_5_no_new_routed_skill_decision_retained_as_history'), 'proportional-rigor v8_5_no_new_routed_skill_decision_retained_as_history', 'true'),
        @(@('proportional_rigor', 'automatic_low_scrutiny_route'), 'proportional-rigor automatic_low_scrutiny_route', 'false'),
        @(@('quick_mode', 'included'), 'quick-mode included', 'true'),
        @(@('quick_mode', 'explicit_request_only'), 'quick-mode explicit_request_only', 'true'),
        @(@('quick_mode', 'natural_language_selectable'), 'quick-mode natural_language_selectable', 'true'),
        @(@('quick_mode', 'dogfood_optional'), 'quick-mode dogfood_optional', 'true'),
        @(@('quick_mode', 'automated_uat_optional'), 'quick-mode automated_uat_optional', 'true'),
        @(@('quick_mode', 'selected_validation_becomes_required'), 'quick-mode selected_validation_becomes_required', 'true'),
        @(@('quick_mode', 'real_project_interaction_required'), 'quick-mode real_project_interaction_required', 'true'),
        @(@('quick_mode', 'static_inspection_not_interaction_evidence'), 'quick-mode static_inspection_not_interaction_evidence', 'true'),
        @(@('quick_mode', 'live_host_evaluated'), 'quick-mode live_host_evaluated', 'false'),
        @(@('outcome_first_delivery', 'global_principles'), 'outcome-first delivery global_principles', 'true'),
        @(@('outcome_first_delivery', 'response_weight_matching'), 'outcome-first delivery response_weight_matching', 'true'),
        @(@('outcome_first_delivery', 'internal_depth_external_brevity'), 'outcome-first delivery internal_depth_external_brevity', 'true'),
        @(@('outcome_first_delivery', 'quiet_completion'), 'outcome-first delivery quiet_completion', 'true'),
        @(@('outcome_first_delivery', 'act_or_state_blocker'), 'outcome-first delivery act_or_state_blocker', 'true'),
        @(@('outcome_first_delivery', 'no_process_replay'), 'outcome-first delivery no_process_replay', 'true'),
        @(@('outcome_first_delivery', 'anti_filler'), 'outcome-first delivery anti_filler', 'true'),
        @(@('outcome_first_delivery', 'anti_sycophancy'), 'outcome-first delivery anti_sycophancy', 'true'),
        @(@('outcome_first_delivery', 'explicit_user_or_host_style_override'), 'outcome-first delivery explicit_user_or_host_style_override', 'true'),
        @(@('outcome_first_delivery', 'summary_tldr_distinct_when_used'), 'outcome-first delivery summary_tldr_distinct_when_used', 'true'),
        @(@('outcome_first_delivery', 'parallel_independent_lookups_when_supported'), 'outcome-first delivery parallel_independent_lookups_when_supported', 'true'),
        @(@('outcome_first_delivery', 'runtime_vendored'), 'outcome-first delivery runtime_vendored', 'false'),
        @(@('direct_claims', 'preserve_uncertainty'), 'direct-claims preserve_uncertainty', 'true'),
        @(@('direct_claims', 'preserve_semantics'), 'direct-claims preserve_semantics', 'true'),
        @(@('direct_claims', 'no_blanket_word_ban'), 'direct-claims no_blanket_word_ban', 'true'),
        @(@('direct_claims', 'live_host_evaluated'), 'direct-claims live_host_evaluated', 'false')
    )
    try {
        foreach ($shell in $auditShells) {
            $output = @(& $shell -NoLogo -NoProfile -File $auditScriptPath 2>&1)
            if ($LASTEXITCODE -ne 0 -or (($output -join "`n") -notmatch 'repository metadata')) { throw "Audit real-Boolean control failed under $shell" }
        }
        $auditTypeMutationCount = 0
        foreach ($case in $auditTypeCases) {
            $bad = ($baselineMetadata | ConvertTo-Json -Depth 20 | ConvertFrom-Json)
            $target = $bad
            $segments = [string]$case[0][0] -split '\.'
            foreach ($segment in $segments) { $target = $target.$segment }
            $target.($case[0][1]) = ConvertFrom-Json -InputObject ('"' + [string]$case[2] + '"')
            [IO.File]::WriteAllText($auditPackagePath, ($bad | ConvertTo-Json -Depth 20), (New-Object Text.UTF8Encoding($false)))
            foreach ($shell in $auditShells) {
                $output = @(& $shell -NoLogo -NoProfile -File $auditScriptPath 2>&1)
                $outputText = $output -join "`n"
                $expectedMessage = [string]$case[1] + ' must be a Boolean'
                if ($LASTEXITCODE -eq 0 -or $outputText -notmatch [regex]::Escape($expectedMessage)) {
                    throw "Audit Boolean type control failed under $shell for $($case[1])"
                }
            }
            $auditTypeMutationCount++
        }
        Write-Host "PASS: audit real-Boolean controls in $($auditShells.Count) shells" -ForegroundColor Green
        Write-Host "PASS: audit strict Boolean type controls for $auditTypeMutationCount metadata fields" -ForegroundColor Green
    }
    finally {
        [IO.File]::WriteAllText($auditPackagePath, $auditOriginalPackage, (New-Object Text.UTF8Encoding($false)))
    }

    $failures.Clear()
    Write-Host "PASS: strict Boolean type controls for $booleanTypeMutationCount Quick Mode/direct-claims fields" -ForegroundColor Green
    Write-Host "PASS: direct-claims positive controls and $directMutationCount deliberate policy/metadata mutations" -ForegroundColor Green
    Write-Host "PASS: Quick Mode positive control and $quickMutationCount deliberate metadata mutations" -ForegroundColor Green
    Write-Host "PASS: validator rejects unsafe paths, case collisions, executables, symlinks, and malformed master archives" -ForegroundColor Green
}
finally {
    $resolvedFixture = [IO.Path]::GetFullPath($fixtureRoot)
    $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if ($resolvedFixture.StartsWith($resolvedTemp) -and (Split-Path $resolvedFixture -Leaf) -like 'lean-agent-validator-*') {
        Remove-Item -LiteralPath $resolvedFixture -Recurse -Force
    }
}
