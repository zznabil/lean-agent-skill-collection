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
import time
import zipfile
from contextlib import contextmanager
from pathlib import Path, PurePosixPath
import os

ROOT = Path(__file__).resolve().parent.parent
CORPUS = ROOT / "docs/evals/composition-omp.json"
DECISION_SYSTEM = (
    "You evaluate supplied agent decision scenarios. Read the selected skill sources with the read tool. "
    "Do not execute the described tasks or invent evidence. "
    "Apply the source contracts to the supplied scenario and return only the requested decision JSON."
)
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


@contextmanager
def _evaluation_workspace():
    directory = tempfile.TemporaryDirectory(prefix="composition-eval-")
    try:
        yield directory.name
    finally:
        # Windows may retain a working-directory handle briefly after OMP exits.
        deadline = time.monotonic() + 5
        while True:
            try:
                directory.cleanup()
                break
            except PermissionError as exc:
                if getattr(exc, "winerror", None) != 32 or time.monotonic() >= deadline:
                    raise
                time.sleep(0.05)


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


def _displayed_coverage(text, expected, start, end, source_path):
    """Count verified lines from supported non-raw reader displays."""
    lower, upper = max(1, start - 1), min(len(expected), end + 3)
    rows = text.splitlines()
    file_header = re.fullmatch(r"\[(?P<path>[^\]\n]+)#[0-9A-Fa-f]{4}\]", rows[0]) if rows else None
    if file_header:
        try:
            shown = Path(file_header["path"]).expanduser()
        except (RuntimeError, ValueError):
            return set()
        target = Path(source_path)
        shown_parts = tuple(os.path.normcase(part) for part in shown.parts)
        target_parts = tuple(os.path.normcase(part) for part in target.parts)
        if (".." in shown.parts or (shown.is_absolute() and shown_parts != target_parts)
                or (not shown.is_absolute() and (len(shown_parts) < 2 or target_parts[-len(shown_parts):] != shown_parts))):
            return set()
        rows = rows[1:]
    truncation = (
        r"Some lines truncated to (?P<limit>[1-9][0-9]*) chars\. "
        r"Use :raw:(?P<first>[1-9][0-9]*)-(?P=first) to read line (?P=first) whole"
        r"(?:; cut lines run to line (?P<last>[1-9][0-9]*), each read the same way)?"
    )
    showing = clipped = more = None
    if len(rows) >= 2 and rows[-2] == "":
        footer = rows[-1]
        showing = re.fullmatch(
            r"\[Showing lines (?P<begin>[1-9][0-9]*)-(?P<finish>[1-9][0-9]*) of "
            r"(?P<total>[1-9][0-9]*)\. Use :(?P<next>[1-9][0-9]*) to continue"
            r"(?:\. " + truncation + r")?\]", footer,
        )
        clipped = re.fullmatch(r"\[" + truncation + r"\]", footer)
        more = re.fullmatch(r"\[(?P<count>[1-9][0-9]*) more lines in file\. Use :(?P<next>[1-9][0-9]*) to continue\]", footer)
        if showing or clipped or more:
            rows = rows[:-2]
    if showing:
        first, last = int(showing["begin"]), int(showing["finish"])
        if not (int(showing["total"]) == len(expected) and lower <= first <= start <= last <= upper
                and last < len(expected) and int(showing["next"]) == last + 1):
            return set()
        clipped = showing if showing["limit"] else None
    elif more:
        next_line = int(more["next"])
        if not (start <= next_line <= min(len(expected), upper + 1)
                and int(more["count"]) == len(expected) - next_line + 1):
            return set()
    elif not clipped and rows == expected[lower - 1:upper]:
        return set(range(lower, upper + 1))

    # A contiguous display has a known position. A cut line contributes no
    # coverage until a separate exact read supplies it.
    first, last = (int(showing["begin"]), int(showing["finish"])) if showing else (lower, upper)
    if len(rows) == last - first + 1:
        complete, truncated = set(), []
        for index, (actual, original) in enumerate(zip(rows, expected[first - 1:last]), first):
            if actual == original:
                complete.add(index)
            elif (clipped and len(actual) == int(clipped["limit"]) + 1 and actual.endswith("…")
                  and len(original) > int(clipped["limit"]) and actual[:-1] == original[:int(clipped["limit"])]):
                truncated.append(index)
            else:
                break
        else:
            if not clipped or (truncated and truncated[0] == int(clipped["first"])
                               and truncated[-1] == int(clipped["last"] or clipped["first"])):
                return complete
    if clipped:
        return set()

    # Numbered rows must be ordered and fully matched. Context or block
    # anchors outside the reader's standard window do not establish coverage.
    nonmarkers = [row for row in rows if row != "…"]
    numbered = [re.fullmatch(r"([1-9][0-9]*)[|:](.*)", row) for row in nonmarkers]
    if numbered and all(numbered):
        result, previous = set(), 0
        for match in numbered:
            index = int(match[1])
            if index <= previous or index > len(expected) or expected[index - 1] != match[2]:
                return set()
            previous = index
            if lower <= index <= upper and (not showing or int(showing["begin"]) <= index <= int(showing["finish"])):
                result.add(index)
        return result

    # Cut-block displays can include distant opening/closing anchors. Require
    # every segment to occur in order and credit only uniquely located lines.
    if (showing or more or "…" in rows) and rows:
        segments = [[]]
        for row in rows:
            if row == "…":
                if segments[-1]:
                    segments.append([])
            else:
                segments[-1].append(row)
        segments = [segment for segment in segments if segment]
        result, minimum = set(), 0
        for segment in segments:
            positions = [i for i in range(len(expected) - len(segment) + 1)
                         if expected[i:i + len(segment)] == segment]
            possible = [i for i in positions if i >= minimum]
            if not possible:
                return set()
            minimum = possible[0] + len(segment) + 1
            if len(positions) == 1:
                result.update(index for index in range(positions[0] + 1, positions[0] + len(segment) + 1)
                              if lower <= index <= upper)
        return result
    return set()

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
                match = re.fullmatch(
                    r"(?:" + re.escape(f"skill://{name}") + r"(?:/SKILL\.md)?|" + re.escape(paths[name]) + r")"
                    r"(?P<raw_before>:raw)?(?::(?P<start>[1-9][0-9]*)(?P<range>-(?P<end>[1-9][0-9]*)?)?)?(?P<raw_after>:raw)?",
                    path,
                )
                if match:
                    if match["raw_before"] and match["raw_after"]:
                        break
                    last = len(source.splitlines())
                    start = int(match["start"] or 1)
                    if match["end"]:
                        end = min(int(match["end"]), last)
                    elif match["start"] and not match["range"] and (match["raw_before"] or match["raw_after"]):
                        end = min(start, last)
                    else:
                        end = last
                    if start <= end:
                        pending[call_id] = (name, start, end, bool(match["raw_before"] or match["raw_after"]))
                    break
            continue
        message = event.get("message", {})
        if event.get("type") != "message_end" or message.get("role") != "toolResult" or message.get("toolName") != "read":
            continue
        read = pending.pop(message.get("toolCallId"), None)
        if read is None or event.get("isError") or message.get("isError"):
            continue
        name, start, end, raw = read
        if read_skills is not None:
            read_skills.add(name)
        expected = sources[name].splitlines()
        text = text_content(message)
        if text.splitlines() == expected[start - 1:end]:
            coverage[name].update(range(start, end + 1))
            continue
        if text.startswith("[Skill file: "):
            header, separator, text = text.partition("\n")
            if not separator or header.rstrip("\r") != f"[Skill file: {Path(paths[name])}]":
                continue
            if text.splitlines() == expected[start - 1:end]:
                coverage[name].update(range(start, end + 1))
                continue
        if not raw:
            coverage[name].update(_displayed_coverage(text, expected, start, end, paths[name]))
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
        headered = copy.deepcopy(raw_events)
        for index, name in enumerate(sources):
            headered[index * 2]["args"]["path"] = f"skill://{name}"
            headered[index * 2 + 1]["message"]["content"][0]["text"] = f"[Skill file: {Path(paths[name])}]\n{sources[name]}"
        if score(case, answer, finalized(headered, answer), sources, paths)[0]:
            raise AssertionError("valid path-bound skill header rejected")
        headered_numbered = copy.deepcopy(headered)
        for index, name in enumerate(sources):
            numbered = "\n".join(f"{i}|{line}" for i, line in enumerate(sources[name].splitlines(), 1))
            headered_numbered[index * 2 + 1]["message"]["content"][0]["text"] = f"[Skill file: {Path(paths[name])}]\n{numbered}"
        if score(case, answer, finalized(headered_numbered, answer), sources, paths)[0]:
            raise AssertionError("valid numbered skill header rejected")
        for mutation in ("wrong-header", "wrong-header-numbered", "mixed-numbered", "modified", "truncated", "failed", "mismatched", "late"):
            bad = copy.deepcopy(headered)
            name = next(iter(sources))
            result = bad[1]["message"]
            if mutation == "wrong-header":
                result["content"][0]["text"] = f"[Skill file: {Path(paths[name])}.wrong]\n{sources[name]}"
            elif mutation == "wrong-header-numbered":
                numbered = "\n".join(f"{i}|{line}" for i, line in enumerate(sources[name].splitlines(), 1))
                result["content"][0]["text"] = f"[Skill file: {Path(paths[name])}.wrong]\n{numbered}"
            elif mutation == "mixed-numbered":
                numbered = "\n".join(f"{i}|{line}" for i, line in enumerate(sources[name].splitlines(), 1))
                result["content"][0]["text"] = f"[Skill file: {Path(paths[name])}]\n{numbered}\nextra"
            elif mutation == "modified":
                result["content"][0]["text"] = result["content"][0]["text"].replace("# Skill", "# Altered")
            elif mutation == "truncated":
                result["content"][0]["text"] = "\n".join(result["content"][0]["text"].splitlines()[:-1])
            elif mutation == "failed":
                result["isError"] = True
            elif mutation == "mismatched":
                result["toolCallId"] = "unmatched"
            trace = [final_event(answer), *bad] if mutation == "late" else finalized(bad, answer)
            if not score(case, answer, trace, sources, paths)[0]:
                raise AssertionError(f"headered {mutation} source accepted")
        checks += 10
        if not score(case, answer, [final_event(answer), *events], sources, paths)[0]:
            raise AssertionError("CE-1: reads after final decision accepted")
        if not score(case, answer, events, sources, paths)[0]:
            raise AssertionError("missing final assistant decision accepted")
        checks += 2
        for base_kind in ("skill", "skill-file", "path"):
            for raw in (False, True):
                ranged = []
                for index, (name, source) in enumerate(sources.items()):
                    base = paths[name] if base_kind == "path" else f"skill://{name}"
                    if base_kind == "skill-file":
                        base += "/SKILL.md"
                    for start, end in ((1, 2), (3, 4)):
                        selector = f":{start}-{end}" if start == 1 else f":{start}-" if raw else f":{start}"
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
                for mutation in ("missing", "modified", "failed", "mismatched", "wrong-path", "late"):
                    bad = copy.deepcopy(ranged)
                    if mutation == "missing":
                        del bad[2:4]
                    elif mutation == "modified":
                        bad[3]["message"]["content"][0]["text"] += " changed"
                    elif mutation == "failed":
                        bad[3]["message"]["isError"] = True
                    elif mutation == "mismatched":
                        bad[3]["message"]["toolCallId"] = "unmatched"
                    elif mutation == "wrong-path":
                        bad[0]["args"]["path"] = f"skill://{case['skills'][0]}/OTHER.md"
                    else:
                        late = bad[2:4]
                        del bad[2:4]
                        bad = [*bad, final_event(answer), *late]
                    trace = bad if mutation == "late" else finalized(bad, answer)
                    if not score(case, answer, trace, sources, paths)[0]:
                        raise AssertionError(f"CE-2: {mutation} source portion accepted")
                checks += 7
        for base_kind in ("skill", "path"):
            for slices in (((":1:raw", 1, 1), (":2-:raw", 2, 4)),
                           ((":1-2:raw", 1, 2), (":3-:raw", 3, 4)),
                           ((":raw:1", 1, 1), (":raw:2-", 2, 4))):
                raw_ranges = []
                for index, (name, source) in enumerate(sources.items()):
                    base = f"skill://{name}" if base_kind == "skill" else paths[name]
                    for selector, start, end in slices:
                        call_id = f"raw-suffix-{index}-{start}"
                        text = "\n".join(source.splitlines()[start - 1:end])
                        raw_ranges.extend([
                            {"type": "tool_execution_start", "toolName": "read", "toolCallId": call_id, "args": {"path": base + selector}},
                            {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": call_id, "content": [{"type": "text", "text": text}]}},
                        ])
                if score(case, answer, finalized(raw_ranges, answer), sources, paths)[0]:
                    raise AssertionError("valid raw selector coverage rejected")
                checks += 1
        truncated_reads = []
        for index, (name, source) in enumerate(sources.items()):
            lines = source.splitlines()
            displayed = lines.copy()
            displayed[1] = displayed[1][:4] + "…"
            text = "\n".join(displayed) + "\n\n[Some lines truncated to 4 chars. Use :raw:2-2 to read line 2 whole]"
            for suffix, result, label in (("", text, "truncated"), (":2:raw", lines[1], "reread")):
                call_id = f"{label}-{index}"
                truncated_reads.extend([
                    {"type": "tool_execution_start", "toolName": "read", "toolCallId": call_id, "args": {"path": paths[name] + suffix}},
                    {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": call_id, "content": [{"type": "text", "text": result}]}},
                ])
        if score(case, answer, finalized(truncated_reads, answer), sources, paths)[0]:
            raise AssertionError("complete unnumbered source with raw reread rejected")
        for mutation in ("missing", "modified", "removed", "reordered", "footer", "reread-modified", "reread-late"):
            bad = copy.deepcopy(truncated_reads)
            result = bad[1]["message"]["content"][0]
            if mutation == "missing":
                del bad[2:4]
            elif mutation == "modified":
                result["text"] = result["text"].replace("# Skill", "# Altered")
            elif mutation == "removed":
                result["text"] = "\n".join(result["text"].split("\n")[1:])
            elif mutation == "reordered":
                lines = result["text"].split("\n")
                lines[0], lines[3] = lines[3], lines[0]
                result["text"] = "\n".join(lines)
            elif mutation == "footer":
                result["text"] = result["text"].replace("Some lines truncated", "Unknown lines truncated")
            elif mutation == "reread-modified":
                bad[3]["message"]["content"][0]["text"] += " altered"
            else:
                late = bad[2:4]
                del bad[2:4]
                bad = [*bad, final_event(answer), *late]
            trace = bad if mutation == "reread-late" else finalized(bad, answer)
            if not score(case, answer, trace, sources, paths)[0]:
                raise AssertionError(f"unnumbered {mutation} source accepted")
        checks += 8
        multi_truncated = copy.deepcopy(truncated_reads)
        for index, (name, source) in enumerate(sources.items()):
            result = multi_truncated[index * 4 + 1]["message"]["content"][0]
            lines = result["text"].split("\n")
            lines[3] = lines[3][:4] + "…"
            lines[-1] = lines[-1].replace("line 2 whole]", "line 2 whole; cut lines run to line 4, each read the same way]")
            result["text"] = "\n".join(lines)
            call_id = f"reread-four-{index}"
            multi_truncated.extend([
                {"type": "tool_execution_start", "toolName": "read", "toolCallId": call_id, "args": {"path": paths[name] + ":4:raw"}},
                {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": call_id, "content": [{"type": "text", "text": source.splitlines()[3]}]}},
            ])
        if score(case, answer, finalized(multi_truncated, answer), sources, paths)[0]:
            raise AssertionError("multiple truncated lines with raw rereads rejected")
        incomplete = copy.deepcopy(multi_truncated)
        del incomplete[len(truncated_reads):len(truncated_reads) + 2]
        if not score(case, answer, finalized(incomplete, answer), sources, paths)[0]:
            raise AssertionError("missing second truncated-line reread accepted")
        checks += 2
        for mutation in ("reordered", "unmatched"):
            bad = copy.deepcopy(events)
            text = bad[1]["message"]["content"][0]["text"]
            bad[1]["message"]["content"][0]["text"] = "\n".join(reversed(text.splitlines())) if mutation == "reordered" else text + "\nunmatched altered content"
            if not score(case, answer, finalized(bad, answer), sources, paths)[0]:
                raise AssertionError(f"numbered {mutation} source accepted")
        checks += 2
        raw_spoof = copy.deepcopy(raw_events)
        name = case["skills"][0]
        raw_spoof[0]["args"]["path"] = f"skill://{name}:1:raw"
        raw_spoof[1]["message"]["content"][0]["text"] = "\n".join(f"{i}|{line}" for i, line in enumerate(sources[name].splitlines(), 1))
        if not score(case, answer, finalized(raw_spoof, answer), sources, paths)[0]:
            raise AssertionError("numbered output accepted for a raw single-line read")
        checks += 1
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
    long_lines = [f"line-{i:02}" for i in range(1, 16)]
    long_source = "\n".join(long_lines) + "\n"
    long_path = "/fixture/writing/SKILL.md"
    long_sources, long_paths = {"writing": long_source}, {"writing": long_path}

    def range_read(selector, text, call_id):
        return [
            {"type": "tool_execution_start", "toolName": "read", "toolCallId": call_id, "args": {"path": long_path + selector}},
            {"type": "message_end", "message": {"role": "toolResult", "toolName": "read", "toolCallId": call_id, "content": [{"type": "text", "text": text}]}},
        ]

    def range_loaded(trace):
        return loaded_sources(trace, long_sources, long_paths) == ["writing"]

    numbered_all = "\n".join(f"{i}:{line}" for i, line in enumerate(long_lines, 1))
    if range_loaded(range_read(":1-1", numbered_all, "outside")):
        raise AssertionError("numbered lines outside reader context counted")
    numbered_context = f"[{long_path}#A1B2]\n" + "\n".join(numbered_all.splitlines()[:4]) + "\n\n[Showing lines 1-4 of 15. Use :5 to continue]"
    rest = range_read(":5-:raw", "\n".join(long_lines[4:]), "rest")
    if not range_loaded([*range_read(":1-1", numbered_context, "context"), *rest]):
        raise AssertionError("numbered reader context rejected")
    wrong_header = numbered_context.replace(long_path, "/fixture/other/SKILL.md")
    if range_loaded([*range_read(":1-1", wrong_header, "wrong-header"), *rest]):
        raise AssertionError("mismatched numbered file header accepted")
    checks += 1
    relative_header = numbered_context.replace(long_path, "writing/SKILL.md")
    if not range_loaded([*range_read(":1-1", relative_header, "relative-header"), *rest]):
        raise AssertionError("relative numbered file header rejected")
    traversal_header = numbered_context.replace(long_path, "other/../writing/SKILL.md")
    if range_loaded([*range_read(":1-1", traversal_header, "traversal-header"), *rest]):
        raise AssertionError("traversal in numbered file header accepted")
    checks += 2
    before = range_read(":1-3:raw", "\n".join(long_lines[:3]), "before")
    after = range_read(":10-:raw", "\n".join(long_lines[9:]), "after")
    showing = "\n".join(long_lines[3:9]) + "\n\n[Showing lines 4-9 of 15. Use :10 to continue]"
    if not range_loaded([*before, *range_read(":5-6", showing, "showing"), *after]):
        raise AssertionError("actual unnumbered range context rejected")
    eof = range_read(":13-15", "\n".join(long_lines[11:]), "eof")
    first = range_read(":1-11:raw", "\n".join(long_lines[:11]), "first")
    if not range_loaded([*first, *eof]):
        raise AssertionError("unnumbered end-of-file context rejected")
    cut = f"[Skill file: {Path(long_path)}]\n" + long_lines[0] + "\n…\n" + "\n".join(long_lines[3:9]) + "\n…\n" + long_lines[14] + "\n\n[6 more lines in file. Use :10 to continue]"
    if not range_loaded([*before, *range_read(":5-6", cut, "cut"), *after]):
        raise AssertionError("skill-header cut-block context rejected")
    for broken in (cut.replace("line-06", "altered"), cut.replace("line-06\nline-07", "line-07\nline-06"), cut.replace("6 more lines", "7 more lines")):
        if range_loaded([*before, *range_read(":5-6", broken, "broken-cut"), *after]):
            raise AssertionError("altered cut-block source accepted")
    clipped = long_lines[3:9]
    clipped[1], clipped[4] = clipped[1][:4] + "…", clipped[4][:4] + "…"
    clipped_text = "\n".join(clipped) + "\n\n[Showing lines 4-9 of 15. Use :10 to continue. Some lines truncated to 4 chars. Use :raw:5-5 to read line 5 whole; cut lines run to line 8, each read the same way]"
    five = range_read(":5:raw", long_lines[4], "five")
    eight = range_read(":8:raw", long_lines[7], "eight")
    clipped_read = range_read(":5-6", clipped_text, "clipped")
    if not range_loaded([*before, *clipped_read, *five, *eight, *after]):
        raise AssertionError("ranged truncation with exact rereads rejected")
    if range_loaded([*before, *clipped_read, *five, *after]):
        raise AssertionError("missing ranged truncation reread accepted")
    checks += 10
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
            "\nReturn only one JSON object with exactly these fields: "
            "owner (skill ID or null), verdict (PROCEED, HOLD, DONE), state (READY, BLOCKED, COMPLETE), "
            "actions (next required actions, not executed actions), safety (exact JSON booleans for "
            + ", ".join(sorted(SAFETY)) + "), deferred (remaining scope/gates). "
            "Valid verdict/state pairs are PROCEED/READY, HOLD/BLOCKED and DONE/COMPLETE. "
            "Use only these action labels when applicable: " + ", ".join(sorted(ACTIONS))
            + ". Deferred labels: " + ", ".join(sorted(DEFERRED)) + ". "
            "mandatory_criteria_preserved is true when your decision retains every mandatory criterion as a prerequisite, "
            "including unmet criteria; it is false when your decision waives or substitutes a criterion. "
            "evidence_sufficient is true only when the supplied acceptance evidence satisfies the retained criteria. "
            "Other evidence and authorization booleans describe the supplied scenario, not execution in this evaluation. "
            "deferred records remaining unperformed scope or gates, not work you are authorized to omit. "
            "Include only actions and gates supported by the supplied scenario; do not invent additional scope. "
            "No extra prose, status fields, markdown fences, or invented evidence. "
            "Evaluation labels are not the selected skill's runtime lifecycle states. "
            "Judge the decision requested by the scenario. When current acceptance or completion is requested, "
            "HOLD/BLOCKED means that acceptance cannot be granted, even when safe prerequisite actions can proceed. "
            "PROCEED/READY permits starting requested work; it does not grant missing acceptance. "
            "DONE/COMPLETE requires the retained acceptance criteria to be satisfied. "
            "List actions that address the stated blocker or authorized working slice, including verification of that work. "
            "Exclude downstream execution until ownership, authorization, safe state and required capabilities permit it. "
            "Use the most specific applicable action label; do not list a generic gate again for the same verification. "
            "Deferred records remaining scope or withheld acceptance for the current task. "
            "Do not treat cancelled, superseded or already performed execution as pending work. "
            "Retain explicit authorization boundaries stated by the scenario for relevant, unperformed lifecycle stages. "
            "Do not infer additional stages from general skill procedures. "
            "Do not add unrelated work merely because it lacks permission. "
            "\nScenario:\n" + case["prompt"])


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
    policy = output / "package-policy.txt"
    if any(not case["standalone"] for case in cases):
        policy.write_bytes((project / "AGENTS.md").read_bytes())
    model = args.model or corpus["model"]
    results = []
    for case in cases:
        # Every live workspace excludes repository ancestors and ambient host rules.
        with _evaluation_workspace() as temporary:
            cwd = Path(temporary).resolve()
            if ROOT == cwd or ROOT in cwd.parents:
                raise ValueError("evaluation workspace must be outside the repository")
            if case["standalone"]:
                for name in case["skills"]:
                    shutil.copytree(project / "skills" / name, cwd / "skills" / name)
            else:
                shutil.copytree(project, cwd, dirs_exist_ok=True)
            paths = {name: (cwd / "skills" / name / "SKILL.md").as_posix() for name in case["skills"]}
            sources = {name: Path(path).read_text(encoding="utf-8-sig") for name, path in paths.items()}
            config = output / f"{case['id']}.omp.yml"
            config.write_text("skills:\n  customDirectories:\n    - " + json.dumps((cwd / "skills").as_posix()) + "\n", encoding="utf-8")
            prompt = prompt_for(case, paths)
            (output / f"{case['id']}.prompt.txt").write_text(prompt, encoding="utf-8")
            command = ["omp", "-p", "--no-session", "--no-rules", "--no-extensions", "--mode=json", "--max-time=120", "--tools=read", f"--system-prompt={DECISION_SYSTEM}", "--skills=" + ",".join(case["skills"]), f"--model={model}", f"--config={config}", f"--cwd={cwd}"]
            if not case["standalone"]:
                command.append(f"--append-system-prompt={policy}")
            command.append(prompt)
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
    report = {"scope": corpus["scope"], "model_requested": model, "model_actual": "not independently verified; inspect raw traces", "base_system_prompt": DECISION_SYSTEM, "thinking": "inherited; not independently captured", "runner_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(), "package": str(package), "package_sha256": hashlib.sha256(package.read_bytes()).hexdigest(), "corpus_sha256": hashlib.sha256(CORPUS.read_bytes()).hexdigest(), "cases": results, "passed": sum(item["passed"] for item in results), "total": len(results), "interaction_evidence": False, "limits": "Selection and successful source loading do not prove whole-skill obedience. This checks live decisions only; not implementation, browser UAT, independent critic execution, or publication. One sample per selected case; no variance claim."}
    (output / "report.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(f"Corpus: {report['passed']}/{report['total']} PASS; evidence: {output / 'report.json'}")
    return 0 if report["passed"] == report["total"] else 1


if __name__ == "__main__":
    sys.exit(main())
