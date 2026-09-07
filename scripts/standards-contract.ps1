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
    Test-StandardsApplications $entries
}

# Check declared local routing and counterexample fixtures, not their model execution.
function Test-StandardsApplications([object[]]$Entries) {
    try {
        $applications=(Read-Text (Join-Path $repoRoot 'docs/STANDARDS-APPLICATIONS.json')) | ConvertFrom-Json
    } catch { Add-Failure 'standards application parse failure'; return }
    $routes=@($applications.routes); $cases=@($applications.cases)
    if ($applications.schema_version -ne 1 -or $applications.status -ne 'authored_not_executed') { Add-Failure 'standards application evidence mismatch' }
    if ($cases.Count -ne 64 -or @($cases.id | Sort-Object -Unique).Count -ne $cases.Count) { Add-Failure 'standards application case inventory' }
    $byId=@{}; $byRoute=@{}; $used=@{}; $canonical=@{}
    foreach ($entry in $Entries) { $byId[[string]$entry.id]=$entry }
    foreach ($route in $routes) {
        $key=[string]$route.id
        if ($byRoute.ContainsKey($key)) { Add-Failure 'standards application duplicate route'; continue }
        $byRoute[$key]=$route
        $owner=[string]$route.owner; $from=[string]$route.entrypoint
        if ($owner -notmatch '^(AGENTS\.md|ENGINEERING-CORE\.md|skills/[a-z-]+/[A-Z][A-Z0-9-]*\.md|docs/STANDARDS-REGISTER\.md)$') { Add-Failure "standards application owner invalid: $key"; continue }
        if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $owner) -PathType Leaf)) { Add-Failure "standards application owner missing: $key"; continue }
        if ($owner -eq 'docs/STANDARDS-REGISTER.md') {
            if ($from -or $route.activation) { Add-Failure "standards application inactive route: $key" }
            continue
        }
        $expectedFrom=$owner
        if ($owner -eq 'ENGINEERING-CORE.md') { $expectedFrom='AGENTS.md' }
        elseif ($owner -match '^skills/') { $expectedFrom=($owner -replace '/[^/]+$','/SKILL.md') }
        if ($from -cne $expectedFrom) { Add-Failure "standards application cross-profile route: $key"; continue }
        if ($from -ne $owner) {
            $rootText=Read-Text (Join-Path $repoRoot $from)
            $activation=[string]$route.activation
            $name=Split-Path -Leaf $owner
            $link='['+$name+']('+$name+')'
            if ($owner -eq 'ENGINEERING-CORE.md') { $link=$name }
            if ([string]::IsNullOrWhiteSpace($activation) -or $activation.IndexOf($link,[StringComparison]::Ordinal) -lt 0 -or $rootText.IndexOf($activation,[StringComparison]::Ordinal) -lt 0) { Add-Failure "standards application activation missing: $key" }
        } elseif ($route.activation) { Add-Failure "standards application unexpected loader: $key" }
    }
    foreach ($case in $cases) {
        foreach ($field in @('id','route','anchor','positive','expect','negative','reject')) {
            if ([string]::IsNullOrWhiteSpace([string]$case.$field)) { Add-Failure 'standards application field missing' }
        }
        if ($case.positive -ceq $case.negative -or $case.expect -ceq $case.reject) { Add-Failure "standards application near miss missing: $($case.id)" }
        if (-not $byRoute.ContainsKey([string]$case.route)) { Add-Failure "standards application route missing: $($case.id)"; continue }
        $route=$byRoute[[string]$case.route]; $owner=[string]$route.owner
        if ($owner -notmatch '^(AGENTS\.md|ENGINEERING-CORE\.md|skills/[a-z-]+/[A-Z][A-Z0-9-]*\.md|docs/STANDARDS-REGISTER\.md)$') { continue }
        $path=Join-Path $repoRoot $owner
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
        if ((Read-Text $path).IndexOf([string]$case.anchor,[StringComparison]::Ordinal) -lt 0) { Add-Failure "standards application mechanism missing: $($case.id)" }
        $ids=@($case.standards)
        if (-not $ids.Count -or @($ids | Sort-Object -Unique).Count -ne $ids.Count) { Add-Failure "standards application duplicate or empty sources: $($case.id)" }
        foreach ($id in $ids) {
            if (-not $byId.ContainsKey([string]$id)) { Add-Failure "standards application unknown source: $id"; continue }
            $entry=$byId[[string]$id]; $used[[string]$id]=$true
            if ($entry.owner -ceq $owner) { $canonical[[string]$id]=$true }
            if ($entry.mode -in @('excluded','watch','deferred') -and $owner -ne 'docs/STANDARDS-REGISTER.md') { Add-Failure "standards application promotes inactive source: $id" }
        }
    }
    Assert-Same @($Entries.id) @($used.Keys) 'standards application source coverage'
    Assert-Same @($Entries.id) @($canonical.Keys) 'standards application canonical coverage'
}
