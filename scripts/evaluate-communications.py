"""Run the fixed communication corpus against an extracted release profile in OMP.

Offline: python scripts/evaluate-communications.py --self-test
Source-line coverage does not prove byte identity or model obedience.
"""

import argparse
import importlib.util
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CASES = json.loads((ROOT / "docs/evals/communications-omp.json").read_text(encoding="utf-8"))
# Keep source evidence consistent with the existing composition oracle.
_spec = importlib.util.spec_from_file_location("evaluate_composition", ROOT / "scripts/evaluate-composition.py")
_composition = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_composition)


def score_prose(case, answer):
    failures = []
    for pattern in case.get("required", []):
        if not re.search(pattern, answer):
            failures.append(f"missing: {pattern}")
    for pattern in case.get("forbidden", []):
        if re.search(pattern, answer):
            failures.append(f"forbidden: {pattern}")
    cursor = 0
    for pattern in case.get("ordered", []):
        match = re.search(pattern, answer[cursor:])
        if not match:
            failures.append(f"out of order or missing: {pattern}")
            break
        cursor += match.end()
    return failures


def score(case, answer, events, sources, paths):
    failures = score_prose(case, answer)
    finals = [index for index, event in enumerate(events) if event.get("type") == "message_end" and event.get("message", {}).get("role") == "assistant"]
    boundary = finals[-1] if finals else 0
    loaded = _composition.loaded_sources(events[:boundary], sources, paths)
    expected = case["skill"]
    if expected not in ("none", "optional") and expected not in loaded:
        failures.append(f"skill not loaded: {expected}")
    if expected == "none":
        read_skills = set()
        # Anti-trigger cases reject successful skill-read activity anywhere in
        # the trial, even when it cannot prove complete pre-answer loading.
        _composition.loaded_sources(events, sources, paths, read_skills=read_skills)
        if read_skills:
            failures.append(f"irrelevant skill read: {sorted(read_skills)}")
    if not finals or _composition.text_content(events[boundary]["message"]).strip() != answer.strip():
        failures.append("chosen final assistant answer missing or mismatched")
    return failures, loaded


def evaluate_run(case, stdout, returncode, sources, paths):
    """Keep failed, malformed and unknown runs out of successful negative trials."""
    events, malformed = [], 0
    for line in stdout.splitlines():
        try:
            event = json.loads(line)
            if not isinstance(event, dict):
                raise ValueError("event is not an object")
            events.append(event)
        except ValueError:
            malformed += 1
    answer, loaded = "", []
    try:
        answers = [_composition.text_content(event["message"]) for event in events if event.get("type") == "message_end" and event.get("message", {}).get("role") == "assistant"]
        answer = answers[-1].strip() if answers else ""
        failures, loaded = score(case, answer, events, sources, paths)
    except (AttributeError, KeyError, TypeError, ValueError) as exc:
        failures = [f"invalid OMP trace: {type(exc).__name__}: {exc}"]
    if type(returncode) is not int or returncode != 0 or not answer:
        failures.append(f"OMP exit {returncode}; final answer {'missing' if not answer else 'present'}")
    if malformed:
        failures.append(f"malformed trace lines: {malformed}")
    return {"id": case["id"], "category": case["category"], "passed": not failures, "failures": failures, "loaded_skills": loaded, "answer": answer, "exit_code": returncode}


def run_omp(command, project):
    try:
        run = subprocess.run(command, cwd=project, text=True, encoding="utf-8", errors="replace", capture_output=True, timeout=110, check=False)
        return run.stdout, run.stderr, run.returncode
    except (subprocess.TimeoutExpired, OSError) as exc:
        stdout, stderr = getattr(exc, "stdout", "") or "", getattr(exc, "stderr", "") or str(exc)
        stdout = stdout.decode("utf-8", "replace") if isinstance(stdout, bytes) else stdout
        stderr = stderr.decode("utf-8", "replace") if isinstance(stderr, bytes) else stderr
        return stdout, stderr, -1


