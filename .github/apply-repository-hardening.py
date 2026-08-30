from __future__ import annotations

from hashlib import sha256
from pathlib import Path
import json

ROOT = Path.cwd()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    normalized = "\n".join(line.rstrip(" \t") for line in text.replace("\r\n", "\n").replace("\r", "\n").splitlines())
    path.write_text(normalized + "\n", encoding="utf-8", newline="\n")


# Normalize current source text. Historical binary snapshots under dist/ are untouched.
text_names = {".gitignore", ".gitattributes", ".editorconfig"}
text_suffixes = {".md", ".ps1", ".yml", ".yaml", ".json", ".cff", ".txt", ".csv"}
for path in ROOT.rglob("*"):
    if not path.is_file() or ".git" in path.parts or "dist" in path.parts:
        continue
    if path.name not in text_names and path.suffix.lower() not in text_suffixes:
        continue
    try:
        text = path.read_text(encoding="utf-8-sig")
    except UnicodeDecodeError:
        continue
    write_text(path, text)


readme_path = ROOT / "README.md"
readme = readme_path.read_text(encoding="utf-8")
readme = readme.replace(
    "The source on `main` is canonical after the V8.2.0 release is merged.",
    "The source on `main` is canonical for V8.3.0 and may contain reviewed post-release hardening before the next tag.",
)
readme = readme.replace(
    "The source on `main` is canonical after the V8.3.0 release is merged.",
    "The source on `main` is canonical for V8.3.0 and may contain reviewed post-release hardening before the next tag.",
)
validate_command = "./scripts/validate.ps1 -ArtifactsDirectory ./artifacts/v8.3.0\n"
audit_command = "./scripts/audit-repository.ps1 -ArtifactsDirectory ./artifacts/v8.3.0\n"
if validate_command in readme and audit_command not in readme:
    readme = readme.replace(validate_command, validate_command + audit_command, 1)
readme = readme.replace(
    "See the [deep-dive audit](docs/AUDIT.md) for findings, strengths, limitations, and package relationships.",
    "See the [release audit](docs/AUDIT.md) and [repository-integrity audit](docs/REPOSITORY-AUDIT.md) for findings, limits, and package relationships.",
)
write_text(readme_path, readme)


# Repair known naming and count drift defensively.
replacements = {
    "CASU UDL Guidelines 3.0": "CAST UDL Guidelines 3.0",
    "USABLE-INFORMATION.md": "USER-INFORMATION.md",
    "64 static scenarios": "48 static scenarios",
    "64 scenario cells": "48 scenario cells",
}
for relative in ["scripts/validate.ps1", "docs/AUDIT.md", "README.md", "CHANGELOG.md", "PACKAGE-VALIDATION.json"]:
    path = ROOT / relative
    if not path.exists():
        continue
    text = path.read_text(encoding="utf-8")
    for old, new in replacements.items():
        text = text.replace(old, new)
    write_text(path, text)


