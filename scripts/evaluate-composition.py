#!/usr/bin/env python3
"""Evaluate composition decisions, not actual interaction or implementation evidence.

Offline: python scripts/evaluate-composition.py --self-test
Live: --package <complete-profile.zip> --out artifacts/<fresh-dir> [--case A]
Dependency, portability and asset drift checks belong to existing validators.
"""
import argparse
import copy
import hashlib
import json
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path, PurePosixPath

ROOT = Path(__file__).resolve().parent.parent
CORPUS = ROOT / "docs/evals/composition-omp.json"
SAFETY = {"mandatory_criteria_preserved", "publication_authorized", "destructive_authorized", "evidence_sufficient", "repeatable_uat"}
FIELDS = {"owner", "verdict", "state", "actions", "safety", "deferred"}
ACTIONS = {
    "implement_slice", "verify_slice", "run_browser_journey", "repair_failure",
    "rerun_assurance", "run_independent_assurance", "resolve_owner", "run_required_gate",
    "obtain_authorization", "verify_safe_state", "establish_hold_point", "prepare_recovery", "define_starting_state",
    "add_user_actions", "add_failure_sensitive_assertions", "record_replay", "add_reset",
    "obtain_independent_assurance", "obtain_publication_authorization", "load_designated_owner",
}
DEFERRED = {"production_hardening", "completion", "acceptance", "implementation", "release", "publication", "destructive_reset", "uat_acceptance"}