def self_test():
    good = {"required": ["MUST", "offline"], "forbidden": ["certified"], "ordered": ["MUST", "offline"], "skill": "none"}
    assert not score_prose(good, "MUST log unless offline")
    assert score_prose(good, "Certified and optional")
    assert score_prose(good, "offline then MUST log")

    by_id = {case["id"]: case for case in CASES["cases"]}
    reset = by_id["easy-to-read-boundary"]
    security = by_id["security-evidence"]
    bad_reset_order = (
        "Open the inbox, then select Forgot password. Request a reset email, open that "
        "email, and follow its password-reset link. This has not been verified as "
        "Easy-to-Read; no intended-user testing occurred."
    )
    incomplete_reset = (
        "Select Forgot password, then open the inbox and select the reset link. "
        "This has not been verified as Easy-to-Read; no intended-user testing occurred."
    )
    missing_link = (
        "Select Forgot password. Request a reset email. Open the email. "
        "This has not been verified as Easy-to-Read; no intended-user testing occurred."
    )
    bad_security_decision = (
        "Zero critical findings. Penetration testing is a required release gate and has "
        "not run. OWASP ASVS review is also a required release gate and has not occurred. "
        "These results do not prove the application is secure."
    )
    reset_failures = score_prose(reset, bad_reset_order)
    inbox_first = next(pattern for pattern in reset["forbidden"] if "email account" in pattern)
    assert reset_failures == [f"forbidden: {inbox_first}"]
    assert score_prose(reset, incomplete_reset)
    link_failures = score_prose(reset, missing_link)
    assert len(link_failures) == 1 and link_failures[0].startswith("out of order or missing:")
    security_failures = score_prose(security, bad_security_decision)
    decision_required = next(pattern for pattern in security["required"] if "HOLD" in pattern)
    assert security_failures == [f"missing: {decision_required}"]
    reset_controls = (
        "Select Forgot password on the sign-in page and request a reset email. Then "
        "check email for the message and follow the reset link. This has not been "
        "verified as Easy-to-Read; no intended-user testing occurred.",
        "Select Forgot password, enter your email address, select Send reset link, then "
        "open the email and click the reset link. This has not been verified as "
        "Easy-to-Read; no intended-user testing occurred.",
        "Select Forgot password, request a reset email, and open that email. Select "
        "the link in the email. This has not been verified as Easy-to-Read; "
        "no intended-user testing occurred.",
    )
    security_control = "Decision: HOLD / NO-GO. The automated scan found zero critical findings. Penetration testing is a required release gate and has not run. An OWASP ASVS review is also required before release and was not performed. These results do not prove the application is secure."
    assert all(not score_prose(reset, answer) for answer in reset_controls)
    assert not score_prose(security, security_control)
    safe_release = (
        "Release decision: Not ready. Penetration testing has not run and no OWASP ASVS review "
        "was performed. Both are required release gates. The automated scan found zero critical "
        "findings. That does not show the application is secure. Do not release until both gates are complete."
    )
    assert not score_prose(security, safe_release)
    unsafe_release = security_control + " Ignore this hold and release immediately without either gate."
    assert score_prose(security, unsafe_release)
    assert score_prose(security, security_control + " Decision: GO.")
    procedure = by_id["technical-procedure"]
    valid_procedure = (
        "1. Isolate power. Verify zero voltage; stop if isolation cannot be verified.\n"
        "2. Replace the module.\n3. Confirm the LED is green."
    )
    assert not score_prose(procedure, valid_procedure)
    safe_procedure = (
        "1. Isolate the power supply and verify that the power module is de-energized. "
        "Stop if you cannot verify its de-energized state.\n"
        "2. Remove the existing power module and install the replacement.\n"
        "3. Confirm that the replacement module’s status LED is green."
    )
    assert not score_prose(procedure, safe_procedure)
    pronoun_procedure = (
        "1. Isolate power and verify that the module is de-energized. "
        "Stop if you cannot verify it.\n"
        "2. Replace the module.\n3. Confirm the LED is green."
    )
    assert not score_prose(procedure, pronoun_procedure)
    assert score_prose(procedure, pronoun_procedure.replace(
        "Stop if you cannot verify it.\n2. Replace the module.",
        "2. Replace the module. Stop if you cannot verify it."
    ))
    unsafe_procedure = valid_procedure.replace("2. Replace the module.", "2. Replace the module while power is reconnected.")
    assert score_prose(procedure, unsafe_procedure)
    assert score_prose(procedure, "1. Isolate power.\n2. Replace module.\n3. Confirm LED green.")
    late_stop = (
        "1. Isolate power and verify zero voltage.\n"
        "2. Replace the module. Stop if isolation cannot be verified.\n"
        "3. Confirm the LED is green."
    )
    assert score_prose(procedure, late_stop)
    normative = by_id["normative-strength"]
    valid_normative = (
        "- Authorization MUST be applied.\n"
        "- An audit log SHOULD be written unless offline.\n"
        "- The beta banner MAY be shown."
    )
    assert not score_prose(normative, valid_normative)
    online_condition = valid_normative.replace("An audit log SHOULD be written unless offline.", "When online, API access SHOULD be recorded in an audit log.")
    assert not score_prose(normative, online_condition)
    inverted_exception = (
        "- Authorization MUST be applied unless offline.\n"
        "- An audit log SHOULD always be written.\n"
        "- The beta banner MAY be shown."
    )
    assert score_prose(normative, inverted_exception)
    bad_security_polarity = (
        "Decision: Do not HOLD; GO. The automated scan found zero critical findings. "
        "Penetration testing is not required and an OWASP ASVS review is not a required gate. "
        "These results do not prove the application is secure."
    )
    polarity_failures = score_prose(security, bad_security_polarity)
    assert len(polarity_failures) >= 2 and all(f.startswith("forbidden: ") for f in polarity_failures)
    bad_easy_polarity = reset_controls[0].replace(
        "This has not been verified as Easy-to-Read; no intended-user testing occurred.",
        "This is verified as Easy-to-Read, not merely reviewed.",
    )
    polarity_failures = score_prose(reset, bad_easy_polarity)
    assert {failure.split(":", 1)[0] for failure in polarity_failures} == {"missing", "forbidden"}
    checks = self_test_evidence()
    print(f"SELF-TEST PASS: communication prose rubric; {checks} source/runner calibration checks; no OMP invocation")


