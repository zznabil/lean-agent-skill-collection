# Structural ownership checks only. This is not a semantic or live-model evaluator.
function Test-StandardsContracts {
    $expectedHistory = '42e2296ce3c61dc1ec1dcc69067b87585fb94ed6620b7ef80f39c6eeb8348b0f'
    try {
        $coverage = (Read-Text (Join-Path $repoRoot 'docs/STANDARDS-COVERAGE.json')) | ConvertFrom-Json
        $register = Read-Text (Join-Path $repoRoot 'docs/STANDARDS-REGISTER.md')
    } catch { Add-Failure 'standards contract parse failure'; return }
    $rows = New-Object System.Collections.Generic.List[object]
    foreach ($line in ($register -split '\r?\n')) {
        if (-not $line.StartsWith('| ') -or $line.StartsWith('| Candidate')) { continue }
        $cells = @($line.Trim().Trim('|').Split('|') | ForEach-Object { $_.Trim() })
        if ($cells.Count -eq 7) { $rows.Add([pscustomobject]@{ cells=$cells; candidate=$cells[0] }) }
    }
    $entries = @($coverage.entries)
    if ($coverage.schema_version -ne 1 -or $rows.Count -ne 97 -or $entries.Count -ne 97) { Add-Failure 'standards coverage count or schema mismatch' }
    $names = @($rows | ForEach-Object { $_.candidate })
    Assert-Same $names @($entries.candidate) 'standards coverage inventory'
    if (@($entries.id | Sort-Object -Unique).Count -ne $entries.Count -or @($entries.candidate | Sort-Object -Unique).Count -ne $entries.Count) { Add-Failure 'duplicate standards coverage entry' }
    $history = (@($rows | ForEach-Object { (@($_.cells[0],$_.cells[1],$_.cells[2],$_.cells[4],$_.cells[5],$_.cells[6]) -join '|') }) -join "`n") + "`n"
    $sha = [Security.Cryptography.SHA256]::Create()
    try { $actualHistory = [BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($history))).Replace('-','').ToLowerInvariant() } finally { $sha.Dispose() }
    if ($actualHistory -ne $expectedHistory -or $coverage.historical_columns_sha256 -ne $expectedHistory) { Add-Failure 'standards historical decisions or source records changed' }
    $inactive = @{
        'OWASP SAMM'='excluded'
        'ISO/IEC 25059 AI quality model'='watch'
        'OWASP Agent Observability Standard'='deferred'
        'DORA delivery metrics'='excluded'
        'Safety-critical domain standards'='project-local'
        'Organization-scale governance frameworks'='excluded'
    }
    for ($i=0; $i -lt $entries.Count; $i++) {
        $entry=$entries[$i]
        $row=@($rows | Where-Object { $_.candidate -eq $entry.candidate })
        if ($row.Count -ne 1) { Add-Failure "standards row resolution: $($entry.id)"; continue }
        if ($entry.id -ne ('S{0:D2}' -f ($i+1)) -or $entry.candidate -cne $rows[$i].candidate -or $entry.decision -cne $row[0].cells[2]) { Add-Failure "standards identity or decision mismatch: $($entry.id)" }
        $expectedMode='scoped'
        if ($inactive.ContainsKey([string]$entry.candidate)) { $expectedMode=$inactive[[string]$entry.candidate] }
        if ($entry.mode -ne $expectedMode) { Add-Failure "standards scope promotion or mismatch: $($entry.id)" }
        $owner=[string]$entry.owner
        if ($owner -notmatch '^(AGENTS\.md|ENGINEERING-CORE\.md|skills/[a-z-]+/[A-Z][A-Z0-9-]*\.md|docs/STANDARDS-REGISTER\.md)$') { Add-Failure "standards owner invalid: $($entry.id)"; continue }
        if ($entry.mode -in @('scoped','project-local') -and $owner.StartsWith('docs/')) { Add-Failure "standards active owner is documentation only: $($entry.id)" }
        if ($entry.mode -in @('excluded','watch','deferred') -and $owner -ne 'docs/STANDARDS-REGISTER.md') { Add-Failure "standards inactive owner is executable policy: $($entry.id)" }
        $path=Join-Path $repoRoot $owner
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { Add-Failure "standards owner missing: $($entry.id)"; continue }
        $text=Read-Text $path
        foreach ($field in @('trigger','behaviour','reference')) {
            $value=[string]$entry.$field
            if ([string]::IsNullOrWhiteSpace($value) -or $text.IndexOf($value,[StringComparison]::Ordinal) -lt 0) { Add-Failure "standards $field missing: $($entry.id)" }
        }
        $relative='../'+$owner
        if ($owner.StartsWith('docs/')) { $relative=$owner.Substring(5) }
        if ($row[0].cells[3] -cne ('['+$owner+']('+$relative+')')) { Add-Failure "standards register owner mismatch: $($entry.id)" }
        if ($entry.load_from) {
            $from=[string]$entry.load_from
            $ref=[string]$entry.load_reference
            $ownerDir=($owner -split '/')[0..1] -join '/'
            if ($from -cne ($ownerDir+'/SKILL.md') -or $owner -cne ($ownerDir+'/'+$ref)) { Add-Failure "standards standalone load owner mismatch: $($entry.id)"; continue }
            $rootText=Read-Text (Join-Path $repoRoot $from)
            if ($rootText.IndexOf(('['+$ref+']('+$ref+')'),[StringComparison]::Ordinal) -lt 0) { Add-Failure "standards load reference missing: $($entry.id)" }
        } elseif ($owner -match '^skills/' -and $owner -notmatch '/SKILL\.md$') { Add-Failure "standards conditional load missing: $($entry.id)" }
    }
    $fallback='For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.'
    foreach ($root in Get-ChildItem (Join-Path $repoRoot 'skills/*/SKILL.md')) {
        if ((Read-Text $root.FullName).IndexOf($fallback,[StringComparison]::Ordinal) -lt 0) { Add-Failure "standalone communication fallback missing: $($root.Directory.Name)" }
    }
    try {
        $scenarios=(Read-Text (Join-Path $repoRoot 'docs/evals/standards-v9.0.1.json')) | ConvertFrom-Json
        if ($scenarios.status -ne 'authored_not_executed' -or @($scenarios.cases).Count -ne 10 -or @($scenarios.cases.id | Sort-Object -Unique).Count -ne 10) { Add-Failure 'standards authored scenario contract mismatch' }
        foreach ($case in $scenarios.cases) {
            foreach ($field in @('id','area','prompt','expect','reject')) { if ([string]::IsNullOrWhiteSpace([string]$case.$field)) { Add-Failure 'standards scenario field missing' } }
            if ($case.expect -eq $case.reject) { Add-Failure 'standards scenario does not discriminate' }
        }
    } catch { Add-Failure 'standards scenario parse failure' }
}
