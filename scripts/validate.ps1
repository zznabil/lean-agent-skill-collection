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
. (Join-Path $PSScriptRoot 'release-inventory.ps1')

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

function Get-PackageBaseName([string]$ProfileDefinition, [string]$Version) {
    switch ($ProfileDefinition) {
        'communication' { return "user-facing-communication-mini-openai-v$Version" }
        'get-it-done' { return "get-it-done-pack-openai-v$Version" }
        'gauntlet' { return "gauntlet-loop-pack-openai-v$Version" }
        default { return "lean-agent-skills-$ProfileDefinition-openai-v$Version" }
    }
}

function Test-DirectClaimsText([string]$Text, [string]$Label) {
    $needles = @('State supported conclusions directly','avoid litotes and rhetorical hedging','Preserve genuine uncertainty','evidence scope and degree','Own actual agent errors','within existing permissions')
    foreach ($needle in $needles) {
        if ($Text.IndexOf($needle, [StringComparison]::Ordinal) -lt 0) { Add-Failure "direct-claims policy missing '$needle' in $Label" }
    }
}

function Test-DirectClaimsMetadata([object]$Contract, [string]$Label) {
    foreach ($name in @('global_principles','preserve_uncertainty','preserve_semantics','evidence_based_ownership','no_blanket_word_ban','no_new_route')) {
        if ($null -eq $Contract -or $Contract.$name -ne $true) { Add-Failure "direct-claims metadata must enable $name in $Label" }
    }
    foreach ($name in @('runtime_enforcement','live_host_evaluated')) {
        if ($null -eq $Contract -or $Contract.$name -ne $false) { Add-Failure "direct-claims metadata must not claim $name in $Label" }
    }
}

function Test-ReleaseInventoryContracts([object]$Profiles, [object]$Validation, [string]$ProfileText) {
    try { $inventory = Get-ReleaseUserFacingInventory $repoRoot $Profiles; $script:releaseUserFacingInventory = $inventory }
    catch { Add-Failure "supplemental inventory validation failure: $($_.Exception.Message)"; return }
    $profileNames = @($Profiles.profiles.PSObject.Properties | ForEach-Object { [string]$_.Name })
    $expectedProfileNames = @('core','engineering','complete','communication','get-it-done','gauntlet')
    if ((Get-RawInventoryDuplicates $profileNames).Count -gt 0) { Add-Failure 'profile definitions contain an exact duplicate' }
    if ((Get-RawInventoryCaseDuplicates $profileNames).Count -gt 0) { Add-Failure 'profile definitions contain a case-only duplicate' }
    if (-not (Compare-ReleaseInventorySequence $expectedProfileNames $profileNames)) { Add-Failure 'profile definitions must contain the exact six profiles in canonical order' }
    try {
        $rawProfileNames = @(Get-ReleaseInventoryJsonPropertyNames $ProfileText 'profiles')
        if ((Get-RawInventoryDuplicates $rawProfileNames).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $rawProfileNames).Count -gt 0 -or -not (Compare-ReleaseInventorySequence $expectedProfileNames $rawProfileNames)) { Add-Failure 'raw profile declarations have duplicate, case-colliding, or unexpected names' }
    } catch { Add-Failure "raw profile declaration validation failure: $($_.Exception.Message)" }
    $baseNames = @($Profiles.profiles.complete.skills | ForEach-Object { [string]$_ })
    if ( $baseNames.Count -ne 24 -or (Get-RawInventoryDuplicates $baseNames).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $baseNames).Count -gt 0) { Add-Failure 'Complete base task inventory must contain 24 unique names' }
    foreach ($name in $baseNames) { if (-not (Test-ReleaseInventoryPortableName $name)) { Add-Failure "invalid base task skill name: $name" } }
    foreach ($name in $inventory.Names) { if ($baseNames -contains $name) { Add-Failure "base and supplemental skill collision: $name" } }
    $included = @($inventory.Definition.included_profiles | ForEach-Object { [string]$_ })
    if ($included.Count -ne 6 -or (Get-RawInventoryDuplicates $included).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $included).Count -gt 0 -or -not (Test-ReleaseInventoryMemberSet $expectedProfileNames $included)) { Add-Failure 'included_profiles must contain exactly the six profiles without duplicates' }
    $totals = @{ core=36; engineering=47; complete=51; communication=30; 'get-it-done'=33; gauntlet=31 }
    foreach ($name in $expectedProfileNames) {
        $base = @($Profiles.profiles.PSObject.Properties[$name].Value.skills | ForEach-Object { [string]$_ })
        if ((Get-RawInventoryDuplicates $base).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $base).Count -gt 0) { Add-Failure "profile $name base inventory contains duplicate names" }
        foreach ($skill in $base) { if ($inventory.Names -contains $skill) { Add-Failure "profile $name base inventory collides with supplemental skill: $skill" } }
        $effective = @($base) + @($inventory.Names)
        if ($effective.Count -ne $totals[$name]) { Add-Failure "profile $name effective inventory total is $($effective.Count), expected $($totals[$name])" }
    }
    $expectedSupplemental = @($inventory.Names)
    $effectiveMetadata = $Validation.effective_profile_counts
    foreach ($name in $expectedProfileNames) {
        $baseCount = @($Profiles.profiles.PSObject.Properties[$name].Value.skills).Count
        $row = $effectiveMetadata.PSObject.Properties[$name].Value
        if ($null -eq $row -or $row.base_task_skills -ne $baseCount -or $row.supplemental_user_facing_skills -ne 27 -or $row.total -ne $totals[$name]) { Add-Failure "root effective profile metadata mismatch: $name" }
    }
    if ($Validation.base_task_skills_expected -ne 24 -or $Validation.supplemental_user_facing_skills_expected -ne 27 -or $Validation.release_unique_skills_expected -ne 51 -or $Validation.skills_expected -ne 51 -or $Validation.skills_validated -ne 51) { Add-Failure 'root package validation inventory counts are inaccurate' }
    $declaredSupplemental = @($Validation.supplemental_user_facing_skills | ForEach-Object { [string]$_ })
    if (-not (Compare-ReleaseInventorySequence $expectedSupplemental $declaredSupplemental)) { Add-Failure 'root package validation supplemental order differs from SOURCE-MANIFEST.json' }
    $ri = $Validation.release_inventory
    if ($null -eq $ri -or $ri.base_task_adapters -ne 24 -or $ri.supplemental_adapters -ne 0 -or $ri.source_manifest -ne 'packs/user-facing-standards/SOURCE-MANIFEST.json' -or $ri.catalog -ne 'packs/user-facing-standards/CATALOG.md' -or $ri.rights_notice -ne 'packs/user-facing-standards/THIRD-PARTY-NOTICES.md' -or $ri.base_task_routing_unchanged -ne $true -or $ri.public_source_limitations_preserved -ne $true) { Add-Failure 'root package validation release inventory metadata is inaccurate' }
    if (-not ($failures | Where-Object { $_ -match 'supplemental inventory|profile definitions|inventory|included_profiles|effective profile|collision|package validation release inventory' })) { Add-Pass 'raw profile and canonical supplemental inventory contracts' }
}
function Test-BooleanContract([object]$Value, [bool]$Expected, [string]$Label) {
    if ($null -eq $Value -or [bool]$Value -ne $Expected) { Add-Failure "$Label must be $Expected"; return $false }
    return $true
}

function Test-QuickModeMetadata([object]$Contract, [bool]$ExpectedIncluded, [string]$Label) {
    if ($null -eq $Contract) { Add-Failure "quick-mode metadata missing in $Label"; return }
    if (-not (Test-BooleanContract $Contract.included $ExpectedIncluded "quick-mode metadata included in $Label")) { return }
    if (-not $ExpectedIncluded) { return }
    foreach ($name in @('explicit_request_only','natural_language_selectable','dogfood_optional','automated_uat_optional','selected_validation_becomes_required','real_project_interaction_required','static_inspection_not_interaction_evidence')) {
        Test-BooleanContract $Contract.$name $true "quick-mode metadata $name in $Label" | Out-Null
    }
    if ($Contract.default_validation -ne 'SMOKE') { Add-Failure "quick-mode default validation must be SMOKE in $Label" }
    if ($Contract.production_readiness_default -ne 'NOT_ASSESSED') { Add-Failure "quick-mode production readiness must default to NOT_ASSESSED in $Label" }
    Test-BooleanContract $Contract.live_host_evaluated $false "quick-mode metadata live_host_evaluated in $Label" | Out-Null
}

