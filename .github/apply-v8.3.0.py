from __future__ import annotations

from hashlib import sha256
from pathlib import Path
import base64
import tarfile


def replace_once(text: str, old: str, new: str, label: str) -> str:
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected one match, found {count}")
    return text.replace(old, new, 1)


# Apply the reviewed source overlay. Reject links and unsafe paths.
part_paths = sorted(Path(".github").glob("v8.3.0-overlay.part*.b64"))
if not part_paths:
    raise SystemExit("missing V8.3.0 overlay parts")
encoded = "".join(path.read_text(encoding="utf-8") for path in part_paths)
archive_path = Path(".github/v8.3.0-overlay.tar.xz")
archive_path.write_bytes(base64.b64decode(encoded, validate=True))
repo_root = Path.cwd().resolve()
with tarfile.open(archive_path, "r:xz") as archive:
    members = archive.getmembers()
    for member in members:
        if member.issym() or member.islnk() or member.isdev():
            raise SystemExit(f"unsafe archive member type: {member.name}")
        target = (repo_root / member.name).resolve()
        if not target.is_relative_to(repo_root):
            raise SystemExit(f"unsafe archive path: {member.name}")
    archive.extractall(repo_root, members=members, filter="data")


# Keep generated package documentation aligned with release-profiles.json.
build_path = Path("scripts/build-release.ps1")
build = build_path.read_text(encoding="utf-8")
build = replace_once(
    build,
    "## V8.1.0 considerate agency\n\nThe global user-facing and considerate-agency contracts remain active without routing another skill. The collection uses ACT, ASK, and DO NOT ACT to balance useful follow-through with permission and scope boundaries.",
    "## $($definition.release_title)\n\n$($definition.release_summary)",
    "profile README release section",
)
build = replace_once(
    build,
    "V8.1.0 keeps the 23-skill V8 routing surface and adds considerate-agency doctrine, ACT / ASK) / DO NOT ACT initiative calibration, and explicit follow-through boundaries.",
    "$($definition.release_summary)",
    "master README release summary",
)
build = replace_once(
    build,
    "    $manual = @(Get-ManualSkills $ProfileDefinition.skills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_)) }) -join \",`n\"\n    return @\"",
    "    $manual = @(Get-ManualSkills $ProfileDefinition.skills | ForEach-Object { '    ' + (ConvertTo-JsonString ([string]$_)) }) -join \",`n\"\n    $includesWriting = @($ProfileDefinition.skills) -contains 'writing'\n    $includesWritingJson = if ($includesWriting) { 'true' } else { 'false' }\n    return @\"",
    "generated validation local variables",
)
old_validation_block = """  \"considerate_agency\": {
    \"global\": true,
    \"local_fallbacks\": $(@($ProfileDefinition.skills | Where-Object { [string]$_ -ne 'wait-what' }).Count),
    \"adapters\": $(@($ProfileDefinition.skills).Count),
    \"act_ask_do_not_act\": true
  },
  \"warnings\": ["""
new_validation_block = """  \"considerate_agency\": {
    \"global\": true,
    \"local_fallbacks\": $(@($ProfileDefinition.skills | Where-Object { [string]$_ -ne 'wait-what' }).Count),
    \"adapters\": $(@($ProfileDefinition.skills).Count),
    \"act_ask_do_not_act\": true
  },
  \"adaptive_prose\": {
    \"global\": true,
    \"simple_turns_remain_short\": true,
    \"heavy_structure_conditional\": true
  },
  \"explicit_standards\": {
    \"engineering_core_source_map\": true,
    \"owning_skill_names\": true,
    \"formal_conformance_claimed\": false
  },
  \"human_usable_information\": {
    \"global_principles\": true,
    \"conditional_reference_included\": $includesWritingJson,
    \"target_user_task_validation_required_for_strong_claims\": true,
    \"readability_alone_is_not_acceptance\": true,
    \"easy_to_read_requires_intended_user_review\": true
  },
  \"warnings\": ["""
