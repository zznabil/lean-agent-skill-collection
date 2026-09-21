$script:ReleaseInventoryPortableNamePattern = '^[a-z0-9]+(?:-[a-z0-9]+)*$'
$script:ExpectedSupplementalPackLedgerSha256 = '8739f3365f547076e90f69c4226c15cc128ae9b8849703a6752cb10ff6f2611e'

function Get-ReleaseInventorySha256([string]$Path) {
    $stream = [IO.File]::OpenRead($Path)
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '').ToLowerInvariant() }
    finally { $stream.Dispose(); $sha.Dispose() }
}

function Get-RawInventoryDuplicates([object[]]$Values) {
    $seen = New-Object System.Collections.Generic.List[string]
    $duplicates = New-Object System.Collections.Generic.List[string]
    foreach ($value in @($Values)) {
        $text = [string]$value
        if ($seen.Contains($text)) { if (-not $duplicates.Contains($text)) { $duplicates.Add($text) } }
        else { $seen.Add($text) }
    }
    return @($duplicates)
}

function Get-RawInventoryCaseDuplicates([object[]]$Values) {
    $seen = New-Object System.Collections.Generic.List[string]
    $duplicates = New-Object System.Collections.Generic.List[string]
    foreach ($value in @($Values)) {
        $text = [string]$value
        $folded = $text.ToLowerInvariant()
        $prior = $null
        foreach ($item in $seen) { if ($item.ToLowerInvariant() -eq $folded) { $prior = $item; break } }
        if ($null -ne $prior -and $prior -cne $text) {
            if (-not $duplicates.Contains($text)) { $duplicates.Add($text) }
        } else { $seen.Add($text) }
    }
    return @($duplicates)
}

function Test-ReleaseInventoryPortableName([string]$Name) {
    return (-not [string]::IsNullOrWhiteSpace($Name) -and $Name -cmatch $script:ReleaseInventoryPortableNamePattern)
}

function Compare-ReleaseInventorySequence([object[]]$Expected, [object[]]$Actual) {
    $left = @($Expected); $right = @($Actual)
    if ($left.Count -ne $right.Count) { return $false }
    for ($index = 0; $index -lt $left.Count; $index++) {
        if ([string]$left[$index] -cne [string]$right[$index]) { return $false }
    }
    return $true
}

function Test-ReleaseInventoryMemberSet([object[]]$Expected, [object[]]$Actual) {
    $left = @($Expected); $right = @($Actual)
    if ($left.Count -ne $right.Count) { return $false }
    $actualExact = New-Object 'System.Collections.Generic.Dictionary[string,bool]' ([StringComparer]::Ordinal)
    foreach ($item in $right) { $actualExact[[string]$item] = $true }
    foreach ($item in $left) { if (-not $actualExact.ContainsKey([string]$item)) { return $false } }
    return $true
}

function Get-ReleaseArchiveSkillFolders([object[]]$Entries, [string]$Root) {
    $exact = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::Ordinal)
    $caseFolded = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
    foreach ($entry in @($Entries)) {
        $name = ([string]$entry.FullName).Replace('\','/')
        if ($name -notmatch ('^' + [regex]::Escape($Root) + 'skills/([^/]+)/')) { continue }
        $folder = $matches[1]
        if (-not $exact.ContainsKey($folder)) { $exact.Add($folder, $folder) }
        if ($caseFolded.ContainsKey($folder) -and $caseFolded[$folder] -cne $folder) { throw "case-colliding archive skill folders: $($caseFolded[$folder]) and $folder" }
        if (-not $caseFolded.ContainsKey($folder)) { $caseFolded.Add($folder, $folder) }
    }
    return @($exact.Values)
}

function Read-ReleaseJsonStringRaw([string]$Text, [ref]$Index) {
    $i = $Index.Value
    if ($i -ge $Text.Length -or $Text[$i] -cne '"') { throw 'JSON scanner expected a string.' }
    $i++
    $start = $i
    while ($i -lt $Text.Length) {
        if ($Text[$i] -ceq [char]92) { $i += 2; continue }
        if ($Text[$i] -ceq '"') {
            $raw = $Text.Substring($start, $i - $start)
            try { $value = [string](ConvertFrom-Json ('"' + $raw + '"')) }
            catch { throw 'JSON scanner found an invalid escaped string.' }
            $Index.Value = $i + 1
            return $value
        }
        $i++
    }
    throw 'JSON scanner found an unterminated string.'
}