function Test-MetadataContracts {
    try {
        $plugin = Get-Content -Raw (Join-Path $repoRoot '.codex-plugin/plugin.json') | ConvertFrom-Json
        $profiles = Get-Content -Raw (Join-Path $repoRoot 'release-profiles.json') | ConvertFrom-Json
        $profileText = Get-Content -Raw (Join-Path $repoRoot 'release-profiles.json')
        $citation = Get-Content -Raw (Join-Path $repoRoot 'CITATION.cff')
        $validation = Get-Content -Raw (Join-Path $repoRoot 'PACKAGE-VALIDATION.json') | ConvertFrom-Json
    } catch { Add-Failure "metadata parse failure: $($_.Exception.Message)"; return $null }

    if ($plugin.name -ne 'lean-agent-skills-complete' -or $plugin.skills -ne './skills/' -or $plugin.version -ne $profiles.version) { Add-Failure 'root plugin manifest does not match the release definition' }
    if ($profiles.release -ne ('v' + $profiles.version) -or @($profiles.profiles.PSObject.Properties).Count -ne 6) { Add-Failure 'release profile definition has an invalid version or profile count' }
    if ($citation -notmatch "(?m)^version:\s*$([regex]::Escape([string]$profiles.version))\s*$" -or $citation -notmatch '(?m)^license:\s*MIT\s*$') { Add-Failure 'CITATION.cff does not match release version and license' }
    $agency = $validation.considerate_agency
    $adaptive = $validation.adaptive_prose
    $explicit = $validation.explicit_standards
    $human = $validation.human_usable_information
    $proof = $validation.proof_integrity
    $rigor = $validation.proportional_rigor
    $delivery = $validation.outcome_first_delivery
    $completeCount = @($profiles.profiles.complete.skills).Count
    $effectiveCompleteCount = $completeCount + 27
    Test-ReleaseInventoryContracts $profiles $validation $profileText
    Test-QuickModeMetadata $validation.quick_mode $true 'source metadata'
    if ($validation.scope -notmatch 'static' -or $validation.scope -notmatch 'not live' -or -not $validation.passed -or $validation.version -ne $profiles.version -or $validation.skills_expected -ne $effectiveCompleteCount -or $validation.skills_validated -ne $effectiveCompleteCount -or -not $agency.global -or $agency.local_fallbacks -ne ($completeCount - 1) -or $agency.adapters -ne $completeCount -or $agency.act_ask_do_not_act -ne $true -or -not $adaptive.global -or -not $adaptive.simple_turns_remain_short -or -not $explicit.engineering_core_source_map -or -not $explicit.standards_register -or -not $explicit.owning_skill_names -or $explicit.formal_conformance_claimed -ne $false -or -not $human.global_principles -or $human.conditional_reference -ne 'skills/writing/USER-INFORMATION.md' -or -not $human.target_user_task_validation_required_for_strong_claims -or -not $human.readability_alone_is_not_acceptance -or -not $human.easy_to_read_requires_intended_user_review -or $human.static_scenarios -ne 48 -or -not $proof.global_principles -or $proof.source_project -ne 'Leonxlnx/unlazy' -or $proof.source_commit -ne '473d4b80421c36d733042434cd4b938f81a19ef1' -or $proof.runtime_vendored -ne $false -or -not $proof.oracle_must_be_falsifiable -or -not $proof.status_is_not_reexecution -or -not $proof.required_gate_abandonment_is_not_completion -or -not $proof.native_parallel_claim_requires_launch_barrier -or $proof.scenario_file -ne 'docs/evals/proof-integrity-scenarios-v8.4.0.csv' -or $proof.static_scenarios -ne 40 -or -not $rigor.global_principles -or @($rigor.modes).Count -ne 4 -or -not $rigor.direct_for_single_decisive_check -or -not $rigor.extra_scrutiny_requires_distinct_evidence_gap -or -not $rigor.safety_and_correctness_floor_immutable -or -not $rigor.base_task_routing_unchanged -or $rigor.scenario_file -ne 'docs/evals/proportional-rigor-scenarios-v8.5.0.csv' -or $rigor.static_scenarios -ne 48 -or -not $delivery.global_principles -or $delivery.source_project -ne 'NousResearch/hermes-agent' -or $delivery.source_commit -ne '18a76be124d7c16ed98b629a358b23fef76a7f46' -or $delivery.runtime_vendored -ne $false -or -not $delivery.response_weight_matching -or -not $delivery.internal_depth_external_brevity -or -not $delivery.quiet_completion -or -not $delivery.act_or_state_blocker -or -not $delivery.no_process_replay -or -not $delivery.anti_filler -or -not $delivery.anti_sycophancy -or -not $delivery.explicit_user_or_host_style_override -or -not $delivery.summary_tldr_distinct_when_used -or -not $delivery.parallel_independent_lookups_when_supported -or $delivery.scenario_file -ne 'docs/evals/outcome-first-delivery-scenarios-v8.6.0.csv' -or $delivery.static_scenarios -ne 48) { Add-Failure 'PACKAGE-VALIDATION.json scope, status, version, inventory, prose, standards, or human-usable-information contract is inaccurate' }
    Test-DirectClaimsMetadata $validation.direct_claims 'source metadata'
    $licensePath = Join-Path $repoRoot 'LICENSE'
    if (-not (Test-Path -LiteralPath $licensePath) -or (Get-Content -Raw $licensePath) -notmatch '^MIT License') { Add-Failure 'MIT LICENSE is missing or malformed' }
    if (-not ($failures | Where-Object { $_ -match 'manifest|profile definition|CITATION|PACKAGE-VALIDATION|LICENSE|metadata parse|direct-claims|quick-mode' })) { Add-Pass 'metadata, version, validation-scope, and license contracts' }
    return $profiles
}