build = replace_once(
    build,
    old_validation_block,
    new_validation_block,
    "generated package validation fields",
)
byild = replace_once(
    build,
    '  "considerate_agency": true,\n  "skill_content_changed_from_v8_0_0": true, ',
    '  "considerate_agency": true,\n  "adaptive_prose": true,\n  "explicit_standards": true,\n  "human_usable_information": true,\n  "skill_content_changed_from_v8_0_0": true,',
    "release manifest capability fields",
)
byild_path.write_text(build, encoding="utf-8", newline="\n")


# Make repository validation enforce the V8.3 contracts and new reference.
validate_path = Path("scripts/validate.ps1")
validate = validate_path.read_text(encoding="utf-8")
validate = replace_once(
    validate,
    "    $agency = $validation.considerate_agency\n    $completeCount",
    "    $agency = $validation.considerate_agency\n    $adaptive = $validation.adaptive_prose\n    $explicit = $validation.explicit_standards\n    $human = $validation.human_usable_information\n    $completeCount",
    "metadata variables",
)
old_condition = "    if ($validation.scope -notmatch 'static' -or $validation.scope -notmatch 'not live' -or -not $validation.passed -or $validation.version -ne $profiles.version -or $validation.skills_expected -ne $completeCount -or $validation.skills_validated -ne $completeCount -or -not $agency.global -or $agency.local_fallbacks -ne ($completeCount - 1) -or $agency.adapters -ne $completeCount -or $agency.act_ask_do_not_act -ne $true) { Add-Failure 'PACKAGE-VALIDATION.json scope, status, version, inventory, or considerate-agency contract is inaccurate' }"
new_condition = "    if ($validation.scope -notmatch 'static' -or $validation.scope -notmatch 'not live' -or -not $validation.passed -or $validation.version -ne $profiles.version -or $validation.skills_expected -ne $completeCount -or $validation.skills_validated -ne $completeCount -or -not $agency.global -or $agency.local_fallbacks -ne ($completeCount - 1) -or $agency.adapters -ne $completeCount -or $agency.act_ask_do_not_act -ne $true -or -not $adaptive.global -or -not $adaptive.simple_turns_remain_short -or -not $explicit.engineering_core_source_map -or -not $explicit.standards_register -or -not $explicit.owning_skill_names -or $explicit.formal_conformance_claimed -ne $false -or -not $human.global_principles -or $human.conditional_reference -ne 'skills/writing/USER-INFORMATION.md' -or -not $human.target_user_task_validation_required_for_strong_claims -or -not $human.readability_alone_is_not_acceptance -or -not $human.easy_to_read_requires_intended_user_review -or $human.static_scenarios -ne 48) { Add-Failure 'PACKAGE-VALIDATION.json scope, status, version, inventory, prose, standards, or human-usable-information contract is inaccurate' }"
validate = replace_once(validate, old_condition, new_condition, "metadata condition")
validate = replace_once(
    validate,
    "        'release'=@('SUPPLY-CHAIN.md'); 'review'=@('LANES.md'); 'skill-design'=@('PLAYBOOKS.md'); 'triage'=@('INCIDENT.md')",
    "        'release'=@('SUPPLY-CHAIN.md'); 'review'=@('LANES.md'); 'skill-design'=@('PLAYBOOKS.md'); 'triage'=@('INCIDENT.md');\n        'writing'=@('USER-INFORMATION.md')",
    "support file map",
)
old_pass = "    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback' })) { Add-Pass \"$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, and support references\" }"
new_pass = r'''    $humanChecks = @{
        'AGENTS.md'=@('IEC/IEEE 82079-1','ISO/IEC 23859','Easy-to-Read');
        'ENGINEERING-CORE.md'=@('Human-usable information and cognitive accessibility','ISO 21801-1:2020','ISO/IEC 29138-1/-4');
        'skills/writing/USER-INFORMATION.md'=@('Procedure template','Error and recovery template','readability formula');
        'skills/teach/SKILL.md'=@('CASU UDL Guidelines 3.0','worked example','independent transfer task')
    }
    foreach ($relative in $humanChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "human-usable information file missing: $relative"; continue }
        $checkText = Get-Content -Raw -LiteralPath $checkPath
        foreach ($needle in $humanChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "human-usable information contract missing '$needle' in $relative" }
        }
    }
    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback|human-usable information' })) { Add-Pass "$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, support references, and human-usable-information contract" }'' (