function Skip-ReleaseJsonValue([string]$Text, [ref]$Index) {
    $i = $Index.Value
    if ($i -ge $Text.Length) { throw 'JSON scanner found a missing value.' }
    if ($Text[$i] -ceq '"') { [void](Read-ReleaseJsonStringRaw $Text ([ref]$i)); $Index.Value = $i; return }
    if ($Text[$i] -ceq '{' -or $Text[$i] -ceq '[') {
        $stack = New-Object System.Collections.Generic.List[char]
        $stack.Add($Text[$i]); $i++
        while ($i -lt $Text.Length -and $stack.Count -gt 0) {
            if ($Text[$i] -ceq '"') { [void](Read-ReleaseJsonStringRaw $Text ([ref]$i)); continue }
            if ($Text[$i] -ceq '{' -or $Text[$i] -ceq '[') { $stack.Add($Text[$i]) }
            elseif ($Text[$i] -ceq '}' -or $Text[$i] -ceq ']') {
                $expected = if ($Text[$i] -ceq '}') { '{' } else { '[' }
                if ($stack[$stack.Count - 1] -cne $expected) { throw 'JSON scanner found mismatched braces.' }
                $stack.RemoveAt($stack.Count - 1)
            }
            $i++
        }
        if ($stack.Count -ne 0) { throw 'JSON scanner found an unterminated value.' }
        $Index.Value = $i; return
    }
    while ($i -lt $Text.Length -and $Text[$i] -cne ',' -and $Text[$i] -cne '}') { $i++ }
    $Index.Value = $i
}

function Read-ReleaseJsonObjectPropertyNames([string]$JsonText, [ref]$Index, [string]$ObjectName) {
    $i = $Index.Value
    if ($i -ge $JsonText.Length -or $JsonText[$i] -cne '{') { throw "JSON root property $ObjectName must be an object." }
    $i++
    $names = New-Object System.Collections.Generic.List[string]
    $first = $true
    while ($true) {
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        if ($i -lt $JsonText.Length -and $JsonText[$i] -ceq '}') { $Index.Value = $i + 1; return @($names) }
        if (-not $first) {
            if ($i -ge $JsonText.Length -or $JsonText[$i] -cne ',') { throw "JSON object $ObjectName contains a missing comma." }
            $i++
            while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        }
        if ($i -ge $JsonText.Length -or $JsonText[$i] -cne '"') { throw "JSON object $ObjectName contains an invalid property declaration." }
        $name = Read-ReleaseJsonStringRaw $JsonText ([ref]$i)
        $names.Add($name)
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        if ($i -ge $JsonText.Length -or $JsonText[$i] -cne ':') { throw "JSON object $ObjectName contains a property without a colon." }
        $i++
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        Skip-ReleaseJsonValue $JsonText ([ref]$i)
        $first = $false
    }
}

function Get-ReleaseJsonRootPropertyNames([string]$JsonText) {
    $i = 0
    while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
    return @(Read-ReleaseJsonObjectPropertyNames $JsonText ([ref]$i) 'root')
}
function Get-ReleaseInventoryJsonPropertyNames([string]$JsonText, [string]$ObjectName) {
    $i = 0
    while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
    if ($i -ge $JsonText.Length -or $JsonText[$i] -cne '{') { throw 'JSON document root must be an object.' }
    $i++
    $targetCount = 0
    $targetNames = $null
    $first = $true
    while ($true) {
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        if ($i -lt $JsonText.Length -and $JsonText[$i] -ceq '}') { $i++; break }
        if (-not $first) {
            if ($i -ge $JsonText.Length -or $JsonText[$i] -cne ',') { throw 'JSON root contains a missing comma.' }
            $i++
            while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        }
        if ($i -ge $JsonText.Length -or $JsonText[$i] -cne '"') { throw 'JSON root contains an invalid property declaration.' }
        $name = Read-ReleaseJsonStringRaw $JsonText ([ref]$i)
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        if ($i -ge $JsonText.Length -or $JsonText[$i] -cne ':') { throw "JSON root property $name has no colon." }
        $i++
        while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
        if ($name -ceq $ObjectName) {
            $targetCount++
            $targetNames = @(Read-ReleaseJsonObjectPropertyNames $JsonText ([ref]$i) $ObjectName)
        } else {
            Skip-ReleaseJsonValue $JsonText ([ref]$i)
        }
        $first = $false
    }
    while ($i -lt $JsonText.Length -and [char]::IsWhiteSpace($JsonText[$i])) { $i++ }
    if ($i -ne $JsonText.Length) { throw 'JSON document has trailing content.' }
    if ($targetCount -ne 1) { throw "JSON root must contain exactly one property named $ObjectName; found $targetCount." }
    return @($targetNames)
}