function Test-SkillTree([object]$Profiles) {
    $skillRoot = Join-Path $repoRoot 'skills'
    try { [void](Get-ReleaseInventorySafeFileTree $skillRoot 'base skill tree') } catch { Add-Failure "base skill tree safety failure: $($_.Exception.Message)"; return }
    $skillDirs = @(Get-ChildItem -LiteralPath $skillRoot -Directory | Sort-Object Name)
    $expectedRaw = @($Profiles.profiles.complete.skills | ForEach-Object { [string]$_ })
    $actualRaw = @($skillDirs | ForEach-Object { [string]$_.Name })
    if ((Get-RawInventoryDuplicates $expectedRaw).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $expectedRaw).Count -gt 0) { Add-Failure 'Complete base task inventory contains duplicate or case-colliding names' }
    if ((Get-RawInventoryDuplicates $actualRaw).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $actualRaw).Count -gt 0) { Add-Failure 'root skills directory contains duplicate or case-colliding names' }
    if ($actualRaw.Count -ne 24 -or -not (Test-ReleaseInventoryMemberSet $expectedRaw $actualRaw)) { Add-Failure 'canonical root skill inventory does not match the 24-skill Complete base profile' }
    $expected = @($expectedRaw | Sort-Object)
    $actual = @($actualRaw | Sort-Object)
    $supportFiles = @{
        'gauntlet-loop'=@('AI-ASSURANCE.md','CRITIC-LANES.md','STATE-FORMAT.md');
        'get-it-done'=@('ORCHESTRATION.md','STATE.md'); 'project-context'=@('AI-ASSET-CARDS.md');
        'release'=@('SUPPLY-CHAIN.md'); 'review'=@('LANES.md'); 'skill-design'=@('PLAYBOOKS.md'); 'triage'=@('INCIDENT.md');
        'writing'=@('USER-INFORMATION.md')
    }
    foreach ($dir in $skillDirs) {
        $skillPath = Join-Path $dir.FullName 'SKILL.md'; $adapterPath = Join-Path $dir.FullName 'agents/openai.yaml'
        if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) { Add-Failure "missing skills/$($dir.Name)/SKILL.md"; continue }
        if (-not (Test-Path -LiteralPath $adapterPath -PathType Leaf)) { Add-Failure "missing adapter for $($dir.Name)"; continue }
        $text = Get-Content -Raw -LiteralPath $skillPath
        Test-DirectClaimsText $text ('skills/' + $dir.Name + '/SKILL.md')
        $frontmatter = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---\r?\n')
        if (-not $frontmatter.Success) { Add-Failure "invalid frontmatter for $($dir.Name)"; continue }
        $name = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^name:\s*["'']?([^"''\r\n]+)').Groups[1].Value.Trim()
        $description = [regex]::Match($frontmatter.Groups[1].Value, '(?m)^description:\s*["'']?(.+?)["'']?\s*$').Groups[1].Value.Trim()
        if ($name -ne $dir.Name -or [string]::IsNullOrWhiteSpace($description)) { Add-Failure "frontmatter failure for $($dir.Name)" }
        $adapter = Get-Content -Raw -LiteralPath $adapterPath
        if ($adapter -notmatch 'Use direct claims; preserve genuine uncertainty and meaning') { Add-Failure "direct-claims adapter reminder missing for $($dir.Name)" }
        $defaultPromptRule = '(?m)^\s{2}default_prompt:\s*.*\$' + [regex]::Escape($dir.Name) + '.+$'
        $rules = @('(?m)^interface:\s*$','(?m)^\s{2}display_name:\s*.+$','(?m)^\s{2}short_description:\s*.+$',$defaultPromptRule,'(?ms)^policy:\s*\r?\n\s{2}products:\s*\r?\n\s{2}-\s*CHAT\s*\r?\n\s{2}-\s*CODEX\s*\r?\n\s{2}allow_implicit_invocation:\s*(true|false)\s*$')
        foreach ($rule in $rules) { if ($adapter -notmatch $rule) { Add-Failure "adapter schema failure for $($dir.Name)"; break } }
        if ($dir.Name -ne 'wait-what' -and $text -notmatch '(?m)^\*\*User-facing:\*\*') { Add-Failure "missing user-facing fallback for $($dir.Name)" }
        if ($adapter -notmatch 'outcome-first' -and -not ($dir.Name -eq 'wait-what' -and $adapter -match 'outcome first')) { Add-Failure "missing adapter outcome-first reinforcement for $($dir.Name)" }
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
    $quickPath = Join-Path $repoRoot 'skills/quick-mode/SKILL.md'
    $quickAdapterPath = Join-Path $repoRoot 'skills/quick-mode/agents/openai.yaml'
    if (-not (Test-Path -LiteralPath $quickPath) -or -not (Test-Path -LiteralPath $quickAdapterPath)) { Add-Failure 'quick-mode skill or adapter missing' }
    else {
        $quickText = [IO.File]::ReadAllText($quickPath, [Text.Encoding]::UTF8)
        foreach ($needle in @('Quick Mode requires an explicit user request','one cheap smoke check','Chrome DevTools or the Chrome DevTools Protocol','OMP Browser Relay','CUA or computer-use control','Static source inspection','AUTOMATED UAT','Production readiness:','NOT ASSESSED')) {
            if ($quickText.IndexOf($needle, [StringComparison]::Ordinal) -lt 0) { Add-Failure "quick-mode contract missing '$needle'" }
        }
    }
    foreach ($relative in @('AGENTS.md','ENGINEERING-CORE.md')) {
        Test-DirectClaimsText ([IO.File]::ReadAllText((Join-Path $repoRoot $relative), [Text.Encoding]::UTF8)) $relative
    }
    $humanChecks = @{
        'AGENTS.md'=@('IEC/IEEE 82079-1','ISO/IEC 23859','Easy-to-Read');
        'ENGINEERING-CORE.md'=@('Human-usable information and cognitive accessibility','ISO 21801-1:2020','ISO/IEC 29138-1/-4');
        'skills/writing/USER-INFORMATION.md'=@('Procedure template','Error and recovery template','readability formula');
        'skills/teach/SKILL.md'=@('CAST UDL Guidelines 3.0','worked example','independent transfer task')
    }
    foreach ($relative in $humanChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "human-usable information file missing: $relative"; continue }
        $checkText = [IO.File]::ReadAllText($checkPath, [Text.Encoding]::UTF8)
        foreach ($needle in $humanChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "human-usable information contract missing '$needle' in $relative" }
        }
    }
    $proofChecks = @{
        'AGENTS.md'=@('representative broken state','historical state, not re-execution');
        'ENGINEERING-CORE.md'=@('Proof integrity and verified orchestration','known positive fixture','before the first wait');
        'skills/test/SKILL.md'=@('Calibrate the verifier','known positive fixture','representative broken implementation');
        'skills/get-it-done/SKILL.md'=@('verifier or oracle','historical status');
        'skills/get-it-done/ORCHESTRATION.md'=@('before the first wait','Leaf gate','ownership claim');
        'skills/gauntlet-loop/SKILL.md'=@('representative broken state','re-execute the current critical oracles');
        'skills/review/LANES.md'=@('Proof integrity and acceptance gates','positive controls for absence tests')
    }
    foreach ($relative in $proofChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "proof-integrity file missing: $relative"; continue }
        $checkText = [IO.File]::ReadAllText($checkPath, [Text.Encoding]::UTF8)
        foreach ($needle in $proofChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "proof-integrity contract missing '$needle' in $relative" }
        }
    }

    $rigorChecks = @{
        'AGENTS.md'=@('Proportional scrutiny and momentum','DIRECT','ADVERSARIAL','distinct risk or evidence gap','smallest complete solution');
        'ENGINEERING-CORE.md'=@('Minimum sufficient scrutiny and work',('correctness ' + [char]0x2192 + ' safety'),'standard library','one consolidated question','build hard');
        'skills/plan/SKILL.md'=@('one decisive check','build hard');
        'skills/implement/SKILL.md'=@(('correctness ' + [char]0x2192 + ' safety'),'standard library','DIRECT','smallest complete change');
        'skills/test/SKILL.md'=@('minimum sufficient evidence','One decisive check','Do not add a framework');
        'skills/review/SKILL.md'=@('distinct material risk or evidence gap','ALREADY LEAN');
        'skills/debug/SKILL.md'=@('DIRECT defect','two materially similar failed attempts');
        'skills/get-it-done/SKILL.md'=@('does not force maximum ceremony','Direct mode normally has one work wave');
        'skills/get-it-done/ORCHESTRATION.md'=@('one decisive check','agent availability alone is not a reason');
        'skills/gauntlet-loop/SKILL.md'=@('MUST NOT invoke it for DIRECT work','distinct material risk or evidence gap');
        'skills/wait-what/SKILL.md'=@('For DIRECT work','do not narrate routine tool calls')
    }
    foreach ($relative in $rigorChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "proportional-rigor file missing: $relative"; continue }
        $checkText = [IO.File]::ReadAllText($checkPath, [Text.Encoding]::UTF8)
        foreach ($needle in $rigorChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "proportional-rigor contract missing '$needle' in $relative" }
        }
    }

    $deliveryChecks = @{
        'AGENTS.md'=@('Global outcome-first delivery overlay','Internal investigation and external brevity are separate','Do not announce an action and then stop before acting','TL;DR MUST NOT merely repeat the Summary','Agree or disagree because evidence supports the conclusion','batch them');
        'skills/wait-what/SKILL.md'=@('Match the response to the weight of the ask','Investigate enough internally to be right','Do not narrate routine tool calls','Agree because evidence supports the claim','execute it before ending','Quiet completed-work brief');
        'skills/get-it-done/SKILL.md'=@('Investigate deeply enough to earn the completion claim','execute it before ending the turn or state the blocker','do not replay routine tool calls');
        'skills/gauntlet-loop/SKILL.md'=@('Keep the user-facing packet outcome-first','instead of replaying each critic round');
        'skills/review/SKILL.md'=@('Do not open with praise','narrate the review process');
        'skills/writing/SKILL.md'=@('Match length and structure to the audience','generic praise','not a narration of how it was drafted');
        'skills/teach/SKILL.md'=@('Match depth to the learner','concise delivery does not excuse shallow preparation')
    }
    foreach ($relative in $deliveryChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "outcome-first delivery file missing: $relative"; continue }
        $checkText = [IO.File]::ReadAllText($checkPath, [Text.Encoding]::UTF8)
        foreach ($needle in $deliveryChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "outcome-first delivery contract missing '$needle' in $relative" }
        }
    }

    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback|human-usable information|proof-integrity|proportional-rigor|outcome-first delivery|direct-claims' })) { Add-Pass "$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, support references, human-usable-information, proof-integrity, proportional-rigor, and outcome-first-delivery contracts" }
}