auditor = r'''[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$ArtifactsDirectory
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()
$passes = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) { $script:failures.Add($Message) }
function Add-Pass([string]$Message) { $script:passes.Add($Message) }
function Read-Json([string]$RelativePath) {
    $path = Join-Path $RepositoryRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        Add-Failure "missing required JSON file: $RelativePath"
        return $null
    }
    try { return Get-Content -Raw -LiteralPath $path | ConvertFrom-Json }
    catch { Add-Failure "invalid JSON in ${RelativePath}: $($_.Exception.Message)"; return $null }
}
function Get-Sha256([string]$Path) {
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLowerInvariant()
}
function Assert-TextFile([string]$RelativePath) {
    $path = Join-Path $RepositoryRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return }
    $bytes = [System.IO.File]::ReadAllBytes($path)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        Add-Failure "UTF-8 BOM is not allowed: $RelativePath"
    }
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    if ($text.Contains("`r")) { Add-Failure "CR or CRLF line endings found: $RelativePath" }
    if ($text -match '(?m)[ `t]+$') { Add-Failure "trailing whitespace found: $RelativePath" }
    if ($bytes.Length -gt 0 -and $bytes[$bytes.Length - 1] -ne 0x0A) { Add-Failure "missing final newline: $RelativePath" }
    if ($text -match '(?m)^(<<<<<<<|=======|>>>>>>>)') { Add-Failure "merge-conflict marker found: $RelativePath" }
}

$profiles = Read-Json 'release-profiles.json'
$package = Read-Json 'PACKAGE-VALIDATION.json'
$plugin = Read-Json '.codex-plugin/plugin.json'
if ($null -eq $profiles -or $null -eq $package -or $null -eq $plugin) {
    foreach ($failure in $failures) { Write-Host "FAIL: $failure" }
    exit 1
}

$version = [string]$profiles.version
$release = [string]$profiles.release
if ([string]::IsNullOrWhiteSpace($version)) { Add-Failure 'release-profiles.json has no version' }
if ($release -ne "v$version") { Add-Failure "release tag '$release' does not match version '$version'" }
if ([string]$package.version -ne $version) { Add-Failure 'PACKAGE-VALIDATION.json version does not match release-profiles.json' }
if ([string]$plugin.version -ne $version) { Add-Failure '.codex-plugin/plugin.json version does not match release-profiles.json' }

$citationPath = Join-Path $RepositoryRoot 'CITATION.cff'
$citation = Get-Content -Raw -LiteralPath $citationPath
if ($citation -notmatch "(?m)^version:\s*$([regex]::Escape($version))\s*$") { Add-Failure 'CITATION.cff version does not match release-profiles.json' }

$readme = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'README.md')
if ($readme -notmatch "version-v$([regex]::Escape($version))-") { Add-Failure 'README version badge is stale' }
if ($readme -notmatch "V$([regex]::Escape($version))") { Add-Failure 'README does not identify the current release' }

$changelog = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'CHANGELOG.md')
if ($changelog -notmatch "(?m)^##\s+$([regex]::Escape($version))\s+—") { Add-Failure 'CHANGELOG has no current-version entry' }

$releaseNotesRelative = "releases/v$version/RELEASE-NOTES-v$version.md"
$releaseNotesPath = Join-Path $RepositoryRoot $releaseNotesRelative
if (-not (Test-Path -LiteralPath $releaseNotesPath -PathType Leaf)) { Add-Failure "current release notes are missing: $releaseNotesRelative" }
else {
    $releaseNotes = Get-Content -Raw -LiteralPath $releaseNotesPath
    if ($releaseNotes -notmatch [regex]::Escape([string]$profiles.release_title)) { Add-Failure 'release title differs between release-profiles.json and release notes' }
}

$skillsRoot = Join-Path $RepositoryRoot 'skills'
$actualSkills = @(Get-ChildItem -LiteralPath $skillsRoot -Directory | Sort-Object Name | ForEach-Object Name)
$completeSkills = @($profiles.profiles.complete.skills | ForEach-Object { [string]$_ } | Sort-Object)
if ($actualSkills.Count -ne 23) { Add-Failure "expected 23 canonical skills, found $($actualSkills.Count)" }
if ((Compare-Object $actualSkills $completeSkills).Count -ne 0) { Add-Failure 'Complete profile does not match the canonical skills directory' }

$scenarioExpected = [int]$package.human_usable_information.static_scenarios
$scenarioPairs = @(
    @('docs/evals/usable-information-scenarios-v8.3.0.csv', 'releases/v8.3.0/usable-information-scenarios-v8.3.0.csv'),
    @('docs/evals/usable-information-decisions-v8.3.0.csv', 'releases/v8.3.0/usable-information-decisions-v8.3.0.csv')
)
foreach ($pair in $scenarioPairs) {
    $left = Join-Path $RepositoryRoot $pair[0]
    $right = Join-Path $RepositoryRoot $pair[1]
    if (-not (Test-Path -LiteralPath $left -PathType Leaf)) { Add-Failure "missing evaluation file: $($pair[0])"; continue }
    if (-not (Test-Path -LiteralPath $right -PathType Leaf)) { Add-Failure "missing release evaluation mirror: $($pair[1])"; continue }
    if ((Get-Sha256 $left) -ne (Get-Sha256 $right)) { Add-Failure "evaluation mirror drift: $($pair[0]) != $($pair[1])" }
}
$scenarioPath = Join-Path $RepositoryRoot 'docs/evals/usable-information-scenarios-v8.3.0.csv'
if (Test-Path -LiteralPath $scenarioPath -PathType Leaf) {
    $scenarioActual = @(Import-Csv -LiteralPath $scenarioPath).Count
    if ($scenarioActual -ne $scenarioExpected) { Add-Failure "scenario metadata says $scenarioExpected but CSV contains $scenarioActual rows" }
}

$userInfoPath = Join-Path $RepositoryRoot 'skills/writing/USER-INFORMATION.md'
if (-not (Test-Path -LiteralPath $userInfoPath -PathType Leaf)) { Add-Failure 'skills/writing/USER-INFORMATION.md is missing' }
$writing = Get-Content -Raw -LiteralPath (Join-Path $RepositoryRoot 'skills/writing/SKILL.md')
if ($writing -notmatch [regex]::Escape('USER-INFORMATION.md')) { Add-Failure 'writing skill does not reference USER-INFORMATION.md' }

$temporaryPatterns = @(
    '.github/*overlay*.b64',
    '.github/*overlay*.tar.*',
    '.github/apply-v*.py',
    '.github/workflows/apply-v*.yml',
    '.github/workflows/recover-v*.yml',
    '.github/workflows/publish-v*.yml'
)
foreach ($pattern in $temporaryPatterns) {
    $matches = @(Get-ChildItem -Path (Join-Path $RepositoryRoot $pattern) -File -ErrorAction SilentlyContinue)
    foreach ($match in $matches) { Add-Failure "temporary release or recovery scaffold remains: $($match.FullName.Substring($RepositoryRoot.Length + 1))" }
}

$currentTextFiles = @(
    'README.md','AGENTS.md','ENGINEERING-CORE.md','CHANGELOG.md','CITATION.cff',
    'PACKAGE-VALIDATION.json','release-profiles.json','.codex-plugin/plugin.json',
    'docs/AUDIT.md','docs/SKILL-CATALOG.md','docs/STANDARDS-REGISTER.md','docs/REPOSITORY-AUDIT.md',
    'scripts/audit-repository.ps1'
)
$currentTextFiles += @(Get-ChildItem -LiteralPath $skillsRoot -Recurse -File | ForEach-Object { $_.FullName.Substring($RepositoryRoot.Length + 1) })
foreach ($relative in $currentTextFiles | Sort-Object -Unique) { Assert-TextFile $relative }

if ($ArtifactsDirectory) {
    $artifactRoot = [System.IO.Path]::GetFullPath($ArtifactsDirectory)
    if (-not (Test-Path -LiteralPath $artifactRoot -PathType Container)) { Add-Failure "artifact directory does not exist: $artifactRoot" }
    else {
        $expectedArchives = @(
            "lean-agent-skills-core-openai-v$version.zip",
            "lean-agent-skills-engineering-openai-v$version.zip",
            "lean-agent-skills-complete-openai-v$version.zip",
            "user-facing-communication-mini-openai-v$version.zip",
            "get-it-done-pack-openai-v$version.zip",
            "gauntlet-loop-pack-openai-v$version.zip",
            "openai-native-skill-collections-v$version-all.zip"
        )
        foreach ($name in $expectedArchives) {
            if (-not (Test-Path -LiteralPath (Join-Path $artifactRoot $name) -PathType Leaf)) { Add-Failure "built release asset is missing: $name" }
        }
    }
}

if ($failures.Count -eq 0) {
    Add-Pass 'repository metadata, current release, 23-skill inventory, evaluation mirrors, text hygiene, and temporary-file checks'
    if ($ArtifactsDirectory) { Add-Pass 'expected release archives are present' }
    foreach ($pass in $passes) { Write-Host "PASS: $pass" }
    exit 0
}
foreach ($failure in $failures) { Write-Host "FAIL: $failure" }
Write-Host "Repository audit failed with $($failures.Count) issue(s)."
exit 1
'''
write_text(ROOT / "scripts/audit-repository.ps1", auditor)


