[CmdletBinding()]
param([string]$ArtifactsDirectory)
$requestedArtifactsDirectory = $ArtifactsDirectory
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'validate.ps1') -FunctionsOnly
$quietFailures = $true

$fixtureRoot = Join-Path ([IO.Path]::GetTempPath()) ('lean-agent-validator-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $fixtureRoot -Force | Out-Null
Add-Type -AssemblyName System.IO.Compression
$profiles = Get-Content -Raw (Join-Path $repoRoot 'release-profiles.json') | ConvertFrom-Json
$script:releaseUserFacingInventory = Get-ReleaseUserFacingInventory $repoRoot $profiles
$canonicalMap = Get-CanonicalSourceFileMap $profiles
if ([string]::IsNullOrWhiteSpace($requestedArtifactsDirectory)) { $requestedArtifactsDirectory = Join-Path $repoRoot 'artifacts/repro-a' }
$artifactRoot = [IO.Path]::GetFullPath($requestedArtifactsDirectory)
if (-not (Test-Path -LiteralPath $artifactRoot -PathType Container)) { throw "Validator integration controls require a built artifact directory: $artifactRoot" }
$failures.Clear(); Get-ReleaseUserFacingInventory $repoRoot $profiles | Out-Null
if ($failures.Count -ne 0) { throw 'Clean supplemental source positive control failed' }
Write-Host 'PASS: clean supplemental source positive control' -ForegroundColor Green
$auditScript = Join-Path $repoRoot 'scripts/audit-repository.ps1'
& $auditScript -ArtifactsDirectory $artifactRoot | Out-Null
if (-not $?) { throw 'Audit default-root regression failed' }
Write-Host 'PASS: audit default-root invocation from caller cwd' -ForegroundColor Green

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
function Get-EntryBytes([IO.Compression.ZipArchiveEntry]$Entry) {
    $stream = $Entry.Open(); $memory = New-Object IO.MemoryStream
    try { $stream.CopyTo($memory); return $memory.ToArray() } finally { $stream.Dispose(); $memory.Dispose() }
}
function Get-BytesHash([byte[]]$Bytes) {
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [BitConverter]::ToString($sha.ComputeHash($Bytes)).Replace('-', '').ToLowerInvariant() } finally { $sha.Dispose() }
}
function Read-ZipMap([string]$Path) {
    $archive = [IO.Compression.ZipFile]::OpenRead($Path); $map = New-Object 'System.Collections.Generic.Dictionary[string,byte[]]' ([StringComparer]::Ordinal)
    try { foreach ($entry in $archive.Entries) { $map.Add([string]$entry.FullName,(Get-EntryBytes $entry)) } } finally { $archive.Dispose() }
    return $map
}
function Write-ZipMap([string]$Path,[System.Collections.Generic.Dictionary[string,byte[]]]$Map) {
    $stream=[IO.File]::Open($Path,[IO.FileMode]::Create); $archive=New-Object IO.Compression.ZipArchive($stream,[IO.Compression.ZipArchiveMode]::Create,$false)
    try { foreach ($name in $Map.Keys) { $entry=$archive.CreateEntry($name); $out=$entry.Open(); try { $bytes=$Map[$name]; $out.Write($bytes,0,$bytes.Length) } finally { $out.Dispose() } } } finally { $archive.Dispose(); $stream.Dispose() }
}
function New-PackageMutation([string]$Source,[string]$Destination,[string]$Prefix,[scriptblock]$Mutator,[bool]$Rehash) {
    $map=Read-ZipMap $Source; & $Mutator $map $Prefix
    if ($Rehash) {
        $lines=New-Object System.Collections.Generic.List[string]
        foreach ($name in $map.Keys) { if ($name -ne ($Prefix+'CHECKSUMS.sha256')) { $lines.Add((Get-BytesHash $map[$name]) + '  ' + $name.Substring($Prefix.Length)) } }
        $map[$Prefix+'CHECKSUMS.sha256']=[Text.Encoding]::UTF8.GetBytes(($lines -join [Environment]::NewLine) + [Environment]::NewLine)
    }
    Write-ZipMap $Destination $map
}
function Invoke-PackageRejection([string]$Name,[scriptblock]$Mutator,[string]$Expected,[bool]$Rehash=$true) {
    $destination=Join-Path $fixtureRoot ('package-' + $Name.Replace(' ','-').Replace('/','-').Replace('\','-') + '.zip')
    $prefix=(Get-PackageBaseName 'core' $profiles.version) + '/'
    New-PackageMutation (Join-Path $artifactRoot ((Get-PackageBaseName 'core' $profiles.version)+'.zip')) $destination $prefix $Mutator $Rehash
    $failures.Clear(); try { Test-ZipArchive $destination 'core' $profiles.profiles.core $profiles.version $canonicalMap } catch { $failures.Add($_.Exception.Message) }
    if (-not ($failures | Where-Object { $_ -match [regex]::Escape($Expected) })) { throw "Rejection control failed: $Name (expected $Expected)" }
    Write-Host ('PASS rejection: ' + $Name) -ForegroundColor Green; Remove-Item -LiteralPath $destination -Force
}
function Update-PackLedger([string]$Root) {
    $ledger=Join-Path $Root 'CHECKSUMS.sha256'; $out=New-Object System.Collections.Generic.List[string]
    foreach($line in Get-Content $ledger) { if($line -match '^([0-9a-f]{64})  (.+)$') { $rel=$matches[2]; $target=Join-Path $Root $rel.Replace('/',[IO.Path]::DirectorySeparatorChar); $out.Add((Get-ReleaseInventorySha256 $target)+'  '+$rel) } else { $out.Add($line) } }
    [IO.File]::WriteAllLines($ledger,$out,[Text.Encoding]::UTF8)
}
function Update-RootLedger([string]$FixtureRepo) {
    $source=Join-Path $repoRoot 'UPSTREAM-CHECKSUMS.sha256'; $target=Join-Path $FixtureRepo 'UPSTREAM-CHECKSUMS.sha256'
    Copy-Item -LiteralPath $source -Destination $target -Force
    $lines=New-Object System.Collections.Generic.List[string]
    foreach($line in Get-Content -LiteralPath $target) {
        if($line -match '^([0-9a-f]{64})  (.+)$' -and $matches[2] -eq 'packs/user-facing-standards/CHECKSUMS.sha256') {
            $packLedger=Join-Path $FixtureRepo 'packs/user-facing-standards/CHECKSUMS.sha256'
            $lines.Add((Get-ReleaseInventorySha256 $packLedger)+'  '+$matches[2])
        } else { $lines.Add($line) }
    }
    [IO.File]::WriteAllLines($target,$lines,[Text.Encoding]::UTF8)
}
function Invoke-PackRejection([string]$Name,[scriptblock]$Mutator,[string]$Expected) {
    $fixtureRepo=Join-Path $fixtureRoot ('repo-' + $Name.Replace(' ','-')); $root=Join-Path $fixtureRepo 'packs/user-facing-standards'; New-Item -ItemType Directory -Path (Split-Path $root) -Force | Out-Null; Copy-Item -LiteralPath (Join-Path $repoRoot 'packs/user-facing-standards') -Destination $root -Recurse
    try {
        & $Mutator $root
        if ($Name -notmatch '^pack ledger') { Update-PackLedger $root; Update-RootLedger $fixtureRepo }
        $fixtureProfiles=$profiles | ConvertTo-Json -Depth 50 | ConvertFrom-Json
        $fixtureProfiles.user_facing_standards.source_manifest_sha256=Get-ReleaseInventorySha256 (Join-Path $root 'SOURCE-MANIFEST.json')
        $fixtureProfiles.user_facing_standards.rights_notice_sha256=Get-ReleaseInventorySha256 (Join-Path $root 'THIRD-PARTY-NOTICES.md')
        $anchor = $script:ExpectedSupplementalPackLedgerSha256
        if ($Name -notmatch 'after both ledgers rehash' -and $Name -notmatch '^pack ledger') { $script:ExpectedSupplementalPackLedgerSha256 = Get-ReleaseInventorySha256 (Join-Path $root 'CHECKSUMS.sha256') }
        try {
            $failures.Clear(); try { Get-ReleaseUserFacingInventory $fixtureRepo $fixtureProfiles | Out-Null } catch { $failures.Add($_.Exception.Message) }
        } finally { $script:ExpectedSupplementalPackLedgerSha256 = $anchor }
        if (-not ($failures | Where-Object { $_ -imatch [regex]::Escape($Expected) })) { throw "Rejection control failed: $Name (expected $Expected)" }
        Write-Host ('PASS rejection: ' + $Name) -ForegroundColor Green
    } finally { Remove-Item -LiteralPath $fixtureRepo -Recurse -Force -ErrorAction SilentlyContinue }
}
function Invoke-PackApprovalPositive([string]$Name,[scriptblock]$Mutator) {
    $fixtureRepo=Join-Path $fixtureRoot ('repo-' + $Name.Replace(' ','-')); $root=Join-Path $fixtureRepo 'packs/user-facing-standards'; New-Item -ItemType Directory -Path (Split-Path $root) -Force | Out-Null; Copy-Item -LiteralPath (Join-Path $repoRoot 'packs/user-facing-standards') -Destination $root -Recurse
    try {
        & $Mutator $root
        Update-PackLedger $root; Update-RootLedger $fixtureRepo
        $fixtureProfiles=$profiles | ConvertTo-Json -Depth 50 | ConvertFrom-Json
        $fixtureProfiles.user_facing_standards.source_manifest_sha256=Get-ReleaseInventorySha256 (Join-Path $root 'SOURCE-MANIFEST.json')
        $fixtureProfiles.user_facing_standards.rights_notice_sha256=Get-ReleaseInventorySha256 (Join-Path $root 'THIRD-PARTY-NOTICES.md')
        $anchor = $script:ExpectedSupplementalPackLedgerSha256
        $script:ExpectedSupplementalPackLedgerSha256 = Get-ReleaseInventorySha256 (Join-Path $root 'CHECKSUMS.sha256')
        try {
            $failures.Clear(); try { Get-ReleaseUserFacingInventory $fixtureRepo $fixtureProfiles | Out-Null } catch { $failures.Add($_.Exception.Message) }
        } finally { $script:ExpectedSupplementalPackLedgerSha256 = $anchor }
        if ($failures.Count -ne 0) { throw "Approval disclaimer positive control failed: $Name ($($failures -join '; '))" }
        Write-Host ('PASS: ' + $Name) -ForegroundColor Green
    } finally { Remove-Item -LiteralPath $fixtureRepo -Recurse -Force -ErrorAction SilentlyContinue }
}
function Invoke-ProfileRejection([string]$Name,[scriptblock]$Mutator,[string]$Expected) {
    $bad=$profiles | ConvertTo-Json -Depth 50 | ConvertFrom-Json; & $Mutator $bad
    $validation=[IO.File]::ReadAllText((Join-Path $repoRoot 'PACKAGE-VALIDATION.json'),[Text.Encoding]::UTF8) | ConvertFrom-Json
    $profileText=[IO.File]::ReadAllText((Join-Path $repoRoot 'release-profiles.json'),[Text.Encoding]::UTF8)
    $failures.Clear(); try { Test-ReleaseInventoryContracts $bad $validation $profileText } catch { $failures.Add($_.Exception.Message) }
    if (-not ($failures | Where-Object { $_ -match [regex]::Escape($Expected) })) { throw "Rejection control failed: $Name (expected $Expected)" }
    Write-Host ('PASS rejection: ' + $Name) -ForegroundColor Green
}
function Invoke-RootRejection([string]$Name,[scriptblock]$Mutator,[string]$Expected) {
    $rootReadme=Join-Path $artifactRoot 'README.md'; $checksums=Join-Path $artifactRoot 'CHECKSUMS.sha256'; $original=[IO.File]::ReadAllBytes($rootReadme); $checksumOriginal=[IO.File]::ReadAllBytes($checksums)
    try { & $Mutator $rootReadme; $failures.Clear(); Test-ReleaseRootReadme $artifactRoot $profiles; if (-not ($failures | Where-Object { $_ -match [regex]::Escape($Expected) })) { throw "Rejection control failed: $Name (expected $Expected)" }; Write-Host ('PASS rejection: ' + $Name) -ForegroundColor Green } finally { [IO.File]::WriteAllBytes($rootReadme,$original); [IO.File]::WriteAllBytes($checksums,$checksumOriginal) }
}
function Invoke-ArtifactRejection([string]$Name,[scriptblock]$Mutator,[string]$Expected) {
    $path=Join-Path $artifactRoot 'RELEASE-MANIFEST.json'; $original=[IO.File]::ReadAllBytes($path)
    try { & $Mutator $path; $failures.Clear(); Test-ReleaseArtifacts $artifactRoot $profiles; if (-not ($failures | Where-Object { $_ -match [regex]::Escape($Expected) })) { throw "Rejection control failed: $Name (expected $Expected)" }; Write-Host ('PASS rejection: ' + $Name) -ForegroundColor Green } finally { [IO.File]::WriteAllBytes($path,$original) }
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
    # These controls test policy-presence and metadata guards, not live prose quality.
    $baselineText = [IO.File]::ReadAllText((Join-Path $repoRoot 'AGENTS.md'), [Text.Encoding]::UTF8)
    $baselineMetadata = [IO.File]::ReadAllText((Join-Path $repoRoot 'PACKAGE-VALIDATION.json'), [Text.Encoding]::UTF8) | ConvertFrom-Json
    $failures.Clear()
    Test-DirectClaimsText $baselineText 'positive control'
    Test-DirectClaimsMetadata $baselineMetadata.direct_claims 'positive control'
    if ($failures.Count -ne 0) { throw 'Direct-claims positive controls failed' }
    $mutationCount = 0
    foreach ($needle in @('State supported conclusions directly','avoid litotes and rhetorical hedging','Preserve genuine uncertainty','evidence scope and degree','Own actual agent errors','within existing permissions')) {
        $failures.Clear()
        Test-DirectClaimsText ($baselineText.Replace($needle, 'removed guard')) 'negative control'
        if ($failures.Count -eq 0) { throw "Direct-claims guard failed to detect removal: $needle" }
        $mutationCount++
    }
    foreach ($name in @('global_principles','preserve_uncertainty','preserve_semantics','evidence_based_ownership','no_blanket_word_ban','no_new_route','runtime_enforcement','live_host_evaluated')) {
        $failures.Clear()
        $bad = ($baselineMetadata.direct_claims | ConvertTo-Json | ConvertFrom-Json)
        $bad.$name = -not [bool]$bad.$name
        Test-DirectClaimsMetadata $bad 'negative control'
        if ($failures.Count -eq 0) { throw "Direct-claims metadata guard failed to detect mutation: $name" }
        $mutationCount++
    }
    $failures.Clear()
    if ($mutationCount -ne 14) { throw 'Direct-claims negative-control count drifted' }
    Write-Host "PASS: direct-claims positive controls and 14 deliberate policy/metadata mutations" -ForegroundColor Green
    Write-Host "PASS: validator rejects unsafe paths, case collisions, executables, symlinks, and malformed master archives" -ForegroundColor Green
    $packageSource=Join-Path $artifactRoot ((Get-PackageBaseName 'core' $profiles.version)+'.zip')
    $failures.Clear(); Test-ZipArchive $packageSource 'core' $profiles.profiles.core $profiles.version $canonicalMap
    if ($failures.Count -ne 0) { throw 'Clean package positive control failed' }
    $packageControls=@(
        [pscustomobject]@{ Name='U nested reference byte tamper with package rehash'; Expected='canonical byte length mismatch'; Rehash=$true; Mutator={ param($m,$p); $n=$m[$p+'skills/standard-wcag22/references/wcag22-official.html.txt']; $x=New-Object byte[] ($n.Length+1); [Array]::Copy($n,$x,$n.Length); $x[$n.Length]=90; $m[$p+'skills/standard-wcag22/references/wcag22-official.html.txt']=$x } },
        [pscustomobject]@{ Name='supplemental rights notice byte tamper with package rehash'; Expected='canonical byte length mismatch'; Rehash=$true; Mutator={ param($m,$p); $n=$m[$p+'USER-FACING-STANDARDS-NOTICES.md']; $x=New-Object byte[] ($n.Length+1); [Array]::Copy($n,$x,$n.Length); $x[$n.Length]=90; $m[$p+'USER-FACING-STANDARDS-NOTICES.md']=$x } },
        [pscustomobject]@{ Name='missing U SOURCES.md with package rehash'; Expected='exact file inventory mismatch'; Rehash=$true; Mutator={ param($m,$p); [void]$m.Remove($p+'skills/standard-bcp14/SOURCES.md') } },
        [pscustomobject]@{ Name='unexpected member under allowed U skill'; Expected='exact file inventory mismatch'; Rehash=$true; Mutator={ param($m,$p); $m.Add($p+'skills/standard-bcp14/unexpected.txt',[Text.Encoding]::UTF8.GetBytes('unexpected')) } },
        [pscustomobject]@{ Name='unexpected non-U skill after metadata and package declarations'; Expected='exact file inventory mismatch'; Rehash=$true; Mutator={ param($m,$p); $m.Add($p+'skills/rogue/SKILL.md',[Text.Encoding]::UTF8.GetBytes('# rogue')) ; $j=([Text.Encoding]::UTF8.GetString($m[$p+'PACKAGE-VALIDATION.json'])|ConvertFrom-Json); $j.included_skills=@($j.included_skills)+'rogue'; $j.base_task_skills=@($j.base_task_skills)+'rogue'; $j.skills_expected=[int]$j.skills_expected+1; $j.skills_validated=[int]$j.skills_validated+1; $m[$p+'PACKAGE-VALIDATION.json']=[Text.Encoding]::UTF8.GetBytes(($j|ConvertTo-Json -Depth 20)) } },
        [pscustomobject]@{ Name='package CHECKSUM exact duplicate'; Expected='exact duplicate'; Rehash=$false; Mutator={ param($m,$p); $q=$p+'CHECKSUMS.sha256'; $t=[Text.Encoding]::UTF8.GetString($m[$q]); $m[$q]=[Text.Encoding]::UTF8.GetBytes($t+($t -split '\r?\n'|Where-Object{$_})[0]+[Environment]::NewLine) } },
        [pscustomobject]@{ Name='package CHECKSUM case-only duplicate'; Expected='case-only duplicate'; Rehash=$false; Mutator={ param($m,$p); $q=$p+'CHECKSUMS.sha256'; $t=[Text.Encoding]::UTF8.GetString($m[$q]); $first=($t -split '\r?\n'|Where-Object{$_})[0]; $parts=$first -split '  ',2; $alias=$parts[1].ToUpperInvariant(); $m[$q]=[Text.Encoding]::UTF8.GetBytes($t+$parts[0]+'  '+$alias+[Environment]::NewLine) } },
        [pscustomobject]@{ Name='raw backslash ZIP member'; Expected='backslash ZIP member'; Rehash=$false; Mutator={ param($m,$p); $m.Add($p+'raw\\member.txt',[Text.Encoding]::UTF8.GetBytes('raw')) } },
        [pscustomobject]@{ Name='directory-only ZIP member'; Expected='directory-only ZIP member'; Rehash=$false; Mutator={ param($m,$p); $m.Add($p+'directory/',[byte[]]@()) } },
        [pscustomobject]@{ Name='generated plugin routing/name/version mutation'; Expected='plugin identity or routing contract mismatch'; Rehash=$true; Mutator={ param($m,$p); $j=([Text.Encoding]::UTF8.GetString($m[$p+'.codex-plugin/plugin.json'])|ConvertFrom-Json); $j.skills='./rogue/'; $m[$p+'.codex-plugin/plugin.json']=[Text.Encoding]::UTF8.GetBytes(($j|ConvertTo-Json -Depth 10)) } },
        [pscustomobject]@{ Name='generated package README material mutation'; Expected='README profile counts/routing claim mismatch'; Rehash=$true; Mutator={ param($m,$p); $t=[Text.Encoding]::UTF8.GetString($m[$p+'README.md']); $m[$p+'README.md']=[Text.Encoding]::UTF8.GetBytes($t.Replace('Base task routing remains unchanged.','Base task routing changed.')) } }
    )
    foreach($control in $packageControls){ Invoke-PackageRejection $control.Name $control.Mutator $control.Expected $control.Rehash }
    $packControls=@(
        [pscustomobject]@{Name='supplemental SKILL.md tamper after both ledgers rehash';Expected='pinned source integrity anchor';Mutator={param($r);$q=Join-Path $r 'skills/standard-bcp14/SKILL.md';Add-Content -LiteralPath $q -Value '# reviewer mutation'}},
        [pscustomobject]@{Name='audit validator tamper after both ledgers rehash';Expected='pinned source integrity anchor';Mutator={param($r);$q=Join-Path $r 'audit/validate_bundle.py';Add-Content -LiteralPath $q -Value '# reviewer mutation'}},
        [pscustomobject]@{Name='pack ledger exact duplicate';Expected='pinned source integrity anchor';Mutator={param($r);$q=Join-Path $r 'CHECKSUMS.sha256';$t=Get-Content -Raw $q;Add-Content -LiteralPath $q -Value (($t -split '
?
'|Where-Object{$_})[0])}},
        [pscustomobject]@{Name='pack ledger case-only duplicate';Expected='pinned source integrity anchor';Mutator={param($r);$q=Join-Path $r 'CHECKSUMS.sha256';$t=Get-Content -Raw $q;$first=($t -split '
?
'|Where-Object{$_})[0];$parts=$first -split '  ',2;Add-Content -LiteralPath $q -Value ($parts[0]+'  '+$parts[1].ToUpperInvariant())}},
        [pscustomobject]@{Name='pack ledger omission';Expected='pinned source integrity anchor';Mutator={param($r);$q=Join-Path $r 'CHECKSUMS.sha256';$lines=@(Get-Content $q);Set-Content -LiteralPath $q -Value $lines[1..($lines.Count-1)] -Encoding UTF8}}
    )
    foreach($control in $packControls){Invoke-PackRejection $control.Name $control.Mutator $control.Expected}
    $approvalControls=@(
        [pscustomobject]@{Name='affirmative approval CATALOG after ledger refresh';Mutator={param($r);Add-Content -LiteralPath (Join-Path $r 'CATALOG.md') -Value 'Publisher approval granted.'}},
        [pscustomobject]@{Name='affirmative approval README after ledger refresh';Mutator={param($r);Add-Content -LiteralPath (Join-Path $r 'README.md') -Value 'Publisher approval granted.'}},
        [pscustomobject]@{Name='affirmative approval SOURCE-MANIFEST after ledger refresh';Mutator={param($r);$q=Join-Path $r 'SOURCE-MANIFEST.json';$t=Get-Content -Raw $q;$t=$t.Replace('No approval assertion is made.','No approval assertion is made. Publisher approval granted.');[IO.File]::WriteAllText($q,$t,[Text.Encoding]::UTF8)}},
        [pscustomobject]@{Name='affirmative approval audit surface after ledger refresh';Mutator={param($r);Add-Content -LiteralPath (Join-Path $r 'audit/ASD-STE100-source-study-and-proposal.md') -Value 'Publisher approval granted.'}},
        [pscustomobject]@{Name='mixed approval disclaimer and assertion';Mutator={param($r);Add-Content -LiteralPath (Join-Path $r 'CATALOG.md') -Value 'No approval assertion is made. Publisher approval granted.'}}
    )
    foreach($control in $approvalControls){Invoke-PackRejection $control.Name $control.Mutator 'approval assertion'}
    Invoke-PackApprovalPositive 'truthful negated approval claim' {param($r);Add-Content -LiteralPath (Join-Path $r 'CATALOG.md') -Value 'This is not an approved ASD-STE100 pilot.'}
    $manifestControls=@(
        [pscustomobject]@{Name='SOURCE-MANIFEST exact duplicate';Expected='source manifest exact duplicate';Mutator={param($r);$q=Join-Path $r 'SOURCE-MANIFEST.json';$j=Get-Content -Raw $q|ConvertFrom-Json;$j.skills[1].name=[string]$j.skills[0].name;[IO.File]::WriteAllText($q,($j|ConvertTo-Json -Depth 20),[Text.Encoding]::UTF8)}},
        [pscustomobject]@{Name='SOURCE-MANIFEST case-only duplicate';Expected='source manifest case-only duplicate';Mutator={param($r);$q=Join-Path $r 'SOURCE-MANIFEST.json';$j=Get-Content -Raw $q|ConvertFrom-Json;$j.skills[1].name=([string]$j.skills[0].name).ToUpperInvariant();[IO.File]::WriteAllText($q,($j|ConvertTo-Json -Depth 20),[Text.Encoding]::UTF8)}},
        [pscustomobject]@{Name='catalog row order swap';Expected='order differs from SOURCE-MANIFEST';Mutator={param($r);$q=Join-Path $r 'CATALOG.md';$lines=[IO.File]::ReadAllLines($q);$header=0;for($i=0;$i -lt $lines.Count;$i++){if($lines[$i].Trim() -ceq '| Skill | Purpose/source | Lines | Evidence / bundled reference |'){$header=$i;break}};$tmp=$lines[$header+2];$lines[$header+2]=$lines[$header+3];$lines[$header+3]=$tmp;[IO.File]::WriteAllLines($q,$lines,[Text.Encoding]::UTF8)}},
        [pscustomobject]@{Name='catalog extra row outside canonical table';Expected='unexpected table row';Mutator={param($r);Add-Content -LiteralPath (Join-Path $r 'CATALOG.md') -Value '| [rogue](skills/rogue/SKILL.md) | extra | 1 | extra |'}}
    )
    foreach($control in $manifestControls){Invoke-PackRejection $control.Name $control.Mutator $control.Expected}
    Invoke-ProfileRejection 'profile base skill exact duplicate' {param($p);$p.profiles.core.skills=@($p.profiles.core.skills)+$p.profiles.core.skills[0]} 'base inventory contains duplicate names'
    Invoke-ProfileRejection 'profile base skill case-only duplicate' {param($p);$p.profiles.core.skills=@($p.profiles.core.skills)+([string]$p.profiles.core.skills[0]).ToUpperInvariant()} 'base inventory contains duplicate names'
    Invoke-ArtifactRejection 'seventh release archive declaration' {param($q);$j=Get-Content -Raw $q|ConvertFrom-Json;$j.archives|Add-Member -NotePropertyName 'rogue.zip' -NotePropertyValue ([pscustomobject]@{profile='rogue';sha256=('0'*64);bytes=0});[IO.File]::WriteAllText($q,($j|ConvertTo-Json -Depth 20),[Text.Encoding]::UTF8)} 'exactly enumerate the six canonical archives'
    Invoke-RootRejection 'generated root README material mutation with checksum rehash' {param($q);$b=[IO.File]::ReadAllBytes($q);$old=Get-BytesHash $b;$t=[Text.Encoding]::UTF8.GetString($b).Replace('Choose one profile.','Choose multiple profiles.');$n=[Text.Encoding]::UTF8.GetBytes($t);[IO.File]::WriteAllBytes($q,$n);$c=Join-Path $artifactRoot 'CHECKSUMS.sha256';$ct=Get-Content -Raw $c;[IO.File]::WriteAllText($c,$ct.Replace($old+'  README.md',(Get-BytesHash $n)+'  README.md'),[Text.Encoding]::UTF8)} 'generated contract mismatch'
    Write-Host 'PASS: artifact-backed validator rejection controls and clean package positive control' -ForegroundColor Green
}
finally {
    $resolvedFixture = [IO.Path]::GetFullPath($fixtureRoot)
    $resolvedTemp = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
    if ($resolvedFixture.StartsWith($resolvedTemp) -and (Split-Path $resolvedFixture -Leaf) -like 'lean-agent-validator-*') {
        Remove-Item -LiteralPath $resolvedFixture -Recurse -Force
    }
}