function Get-CanonicalUpstreamIntegrityPaths {
    $fixed = @(
        '.codex-plugin/plugin.json','.gitattributes','.github/workflows/controlled-execution-pack.yml','.github/workflows/remaining-standards.yml','.github/workflows/standards-pack.yml','.github/workflows/validate.yml','.github/workflows/quick-mode.yml',
        'AGENTS.md','CHANGELOG.md','CITATION.cff','ENGINEERING-CORE.md','LICENSE','PACKAGE-VALIDATION.json','README.md','THIRD_PARTY_NOTICES.md',
        'docs/AUDIT.md','docs/PROSE-CLARITY-v8.8.0.md','docs/REPOSITORY-AUDIT.md','docs/SKILL-CATALOG.md','docs/QUICK-MODE-DESIGN-v8.10.0.md','docs/evals/prose-preservation-v8.8.0.json','docs/evals/quick-mode-scenarios-v8.10.0.csv',
        'packs/user-facing-standards/CHECKSUMS.sha256','packs/remaining-standards/CHECKSUMS.sha256','packs/controlled-execution/CHECKSUMS.sha256','release-profiles.json','releases/v8.8.0/RELEASE-NOTES-v8.8.0.md','releases/v8.9.0/RELEASE-NOTES-v8.9.0.md','releases/v8.10.0/RELEASE-NOTES-v8.10.0.md','releases/v8.10.0/quick-mode-scenarios-v8.10.0.csv',
        'scripts/audit-repository.ps1','scripts/build-release.ps1','scripts/release-inventory.ps1','scripts/test-prose-preservation.ps1','scripts/test-validator.ps1','scripts/validate.ps1'
    )
    foreach ($tree in @('skills','packs','docs','scripts','.codex-plugin','.github','releases')) {
        try { [void](Get-ReleaseInventorySafeFileTree (Join-Path $repoRoot $tree) "integrity tree $tree") }
        catch { Add-Failure "integrity tree safety failure: $($_.Exception.Message)" }
    }
    $expected = New-Object System.Collections.Generic.List[string]
    foreach ($path in $fixed) { [void]$expected.Add($path) }
    try {
        foreach ($item in @(Get-ReleaseInventorySafeFileTree (Join-Path $repoRoot 'skills') 'base skill integrity tree')) {
            [void]$expected.Add((Get-RelativePath $repoRoot $item.FullName).Replace('\','/'))
        }
    } catch { Add-Failure "base skill integrity enumeration failure: $($_.Exception.Message)" }
    return $expected.ToArray()
}

function Test-SourceIntegrity {
    $before = $failures.Count
    $expectedPaths = @(Get-CanonicalUpstreamIntegrityPaths)
    $expectedExact = New-Object 'System.Collections.Generic.Dictionary[string,bool]' ([StringComparer]::Ordinal)
    $expectedFolded = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
    foreach ($path in $expectedPaths) {
        if ($expectedExact.ContainsKey($path)) { Add-Failure "duplicate canonical upstream target: $path"; continue }
        $folded = $path.ToLowerInvariant()
        if ($expectedFolded.ContainsKey($folded) -and $expectedFolded[$folded] -cne $path) { Add-Failure "case-colliding canonical upstream targets: $path"; continue }
        $expectedExact.Add($path,$true); $expectedFolded[$folded] = $path
        try {
            $safePath = Assert-ReleaseInventorySafePath $repoRoot (Join-Path $repoRoot $path.Replace('/',[IO.Path]::DirectorySeparatorChar)) "upstream target $path"
            if (-not (Test-Path -LiteralPath $safePath -PathType Leaf)) { Add-Failure "upstream checksum target missing: $path" }
        } catch { Add-Failure "upstream target safety failure: $path ($($_.Exception.Message))" }
    }
    $declaredExact = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    $declaredFolded = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
    $checksumPath = Assert-ReleaseInventorySafePath $repoRoot (Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256') 'upstream declaration file'
    $lineNumber = 0
    foreach ($line in Get-Content -LiteralPath $checksumPath) {
        $lineNumber++
        if ($line -notmatch '^([0-9a-f]{64})  ([A-Za-z0-9._-]+(?:/[A-Za-z0-9._-]+)*)$') { Add-Failure "malformed upstream checksum line $lineNumber"; continue }
        $declaredHash = $matches[1]; $relative = $matches[2]
        if (@($relative.Split('/') | Where-Object { $_ -eq '.' -or $_ -eq '..' }).Count -gt 0) { Add-Failure "unsafe upstream checksum target: $relative"; continue }
        if ($declaredExact.ContainsKey($relative)) { Add-Failure "upstream checksum exact duplicate: $relative"; continue }
        $folded = $relative.ToLowerInvariant()
        if ($declaredFolded.ContainsKey($folded) -and $declaredFolded[$folded] -cne $relative) { Add-Failure "upstream checksum case-only duplicate: $relative"; continue }
        $declaredExact.Add($relative,$declaredHash); $declaredFolded[$folded] = $relative
        try {
            $safePath = Assert-ReleaseInventorySafePath $repoRoot (Join-Path $repoRoot $relative.Replace('/',[IO.Path]::DirectorySeparatorChar)) "upstream target $relative"
            if (-not (Test-Path -LiteralPath $safePath -PathType Leaf)) { Add-Failure "upstream checksum target missing: $relative"; continue }
            if ((Get-FileSha256 $safePath) -cne $declaredHash) { Add-Failure "upstream checksum mismatch: $relative" }
        } catch { Add-Failure "upstream target safety failure: $relative ($($_.Exception.Message))" }
    }
    $actualPaths = @($declaredExact.Keys)
    if ($actualPaths.Count -ne $expectedPaths.Count -or -not (Test-ReleaseInventoryMemberSet $expectedPaths $actualPaths)) { Add-Failure 'upstream checksum declarations do not exactly match the canonical integrity target set' }
    if ($failures.Count -eq $before) { Add-Pass 'canonical source integrity' }
}

function Test-RemainingStandardsPackIntegrity {
    $before = $failures.Count
    try {
        $ledger = Get-ReleaseRemainingStandardsLedger $repoRoot
        if ($ledger.Records.Count -ne 234) { Add-Failure "remaining standards pack inventory expected 234 entries, found $($ledger.Records.Count)" }
        if (-not $ledger.Records.ContainsKey('audit/validate_bundle.py')) { Add-Failure 'remaining standards pack validator is not in the pinned inventory' }
        if ($ledger.Records.ContainsKey('audit/evil.py')) { Add-Failure 'permanent remaining standards audit fixture is forbidden' }
    } catch { Add-Failure "remaining standards pack inventory validation failure: $($_.Exception.Message)" }
    if ($failures.Count -eq $before) { Add-Pass 'root-pinned remaining standards pack inventory and validator' }
}

function Test-ControlledExecutionPackIntegrity {
    $before = $failures.Count
    try {
        $ledger = Get-ReleaseControlledExecutionLedger $repoRoot
        if ($ledger.Records.Count -ne 38) { Add-Failure "controlled-execution pack inventory expected 38 entries, found $($ledger.Records.Count)" }
        foreach ($required in @('audit/validate_pack.py','audit/build_zip.py','audit/test_validate_pack.py','SOURCE-BASELINE.sha256')) {
            if (-not $ledger.Records.ContainsKey($required)) { Add-Failure "controlled-execution pack required file is not in the pinned inventory: $required" }
        }
        if ($ledger.Records.ContainsKey('audit/evil.py')) { Add-Failure 'permanent controlled-execution audit fixture is forbidden' }
    } catch { Add-Failure "controlled-execution pack inventory validation failure: $($_.Exception.Message)" }
    if ($failures.Count -eq $before) { Add-Pass 'root-pinned controlled-execution pack inventory and validator' }
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
function Get-CanonicalSourceFileMap([object]$Profiles) {
    $exact = New-Object 'System.Collections.Generic.Dictionary[string,object]' ([StringComparer]::Ordinal)
    $folded = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
    $add = {
        param([string]$PackagePath,[string]$SourcePath,[object]$SkillName,[object]$AuthoritativeRecord)
        if ([string]::IsNullOrWhiteSpace($PackagePath) -or $PackagePath -match '[\:]' -or $PackagePath.StartsWith('/') -or $PackagePath.Split('/') -contains '..') { throw "unsafe canonical source path: $PackagePath" }
        if ($exact.ContainsKey($PackagePath)) { throw "duplicate canonical source path: $PackagePath" }
        $lower = $PackagePath.ToLowerInvariant()
        if ($folded.ContainsKey($lower) -and $folded[$lower] -cne $PackagePath) { throw "case-colliding canonical source paths: $($folded[$lower]) and $PackagePath" }
        if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) { throw "canonical source file missing: $PackagePath" }
        $item = Get-Item -LiteralPath $SourcePath -Force
        if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "reparse canonical source file: $PackagePath" }
        $observedHash = Get-FileSha256 $SourcePath
        if ($null -ne $AuthoritativeRecord -and ([int64]$item.Length -ne [int64]$AuthoritativeRecord.Length -or $observedHash -cne [string]$AuthoritativeRecord.Hash)) { throw "canonical supplemental source differs from pack ledger: $PackagePath" }
        $canonicalHash = if ($null -ne $AuthoritativeRecord) { [string]$AuthoritativeRecord.Hash } else { $observedHash }
        $canonicalLength = if ($null -ne $AuthoritativeRecord) { [int64]$AuthoritativeRecord.Length } else { [int64]$item.Length }
        $exact.Add($PackagePath, [pscustomobject]@{ PackagePath=$PackagePath; SourcePath=$SourcePath; SkillName=$SkillName; Length=$canonicalLength; Hash=$canonicalHash })
        $folded[$lower] = $PackagePath
    }
    $skills = New-Object 'System.Collections.Generic.Dictionary[string,bool]' ([StringComparer]::Ordinal)
    $supplemental = New-Object 'System.Collections.Generic.Dictionary[string,bool]' ([StringComparer]::Ordinal)
    foreach ($name in @($script:releaseUserFacingInventory.Names)) { $supplemental[[string]$name] = $true }
    foreach ($profileProperty in @($Profiles.profiles.PSObject.Properties)) {
        foreach ($nameObject in @($profileProperty.Value.skills)) { $skills[[string]$nameObject] = $true }
    }
    foreach ($name in @($supplemental.Keys)) { $skills[[string]$name] = $true }
    foreach ($skillName in @($skills.Keys)) {
        $sourceSkillsRoot = if ($supplemental.ContainsKey([string]$skillName)) { $script:releaseUserFacingInventory.SourceRoot } else { Join-Path $repoRoot 'skills' }
        $skillRoot = Join-Path $sourceSkillsRoot $skillName
        if (-not (Test-Path -LiteralPath $skillRoot -PathType Container)) { throw "canonical skill directory missing: $skillName" }
        foreach ($item in @(Get-ReleaseInventorySafeFileTree $skillRoot "canonical skill $skillName")) {
            $inside = $item.FullName.Substring($skillRoot.Length + 1).Replace('\','/')
            $packagePath = 'skills/' + $skillName + '/' + $inside
            $authority = $null
            if ($supplemental.ContainsKey([string]$skillName)) {
                $authority = $script:releaseUserFacingInventory.PackLedger.Records[$packagePath]
                if ($null -eq $authority) { throw "supplemental source missing from pack ledger: $packagePath" }
            }
            & $add $packagePath $item.FullName $skillName $authority
        }
    }
    foreach ($mapping in @{
        'AGENTS.md' = (Join-Path $repoRoot 'AGENTS.md')
        'ENGINEERING-CORE.md' = (Join-Path $repoRoot 'ENGINEERING-CORE.md')
        'LICENSE' = (Join-Path $repoRoot 'LICENSE')
        'THIRD_PARTY_NOTICES.md' = (Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md')
        'USER-FACING-STANDARDS-NOTICES.md' = $script:releaseUserFacingInventory.RightsPath
    }.GetEnumerator()) {
        $authority = $null
        if ($mapping.Key -ceq 'USER-FACING-STANDARDS-NOTICES.md') {
            $ledgerRelative = $mapping.Value.Substring($script:releaseUserFacingInventory.PackLedger.Root.Length + 1).Replace('\','/')
            $authority = $script:releaseUserFacingInventory.PackLedger.Records[$ledgerRelative]
            if ($null -eq $authority) { throw "supplemental rights notice missing from pack ledger: $ledgerRelative" }
        }
        & $add $mapping.Key $mapping.Value $null $authority
    }
    return [pscustomobject]@{ Files=$exact; Paths=@($exact.Keys) }
}

function Get-CanonicalPackageSourceFiles([object]$ProfileDefinition,[object]$CanonicalMap) {
    $selected = New-Object 'System.Collections.Generic.Dictionary[string,bool]' ([StringComparer]::Ordinal)
    foreach ($nameObject in @($ProfileDefinition.skills)) { $selected[[string]$nameObject] = $true }
    foreach ($name in @($script:releaseUserFacingInventory.Names)) { $selected[[string]$name] = $true }
    $files = New-Object System.Collections.Generic.List[object]
    foreach ($record in @($CanonicalMap.Files.Values)) {
        if ($null -ne $record.SkillName) {
            if ($selected.ContainsKey([string]$record.SkillName)) { $files.Add($record) }
        } elseif ($record.PackagePath -ne 'ENGINEERING-CORE.md' -or $ProfileDefinition.include_engineering_core) {
            $files.Add($record)
        }
    }
    return $files.ToArray()
}
function Test-PackagePluginContract([object]$Entry,[string]$ProfileName,[object]$ProfileDefinition,[string]$Version) {
    try {
        $text = Read-ZipEntryText $Entry
        $rawNames = @(Get-ReleaseJsonRootPropertyNames $text)
        if ((Get-RawInventoryDuplicates $rawNames).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $rawNames).Count -gt 0 -or -not (Compare-ReleaseInventorySequence @('name','version','description','skills') $rawNames)) { Add-Failure "package $ProfileName plugin JSON keys are not exact" }
        $plugin = $text | ConvertFrom-Json
        if ([string]$plugin.name -cne [string]$ProfileDefinition.plugin_name -or [string]$plugin.version -cne $Version -or [string]$plugin.description -cne [string]$ProfileDefinition.description -or [string]$plugin.skills -cne './skills/') { Add-Failure "package $ProfileName plugin identity or routing contract mismatch" }
    } catch { Add-Failure "package $ProfileName plugin JSON contract failure: $($_.Exception.Message)" }
}
function Test-PackageReadmeContract([object]$Entry,[string]$ProfileName,[object]$ProfileDefinition,[string]$Version,[string[]]$BaseSkills,[string[]]$SupplementalSkills,[string[]]$EffectiveSkills) {
    try {
        $text = Read-ZipEntryText $Entry
        $lines = @($text -split '\r?\n')
        $heading = '# ' + [string]$ProfileDefinition.title + ' v' + $Version
        if ($lines.Count -eq 0 -or $lines[0] -cne $heading) { Add-Failure "package $ProfileName README identity/version heading mismatch" }
        if ([regex]::Matches($text,[regex]::Escape([string]$ProfileDefinition.description)).Count -ne 1) { Add-Failure "package $ProfileName README description mismatch" }
        $countLine = "This profile includes $($BaseSkills.Count) base task skills and $($SupplementalSkills.Count) supplemental user-facing standards. Base task routing remains unchanged."
        if (-not $text.Contains($countLine)) { Add-Failure "package $ProfileName README profile counts/routing claim mismatch" }
        $effectiveLine = (@($EffectiveSkills | ForEach-Object { [string][char]96 + [string]$_ + [string][char]96 }) -join ', ')
        $baseLine = (@($BaseSkills | ForEach-Object { [string][char]96 + [string]$_ + [string][char]96 }) -join ', ')
        $supplementalLine = (@($SupplementalSkills | ForEach-Object { [string][char]96 + [string]$_ + [string][char]96 }) -join ', ')
        if (-not $text.Contains($effectiveLine) -or -not $text.Contains($baseLine) -or -not $text.Contains($supplementalLine)) { Add-Failure "package $ProfileName README skill membership mismatch" }
        foreach ($phrase in @('Read THIRD_PARTY_NOTICES.md for the base collection and USER-FACING-STANDARDS-NOTICES.md for supplemental source terms before redistribution.','Publisher documents retain their own terms and are not relicensed by the repository MIT license.','The 27 routines are scoped application aids, not complete formal standards or conformance evidence.','Paid, restricted, or unavailable source documents remain linked rather than bundled; users need authorized full sources for clause-level or formal assessment.','No publisher endorsement is claimed. Inspect each skill-local SOURCES.md before redistribution.','Supplemental user-facing standards carry SOURCES.md and any bundled references/; they do not add OpenAI adapters.','See PACKAGE-VALIDATION.json for static checks.')) {
            if (-not $text.Contains($phrase)) { Add-Failure "package $ProfileName README rights/source/limitation contract mismatch" }
        }
    } catch { Add-Failure "package $ProfileName README contract failure: $($_.Exception.Message)" }
}
function Test-ReleaseRootReadme([string]$Directory,[object]$Profiles) {
    $path = Join-Path $Directory 'README.md'
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { Add-Failure 'release root README missing'; return }
    $text = Get-Content -Raw -LiteralPath $path
    foreach ($phrase in @(
        ('# Lean Agent Skill Collection ' + [string]$Profiles.release),
        [string]$Profiles.release_summary,
        'Release inventory: 24 base task skills including Quick Mode plus 27 supplemental user-facing standards. Effective profile totals are core 36, engineering 47, complete 51, communication 30, get-it-done 33, and gauntlet 31.',
        'Choose one profile. Verify downloads with CHECKSUMS.sha256 and read THIRD_PARTY_NOTICES.md for base collection terms and USER-FACING-STANDARDS-NOTICES.md for supplemental source terms before redistribution.',
        'Publisher documents retain their own terms and are not relicensed by the repository MIT license. The 27 routines are scoped application aids, not complete formal standards or conformance evidence.',
        'Paid, restricted, or unavailable source documents remain linked rather than bundled; users need authorized full sources for clause-level or formal assessment. No publisher endorsement is claimed; inspect each skill-local SOURCES.md before redistribution.'
    )) { if (-not $text.Contains($phrase)) { Add-Failure "release root README generated contract mismatch" } }
}
function Test-ZipArchive([string]$Path,[string]$ProfileName,[object]$ProfileDefinition,[string]$Version,[object]$CanonicalMap) {
    $archive = [IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $exact = New-Object 'System.Collections.Generic.Dictionary[string,System.IO.Compression.ZipArchiveEntry]' ([StringComparer]::Ordinal)
        $fileExact = New-Object 'System.Collections.Generic.Dictionary[string,System.IO.Compression.ZipArchiveEntry]' ([StringComparer]::Ordinal)
        $caseFolded = @{}
        $entries = @($archive.Entries)
        $fileEntries = @($entries | Where-Object { -not [string]::IsNullOrEmpty($_.Name) })
        foreach ($entry in $entries) {
            $rawName = [string]$entry.FullName
            if ($rawName.Contains([char]92)) { Add-Failure "backslash ZIP member '$rawName'" }
            $name = $rawName.Replace([char]92,'/')
            if ([string]::IsNullOrEmpty($entry.Name) -or $name.EndsWith('/',[StringComparison]::Ordinal)) { Add-Failure "directory-only ZIP member '$name'" }
            $lower = $name.ToLowerInvariant()
            if ($exact.ContainsKey($name)) { Add-Failure "duplicate ZIP member '$name'" } else { $exact.Add($name,$entry) }
            if ($caseFolded.ContainsKey($lower) -and $caseFolded[$lower] -cne $name) { Add-Failure "case-colliding ZIP members '$($caseFolded[$lower])' and '$name'" } else { $caseFolded[$lower] = $name }
            if ($name.StartsWith('/') -or $name -match '^[A-Za-z]:' -or $name.Split('/') -contains '..') { Add-Failure "unsafe ZIP path '$name'" }
            if (Test-IsSymlinkAttributes ([int]$entry.ExternalAttributes)) { Add-Failure "symlink ZIP member '$name'" }
        }
        foreach ($entry in $fileEntries) {
            $rawName = [string]$entry.FullName
            if ($rawName.Contains([char]92)) { Add-Failure "backslash ZIP member '$rawName'" }
            $name = $rawName.Replace([char]92,'/')
            if (-not $fileExact.ContainsKey($name)) { $fileExact.Add($name,$entry) }
            if ([IO.Path]::GetExtension($name).ToLowerInvariant() -in @('.exe','.dll','.com','.bat','.cmd','.sh','.ps1','.msi','.jar')) { Add-Failure "executable ZIP member '$name'" }
            $stream = $entry.Open(); try { $buffer = New-Object byte[] 8192; while ($stream.Read($buffer,0,$buffer.Length) -gt 0) {} } catch { Add-Failure "unreadable or CRC-invalid ZIP member '$name'" } finally { $stream.Dispose() }
        }
        if (-not $ProfileName) { return }
        $root = (Get-PackageBaseName $ProfileName $Version) + '/'
        $sourceFiles = @(Get-CanonicalPackageSourceFiles $ProfileDefinition $CanonicalMap)
        $expectedSourceNames = @($sourceFiles | ForEach-Object { [string]$_.PackagePath })
        $generatedNames = @('README.md','.codex-plugin/plugin.json','PACKAGE-VALIDATION.json','CHECKSUMS.sha256')
        $expectedPackageNames = @($expectedSourceNames + $generatedNames)
        $actualPackageNames = @($fileEntries | ForEach-Object {
            $name = $_.FullName.Replace('\','/')
            if ($name.StartsWith($root,[StringComparison]::Ordinal)) { $name.Substring($root.Length) } else { '__outside__/' + $name }
        })
        if ($actualPackageNames.Count -ne $expectedPackageNames.Count -or -not (Test-ReleaseInventoryMemberSet $expectedPackageNames $actualPackageNames)) { Add-Failure "package $ProfileName exact file inventory mismatch" }
        foreach ($sourceFile in $sourceFiles) {
            $entry = $fileExact[$root + $sourceFile.PackagePath]
            if ($null -eq $entry) { Add-Failure "package $ProfileName missing canonical source file: $($sourceFile.PackagePath)"; continue }
            if ([int64]$entry.Length -ne [int64]$sourceFile.Length) { Add-Failure "package $ProfileName canonical byte length mismatch: $($sourceFile.PackagePath)"; continue }
            $stream = $entry.Open(); try { $actualHash = Get-StreamHash $stream } finally { $stream.Dispose() }
            if ($actualHash -cne $sourceFile.Hash) { Add-Failure "package $ProfileName canonical source byte mismatch: $($sourceFile.PackagePath)" }
        }
        $baseSkills = @($ProfileDefinition.skills | ForEach-Object { [string]$_ })
        $supplementalSkills = @($script:releaseUserFacingInventory.Names | ForEach-Object { [string]$_ })
        $effectiveSkills = @($baseSkills + $supplementalSkills)
        try { $actualFolders = @(Get-ReleaseArchiveSkillFolders $entries $root) } catch { Add-Failure "package $ProfileName has $($_.Exception.Message)"; $actualFolders = @() }
        if (-not (Test-ReleaseInventoryMemberSet $actualFolders $effectiveSkills) -or $actualFolders.Count -ne $effectiveSkills.Count) { Add-Failure "package $ProfileName effective skill folder inventory mismatch" }
        $directMetadataEntry = $fileExact[$root+'PACKAGE-VALIDATION.json']
        if ($null -eq $directMetadataEntry) { Add-Failure "package $ProfileName lacks PACKAGE-VALIDATION.json" }
        else {
            try {
                $directMetadata = (Read-ZipEntryText $directMetadataEntry) | ConvertFrom-Json
                if (-not (Compare-ReleaseInventorySequence @($directMetadata.rights_notices | ForEach-Object {[string]$_}) @('THIRD_PARTY_NOTICES.md','USER-FACING-STANDARDS-NOTICES.md')) -or $directMetadata.public_source_limitations_preserved -ne $true) { Add-Failure "package $ProfileName rights metadata mismatch" }
                if ($directMetadata.skills_expected -ne $effectiveSkills.Count -or $directMetadata.skills_validated -ne $effectiveSkills.Count -or -not (Compare-ReleaseInventorySequence @($directMetadata.base_task_skills | ForEach-Object {[string]$_}) $baseSkills) -or -not (Compare-ReleaseInventorySequence @($directMetadata.supplemental_user_facing_skills | ForEach-Object {[string]$_}) $supplementalSkills) -or -not (Compare-ReleaseInventorySequence @($directMetadata.included_skills | ForEach-Object {[string]$_}) $effectiveSkills)) { Add-Failure "package $ProfileName effective inventory metadata mismatch" }
                $agency = $directMetadata.considerate_agency
                if ($null -eq $agency -or $agency.supplemental_adapters -ne 0 -or $agency.base_routing_unchanged -ne $true) { Add-Failure "package $ProfileName adapter/source policy metadata mismatch" }
                Test-DirectClaimsMetadata $directMetadata.direct_claims ("package " + $ProfileName)
                Test-QuickModeMetadata $directMetadata.quick_mode (@($ProfileDefinition.skills) -contains 'quick-mode') ("package " + $ProfileName)
            } catch { Add-Failure "package $ProfileName metadata or inventory parse failure: $($_.Exception.Message)" }
        }
        $pluginEntry = $fileExact[$root+'.codex-plugin/plugin.json']
        if ($null -eq $pluginEntry) { Add-Failure "package $ProfileName lacks .codex-plugin/plugin.json" } else { Test-PackagePluginContract $pluginEntry $ProfileName $ProfileDefinition $Version }
        $readmeEntry = $fileExact[$root+'README.md']
        if ($null -eq $readmeEntry) { Add-Failure "package $ProfileName lacks README.md" } else { Test-PackageReadmeContract $readmeEntry $ProfileName $ProfileDefinition $Version $baseSkills $supplementalSkills $effectiveSkills }
        $checksumEntry = $fileExact[$root+'CHECKSUMS.sha256']
        if ($null -eq $checksumEntry) { Add-Failure "package $ProfileName lacks CHECKSUMS.sha256" }
        else {
            $declaredNames = New-Object System.Collections.Generic.List[string]
            $declaredHashes = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
            foreach ($line in ((Read-ZipEntryText $checksumEntry).Replace([string][char]13,'') -split [char]10)) {
                if ([string]::IsNullOrWhiteSpace($line)) { continue }
                if ($line -notmatch '^([0-9a-f]{64})  (.+)$') { Add-Failure "malformed checksum in package $ProfileName"; continue }
                $expectedHash = $matches[1]; $targetName = $matches[2]
                if ($targetName -notmatch '^(?:[A-Za-z0-9._-]+/)*[A-Za-z0-9._-]+$' -or @($targetName.Split('/') | Where-Object { $_ -eq '.' -or $_ -eq '..' }).Count -gt 0) { Add-Failure "malformed or unsafe checksum target in package $ProfileName"; continue }
                if ($targetName -ieq 'CHECKSUMS.sha256') { Add-Failure "package $ProfileName checksum self-target"; continue }
                if ($declaredHashes.ContainsKey($targetName)) { Add-Failure "package $ProfileName checksum exact duplicate: $targetName"; continue }
                $casePrior = @($declaredNames | Where-Object { $_.ToLowerInvariant() -eq $targetName.ToLowerInvariant() -and $_ -cne $targetName })
                if ($casePrior.Count -gt 0) { Add-Failure "package $ProfileName checksum case-only duplicate: $targetName"; continue }
                $targetEntry = $fileExact[$root+$targetName]
                if ($null -eq $targetEntry) { Add-Failure "package $ProfileName checksum target missing: $targetName"; continue }
                $declaredNames.Add($targetName); $declaredHashes.Add($targetName,$expectedHash)
                $targetStream = $targetEntry.Open(); try { $actualHash = Get-StreamHash $targetStream } finally { $targetStream.Dispose() }
                if ($actualHash -cne $expectedHash) { Add-Failure "checksum mismatch in package ${ProfileName}: $targetName" }
            }
            $actualChecksumNames = @($actualPackageNames | Where-Object { $_ -ne 'CHECKSUMS.sha256' })
            if ($declaredNames.Count -ne $actualChecksumNames.Count -or -not (Test-ReleaseInventoryMemberSet $actualChecksumNames @($declaredNames))) { Add-Failure "package $ProfileName checksum coverage is not exact" }
        }
    } finally { $archive.Dispose() }
}

function Test-MasterArchive([string]$Path,[string]$Directory,[string]$Version) {
    $archive = [IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $root = "openai-native-skill-collections-v$Version-all/"
        $allEntries = @($archive.Entries)
        foreach ($entry in $allEntries) {
            $rawName = [string]$entry.FullName
            if ($rawName.Contains([char]92)) { Add-Failure "backslash master ZIP member '$rawName'" }
            $entryName = $rawName.Replace([char]92,'/')
            if ([string]::IsNullOrEmpty($entry.Name) -or $entryName.EndsWith('/',[StringComparison]::Ordinal)) { Add-Failure "directory-only master ZIP member '$entryName'" }
        }
        $entries = @($allEntries | Where-Object { -not [string]::IsNullOrEmpty($_.Name) })
        $actualNames = @($entries | ForEach-Object { $_.FullName.Replace('\','/') } | Sort-Object)
        $expectedFiles = @(Get-ChildItem -LiteralPath $Directory -File | Where-Object { $_.FullName -ne $Path } | Sort-Object Name)
        $expectedNames = @($expectedFiles | ForEach-Object { $root + $_.Name } | Sort-Object)
        if (Compare-Object $expectedNames $actualNames) { Add-Failure 'master archive inventory mismatch'; return }
        $byName = @{}; foreach ($entry in $entries) { $byName[$entry.FullName.Replace('\','/')] = $entry }
        foreach ($file in $expectedFiles) {
            $stream = $byName[$root + $file.Name].Open()
            try { $actualHash = Get-StreamHash $stream } finally { $stream.Dispose() }
            if ($actualHash -ne (Get-FileSha256 $file.FullName)) { Add-Failure "master archive hash mismatch for $($file.Name)" }
        }
    } finally { $archive.Dispose() }
}

function Test-ReleaseArtifacts([string]$Directory,[object]$Profiles) {
    if(-not(Test-Path -LiteralPath $Directory -PathType Container)){Add-Failure "artifact directory missing: $Directory";return}
    Test-ReleaseRootReadme $Directory $Profiles
    $manifestPath = Join-Path $Directory 'RELEASE-MANIFEST.json'
    $manifestText = Get-Content -Raw $manifestPath
    try{$manifest=$manifestText|ConvertFrom-Json}catch{Add-Failure "release manifest parse failure";return}
    $baseCount = @($Profiles.profiles.complete.skills).Count
    $effectiveCount = $baseCount + @($script:releaseUserFacingInventory.Names).Count
    $expectedArchiveNames = @($Profiles.profiles.PSObject.Properties | ForEach-Object { (Get-PackageBaseName $_.Name $Profiles.version)+'.zip' })
    try {
        $rawArchiveNames = @(Get-ReleaseInventoryJsonPropertyNames $manifestText 'archives')
        if ((Get-RawInventoryDuplicates $rawArchiveNames).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $rawArchiveNames).Count -gt 0 -or -not (Test-ReleaseInventoryMemberSet $expectedArchiveNames $rawArchiveNames)) { Add-Failure 'release manifest archive declarations must exactly enumerate the six canonical archives' }
    } catch { Add-Failure "release manifest archive declaration validation failure: $($_.Exception.Message)" }
    if($manifest.version -ne $Profiles.version -or $manifest.profiles -ne 6 -or $manifest.unique_skills -ne $effectiveCount -or $manifest.release_unique_skills -ne $effectiveCount -or $manifest.base_task_skills -ne $baseCount -or $manifest.supplemental_user_facing_skills -ne 27 -or $manifest.skill_content_changed_from_v8_0_0 -ne $true -or $manifest.considerate_agency -ne $true -or $manifest.proof_integrity -ne $true -or $manifest.proportional_rigor -ne $true -or $manifest.outcome_first_delivery -ne $true -or $manifest.quick_mode -ne $true){Add-Failure 'release manifest contract failure'}
    if ($manifest.direct_claims -ne $true -or $manifest.supplemental_source_manifest -ne $script:releaseUserFacingInventory.ManifestRelative -or $manifest.supplemental_catalog -ne 'packs/user-facing-standards/CATALOG.md' -or $manifest.supplemental_rights_notice -ne 'packs/user-facing-standards/THIRD-PARTY-NOTICES.md'){Add-Failure 'release manifest source inventory contract failure'}
    if ($manifest.direct_claims -ne $true) { Add-Failure 'release manifest direct-claims flag missing' }
    try {
        $canonicalMap = Get-CanonicalSourceFileMap $Profiles
        if (@($canonicalMap.Paths).Count -eq 0) { Add-Failure 'canonical source map is empty' }
    } catch { Add-Failure "canonical source map failure: $($_.Exception.Message)"; return }
    $releaseChecksumPath = Join-Path $Directory 'CHECKSUMS.sha256'
    $declaredNames = New-Object System.Collections.Generic.List[string]
    $declaredHashes = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    foreach($line in Get-Content -LiteralPath $releaseChecksumPath){
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if($line -notmatch '^([0-9a-f]{64})  ([A-Za-z0-9][A-Za-z0-9._-]*(/[A-Za-z0-9][A-Za-z0-9._-]*)*)$'){Add-Failure "malformed release checksum line: $line";continue}
        $hash=$matches[1];$target=$matches[2]
        if($declaredHashes.ContainsKey($target)){Add-Failure "duplicate release checksum target: $target";continue}
        if(@($declaredNames|Where-Object{$_ -cne $target -and $_.ToLowerInvariant() -eq $target.ToLowerInvariant()}).Count -gt 0){Add-Failure "case-only duplicate release checksum target: $target";continue}
        $declaredNames.Add($target);$declaredHashes.Add($target,$hash)
        $targetPath=Join-Path $Directory $target
        if(-not(Test-Path -LiteralPath $targetPath -PathType Leaf)){Add-Failure "release checksum target missing: $target";continue}
        if((Get-FileSha256 $targetPath) -cne $hash){Add-Failure "release checksum mismatch for $target"}
    }
    if($declaredNames.Count -ne $expectedArchiveNames.Count -or -not(Test-ReleaseInventoryMemberSet $expectedArchiveNames @($declaredNames))){Add-Failure 'release CHECKSUMS.sha256 must exactly enumerate the six profile ZIP declarations'}
    foreach ($mapping in @{
        'LICENSE'=(Join-Path $repoRoot 'LICENSE')
        'THIRD_PARTY_NOTICES.md'=(Join-Path $repoRoot 'THIRD_PARTY_NOTICES.md')
        'USER-FACING-STANDARDS-NOTICES.md'=$script:releaseUserFacingInventory.RightsPath
    }.GetEnumerator()) {
        $outputPath=Join-Path $Directory $mapping.Key
        if(-not(Test-Path -LiteralPath $outputPath -PathType Leaf)){Add-Failure "release root file missing: $($mapping.Key)";continue}
        $sourceItem=Get-Item -LiteralPath $mapping.Value -Force;$outputItem=Get-Item -LiteralPath $outputPath -Force
        if([int64]$sourceItem.Length -ne [int64]$outputItem.Length -or (Get-FileSha256 $mapping.Value) -cne (Get-FileSha256 $outputPath)){Add-Failure "release root canonical byte mismatch: $($mapping.Key)"}
    }
    foreach($property in @($Profiles.profiles.PSObject.Properties)){
        $archiveName=(Get-PackageBaseName $property.Name $Profiles.version)+'.zip';$archivePath=Join-Path $Directory $archiveName
        if(-not(Test-Path -LiteralPath $archivePath)){Add-Failure "missing profile archive $archiveName";continue}
        $hash=(Get-FileSha256 $archivePath)
        if($declaredHashes[$archiveName] -ne $hash){Add-Failure "release checksum mismatch for $archiveName"}
        $record=$manifest.archives.PSObject.Properties[$archiveName].Value
        if(-not $record -or $record.profile -cne $property.Name -or $record.sha256 -ne $hash -or $record.bytes -ne (Get-Item $archivePath).Length){Add-Failure "release manifest mismatch for $archiveName"}
        Test-ZipArchive $archivePath $property.Name $property.Value $Profiles.version $canonicalMap
    }
    $master=Join-Path $Directory "openai-native-skill-collections-v$($Profiles.version)-all.zip"
    if(-not(Test-Path -LiteralPath $master)){Add-Failure 'master release archive missing'}else{Test-ZipArchive $master $null $null $Profiles.version $null;Test-MasterArchive $master $Directory $Profiles.version}
    if(-not($failures|Where-Object{$_ -match 'archive|ZIP|package|release manifest|release checksum|checksum in|canonical|rights|root file'})){Add-Pass 'release archives, exact canonical source inventories, licensing, hashes, paths, CRC reads, and executable/symlink checks'}
}
if (-not $FunctionsOnly) {
    $profiles=Test-MetadataContracts
    if($profiles){Test-SkillTree $profiles;Test-SourceIntegrity;Test-RemainingStandardsPackIntegrity;Test-ControlledExecutionPackIntegrity;Test-RepositoryHygiene;if(-not[string]::IsNullOrWhiteSpace($ArtifactsDirectory)){Test-ReleaseArtifacts ([IO.Path]::GetFullPath($ArtifactsDirectory)) $profiles}}
    if($failures.Count -gt 0){Write-Host ("Validation failed with $($failures.Count) issue(s).") -ForegroundColor Red;exit 1}
    Write-Host ("Validation passed with $($passes.Count) check groups.") -ForegroundColor Green
}