function Assert-ReleaseInventorySafePath([string]$RepositoryRoot, [string]$Candidate, [string]$Label) {
    $rootFull = [IO.Path]::GetFullPath($RepositoryRoot).TrimEnd([IO.Path]::DirectorySeparatorChar, [IO.Path]::AltDirectorySeparatorChar)
    $candidateFull = [IO.Path]::GetFullPath($Candidate)
    $rootItem = Get-Item -LiteralPath $rootFull -Force -ErrorAction Stop
    if (($rootItem.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "$Label path contains a reparse point at the repository root." }
    $sameRoot = [String]::Equals($candidateFull, $rootFull, [StringComparison]::OrdinalIgnoreCase)
    $prefix = $rootFull + [IO.Path]::DirectorySeparatorChar
    if (-not $sameRoot -and -not $candidateFull.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw "$Label path resolves outside repository root." }
    if ($sameRoot) { return $rootFull }
    $relative = $candidateFull.Substring($prefix.Length).Replace([IO.Path]::AltDirectorySeparatorChar, [IO.Path]::DirectorySeparatorChar)
    $current = $rootFull
    foreach ($component in @($relative -split [regex]::Escape([IO.Path]::DirectorySeparatorChar))) {
        if ([string]::IsNullOrEmpty($component)) { continue }
        $children = @(Get-ChildItem -LiteralPath $current -Force -ErrorAction Stop)
        $matches = @($children | Where-Object { $_.Name -ceq $component })
        if ($matches.Count -ne 1) { throw "$Label path component is missing or has the wrong case: $component" }
        $current = $matches[0].FullName
        if (($matches[0].Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "$Label path contains a reparse point: $current" }
    }
    return $current
}
function Get-ReleaseInventorySafeFileTree([string]$RootPath, [string]$Label) {
    $rootItem = Get-Item -LiteralPath $RootPath -Force -ErrorAction Stop
    if (-not $rootItem.PSIsContainer) { throw "$Label is not a directory." }
    if (($rootItem.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "$Label contains a reparse point: $RootPath" }
    $pending = New-Object System.Collections.Generic.List[string]
    $files = New-Object System.Collections.Generic.List[object]
    [void]$pending.Add($rootItem.FullName)
    while ($pending.Count -gt 0) {
        $current = $pending[$pending.Count - 1]
        $pending.RemoveAt($pending.Count - 1)
        foreach ($item in @(Get-ChildItem -LiteralPath $current -Force -ErrorAction Stop)) {
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "$Label contains a reparse point: $($item.FullName)" }
            if ($item.PSIsContainer) { [void]$pending.Add($item.FullName) } else { [void]$files.Add($item) }
        }
    }
    return $files.ToArray()
}
function Get-ReleaseChecksumLedger([string]$RepositoryRoot,[string]$PackRelativePath,[string]$ExpectedHash,[string]$Label) {
    $packRoot = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot $PackRelativePath) "$Label root"
    $ledgerPath = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $packRoot 'CHECKSUMS.sha256') "$Label ledger"
    if ((Get-ReleaseInventorySha256 $ledgerPath) -cne $ExpectedHash) {
        throw "$Label ledger digest mismatch: pinned source integrity anchor."
    }
    $expected = New-Object System.Collections.Generic.List[string]
    foreach ($item in @(Get-ReleaseInventorySafeFileTree $packRoot "$Label tree")) {
        $relative = $item.FullName.Substring($packRoot.Length + 1).Replace('\','/')
        if ($relative -cne 'CHECKSUMS.sha256') { [void]$expected.Add($relative) }
    }
    $records = New-Object 'System.Collections.Generic.Dictionary[string,object]' ([StringComparer]::Ordinal)
    $folded = New-Object 'System.Collections.Generic.Dictionary[string,string]' ([StringComparer]::OrdinalIgnoreCase)
    $lineNumber = 0
    foreach ($line in Get-Content -LiteralPath $ledgerPath) {
        $lineNumber++
        if ($line -notmatch '^([0-9a-f]{64})  ([A-Za-z0-9._-]+(?:/[A-Za-z0-9._-]+)*)$') { throw "Malformed $Label checksum line $lineNumber." }
        $hash = $matches[1]; $relative = $matches[2]
        if (@($relative.Split('/') | Where-Object { $_ -eq '.' -or $_ -eq '..' }).Count -gt 0) { throw "Unsafe $Label checksum target: $relative" }
        if ($relative -ceq 'CHECKSUMS.sha256') { throw "$Label ledger cannot checksum itself." }
        if ($records.ContainsKey($relative)) { throw "Exact duplicate $Label checksum target: $relative" }
        $lower = $relative.ToLowerInvariant()
        if ($folded.ContainsKey($lower) -and $folded[$lower] -cne $relative) { throw "Case-only duplicate $Label checksum target: $relative" }
        $target = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $packRoot $relative.Replace('/',[IO.Path]::DirectorySeparatorChar)) "$Label target $relative"
        if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "$Label checksum target missing: $relative" }
        $item = Get-Item -LiteralPath $target -Force -ErrorAction Stop
        $records.Add($relative, [pscustomobject]@{ RelativePath=$relative; Path=$target; Length=[int64]$item.Length; Hash=$hash })
        $folded[$lower] = $relative
        if ((Get-ReleaseInventorySha256 $target) -cne $hash) { throw "$Label checksum mismatch: $relative" }
    }
    if ($records.Count -ne $expected.Count -or -not (Test-ReleaseInventoryMemberSet $expected @($records.Keys))) { throw "$Label checksum inventory is not the exact canonical pack target set." }
    return [pscustomobject]@{ Root=$packRoot; LedgerPath=$ledgerPath; Records=$records; Paths=$expected.ToArray() }
}
function Get-ReleasePackLedger([string]$RepositoryRoot) {
    return Get-ReleaseChecksumLedger $RepositoryRoot 'packs/user-facing-standards' $script:ExpectedSupplementalPackLedgerSha256 'supplemental pack'
}
$script:ExpectedRemainingStandardsPackLedgerSha256 = '07816484fc6deed45b0d233fac7ecd9b6c018ab0feebb7a8847aa78290398dbf'
function Get-ReleaseRemainingStandardsLedger([string]$RepositoryRoot) {
    return Get-ReleaseChecksumLedger $RepositoryRoot 'packs/remaining-standards' $script:ExpectedRemainingStandardsPackLedgerSha256 'remaining standards pack'
}
$script:ExpectedControlledExecutionPackLedgerSha256 = '4152c0c9dd25117ea2e617e4f2cc19e814dbc0ad3eb62b00339f1c11b25e2445'
function Get-ReleaseControlledExecutionLedger([string]$RepositoryRoot) {
    return Get-ReleaseChecksumLedger $RepositoryRoot 'packs/controlled-execution' $script:ExpectedControlledExecutionPackLedgerSha256 'controlled-execution pack'
}
$script:ApprovalTermPattern = '(?<![A-Za-z0-9-])(?:approval|approved|endorsement|endorsed|certification|certified|authorization|authorisation|authorized|authorised)(?![A-Za-z0-9-])'
$script:ApprovalTermRegexOptions = [Text.RegularExpressions.RegexOptions]::IgnoreCase -bor [Text.RegularExpressions.RegexOptions]::CultureInvariant
$script:ApprovalClauseSplitPattern = '(?i)[,.;:!?\r\n—–]+|\b(?:but|however|yet)\b'
$script:ApprovalTokenPattern = "[A-Za-z0-9][A-Za-z0-9''-]*"
$script:ApprovalNegationPattern = '(?i)^(?:no|not|never|without|cannot)$'
$script:ApprovalContextTokenLimit = 12