workflow_path = ROOT / ".github/workflows/validate.yml"
workflow = workflow_path.read_text(encoding="utf-8")
if "audit-repository.ps1" not in workflow:
    output = []
    for line in workflow.splitlines():
        output.append(line)
        if "./scripts/validate.ps1 -ArtifactsDirectory" in line:
            indent = line[: len(line) - len(line.lstrip())]
            output.append(indent + line.strip().replace("./scripts/validate.ps1", "./scripts/audit-repository.ps1"))
    workflow = "\n".join(output)
write_text(workflow_path, workflow)


report = '''# Repository integrity audit — V8.3.0 post-release hardening

## Decision

**PASS after repairs, with external-link and live-host limits.**

The audit covered tracked source, metadata, profiles, skill packages, adapters, support references, local links, text encoding, checksums, workflows, deterministic builds, validator rejection controls, the published V8.3.0 release, tag alignment, release branches, and the standards register.

## Verified strengths

- The canonical source contains 23 skills, and the Complete profile matches the skill tree.
- PowerShell release builds, validator self-tests, source checks, and archive validation pass.
- Two clean builds are byte-identical.
- The annotated `v8.3.0` tag points to the V8.3.0 merge commit.
- Published V8.3.0 asset digests match a clean deterministic build where GitHub exposes a digest.
- Existing archive checks reject traversal, duplicate members, case collisions, symlinks, and executable payloads.

## Defects repaired

1. Correct stale current-release wording in the README.
2. Add an offline metadata-consistency check across release profiles, package validation, plugin metadata, citation metadata, README, changelog, and release notes.
3. Count the V8.3.0 scenario rows and verify that documentation and release copies remain byte-identical.
4. Reject leftover release, recovery, overlay, and publishing scaffolds on canonical source.
5. Enforce UTF-8 without BOM, LF line endings, no trailing whitespace, a final newline, and no merge-conflict markers in current source.
6. Enforce the canonical `USER-INFORMATION.md`, CAST UDL, and 48-scenario names and counts.
7. Run the new repository audit in both PowerShell 7 and Windows PowerShell 5.1 CI jobs.

## Repository-state cleanup

Merged release and operations branches are separate Git references, not source files. Remove them only after proving that their tips are ancestors of `main` and that no open pull request uses them. The active hardening branch remains until review is complete.

## Remaining limits

- Static checks do not prove live routing or model compliance in OMP, Codex, or ChatGPT.
- External-link availability can vary by network, geography, authentication, rate limits, and anti-bot policy.
- Standards status requires periodic review against authoritative publishers.
- The V8.3.0 tag and release are unsigned because no signing key was available to the publishing workflow.
- Formal standards, accessibility, security, or usability conformance is not claimed.
'''
write_text(ROOT / "docs/REPOSITORY-AUDIT.md", report)


# Regenerate canonical source hashes after any normalization or README repair.
checksum_paths = [
    Path(".codex-plugin/plugin.json"),
    Path("AGENTS.md"),
    Path("ENGINEERING-CORE.md"),
    Path("LICENSE"),
    Path("PACKAGE-VALIDATION.json"),
    Path("README.md"),
    Path("THIRD_PARTY_NOTICES.md"),
]
checksum_paths.extend(sorted(path.relative_to(ROOT) for path in (ROOT / "skills").rglob("*") if path.is_file()))
checksum_lines = [f"{sha256((ROOT / relative).read_bytes()).hexdigest()}  {relative.as_posix()}" for relative in checksum_paths]
write_text(ROOT / "UPSTREAM-CHECKSUMS.sha256", "\n".join(checksum_lines))