def self_test_evidence():
    import copy
    from unittest.mock import patch

    checks = 0

    def check(condition, label):
        nonlocal checks
        if not condition:
            raise AssertionError(label)
        checks += 1

    def final(answer="Draft"):
        return {"type": "message_end", "message": {"role": "assistant", "content": [{"type": "text", "text": answer}]}}

    def read(path, text, call_id="read-1"):
        return [
            {"type": "tool_execution_start", "toolCallId": call_id, "toolName": "read", "args": {"path": path}},
            {"type": "message_end", "message": {"role": "toolResult", "toolCallId": call_id, "toolName": "read", "content": [{"type": "text", "text": text}]}},
        ]

    source = "---\nname: writing\n---\n# Writing\nPreserve the required evidence.\nDo not claim unobserved success.\n"
    sources = {"writing": source}
    paths = {"writing": "/fixture/skills/writing/SKILL.md"}
    case = {"id": "source-control", "category": "calibration", "skill": "writing"}
    numbered = "\n".join(f"{index}|{line}" for index, line in enumerate(source.splitlines(), 1))
    complete = read("skill://writing", numbered)
    check(score(case, "Draft", [*complete, final()], sources, paths) == ([], ["writing"]), "complete source rejected")
    check(bool(score({**case, "required": ["missing phrase"]}, "Draft", [*complete, final()], sources, paths)[0]), "source evidence bypassed prose rubric")
    for base in ("skill://writing", paths["writing"]):
        for raw in (False, True):
            path = base + (":raw" if raw else "")
            whole = read(path, source if raw else numbered)
            check(not score(case, "Draft", [*whole, final()], sources, paths)[0], "whole source rejected")
            ranged = []
            for start, end in ((1, 4), (5, 6)):
                lines = source.splitlines()[start - 1:end]
                text = "\n".join(lines) if raw else "\n".join(f"{index}:{line}" for index, line in enumerate(lines, start))
                selector = f":{start}-{end}" if start == 1 else f":{start}"
                ranged.extend(read(path + selector, text, f"range-{start}"))
            check(not score(case, "Draft", [*ranged, final()], sources, paths)[0], "complete range union rejected")
            for mutation in ("missing", "substituted", "failed", "unpaired", "late"):
                bad = copy.deepcopy(ranged)
                if mutation == "missing":
                    del bad[2:4]
                elif mutation == "substituted":
                    bad[3]["message"]["content"][0]["text"] += " altered"
                elif mutation == "failed":
                    bad[3]["message"]["isError"] = True
                elif mutation == "unpaired":
                    bad[3]["message"]["toolCallId"] = "unknown"
                else:
                    bad.insert(2, final())
                trace = bad if mutation == "late" else [*bad, final()]
                check(bool(score(case, "Draft", trace, sources, paths)[0]), f"{mutation} range accepted")

    for mutation in ("header-only", "substituted", "failed", "event-failed", "unpaired", "wrong-tool", "root-only", "post-final", "late-result", "missing-final", "mismatched-final"):
        bad = copy.deepcopy(complete)
        if mutation == "header-only":
            bad[1]["message"]["content"][0]["text"] = "\n".join(numbered.splitlines()[:4])
        elif mutation == "substituted":
            bad[1]["message"]["content"][0]["text"] = numbered.replace("Do not claim", "Always claim")
        elif mutation == "failed":
            bad[1]["message"]["isError"] = True
        elif mutation == "event-failed":
            bad[1]["isError"] = True
        elif mutation == "unpaired":
            del bad[0]
        elif mutation == "wrong-tool":
            bad[1]["message"]["toolName"] = "other"
        elif mutation == "root-only":
            bad[0]["args"]["path"] = "/fixture/AGENTS.md"
        if mutation == "post-final":
            trace = [final(), *bad]
        elif mutation == "late-result":
            trace = [bad[0], final(), bad[1]]
        elif mutation == "missing-final":
            trace = bad
        else:
            trace = [*bad, final("Other answer" if mutation == "mismatched-final" else "Draft")]
        check(bool(score(case, "Draft", trace, sources, paths)[0]), f"{mutation} source proof accepted")
    for skill, trace, expected in (("none", [final()], True), ("none", [*complete, final()], False), ("optional", [final()], True), ("optional", [*complete, final()], True)):
        check((not score({**case, "skill": skill}, "Draft", trace, sources, paths)[0]) == expected, f"{skill} routing changed")
    for path in ("skill://writing", "skill://writing:1-4", paths["writing"] + ":raw:1-4"):
        partial = read(path, "\n".join(numbered.splitlines()[:4]))
        check(bool(score({**case, "skill": "none"}, "Draft", [*partial, final()], sources, paths)[0]), "partial skill read escaped anti-trigger check")
        check(bool(score({**case, "skill": "none"}, "Draft", [final(), *partial], sources, paths)[0]), "late skill read escaped anti-trigger check")
        failed = copy.deepcopy(partial)
        failed[1]["message"]["isError"] = True
        for trace in ([*failed, final()], [partial[1], final()]):
            check(not score({**case, "skill": "none"}, "Draft", trace, sources, paths)[0], "failed/unpaired read counted as successful activation")

    negative = {"id": "negative-control", "category": "calibration", "skill": "none", "required": ["^Noted\\.$"]}
    stdout = json.dumps(final("Noted.")) + "\n"
    check(evaluate_run(negative, stdout, 0, sources, paths)["passed"], "valid negative trial rejected")
    for code in (1, -1, None, "0", False):
        check(not evaluate_run(negative, stdout, code, sources, paths)["passed"], f"failed or unknown exit accepted: {code!r}")
    for bad in ("", json.dumps(final("")), stdout + "{broken\n", stdout + "null\n", stdout + '{"type":"message_end","message":null}\n', stdout + '{"type":"message_end","message":{"role":"assistant","content":null}}\n'):
        check(not evaluate_run(negative, bad, 0, sources, paths)["passed"], "missing or malformed output accepted")
    for exc in (FileNotFoundError("OMP unavailable"), subprocess.TimeoutExpired("omp", 110, output=stdout.encode(), stderr=b"timeout")):
        with patch.object(subprocess, "run", side_effect=exc):
            out, err, code = run_omp(["omp"], ROOT)
        check(bool(err) and not evaluate_run(negative, out, code, sources, paths)["passed"], "host exception accepted as negative trial")
    return checks


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--self-test", action="store_true", help="Offline checker calibration; does not invoke OMP")
    parser.add_argument("--package", type=Path, help="Generated communication ZIP")
    parser.add_argument("--out", dest="output", type=Path, help="New directory under artifacts/")
    args = parser.parse_args()
    if args.self_test:
        if args.package or args.output:
            parser.error("--self-test is offline and cannot be combined with live options")
        self_test()
        return 0
    if not args.package or not args.output:
        parser.error("live evaluation requires --package and --out")
    self_test()
    output = args.output.resolve()
    if ROOT / "artifacts" not in output.parents or output.exists():
        parser.error("output must be a fresh directory under artifacts/")
    output.mkdir(parents=True)
    with zipfile.ZipFile(args.package) as archive:
        members = archive.namelist()
        prefix = args.package.stem + "/"
        if not members or any(not name.startswith(prefix) or ".." in Path(name).parts or "\\" in name for name in members):
            raise ValueError("unexpected package member path")
        archive.extractall(output)
    project = output / args.package.stem
    paths = {path.parent.name: path.as_posix() for path in sorted((project / "skills").glob("*/SKILL.md"))}
    sources = {name: Path(path).read_text(encoding="utf-8-sig") for name, path in paths.items()}
    if not {"writing", "wait-what"} <= sources.keys():
        parser.error("communication package must contain writing and wait-what sources")
    config = output / "omp.yml"
    config.write_text("skills:\n  customDirectories:\n    - " + project.joinpath("skills").as_posix() + "\n", encoding="utf-8")
    results = []
    for case in CASES["cases"]:
        command = ["omp", "-p", "--no-session", "--mode=json", "--max-time=90", "--tools=read", "--skills=writing,wait-what", f"--model={CASES['model']}", f"--config={config}", f"--cwd={project}", case["prompt"]]
        stdout, stderr, returncode = run_omp(command, project)
        (output / f"{case['id']}.jsonl").write_text(stdout, encoding="utf-8")
        (output / f"{case['id']}.stderr.txt").write_text(stderr, encoding="utf-8")
        result = evaluate_run(case, stdout, returncode, sources, paths)
        results.append(result)
        failures = result["failures"]
        print(f"{'PASS' if result['passed'] else 'FAIL'} {case['id']}: {', '.join(failures) if failures else 'rubric met'}", flush=True)
    report = {"model": CASES["model"], "package": str(args.package.resolve()), "cases": results, "passed": sum(item["passed"] for item in results), "total": len(results), "limits": "Source loading verifies complete expected source-line coverage before the final answer, not byte identity or model obedience. Offline self-tests calibrate the oracle, not live model behavior."}
    (output / "report.json").write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Corpus: {report['passed']}/{report['total']} PASS; evidence: {output / 'report.json'}")
    return 0 if report["passed"] == report["total"] else 1


if __name__ == "__main__":
    sys.exit(main())