function Test-ReleaseNearbyApprovalNegation([object[]]$Before,[object[]]$After) {
    $window = New-Object System.Collections.Generic.List[string]
    $start = [Math]::Max(0, $Before.Count - $script:ApprovalContextTokenLimit)
    if ($Before.Count -gt 0) { foreach ($token in $Before[$start..($Before.Count - 1)]) { [void]$window.Add([string]$token) } }
    $end = [Math]::Min($script:ApprovalContextTokenLimit - 1, $After.Count - 1)
    if ($After.Count -gt 0) { foreach ($token in $After[0..$end]) { [void]$window.Add([string]$token) } }
    foreach ($token in $window) {
        if ($token -match $script:ApprovalNegationPattern) { return $true }
    }
    return $false
}

function Test-ReleaseUserFacingApprovalClaim([string]$Text) {
    foreach ($clause in [regex]::Split($Text, $script:ApprovalClauseSplitPattern)) {
        $matches = [regex]::Matches($clause, $script:ApprovalTermPattern, $script:ApprovalTermRegexOptions)
        for ($index = 0; $index -lt $matches.Count; $index++) {
            $match = $matches[$index]
            $previousEnd = 0
            if ($index -gt 0) { $previousEnd = $matches[$index - 1].Index + $matches[$index - 1].Length }
            $nextStart = $clause.Length
            if ($index + 1 -lt $matches.Count) { $nextStart = $matches[$index + 1].Index }
            $beforeText = $clause.Substring($previousEnd, $match.Index - $previousEnd)
            $afterText = $clause.Substring($match.Index + $match.Length, $nextStart - ($match.Index + $match.Length))
            $before = @([regex]::Matches($beforeText, $script:ApprovalTokenPattern) | ForEach-Object { $_.Value })
            $after = @([regex]::Matches($afterText, $script:ApprovalTokenPattern) | ForEach-Object { $_.Value })
            if (-not (Test-ReleaseNearbyApprovalNegation $before $after)) { return $true }
        }
    }
    return $false
}