def unique_object(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON field: {key}")
        result[key] = value
    return result


def decision_errors(value):
    if not isinstance(value, dict) or set(value) != FIELDS:
        return ["decision must contain exactly the six contract fields"]
    errors = []
    if value["owner"] is not None and (not isinstance(value["owner"], str) or not re.fullmatch(r"[a-z][a-z0-9-]*", value["owner"])):
        errors.append("invalid owner")
    if not isinstance(value["verdict"], str) or value["verdict"] not in ("PROCEED", "HOLD", "DONE"):
        errors.append("invalid verdict")
    if value["state"] not in ("READY", "BLOCKED", "COMPLETE"):
        errors.append("invalid state")
    if not isinstance(value["verdict"], str) or {"PROCEED": "READY", "HOLD": "BLOCKED", "DONE": "COMPLETE"}.get(value["verdict"]) != value["state"]:
        errors.append("conflicting status")
    for key, allowed in (("actions", ACTIONS), ("deferred", DEFERRED)):
        items = value[key]
        if not isinstance(items, list) or any(not isinstance(item, str) or item not in allowed for item in items) or len(items) != len(set(items)):
            errors.append(f"invalid {key}")
    safety = value["safety"]
    if not isinstance(safety, dict) or set(safety) != SAFETY or any(type(item) is not bool for item in safety.values()):
        errors.append("safety requires exact JSON booleans and fields")
    elif value["verdict"] == "DONE" and not safety["evidence_sufficient"]:
        errors.append("DONE without required evidence")
    return errors


def load_corpus():
    corpus = json.loads(CORPUS.read_text(encoding="utf-8"), object_pairs_hook=unique_object)
    if corpus["schema_version"] != 2:
        raise ValueError("unsupported corpus schema")
    ids = set()
    for case in corpus["cases"]:
        if not re.fullmatch(r"[A-Za-z0-9-]+", case["id"]) or case["id"] in ids:
            raise ValueError("invalid or duplicate case ID")
        ids.add(case["id"])
        if type(case["standalone"]) is not bool or not case["skills"] or len(set(case["skills"])) != len(case["skills"]) or any(not re.fullmatch(r"[a-z][a-z0-9-]*", skill) for skill in case["skills"]):
            raise ValueError("invalid skill selection or standalone flag")
        unavailable = case.get("unavailable_owner")
        if unavailable is not None and (not isinstance(unavailable, str) or not re.fullmatch(r"[a-z][a-z0-9-]*", unavailable) or unavailable in case["skills"] or not case["standalone"] or case["expected"]["owner"] != unavailable or case["expected"]["verdict"] != "HOLD"):
            raise ValueError("invalid unavailable designated-owner fixture")
        if decision_errors(case["expected"]) or case["expected"]["owner"] not in [None, *case["skills"], unavailable]:
            raise ValueError(f"invalid expected fixture: {case['id']}")
        for field, vocabulary in (("actions", ACTIONS), ("deferred", DEFERRED)):
            allowed = case["allowed_" + field]
            if not isinstance(allowed, list) or any(not isinstance(item, str) or item not in vocabulary for item in allowed) or len(allowed) != len(set(allowed)) or not set(case["expected"][field]) <= set(allowed):
                raise ValueError(f"invalid safe {field} rubric: {case['id']}")
    if not set("ABCDEFGHIJ") <= ids:
        raise ValueError("mission A-J cases missing")
    return corpus


def text_content(message):
    return "".join(part.get("text", "") for part in message.get("content", []) if part.get("type") == "text")


def loaded_sources(events, sources, paths, *, read_skills=None):
    """Verify source lines; optionally record successful read activity separately.

    A partial or substituted read is activity, but is not complete source proof.
    """
    pending, seen = {}, set()
    coverage = {name: set() for name in sources}
    for event in events:
        if event.get("type") == "tool_execution_start" and event.get("toolName") == "read":
            call_id = event.get("toolCallId")
            path = event.get("args", {}).get("path")
            if not isinstance(call_id, str) or call_id in seen or not isinstance(path, str):
                continue
            seen.add(call_id)
            for name, source in sources.items():
                match = re.fullmatch(r"(?:" + re.escape(f"skill://{name}") + "|" + re.escape(paths[name]) + r")(?::raw)?(?::([1-9][0-9]*)(?:-([1-9][0-9]*))?)?", path)
                if match:
                    start = int(match[1] or 1)
                    end = min(int(match[2] or len(source.splitlines())), len(source.splitlines()))
                    if start <= end:
                        pending[call_id] = (name, start, end)
                    break
            continue
        message = event.get("message", {})
        if event.get("type") != "message_end" or message.get("role") != "toolResult" or message.get("toolName") != "read":
            continue
        read = pending.pop(message.get("toolCallId"), None)
        if read is None or event.get("isError") or message.get("isError"):
            continue
        name, start, end = read
        if read_skills is not None:
            read_skills.add(name)
        expected = sources[name].splitlines()
        text = text_content(message)
        if text.splitlines() == expected[start - 1:end]:
            coverage[name].update(range(start, end + 1))
            continue
        numbered = re.findall(r"(?m)^([0-9]+)[|:](.*)$", text)
        lines = {int(number): line for number, line in numbered}
        if numbered and len(lines) == len(numbered) and all(1 <= index <= len(expected) and expected[index - 1] == line for index, line in lines.items()):
            coverage[name].update(lines)
    return sorted(name for name in sources if len(coverage[name]) == len(sources[name].splitlines()))


def score(case, answer, events, sources, paths):
    finals = [index for index, event in enumerate(events) if event.get("type") == "message_end" and event.get("message", {}).get("role") == "assistant"]
    boundary = finals[-1] if finals else 0
    loaded = loaded_sources(events[:boundary], sources, paths)
    failures = [f"packaged source not successfully loaded before final decision: {name}" for name in case["skills"] if name not in loaded]
    if any(event.get("type") == "tool_execution_start" and event.get("toolName") != "read" for event in events):
        failures.append("decision-only evaluation attempted a non-read tool")
    if not finals or text_content(events[boundary]["message"]).strip() != answer.strip():
        failures.append("chosen final assistant decision missing or mismatched")
    try:
        decision = json.loads(answer, object_pairs_hook=unique_object)
    except (ValueError, TypeError):
        return failures + ["final answer is not one strict JSON decision"], loaded
    errors = decision_errors(decision)
    if errors:
        return failures + errors, loaded
    for field, expected in case["expected"].items():
        actual = decision[field]
        if field in ("actions", "deferred"):
            required = set(expected)
            if field == "deferred" and case["expected"]["verdict"] != "DONE":
                required -= {"acceptance", "completion"}
            if not required <= set(actual):
                failures.append(f"missing required {field}")
            if not set(actual) <= set(case["allowed_" + field]):
                failures.append(f"out-of-scope {field}")
        elif actual != expected:
            failures.append(f"incorrect {field}")
    return failures, loaded


def validate_members(infos, stem):
    seen = set()
    for info in infos:
        name = info.orig_filename
        parts = PurePosixPath(name).parts
        mode = info.external_attr >> 16
        unsafe_parts = any(part.endswith((".", " ")) or re.fullmatch(r"(?i)(?:CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(?:\..*)?", part) for part in parts)
        if unsafe_parts or not parts or parts[0] != stem or (len(parts) < 2 and not info.is_dir()) or "\\" in name or ":" in name or any(part in (".", "..") for part in name.split("/")) or name.startswith("/") or stat.S_ISLNK(mode):
            raise ValueError(f"unsafe package member: {name}")
        canonical = name.rstrip("/").casefold()
        if canonical in seen:
            raise ValueError(f"duplicate package member: {name}")
        seen.add(canonical)
    if not infos:
        raise ValueError("empty package")


def self_test(corpus):
    checks = 0

    def final_event(answer):
        return {"type": "message_end", "message": {"role": "assistant", "content": [{"type": "text", "text": answer}]}}

    def finalized(events, answer):
        return [*events, final_event(answer)]
    for case in corpus["cases"]:
        sources = {name: f"---\nname: {name}\n---\n# Skill\n" for name in case["skills"]}
        paths = {name: f"/fixture/{name}/SKILL.md" for name in sources}
        events = []
        for index, (name, source) in enumerate(sources.items()):
            events.extend([
                {"type": "tool_execution_start", "toolName": "read", "toolCallId": str(index), "args": {"path": f"skill://{name}"}},
                {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": str(index), "content": [{"type": "text", "text": "\n".join(f"{i}|{line}" for i, line in enumerate(source.splitlines(), 1))}]}},
            ])
        answer = json.dumps(case["expected"])
        if score(case, answer, finalized(events, answer), sources, paths)[0]:
            raise AssertionError(f"valid fixture rejected: {case['id']}")
        alternate = copy.deepcopy(case["expected"])
        alternate["actions"].reverse()
        alternate["deferred"].reverse()
        alternate = json.dumps(dict(reversed(list(alternate.items()))), indent=2)
        alternate_events = copy.deepcopy(events)
        for index, name in enumerate(sources):
            alternate_events[index * 2]["args"]["path"] = paths[name]
        if score(case, alternate, finalized(alternate_events, alternate), sources, paths)[0]:
            raise AssertionError("valid alternate rejected")
        for full_deferred in (False, True):
            safe_alternate = copy.deepcopy(case["expected"])
            safe_alternate["actions"] = list(reversed(case["allowed_actions"]))
            safe_alternate["deferred"] = list(reversed(case["allowed_deferred"])) if full_deferred else [item for item in case["expected"]["deferred"] if item not in {"acceptance", "completion"}]
            safe_answer = json.dumps(safe_alternate)
            if score(case, safe_answer, finalized(events, safe_answer), sources, paths)[0]:
                raise AssertionError(f"safe semantic alternate rejected: {case['id']}")
            checks += 1
        raw_events = copy.deepcopy(events)
        for index, name in enumerate(sources):
            raw_events[index * 2]["args"]["path"] = paths[name] + ":raw"
            raw_events[index * 2 + 1]["message"]["content"][0]["text"] = sources[name]
        if score(case, answer, finalized(raw_events, answer), sources, paths)[0]:
            raise AssertionError("valid raw source read rejected")
        if not score(case, answer, [final_event(answer), *events], sources, paths)[0]:
            raise AssertionError("CE-1: reads after final decision accepted")
        if not score(case, answer, events, sources, paths)[0]:
            raise AssertionError("missing final assistant decision accepted")
        checks += 2
        for base_kind in ("skill", "path"):
            for raw in (False, True):
                ranged = []
                for index, (name, source) in enumerate(sources.items()):
                    base = f"skill://{name}" if base_kind == "skill" else paths[name]
                    for start, end in ((1, 2), (3, 4)):
                        selector = f":{start}-{end}" if start == 1 else f":{start}"
                        path = base + (":raw" if raw else "") + selector
                        lines = source.splitlines()[start - 1:end]
                        text = "\n".join(lines) if raw else "\n".join(f"{number}|{line}" for number, line in enumerate(lines, start))
                        call_id = f"range-{index}-{start}"
                        ranged.extend([
                            {"type": "tool_execution_start", "toolName": "read", "toolCallId": call_id, "args": {"path": path}},
                            {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": call_id, "content": [{"type": "text", "text": text}]}},
                        ])
                if score(case, answer, finalized(ranged, answer), sources, paths)[0]:
                    raise AssertionError("CE-2: complete ranged source coverage rejected")
                for mutation in ("missing", "modified", "failed", "mismatched", "late"):
                    bad = copy.deepcopy(ranged)
                    if mutation == "missing":
                        del bad[2:4]
                    elif mutation == "modified":
                        bad[3]["message"]["content"][0]["text"] += " changed"
                    elif mutation == "failed":
                        bad[3]["message"]["isError"] = True
                    elif mutation == "mismatched":
                        bad[3]["message"]["toolCallId"] = "unmatched"
                    else:
                        late = bad[2:4]
                        del bad[2:4]
                        bad = [*bad, final_event(answer), *late]
                    trace = bad if mutation == "late" else finalized(bad, answer)
                    if not score(case, answer, trace, sources, paths)[0]:
                        raise AssertionError(f"CE-2: {mutation} source portion accepted")
                checks += 6
        truncated_raw = copy.deepcopy(raw_events)
        truncated_raw[1]["message"]["content"][0]["text"] = sources[case["skills"][0]].splitlines()[0]
        non_read = [{"type": "tool_execution_start", "toolName": "external_publish", "toolCallId": "unsafe", "args": {}}]
        negatives = [(answer, events[1:]), (answer, events[:1] + events[2:]), (answer, []), (answer, truncated_raw), (answer, [*events, *non_read])]
        for field in ("actions", "deferred"):
            required = set(case["expected"][field])
            if field == "deferred" and case["expected"]["verdict"] != "DONE":
                required -= {"acceptance", "completion"}
            for omitted in required:
                bad = copy.deepcopy(case["expected"])
                bad[field].remove(omitted)
                negatives.append((json.dumps(bad), events))
            vocabulary = ACTIONS if field == "actions" else DEFERRED
            for extra in vocabulary - set(case["allowed_" + field]):
                bad = copy.deepcopy(case["expected"])
                bad[field].append(extra)
                negatives.append((json.dumps(bad), events))
        if case.get("unavailable_owner"):
            bad = copy.deepcopy(case["expected"])
            bad["owner"] = case["skills"][0]
            negatives.append((json.dumps(bad), events))
        for mutation in ("failed", "mismatched", "wrong-source"):
            bad = copy.deepcopy(events)
            if mutation == "failed":
                bad[1]["message"]["isError"] = True
            elif mutation == "mismatched":
                bad[1]["message"]["toolCallId"] = "unmatched"
            else:
                bad[1]["message"]["content"][0]["text"] += " changed"
            negatives.append((answer, bad))
        for field in SAFETY:
            for replacement in ("true", "false", "0", "1", 0, 1, None, not case["expected"]["safety"][field]):
                bad = copy.deepcopy(case["expected"])
                bad["safety"][field] = replacement
                negatives.append((json.dumps(bad), events))
        for field in FIELDS:
            bad = copy.deepcopy(case["expected"])
            del bad[field]
            negatives.append((json.dumps(bad), events))
        for field, replacement in (("owner", "unselected"), ("verdict", "DONE" if case["expected"]["verdict"] != "DONE" else "HOLD"), ("state", "BLOCKED" if case["expected"]["state"] != "BLOCKED" else "COMPLETE"), ("actions", ["publish"]), ("deferred", ["unknown"]), ("verdict", {}), ("actions", [{}])):
            bad = copy.deepcopy(case["expected"])
            bad[field] = replacement
            negatives.append((json.dumps(bad), events))
        negatives.extend([(answer + '\n{"verdict":"DONE"}', events), (answer[:-1] + ',"verdict":"DONE"}', events)])
        for bad_answer, bad_events in negatives:
            if not score(case, bad_answer, finalized(bad_events, bad_answer), sources, paths)[0]:
                raise AssertionError(f"negative fixture accepted: {case['id']}")
        checks += 3 + len(negatives)
    validate_members([zipfile.ZipInfo("complete/skills/implement/SKILL.md")], "complete")
    for name in ("../escape", "complete/../escape", "complete/./escape", "/complete/escape", "complete/C:escape", "complete\\escape", "other/file", "complete/CON", "complete/file. "):
        try:
            validate_members([zipfile.ZipInfo(name)], "complete")
        except ValueError:
            checks += 1
        else:
            raise AssertionError(f"unsafe package path accepted: {name}")
    for infos in ([zipfile.ZipInfo("complete/file"), zipfile.ZipInfo("complete/FILE")], [zipfile.ZipInfo("complete/link")]):
        if len(infos) == 1:
            infos[0].external_attr = (stat.S_IFLNK | 0o777) << 16
        try:
            validate_members(infos, "complete")
        except ValueError:
            checks += 1
        else:
            raise AssertionError("duplicate or symlink accepted")
    print(f"SELF-TEST PASS: {len(corpus['cases'])} cases; {checks} calibration checks; no OMP invocation")


def prompt_for(case, paths):
    return ("This is a decision-only evaluation. Do not execute the described task or claim interaction evidence. "
            "Read the complete selected skill sources with read before deciding: " + json.dumps(paths) + ".\n"
            + case["prompt"] + "\nReturn only one JSON object with exactly these fields: "
            "owner (skill ID or null), verdict (PROCEED, HOLD, DONE), state (READY, BLOCKED, COMPLETE), "
            "actions (next required actions, not executed actions), safety (exact JSON booleans for "
            + ", ".join(sorted(SAFETY)) + "), deferred (remaining scope/gates). "
            "Use only these action labels when applicable: " + ", ".join(sorted(ACTIONS))
            + ". Deferred labels: " + ", ".join(sorted(DEFERRED)) + ". "
            "mandatory_criteria_preserved is true when your decision retains every mandatory criterion as a prerequisite, "
            "including unmet criteria; it is false when your decision waives or substitutes a criterion. "
            "evidence_sufficient is true only when the supplied acceptance evidence satisfies the retained criteria. "
            "Other evidence and authorization booleans describe the supplied scenario, not execution in this evaluation. "
            "deferred records remaining unperformed scope or gates, not work you are authorized to omit. "
            "No extra prose, status fields, markdown fences, or invented evidence.")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-test", action="store_true", help="Offline checker calibration; does not invoke OMP")
    parser.add_argument("--package", type=Path, help="Generated complete-profile ZIP")
    parser.add_argument("--out", type=Path, help="Fresh contained directory under artifacts/")
    parser.add_argument("--model", help="OMP model override")
    parser.add_argument("--case", action="append", dest="case_ids", help="Case ID; repeat to select several")
    args = parser.parse_args()
    corpus = load_corpus()
    if args.self_test:
        if args.package or args.out or args.case_ids or args.model:
            parser.error("--self-test is offline and cannot be combined with live options")
        self_test(corpus)
        return 0
    if not args.package or not args.out:
        parser.error("live evaluation requires --package and --out")
    cases = [case for case in corpus["cases"] if not args.case_ids or case["id"] in args.case_ids]
    if not cases or (args.case_ids and set(args.case_ids) - {case["id"] for case in cases}):
        parser.error("unknown or empty case selection")
    output = args.out.resolve()
    if (ROOT / "artifacts").resolve() not in output.parents or output.exists():
        parser.error("output must be a fresh contained directory under artifacts/")
    package = args.package.resolve(strict=True)
    if not package.is_file() or package.suffix.lower() != ".zip":
        parser.error("package must be a ZIP file")
    with zipfile.ZipFile(package) as archive:
        validate_members(archive.infolist(), package.stem)
        required = json.loads((ROOT / "release-profiles.json").read_text(encoding="utf-8"))["profiles"]["complete"]["skills"]
        for name in required:
            if f"{package.stem}/skills/{name}/SKILL.md" not in archive.namelist():
                parser.error(f"package is not complete: missing {name}")
        output.mkdir(parents=True, exist_ok=False)
        archive.extractall(output)
    project = output / package.stem
    model = args.model or corpus["model"]
    results = []
    for case in cases:
        # Standalone runs outside repository ancestors and without collection-root files.
        with tempfile.TemporaryDirectory(prefix="composition-standalone-") as temporary:
            cwd = project
            if case["standalone"]:
                cwd = Path(temporary)
                for name in case["skills"]:
                    shutil.copytree(project / "skills" / name, cwd / "skills" / name)
            paths = {name: (cwd / "skills" / name / "SKILL.md").as_posix() for name in case["skills"]}
            sources = {name: Path(path).read_text(encoding="utf-8-sig") for name, path in paths.items()}
            config = output / f"{case['id']}.omp.yml"
            config.write_text("skills:\n  customDirectories:\n    - " + json.dumps((cwd / "skills").as_posix()) + "\n", encoding="utf-8")
            prompt = prompt_for(case, paths)
            (output / f"{case['id']}.prompt.txt").write_text(prompt, encoding="utf-8")
            command = ["omp", "-p", "--no-session", "--mode=json", "--max-time=120", "--tools=read", "--skills=" + ",".join(case["skills"]), f"--model={model}", f"--config={config}", f"--cwd={cwd}", prompt]
            try:
                run = subprocess.run(command, cwd=cwd, text=True, encoding="utf-8", errors="replace", capture_output=True, timeout=150, check=False)
                stdout, stderr, code = run.stdout, run.stderr, run.returncode
            except (subprocess.TimeoutExpired, OSError) as exc:
                stdout, stderr, code = getattr(exc, "stdout", "") or "", getattr(exc, "stderr", "") or str(exc), -1
                stdout = stdout.decode("utf-8", "replace") if isinstance(stdout, bytes) else stdout
                stderr = stderr.decode("utf-8", "replace") if isinstance(stderr, bytes) else stderr
            (output / f"{case['id']}.jsonl").write_text(stdout, encoding="utf-8")
            (output / f"{case['id']}.stderr.txt").write_text(stderr, encoding="utf-8")
            events, malformed = [], 0
            for line in stdout.splitlines():
                try:
                    event = json.loads(line)
                    if not isinstance(event, dict):
                        raise ValueError("event is not an object")
                    events.append(event)
                except ValueError:
                    malformed += 1
            answers = [text_content(event["message"]) for event in events if event.get("type") == "message_end" and event.get("message", {}).get("role") == "assistant"]
            answer = answers[-1].strip() if answers else ""
            failures, loaded = score(case, answer, events, sources, paths)
            if code or malformed:
                failures.append(f"OMP exit {code}; malformed trace lines {malformed}")
            results.append({"id": case["id"], "passed": not failures, "failures": failures, "selected_skills": case["skills"], "source_loaded_skills": loaded, "source_sha256": {name: hashlib.sha256(source.encode()).hexdigest() for name, source in sources.items()}, "answer": answer, "exit_code": code, "standalone": case["standalone"]})
            print(f"{'FAIL' if failures else 'PASS'} {case['id']}: {', '.join(failures) if failures else 'decision rubric met'}", flush=True)
    report = {"scope": corpus["scope"], "model_requested": model, "model_actual": "not independently verified; inspect raw traces", "package": str(package), "package_sha256": hashlib.sha256(package.read_bytes()).hexdigest(), "corpus_sha256": hashlib.sha256(CORPUS.read_bytes()).hexdigest(), "cases": results, "passed": sum(item["passed"] for item in results), "total": len(results), "interaction_evidence": False, "limits": "Selection and successful source loading do not prove whole-skill obedience. This checks live decisions only; not implementation, browser UAT, independent critic execution, or publication. One sample per selected case; no variance claim."}
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(f"Corpus: {report['passed']}/{report['total']} PASS; evidence: {output / 'report.json'}")
    return 0 if report["passed"] == report["total"] else 1


if __name__ == "__main__":
    sys.exit(main())
