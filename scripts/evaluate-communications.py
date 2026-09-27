"""Run the fixed communication corpus against an extracted release profile in OMP."""

import argparse
import json
import re
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CASES = json.loads((ROOT / "docs/evals/communications-omp.json").read_text(encoding="utf-8"))


def score(case, answer, events):
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
    loaded = set()
    requested = set()
    for event in events:
        if event.get("type") == "tool_execution_start" and event.get("toolName") == "read":
            path = event.get("args", {}).get("path", "")
            if path.startswith("skill://"):
                requested.add(path.removeprefix("skill://"))
        if event.get("type") != "message_end" or event.get("message", {}).get("role") != "toolResult":
            continue
        text = "".join(part.get("text", "") for part in event["message"].get("content", []) if part.get("type") == "text")
        for name in requested:
            if re.search(rf"(?m)^\d+\|name: {re.escape(name)}$", text) and re.search(r"(?m)^\d+\|# ", text):
                loaded.add(name)
    expected = case["skill"]
    if expected not in ("none", "optional") and expected not in loaded:
        failures.append(f"skill not loaded: {expected}")
    if expected == "none" and loaded:
        failures.append(f"irrelevant skill loaded: {sorted(loaded)}")
    return failures, sorted(loaded)


def self_test():
    good = {"required": ["MUST", "offline"], "forbidden": ["certified"], "ordered": ["MUST", "offline"], "skill": "none"}
    assert not score(good, "MUST log unless offline", [])[0]
    assert score(good, "Certified and optional", [])[0]
    assert score(good, "offline then MUST log", [])[0]
    fake = {"required": [], "skill": "writing"}
    assert score(fake, "Draft", [])[0]
    loaded = [{"type": "tool_execution_start", "toolName": "read", "args": {"path": "skill://writing"}}, {"type": "message_end", "message": {"role": "toolResult", "content": [{"type": "text", "text": "1|---\n2|name: writing\n3|---\n4|# Writing\n"}]}}]
    assert not score(fake, "Draft", loaded)[0]
    assert score({"required": [], "skill": "none"}, "Draft", loaded)[0]
    assert not score({"required": [], "skill": "optional"}, "Draft", loaded)[0]
    assert not score({"required": [], "skill": "optional"}, "Draft", [])[0]

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
    reset_failures, _ = score(reset, bad_reset_order, [])
    inbox_first = next(pattern for pattern in reset["forbidden"] if "email account" in pattern)
    assert reset_failures == [f"forbidden: {inbox_first}"]
    assert score(reset, incomplete_reset, [])[0]
    link_failures, _ = score(reset, missing_link, [])
    assert len(link_failures) == 1 and link_failures[0].startswith("out of order or missing:")
    security_failures, _ = score(security, bad_security_decision, [])
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
    assert all(not score(reset, answer, [])[0] for answer in reset_controls)
    assert not score(security, security_control, [])[0]
    bad_security_polarity = (
        "Decision: Do not HOLD; GO. The automated scan found zero critical findings. "
        "Penetration testing is not required and an OWASP ASVS review is not a required gate. "
        "These results do not prove the application is secure."
    )
    polarity_failures, _ = score(security, bad_security_polarity, [])
    assert len(polarity_failures) >= 2 and all(f.startswith("forbidden: ") for f in polarity_failures)
    bad_easy_polarity = reset_controls[0].replace(
        "This has not been verified as Easy-to-Read; no intended-user testing occurred.",
        "This is verified as Easy-to-Read, not merely reviewed.",
    )
    polarity_failures, _ = score(reset, bad_easy_polarity, [])
    assert {failure.split(":", 1)[0] for failure in polarity_failures} == {"missing", "forbidden"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--package", type=Path, required=True, help="Generated communication ZIP")
    parser.add_argument("--out", dest="output", type=Path, required=True, help="New directory under artifacts/")
    args = parser.parse_args()
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
    config = output / "omp.yml"
    config.write_text("skills:\n  customDirectories:\n    - " + project.joinpath("skills").as_posix() + "\n", encoding="utf-8")
    results = []
    for case in CASES["cases"]:
        command = ["omp", "-p", "--no-session", "--mode=json", "--max-time=90", "--tools=read", "--skills=writing,wait-what", f"--model={CASES['model']}", f"--config={config}", f"--cwd={project}", case["prompt"]]
        try:
            run = subprocess.run(command, cwd=project, text=True, encoding="utf-8", errors="replace", capture_output=True, timeout=110, check=False)
            stdout, stderr, returncode = run.stdout, run.stderr, run.returncode
        except subprocess.TimeoutExpired as exc:
            stdout = (exc.stdout or b"").decode("utf-8", "replace") if isinstance(exc.stdout, bytes) else (exc.stdout or "")
            stderr = (exc.stderr or b"").decode("utf-8", "replace") if isinstance(exc.stderr, bytes) else (exc.stderr or "")
            returncode = -1
        (output / f"{case['id']}.jsonl").write_text(stdout, encoding="utf-8")
        (output / f"{case['id']}.stderr.txt").write_text(stderr, encoding="utf-8")
        events = []
        for line in stdout.splitlines():
            try:
                events.append(json.loads(line))
            except json.JSONDecodeError:
                pass
        answers = ["".join(part.get("text", "") for part in event["message"].get("content", []) if part.get("type") == "text") for event in events if event.get("type") == "message_end" and event.get("message", {}).get("role") == "assistant"]
        answer = answers[-1].strip() if answers else ""
        failures, loaded = score(case, answer, events)
        if returncode or not answer:
            failures.append(f"OMP exit {returncode}; final answer {'missing' if not answer else 'present'}")
        result = {"id": case["id"], "category": case["category"], "passed": not failures, "failures": failures, "loaded_skills": loaded, "answer": answer, "exit_code": returncode}
        results.append(result)
        print(f"{'PASS' if result['passed'] else 'FAIL'} {case['id']}: {', '.join(failures) if failures else 'rubric met'}", flush=True)
    report = {"model": CASES["model"], "package": str(args.package.resolve()), "cases": results, "passed": sum(item["passed"] for item in results), "total": len(results)}
    (output / "report.json").write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Corpus: {report['passed']}/{report['total']} PASS; evidence: {output / 'report.json'}")
    return 0 if report["passed"] == report["total"] else 1


if __name__ == "__main__":
    sys.exit(main())