function Assert-ReleaseUserFacingApprovalLanguage([string]$RepositoryRoot) {
    $surfaces = @(
        'packs/user-facing-standards/CATALOG.md',
        'packs/user-facing-standards/README.md',
        'packs/user-facing-standards/SOURCE-MANIFEST.json',
        'packs/user-facing-standards/audit/ASD-STE100-source-study-and-proposal.md'
    )
    $staleProvenancePattern = '(?im)^.*No repository, release, installed skill.*changed\.?$'
    foreach ($relative in $surfaces) {
        $path = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot $relative.Replace('/', [IO.Path]::DirectorySeparatorChar)) "approval-language surface $relative"
        $text = [IO.File]::ReadAllText($path, [Text.Encoding]::UTF8)
        if ($text -notmatch '(?i)no approval assertion') { throw "Approval disclaimer missing: $relative" }
        if ($text -match $staleProvenancePattern) { throw "Approval assertion found: $relative" }
        if (Test-ReleaseUserFacingApprovalClaim $text) { throw "Approval assertion found: $relative" }
    }
}

function Get-ReleaseUserFacingInventory([string]$RepositoryRoot, [object]$Profiles) {
    $definition = $Profiles.user_facing_standards
    if ($null -eq $definition) { throw 'release-profiles.json lacks user_facing_standards configuration.' }
    $packLedger = Get-ReleasePackLedger $RepositoryRoot
    $sourceRootRelative = [string]$definition.source_root
    $manifestRelative = [string]$definition.source_manifest
    $rightsRelative = [string]$definition.rights_notice_path
    foreach ($relative in @($sourceRootRelative, $manifestRelative, $rightsRelative)) {
        if ([string]::IsNullOrWhiteSpace($relative) -or $relative -notmatch '^[A-Za-z0-9][A-Za-z0-9._-]*(/[A-Za-z0-9][A-Za-z0-9._-]*)*$') {
            throw "Invalid supplemental inventory path; expected a nonempty portable repo-relative forward-slash path: $relative"
        }
    }
    $sourceRoot = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot $sourceRootRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)) 'Supplemental source root'
    $manifestPath = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot $manifestRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)) 'Supplemental source manifest'
    $rightsPath = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot $rightsRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)) 'Supplemental rights notice'
    [void](Get-ReleaseInventorySafeFileTree $sourceRoot 'Supplemental source root')
    if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) { throw "Supplemental source root missing: $sourceRootRelative" }
    if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) { throw "Supplemental source manifest missing: $manifestRelative" }
    if (-not (Test-Path -LiteralPath $rightsPath -PathType Leaf)) { throw "Supplemental rights notice missing: $rightsRelative" }
    Assert-ReleaseUserFacingApprovalLanguage $RepositoryRoot
    $manifestHash = ([string]$definition.source_manifest_sha256).ToLowerInvariant()
    $rightsHash = ([string]$definition.rights_notice_sha256).ToLowerInvariant()
    if ($manifestHash -notmatch '^[0-9a-f]{64}$' -or $rightsHash -notmatch '^[0-9a-f]{64}$') { throw 'Invalid supplemental source hash configuration.' }
    if ((Get-ReleaseInventorySha256 $manifestPath) -ne $manifestHash) { throw "Supplemental source manifest hash mismatch: $manifestRelative" }
    if ((Get-ReleaseInventorySha256 $rightsPath) -ne $rightsHash) { throw "Supplemental rights notice hash mismatch: $rightsRelative" }
    try { $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json }
    catch { throw "Supplemental source manifest parse failure: $($_.Exception.Message)" }
    $records = @($manifest.skills)
    if ($records.Count -ne 27) { throw "Supplemental source manifest must contain exactly 27 records; found $($records.Count)." }
    $manifestNames = New-Object System.Collections.Generic.List[string]
    foreach ($record in $records) { $manifestNames.Add([string]$record.name) }
    $exactDuplicates = @(Get-RawInventoryDuplicates $manifestNames)
    if ($exactDuplicates.Count -gt 0) { throw "Supplemental source manifest exact duplicate: $($exactDuplicates -join ', ')" }
    $caseDuplicates = @(Get-RawInventoryCaseDuplicates $manifestNames)
    if ($caseDuplicates.Count -gt 0) { throw "Supplemental source manifest case-only duplicate: $($caseDuplicates -join ', ')" }
    foreach ($name in $manifestNames) {
        if (-not (Test-ReleaseInventoryPortableName $name)) { throw "Invalid supplemental skill name: $name" }
    }
    $catalogPath = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path $RepositoryRoot 'packs/user-facing-standards/CATALOG.md') 'Supplemental catalog'
    $catalogLines = @(Get-Content -LiteralPath $catalogPath)
    $headerIndices = @(for ($index = 0; $index -lt $catalogLines.Count; $index++) { if ($catalogLines[$index].Trim() -ceq '| Skill | Purpose/source | Lines | Evidence / bundled reference |') { $index } })
    if ($headerIndices.Count -ne 1) { throw 'Supplemental catalog must contain exactly one canonical skill table.' }
    $headerIndex = $headerIndices[0]
    if ($headerIndex + 1 -ge $catalogLines.Count -or $catalogLines[$headerIndex + 1].Trim() -cne '|---|---|---:|---|') { throw 'Supplemental catalog skill table separator is malformed.' }
    $catalogRows = New-Object System.Collections.Generic.List[object]
    for ($index = $headerIndex + 2; $index -lt $catalogLines.Count; $index++) {
        $line = $catalogLines[$index]
        if ([string]::IsNullOrWhiteSpace($line) -or $line.Trim().StartsWith('#')) { break }
        if (-not $line.Trim().StartsWith('|')) { throw 'Malformed supplemental catalog skill row.' }
        $catalogRows.Add($line)
    }
    $catalogEnd = $headerIndex + 2 + $catalogRows.Count
    for ($index = 0; $index -lt $catalogLines.Count; $index++) {
        if ($index -ge $headerIndex -and $index -lt $catalogEnd) { continue }
        $trimmed = $catalogLines[$index].Trim()
        if ($trimmed.StartsWith('|') -or $trimmed -match 'skills/[^/\s)]+/SKILL\.md') { throw 'Supplemental catalog contains an unexpected table row or skill link outside its canonical table.' }
    }
    if ($catalogRows.Count -ne 27) { throw "Supplemental catalog must contain exactly 27 skill rows; found $($catalogRows.Count)" }
    $catalogNames = New-Object System.Collections.Generic.List[string]
    foreach ($line in $catalogRows) {
        $row = [regex]::Match($line, '^\|\s*\[([^\]]+)\]\(skills/([^/]+)/SKILL\.md\)\s*\|\s*([^|]+?)\s*\|\s*(\d+)\s*\|\s*([^|]+?)\s*\|$')
        if (-not $row.Success) { throw "Malformed supplemental catalog skill row: $line" }
        $displayName = $row.Groups[1].Value; $linkedName = $row.Groups[2].Value
        if ($displayName -cne $linkedName) { throw "Catalog display/link mismatch: $displayName != $linkedName" }
        if (-not (Test-ReleaseInventoryPortableName $linkedName)) { throw "Invalid catalog skill name: $linkedName" }
        if ([int]$row.Groups[4].Value -le 0) { throw "Invalid catalog line count: $linkedName" }
        $catalogNames.Add($linkedName)
        $manifestRecord = @($records | Where-Object { [string]$_.name -ceq $linkedName })
        if ($manifestRecord.Count -ne 1 -or [int]$manifestRecord[0].lines -ne [int]$row.Groups[4].Value) { throw "Catalog line count mismatch: $linkedName" }
    }
    if ((Get-RawInventoryDuplicates $catalogNames).Count -gt 0) { throw 'Supplemental catalog contains an exact duplicate skill row.' }
    if ((Get-RawInventoryCaseDuplicates $catalogNames).Count -gt 0) { throw 'Supplemental catalog contains a case-only duplicate skill row.' }
    if (-not (Compare-ReleaseInventorySequence $manifestNames $catalogNames)) { throw 'Supplemental catalog order differs from SOURCE-MANIFEST.json.' }
    $directories = @(Get-ChildItem -LiteralPath $sourceRoot -Directory)
    $directoryNames = @($directories | ForEach-Object { [string]$_.Name })
    if ((Get-RawInventoryDuplicates $directoryNames).Count -gt 0 -or (Get-RawInventoryCaseDuplicates $directoryNames).Count -gt 0) { throw 'Supplemental source root contains duplicate or case-colliding directory names.' }
    foreach ($directoryName in $directoryNames) {
        if (-not (Test-ReleaseInventoryPortableName $directoryName)) { throw "Invalid supplemental source directory: $directoryName" }
    }
    if (-not (Test-ReleaseInventoryMemberSet $manifestNames $directoryNames) -or $directoryNames.Count -ne 27) { throw 'Supplemental source directories do not match SOURCE-MANIFEST.json membership.' }
    foreach ($name in $manifestNames) {
        $skillPath = Assert-ReleaseInventorySafePath $RepositoryRoot (Join-Path (Join-Path $sourceRoot $name) 'SKILL.md') "Supplemental skill $name"
        if (-not (Test-Path -LiteralPath $skillPath -PathType Leaf)) { throw "Supplemental skill is missing SKILL.md: $name" }
    }
    return [pscustomobject]@{
        Definition = $definition
        PackLedger = $packLedger
        Manifest = $manifest
        ManifestRecords = $records
        Names = @($manifestNames)
        CatalogNames = @($catalogNames)
        SourceRoot = $sourceRoot
        SourceRootRelative = $sourceRootRelative
        ManifestPath = $manifestPath
        ManifestRelative = $manifestRelative
        RightsPath = $rightsPath
        RightsRelative = $rightsRelative
    }
}
