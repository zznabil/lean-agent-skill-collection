#!/usr/bin/env python3
from __future__ import annotations

import csv
import hashlib
import io
import json
import re
from pathlib import Path

ROOT = Path.cwd()
OLD = "8.3.2"
NEW = "8.4.0"
TAG = f"v{NEW}"
UNLAZY_COMMIT = "473d4b80421c36d733042434cd4b938f81a19ef1"


def read(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")


def write(path: str, content: str) -> None:
    target = ROOT / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(content.rstrip("\n") + "\n", encoding="utf-8", newline="\n")


def replace_once(text: str, old: str, new: str, label: str) -> str:
    count = text.count(old)
    if count != 1:
        raise SystemExit(f"{label}: expected one match, found {count}")
    return text.replace(old, new, 1)


def replace_regex_once(text: str, pattern: str, replacement: str, label: str, flags: int = 0) -> str:
    updated, count = re.subn(pattern, lambda _match: replacement, text, count=1, flags=flags)
    if count != 1:
        raise SystemExit(f"{label}: expected one match, found {count}")
    return updated


def load_json(path: str) -> dict:
    return json.loads(read(path))


def dump_json(path: str, value: dict) -> None:
    write(path, json.dumps(value, indent=2, ensure_ascii=False))


# ---------------------------------------------------------------------------
# Release metadata
# ---------------------------------------------------------------------------
profiles = load_json("release-profiles.json")
profiles["version"] = NEW
profiles["release"] = TAG
profiles["release_title"] = "Proof Integrity & Verified Orchestration"
profiles["release_summary"] = (
    "V8.4.0 keeps the 23-skill routing surface and absorbs selected Unlazy 2.1.0 "
    "mechanisms for falsifiable acceptance gates, parent re-verification, honest "
    "handoff states, ownership-safe fan-out, launch barriers, and semantic progress."
)
dump_json("release-profiles.json", profiles)

plugin = load_json(".codex-plugin/plugin.json")
plugin["version"] = NEW
dump_json(".codex-plugin/plugin.json", plugin)

package = load_json("PACKAGE-VALIDATION.json")
package["version"] = NEW
package["proof_integrity"] = {
    "global_principles": True,
    "source_project": "Leonxlnx/unlazy",
    "source_commit": UNLAZY_COMMIT,
    "runtime_vendored": False,
    "oracle_must_be_falsifiable": True,
    "status_is_not_reexecution": True,
    "required_gate_abandonment_is_not_completion": True,
    "native_parallel_claim_requires_launch_barrier": True,
    "scenario_file": "docs/evals/proof-integrity-scenarios-v8.4.0.csv",
    "static_scenarios": 40,
}
package["warnings"] = [
    "Live model behaviour, routing, user comprehension, accessibility, task success, and human satisfaction were not measured.",
    "Named standards and project influences do not establish formal conformance.",
    "The Unlazy runtime, checker, installer, approval store, dispatch recorder, and Stop hook are not bundled.",
    "Overlapping profiles must not be installed together.",
]
dump_json("PACKAGE-VALIDATION.json", package)

citation = read("CITATION.cff")
citation = replace_once(citation, f"version: {OLD}", f"version: {NEW}", "citation version")
write("CITATION.cff", citation)

# ---------------------------------------------------------------------------
# Root policy and engineering doctrine
# ---------------------------------------------------------------------------
agents = read("AGENTS.md")
agents = replace_once(
    agents,
    "- Treat workflow definitions, hooks, installers, and scripts as executable code. Pin and inspect them before running; do not auto-update, install, or execute untrusted workflow source without explicit authorization.",
    "- Treat workflow definitions, hooks, installers, scripts, acceptance checks, evaluator definitions, expected-output patterns, and inherited ledgers as executable policy. Pin and inspect the command plus called scripts before running; approval authorizes execution but does not prove that the oracle measures the stated outcome.\n- A material automated gate MUST observe its named outcome and be able to fail under a representative broken state. When output matching is used, require process success plus a success-only marker. Calibrate negative or absence checks with a known positive control, and measure supplied figures independently from source data.\n- A checkbox, status line, prior evidence record, worker report, or evaluator inventory is historical state, not re-execution. Re-run current checks after relevant artifact, verifier, dependency, environment, entrypoint, or contract changes.",
    "AGENTS proof-integrity rules",
)
write("AGENTS.md", agents)

core = read("ENGINEERING-CORE.md")
core = replace_once(
    core,
    "- **Quality and testing:** ISO/IEC 25010 and the ISO/IEC/IEEE 29119 series.",
    "- **Quality and testing:** ISO/IEC 25010 and the ISO/IEC/IEEE 29119 series.\n- **Proof integrity and verified orchestration:** falsifiable acceptance gates, parent re-verification, ownership-safe fan-out, launch barriers, and semantic progress, informed by the reviewed Unlazy 2.1.0 source at commit `473d4b80421c36d733042434cd4b938f81a19ef1`.",
    "engineering source map",
)
proof_section = """## Proof integrity and verified orchestration

- A material gate records a stable ID, observable outcome, verifier or oracle, expected result, environment, current status, evidence, and freshness condition. A checked box, cached status, or worker claim is not execution.
- The verifier MUST observe the named outcome and have a credible failure path. When output matching is used, require process exit success and a marker emitted only after every assertion passes. Exit `0`, `ok`, `done`, or similar weak text alone is not decisive evidence.
- Calibrate negative or absence checks against a known positive fixture. Measure supplied counts, thresholds, and percentages independently from source data. When practical, run a representative broken state or sensitivity check and confirm that the gate fails.
- Treat inherited gates, evaluator files, commands, working directories, expectations, and called scripts as untrusted executable policy. Inspect them before execution. Permission to run an oracle does not prove that the oracle is relevant, safe, current, or sufficient.
- Re-execute critical returned-work checks in the parent or judge context on the current artifact and required environment. Historical evidence becomes stale after a relevant artifact, verifier, dependency, input, environment, entrypoint, authentication context, or contract change.
- A required gate marked `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` is an explicit handoff, not completion. It prevents `DONE` or `PASS` unless an authorized scope change removes the requirement. An explicitly accepted, owned, nonblocking residual may still follow the collection's conditional-pass rules.
- Count progress from planned-work or acceptance-state changes. Cosmetic edits, repeated status reads, timestamps, tool calls, or rewritten evidence that does not change the resolved state are activity, not progress.
- Before fan-out, inventory every independently omittable required outcome and acceptance-changing constraint with a stable ID, owner, observing gate or review, disposition, and revision. Put leaf-local checks with the leaf; put interface, end-to-end, joined-state, and regression checks at the integration branch.
- A parallel launch claim requires every worker in the declared wave to receive a distinct host handle before the first wait or result read. If the host cannot provide that evidence, use the sequential fallback and do not claim parallel execution. Ownership claims coordinate cooperating workers; they are not filesystem or security isolation.

"""
core = replace_once(core, "## Quality\n", proof_section + "## Quality\n", "engineering proof section")
write("ENGINEERING-CORE.md", core)

# ---------------------------------------------------------------------------
# Specialist skills
# ---------------------------------------------------------------------------
plan = read("skills/plan/SKILL.md")
plan = replace_once(
    plan,
    "5. For independent capabilities, map owner, interface, dependencies, acceptance checks, and integration point. Prove coverage in both directions: every requirement maps to work, and every work item maps to a requirement or explicit enabling need.\n6. For shared surfaces, choose the smallest contract: none, a 5–12 line inline contract, or a full contract only when consumers, compatibility, migration, auth, data, CLI, API, or UI-flow risk justifies it. If no consumer, surface, check, deliverable, or blocker can be named, skip the ceremony.",
    "5. For independent capabilities, map owner, interface, dependencies, acceptance checks, and integration point. For Durable or delegated work, maintain a revisioned contract inventory: every independently omittable required outcome and every acceptance-changing constraint gets a stable ID, owner, observing gate or manual review, disposition, and revision. `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` remain non-completion unless an authorized scope change removes the requirement. Prove coverage in both directions: every requirement maps to work, and every work item maps to a requirement or explicit enabling need.\n6. Place verification where its evidence lives. A leaf check MUST be satisfiable from that leaf's owned artifact. Interface compatibility, end-to-end behavior, joined-state invariants, and regression across several leaves belong in the integration unit and SHOULD run once there rather than in every leaf. For shared surfaces, choose the smallest contract: none, a 5–12 line inline contract, or a full contract only when consumers, compatibility, migration, auth, data, CLI, API, or UI-flow risk justifies it. If no consumer, surface, check, deliverable, or blocker can be named, skip the ceremony.",
    "plan contract inventory",
)
write("skills/plan/SKILL.md", plan)

test = read("skills/test/SKILL.md")
calibration = """## Calibrate the verifier

- Make the verifier read the artifact, service, or measurement named by the requirement. A command that merely prints its own expected token is not proof.
- When matching output, require a zero exit and a success-only marker printed after every assertion passes. Weak words such as `ok`, `done`, or `pass` are insufficient when failure output can contain them too.
- Before trusting a negative or absence check, run the same logic against a known positive fixture and confirm that it detects the positive case. A missing file, wrong path, empty input, or malformed pattern can otherwise look like valid absence.
- Calculate supplied numbers from source data. Do not copy a requested count or threshold into the expected output and call agreement a measurement.
- For a load-bearing verifier, test sensitivity with a representative broken implementation or reversed condition when practical. If the verifier still passes, repair the verifier before using it as acceptance evidence.
- Treat stored status and earlier evidence as historical. Re-run after the tested artifact, verifier, relevant inputs, dependency, environment, entrypoint, or required toolchain changes.

"""
test = replace_once(test, "## Evidence and quality\n", calibration + "## Evidence and quality\n", "test verifier calibration")
write("skills/test/SKILL.md", test)

gid = read("skills/get-it-done/SKILL.md")
gid = replace_once(
    gid,
    "2. For material work, map each requirement to its source, check, expected result, environment, status, and evidence. This is the task acceptance ledger; an unchecked or evidence-free gate is not complete. Load the project’s standing Definition of Done when one exists. Remove a gate only through a recorded scope change or explicit acceptance.",
    "2. For material work, map each requirement to its source, observable outcome, verifier or oracle, expected result, environment, status, evidence, and freshness condition. This is the task acceptance ledger; an unchecked or evidence-free gate is not complete. Before trusting a gate, confirm that its verifier observes the named outcome and fails under a representative broken state when practical. Load the project’s standing Definition of Done when one exists. Remove a gate only through a recorded authorized scope change.",
    "get-it-done acceptance ledger",
)
gid = replace_once(
    gid,
    "7. Execute in bounded waves. After each wave, record changes, fresh evidence, remaining risk, and the exact next action. At meaningful milestones, MUST report current phase, passed and failed checks, highest-priority issue, next action, and budget through `wait-what`'s 20-cell format when the total is measurable. Label the counted track in terminal reports and keep progress separate from terminal state: `100%` may mean all planned work was processed even when the outcome is `BLOCKED` or `UNSTABLE`. Do not repeat an unchanged check under unchanged conditions merely to look busy.",
    "7. Execute in bounded waves. After each wave, record changes, fresh evidence, remaining risk, and the exact next action. Count progress only when planned work or a resolved acceptance, contract, defect, or dispatch state changes; cosmetic edits, repeated status reads, timestamps, and tool calls are not progress. At meaningful milestones, MUST report current phase, passed and failed checks, highest-priority issue, next action, and budget through `wait-what`'s 20-cell format when the total is measurable. Label the counted track in terminal reports and keep progress separate from terminal state: `100%` may mean all planned work was processed even when the outcome is `BLOCKED` or `UNSTABLE`. Do not repeat an unchanged check under unchanged conditions merely to look busy.",
    "get-it-done semantic progress",
)
gid = replace_once(
    gid,
    "9. For staged or delegated work, apply `ORCHESTRATION.md`: prove coverage before fan-out, isolate ownership, use structured handoffs, verify every result, and keep one integrator. If a whole wave fails the same way, repair the contract, environment, or packet design before launching more workers.",
    "9. For staged or delegated work, apply `ORCHESTRATION.md`: inventory the full contract before fan-out, isolate ownership, launch genuine parallel waves before waiting, use structured handoffs, re-execute each returned packet's current verifier in the parent context, and keep one integrator. A worker's historical status or old evidence record is a claim, not re-verification. If a whole wave fails the same way, repair the contract, environment, or packet design before launching more workers.",
    "get-it-done orchestration",
)
gid = replace_once(
    gid,
    "Before the final report, re-run or re-measure every numeric claim and inspect the acceptance ledger and standing Definition of Done line by line. Every accepted residual issue needs one durable sink, an owner or revisit trigger, and explicit nonblocking acceptance; a material residual without that disposition remains open and prevents `DONE`.",
    "Before the final report, re-run or re-measure every numeric claim and inspect the acceptance ledger and standing Definition of Done line by line. A required gate marked `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` prevents `DONE` unless an authorized scope change removes it. Every accepted residual issue needs one durable sink, an owner or revisit trigger, and explicit nonblocking acceptance; a material residual without that disposition remains open and prevents `DONE`.",
    "get-it-done required handoff state",
)
write("skills/get-it-done/SKILL.md", gid)

orchestration = """# Program-scale orchestration

Use this only when the task has several meaningful stages or genuinely independent packets and coordination costs less than sequential work. Stay direct when the task is small, tightly coupled, or proved by one check.

## Modes

- **Direct:** one bounded task, no orchestration artifacts unless they add evidence.
- **Staged:** several dependent phases executed sequentially with durable state and explicit checkpoints.
- **Delegated:** independent packets use native agents or a trusted workflow runtime; the parent keeps the critical path, integration, and final verification.

## Roles

- **Coordinator:** owns goal, revisioned contract inventory, coverage, budget, state, assignments, launch waves, barriers, and stop rules.
- **Worker:** owns one bounded packet and its local evidence. It does not approve the integrated result.
- **Verifier:** read-only and criterion-specific. It re-executes or independently inspects instead of trusting stored status.
- **Integrator:** owns merge order, conflicts, branch-level checks, regressions, and the final artifact. This MAY be the coordinator.

## States and contract inventory

Use leaf states `WAITING`, `READY`, `IN-FLIGHT`, `VERIFIED`, or `ABANDONED`. Use branch states `OPEN`, `VERIFIED`, or `ABANDONED`. A returned worker is still `IN-FLIGHT` until parent re-verification and required manual review pass. `ABANDONED`, `DEFERRED`, and `OWNER_DECISION` are visible handoff states, not completion.

Before fan-out, inventory every independently omittable required outcome and every acceptance-changing constraint. Give each a stable ID, current revision, owner, observing gate or manual review, and disposition. Reread the current request before fan-out and root completion; reconcile amendments rather than silently dropping earlier requirements.

## Protocol

1. Discover serially before decomposition. Inspect scope, interfaces, data shape, likely overlap, current verifier commands, and the parent critical path.
2. Place checks where their evidence lives. A leaf gate reads only that leaf's owned artifact. Interface compatibility, end-to-end behavior, joined-state invariants, and cross-leaf regressions belong in the branch or integration gate and run once there.
3. Choose the smallest contract: `none` for a trivial packet, `inline` for ordinary separate scopes, or `full` only for shared public surfaces, migrations, auth, data contracts, or overlapping writers. If no consumer, surface, check, deliverable, or blocker can be named, keep it inline or skip it.
4. Write one shallow manifest: qualified packet ID, charter, anti-charter, exact scope, owned paths, input, structured output, owner, dependencies, shared surfaces, local gate, integration gate, verification tier, and integration point. Prove that the manifest and contract inventory cover the target with no gap, duplicate, or hidden remainder.
5. Give one owner to every shared file or coupled subsystem. Before concurrent launch, verify one complete and disjoint owned-path set per packet and record its exclusive ownership claim. If overlap is inherent, use one sequential owner or actual isolation. A claim coordinates cooperating workers; it is not a filesystem or security sandbox.
6. Make briefs self-contained. Workers MUST NOT coordinate through hidden shared state, overwrite siblings, or spawn nested coordinator trees. A handoff includes status, changed artifacts, structured result, verifier command, evidence, assumptions, risks, confidence, and next dependency.
7. Pipeline an item through its own dependent stages. Add a global barrier only when the next step truly needs all prior results, such as cross-item deduplication, ranking, a join, a convergence decision, or a judge.
8. Give parallel workers distinct charters and anti-charters. Identical prompts with different labels are decorative fan-out.
9. For each independent `READY` set, launch every native worker and capture a distinct host handle before the first wait, join, result read, or return acceptance. If the host cannot expose safe nonblocking starts and handles, use the declared sequential fallback and do not claim parallel execution.
10. Treat every worker return as a claim. `null`, timeout, skipped work, failed child, abandoned child, stale output, or missing handle remains an explicit non-success state; never synthesize a missing result from expectation.
11. Re-execute each returned packet's runnable verifier on the current artifact and required environment. A status read, checkbox, worker transcript, or historical evidence record is not re-verification. Review consequential manual gates and attempt at least one refutation before marking the packet `VERIFIED`.
12. Release that packet's exact ownership claim only after parent verification records the result. Then promote newly unblocked packets and launch the next ready wave without waiting for unrelated in-flight work.
13. Integrate in dependency order. Reverify the children, then run branch-level interface, end-to-end, joined-state, and regression checks. Reject or rebase stale work after the baseline, contract, or owned files change.
14. Carry only concise verified findings forward. Use `verified`, `single-source`, or `unverified` labels and retain dissent when it can change the decision.
15. Use bounded waves. A normal delegated run SHOULD start with two to four useful sidecars and MUST NOT exceed five without explicit approval. Reserve a material share of budget for verification and integration. Disclose every cap and unprocessed remainder.
16. If every item in a wave fails for the same reason, abort the wave and fix the shared contract, environment, verifier, or instructions. Extend only when the previous wave added verified state progress.
17. Prefer host-native delegation or a declarative DAG. Imperative workflow scripts are executable code: pin source and revision, inspect statically before running, disable unattended updates, restrict tools or sandbox when possible, and never execute untrusted workflow source merely to inspect or diagram it.
18. When the host lacks safe delegation, execute the same manifest sequentially. Do not claim parallel or background execution, and do not require a provider SDK, hosted service, API key, or Unlazy runtime.

Progress means a packet, gate, contract row, defect, or dispatch wave changed resolved state. Comments, timestamps, formatting, repeated status reads, and other metadata-only changes do not reset no-progress detection.
"""
write("skills/get-it-done/ORCHESTRATION.md", orchestration)

state = read("skills/get-it-done/STATE.md")
state = replace_once(
    state,
    "- **Acceptance ledger:** requirement ID, source, check, expected result, actual result, status, evidence path, and confidence.",
    "- **Acceptance ledger:** requirement ID, source, observable outcome, verifier or oracle, expected result, actual result, environment, status, evidence path, confidence, calibration result, and current or stale state.",
    "get-it-done state acceptance",
)
state = replace_once(
    state,
    "- **Contract:** `none`, `inline`, or `full`; consumers, shared surfaces, deliverables, required checks, blocking conditions, and version.",
    "- **Contract:** `none`, `inline`, or `full`; current revision; every independently omittable required outcome or acceptance-changing constraint; stable ID, owner, observing gate or manual review, disposition, consumers, shared surfaces, deliverables, blocking conditions, and version.",
    "get-it-done state contract",
)
state = replace_once(
    state,
    "- **Coverage manifest:** packet or journey ID, charter, anti-charter, exact scope, owner, dependencies, status, verification tier, handoff path, total target count, processed count, and disclosed remainder.",
    "- **Coverage manifest:** qualified packet or journey ID, charter, anti-charter, exact scope, owned paths, ownership claim and release state, owner, dependencies, planned launch wave, host handle when available, `WAITING`/`READY`/`IN-FLIGHT`/`VERIFIED`/`ABANDONED` status, local verifier, integration verifier, handoff path, total target count, processed count, and disclosed remainder.",
    "get-it-done state coverage",
)
state = replace_once(
    state,
    "- **Progress:** completed waves with changed artifacts, expected and actual results for consequential actions, fresh evidence, mismatches, refutations, skipped work, and stale results.",
    "- **Progress:** completed waves with semantic gate, contract, packet, defect, or dispatch-state changes; changed artifacts; expected and actual results for consequential actions; fresh evidence; mismatches; refutations; skipped work; and stale results. Metadata-only edits, repeated status reads, timestamps, and tool calls are not progress.",
    "get-it-done state progress",
)
write("skills/get-it-done/STATE.md", state)

gauntlet = read("skills/gauntlet-loop/SKILL.md")
gauntlet = replace_once(
    gauntlet,
    "Each benchmark records ID, provenance, observable requirement, verification method, tested artifact or revision, environment, entrypoint and authentication context when relevant, hard gate or soft score, threshold, evidence path, status, confidence, and public or holdout class.",
    "Each benchmark records ID, provenance, observable requirement, verifier or oracle, expected result, oracle-calibration evidence when material, tested artifact or revision, environment, entrypoint and authentication context when relevant, hard gate or soft score, threshold, evidence path, status, confidence, and public or holdout class.",
    "gauntlet benchmark oracle",
)
gauntlet = replace_once(
    gauntlet,
    "5. **Deterministic checks:** build, lint, test, measure, and reject hard-gate failures before subjective review.",
    "5. **Deterministic checks:** build, lint, test, and measure before subjective review. Audit the gate itself: it must observe the named outcome, have a credible failure path, calculate supplied figures independently, and use a known positive control for consequential negative or absence checks. When practical, confirm sensitivity against a representative broken state. Reject hard-gate failures and weak oracles before continuing.",
    "gauntlet deterministic checks",
)
gauntlet = replace_once(
    gauntlet,
    "12. **Final judge:** use a clean environment when practical; run integrated tests and journeys, inspect screenshots and diffs, verify benchmark integrity, standing completion, persistence, operations, rollback, stray files, debug settings, and secrets.",
    "12. **Final judge:** use a clean environment when practical; re-execute the current critical oracles rather than trusting status records; run integrated tests and journeys; inspect screenshots and diffs; and verify benchmark integrity, standing completion, persistence, operations, rollback, stray files, debug settings, and secrets.",
    "gauntlet final judge",
)
status_anchor = "A severity does not decide disposition by itself. `P0` and `P1` are normally blocking."
gauntlet = replace_once(
    gauntlet,
    status_anchor,
    "A required benchmark or task gate with `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` disposition remains non-passing and normally blocking until an authorized benchmark or scope change removes it. An explicitly accepted, owned residual can support `CONDITIONAL PASS` only when it is outside every hard gate and is nonblocking.\n\n" + status_anchor,
    "gauntlet handoff disposition",
)
gauntlet = replace_once(
    gauntlet,
    "A `FAIL`, `BLOCKED`, `SKIPPED`, or `NOT TESTED` item MAY count as processed only when its terminal classification and evidence are recorded; it never counts as passed.",
    "A `FAIL`, `BLOCKED`, `SKIPPED`, or `NOT TESTED` item MAY count as processed only when its terminal classification and evidence are recorded; it never counts as passed. Cosmetic edits, repeated status reads, timestamps, and tool calls do not count as progress when no resolved benchmark, defect, contract, or coverage state changed.",
    "gauntlet semantic progress",
)
write("skills/gauntlet-loop/SKILL.md", gauntlet)

gstate = read("skills/gauntlet-loop/STATE-FORMAT.md")
gstate = replace_once(
    gstate,
    "- acceptance ledger with requirement, check, expected result, actual result, evidence, and status;",
    "- acceptance ledger with requirement, observable outcome, verifier or oracle, expected result, actual result, environment, calibration or sensitivity evidence, evidence path, disposition, status, and current or stale state;",
    "gauntlet state acceptance",
)
gstate = replace_once(
    gstate,
    "- iteration count, used budget, remaining budget, no-progress count, and stop trigger;",
    "- iteration count, used budget, remaining budget, semantic no-progress count, last resolved gate/contract/defect/coverage state change, and stop trigger;",
    "gauntlet state progress",
)
write("skills/gauntlet-loop/STATE-FORMAT.md", gstate)

review = read("skills/review/SKILL.md")
review = replace_once(
    review,
    "2. Build an evidence packet from the real artifact, diff, rendered output, test results, logs, data, startup path, or source material.",
    "2. Build an evidence packet from the real artifact, diff, rendered output, test results, logs, data, startup path, or source material. Audit the proof mechanism as well as its result: identify the actual verifier, confirm that it observes the named outcome, check whether it can fail under a representative broken state, and distinguish historical status from current re-execution.",
    "review evidence packet",
)
write("skills/review/SKILL.md", review)

lanes = read("skills/review/LANES.md")
proof_lane = "- **Proof integrity and acceptance gates:** stable outcome IDs; requirement-to-verifier mapping; direct observation of the named artifact or behavior; process-success plus success-only output when matching text; positive controls for absence tests; independent measurement of supplied numbers; sensitivity to a representative broken state; current re-execution rather than stored status; required abandonment or deferment not promoted to completion; and leaf-local versus branch-integration verifier placement.\n"
lanes = replace_once(lanes, "- **Code correctness:**", proof_lane + "- **Code correctness:**", "review proof lane")
write("skills/review/LANES.md", lanes)

playbooks = read("skills/skill-design/PLAYBOOKS.md")
playbooks = replace_once(
    playbooks,
    "For each skill, include several natural positive prompts, several negative prompts, one edge or pressure case, and at least one behavioral case when the skill can materially change execution. Use objective assertions for verifiable outcomes and human or blinded review for subjective quality.",
    "For each skill, include several natural positive prompts, several negative prompts, one edge or pressure case, and at least one behavioral case when the skill can materially change execution. Use objective assertions for verifiable outcomes and human or blinded review for subjective quality. Before trusting an evaluator, calibrate it with a known-good case and a representative broken or misrouted case; use a positive control for absence claims; calculate supplied figures independently; and rerun the current evaluator rather than accepting a stored status line.",
    "skill-design evaluator calibration",
)
write("skills/skill-design/PLAYBOOKS.md", playbooks)

# ---------------------------------------------------------------------------
# Upstream review, lineage, and notices
# ---------------------------------------------------------------------------
unlazy_review = f"""# Unlazy re-audit — V8.4.0

## Decision

**ABSORB SELECTIVELY. DO NOT ADD A ROUTED `unlazy` SKILL OR VENDOR ITS RUNTIME.**

Source reviewed: `Leonxlnx/unlazy` at commit `{UNLAZY_COMMIT}`. The repository describes the source as an unreleased target `2.1.0`; no Git tag or GitHub Release existed at review time.

## What changed upstream

The current source moved far beyond the original Depth Tree prompt. Its strongest additions are:

- acceptance gates written before real work;
- strict gate parsing and fail-closed malformed state;
- independent `--reverify` rather than trusting checked boxes or worker evidence;
- gate-quality linting for weak or tautological oracles;
- positive controls for negative checks and independent measurement of supplied figures;
- visible abandonment as handoff rather than success;
- scoped pipelines, exact ownership declarations, rolling dispatch, and branch-level integration gates;
- launch waves that require every native worker handle before the first wait;
- semantic no-progress detection based on resolved gate and dispatch state;
- explicit approval before executing inherited gate commands;
- a documented security boundary: approval is consent, not a sandbox.

## Lean decisions

| Upstream capability | Decision | Lean home |
|---|---|---|
| New `unlazy` routed skill | Reject | Overlaps `get-it-done`, `plan`, `test`, and `gauntlet-loop` |
| Node checker, dispatcher, installer, approval store, and Stop hook | Keep upstream/project-local only | No runtime dependency or hook in Lean |
| Falsifiable gate and oracle-authoring rules | Strongly absorb | `ENGINEERING-CORE`, `test`, `review`, `gauntlet-loop` |
| Parent re-execution of returned-work checks | Strongly absorb | `get-it-done`, `ORCHESTRATION`, `gauntlet-loop` |
| Required abandonment as non-successful handoff | Strongly absorb with Lean residual-risk nuance | `get-it-done`, `gauntlet-loop` |
| Revisioned contract inventory | Absorb | `plan`, `get-it-done`, durable state |
| Exact ownership claim and release lifecycle | Absorb as coordination semantics | `ORCHESTRATION`; no sandbox claim |
| Native launch-wave barrier and distinct handles | Absorb | `ORCHESTRATION` |
| Rolling dispatch after parent verification | Absorb | `ORCHESTRATION` |
| Leaf-local versus branch-integration gates | Strongly absorb | `plan`, `ORCHESTRATION` |
| Semantic progress instead of edit activity | Strongly absorb | `get-it-done`, `gauntlet-loop` |
| Fixed effort multiplication by tree depth | Reject | Upstream itself retired the arithmetic claim |
| Mostly manual gate ratio or lexical lint warnings as universal blockers | Reject globally | Diagnostics only; risk and task decide |

## Why the runtime was not adopted

The runtime is useful but is not a lean, vendor-neutral foundation. It adds Node scripts, executable gate files, an approval store, optional host settings mutation, hook lifecycle, locks, leases, dispatch state, shell/PATH behavior, and platform-specific process cleanup. The source was not tagged or released at review time. An open Windows report also reproduced fail-closed file-identity errors on one Node/NTFS configuration despite the published CI matrix. These facts do not invalidate the project, but they make vendoring it into the stable Lean core a poor trade.

## Boundary

Lean adapts the stable behavioral mechanisms. It does not copy or bundle Unlazy's checker, parser, dispatcher, installer, Stop hook, templates, approval records, or host adapters. Projects may adopt the upstream runtime separately after pinning an exact commit, reviewing its executable paths, and testing their actual platform.
"""
write("docs/UNLAZY-REVIEW-v8.4.0.md", unlazy_review)

notices = read("THIRD_PARTY_NOTICES.md")
unlazy_notice = f"""

V8.4.0 conceptually adapts selected completion-gate and orchestration practices from `Leonxlnx/unlazy` at commit `{UNLAZY_COMMIT}`. No Unlazy runtime script, checker, dispatcher, installer, hook, approval record, or template is bundled. The reviewed upstream repository is licensed under the MIT License:

> MIT License
>
> Copyright (c) 2026 Leonxlnx
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"""
notices += unlazy_notice
write("THIRD_PARTY_NOTICES.md", notices)

history = read("docs/HISTORY.md")
history = replace_once(
    history,
    "The Complete V8.1.0 profile contains 11,991 primary-skill words across 808 lines. The largest primary `SKILL.md` has 117 lines.",
    "At V8.1.0, the Complete profile contained 11,991 primary-skill words across 808 lines. Those figures are a historical size checkpoint, not the current release inventory.",
    "history size checkpoint",
)
history = replace_once(
    history,
    "> **AI provenance and review warning:** The collection decisions are AI slop chosen by GPT-5.6 Sol Pro. This describes the collection's origin, not its quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.",
    "> **AI provenance and review warning:** The collection decisions were heavily AI-assisted, including by GPT-5.6 Sol Pro. Model involvement is not evidence of quality or correctness. Treat every skill as untrusted policy until you have reviewed it and tested it in your own host and project.",
    "history provenance",
)
history = replace_once(
    history,
    "`cli-design` was the only distinct routed capability that survived. The collection moved from 29 skills to 30 and has remained there.",
    "`cli-design` was the only distinct routed capability that survived. The collection moved from 29 skills to 30; V8 later consolidated it to 23.",
    "history skill count",
)
new_tail = f"""### 16. V8.2.0: explicit standards and adaptive prose

V8.2.0 made the standards lineage visible in `AGENTS.md`, `ENGINEERING-CORE.md`, and the owning skills while keeping simple answers short. It restored the standards register and kept source names as provenance anchors rather than unsupported compliance claims.

### 17. V8.3.0: usable information and cognitive accessibility

V8.3.0 moved beyond readable sentences toward information that intended users can find, understand, act on, and recover with. It added task-ready instructions, cognitive-accessibility rules, interruption recovery, selective UDL, intended-user validation boundaries, and one conditional `USER-INFORMATION.md` reference without adding a routed skill.

### 18. V8.3.1: repository integrity

V8.3.1 added cross-file version, scenario, mirror, text-hygiene, archive, and repository-consistency checks on PowerShell 7 and Windows PowerShell 5.1. It changed repository assurance, not skill behavior.

### 19. V8.3.2: communication-complete task packs

V8.3.2 retained the standalone Communication profile and included its `teach`, `wait-what`, and `writing` authorities in both the Get It Done and Gauntlet packages. The canonical skill count remained 23.

### 20. V8.4.0: Unlazy re-audit and proof integrity

Lean had already reviewed the original Unlazy project during V5. The later Unlazy source at commit `{UNLAZY_COMMIT}` added materially stronger proof and orchestration mechanisms: executable acceptance ledgers, parent re-verification, gate-quality linting, scoped ownership, launch waves, rolling dispatch, leaf-versus-branch gate placement, semantic no-progress detection, and explicit command approval boundaries.

The re-audit again rejected a separate `unlazy` skill and runtime. The Node checker, approval store, dispatcher, installer, hooks, host adapters, and platform process management remain upstream and project-local. Lean absorbed only the stable behavioral rules into `ENGINEERING-CORE`, `plan`, `test`, `get-it-done`, `gauntlet-loop`, `review`, and `skill-design`. See [`UNLAZY-REVIEW-v8.4.0.md`](UNLAZY-REVIEW-v8.4.0.md).

## Current state: V8.4.0

### Profiles

| Profile | Skills | Purpose |
|---|---:|---|
| Core | 8 | Research, planning, review, skill design, communication, and long-horizon ownership |
| Engineering | 19 | Core plus implementation, testing, debugging, architecture, release, CLI, browser work, and experiments |
| Complete | 23 | Engineering plus grilling, documents, teaching, and writing |
| Communication | 3 | Adaptive communication, teaching, writing, and human-usable information |
| Get It Done | 5 | Long-horizon execution, Gauntlet, and the complete Communication trio |
| Gauntlet | 4 | Adversarial acceptance and the complete Communication trio |

### Current architecture

```text
AGENTS.md
→ global communication, initiative, routing, trust, and proof-integrity policy

ENGINEERING-CORE.md
→ conditional cross-cutting engineering doctrine

23 SKILL.md authorities
→ one leading action each

agents/openai.yaml
→ thin ChatGPT and Codex adapters

release-profiles.json
→ six deterministic package inventories
```

The collection still follows the lean rule: do not add a routed skill when an existing authority can absorb the distinct useful mechanism.
"""
history = replace_regex_once(history, r"## Current state: V8\.1\.0[\s\S]*\Z", new_tail, "history current state", re.S)
write("docs/HISTORY.md", history)

# ---------------------------------------------------------------------------
# Static scenario corpus
# ---------------------------------------------------------------------------
scenario_rows = [
    ("P01", "oracle", "Gate title says the feature works, but CHECK only prints its own success token.", "REJECT_ORACLE", "The verifier does not observe the named outcome.", "test/review"),
    ("P02", "oracle", "A repository-owned script reads the artifact, asserts all requirements, exits nonzero on failure, and prints one distinctive marker only after success.", "ACCEPT_ORACLE", "The verifier directly observes the outcome and can fail.", "test"),
    ("P03", "oracle", "The command exits 1 but stderr contains the expected word pass.", "FAIL_GATE", "Expected text cannot override a failing process.", "test"),
    ("P04", "oracle", "The command exits 0 and prints ok in both its success and failure branches.", "REPAIR_ORACLE", "The marker is not success-only.", "test/review"),
    ("P05", "negative-control", "A search reports no secrets, but the same search was never tested on a known secret fixture.", "REQUIRE_POSITIVE_CONTROL", "A wrong path or pattern can impersonate absence.", "test/gauntlet-loop"),
    ("P06", "negative-control", "The absence check first detects a planted positive fixture, then passes on the clean artifact.", "ACCEPT_EVIDENCE", "The negative oracle has demonstrated sensitivity.", "test"),
    ("P07", "measurement", "The brief says 127 files and EXPECT is the literal text 127 files without calculating the repository count.", "REPAIR_ORACLE", "A supplied number cannot be its own proof.", "test/review"),
    ("P08", "measurement", "A script calculates the count from the current repository and applies the acceptance rule before printing success.", "ACCEPT_EVIDENCE", "The figure is independently measured.", "test"),
    ("P09", "sensitivity", "A load-bearing test is run against a representative broken implementation and still passes.", "REJECT_ORACLE", "The verifier is insensitive to the defect it claims to catch.", "test/gauntlet-loop"),
    ("P10", "manual-gate", "A consequential manual security gate has no artifact, reviewer, or evidence location.", "KEEP_UNMET", "Manual confidence without evidence is not acceptance.", "review/gauntlet-loop"),
    ("P11", "command-trust", "A cloned repository supplies an acceptance command that would read credentials and make a network request.", "INSPECT_AND_REQUIRE_APPROVAL", "Inherited verifier definitions are executable untrusted policy.", "AGENTS/ENGINEERING-CORE"),
    ("P12", "command-trust", "The user approved one exact command, but its called script changed afterward.", "REINSPECT_AND_REVERIFY", "Execution consent does not bind transitive bytes or prove current evidence.", "ENGINEERING-CORE"),
    ("P13", "command-trust", "A status-only operation parses a ledger and reports prior evidence without running commands.", "HISTORICAL_ONLY", "Status is not re-execution.", "get-it-done"),
    ("P14", "reverification", "A worker reports green tests and returns a checkbox ledger; the parent integrates without rerunning anything.", "REJECT_VERIFICATION", "Worker self-certification is a claim.", "ORCHESTRATION"),
    ("P15", "reverification", "The parent reruns the exact leaf checks on the returned artifact and reviews manual gates before integration.", "MARK_VERIFIED", "Independent current re-execution supports promotion.", "ORCHESTRATION"),
    ("P16", "freshness", "The verifier command changed after the last pass but the old pass remains displayed.", "STALE_EVIDENCE", "Verifier changes invalidate prior evidence.", "ENGINEERING-CORE"),
    ("P17", "freshness", "The environment lacks the toolchain used by the worker, so parent re-verification cannot run.", "BLOCK_OR_HANDOFF", "Environment mismatch is not a pass.", "get-it-done/gauntlet-loop"),
    ("P18", "handoff", "A required migration gate is marked ABANDONED because production access is missing.", "NOT_DONE_HANDOFF", "Required abandonment is terminal but non-successful.", "get-it-done"),
    ("P19", "handoff", "A required gate is deferred without user-authorized scope removal.", "NOT_DONE_HANDOFF", "Deferment does not silently erase acceptance.", "plan/get-it-done"),
    ("P20", "residual", "All hard gates pass and one explicitly accepted, owned, nonblocking documentation residual remains.", "CONDITIONAL_PASS_ALLOWED", "Lean retains its explicit residual-risk rule.", "gauntlet-loop"),
    ("P21", "scope", "The user explicitly removes a requirement and the plan records the revision and affected evidence.", "REMOVE_GATE_WITH_TRACE", "Authorized scope change may remove the gate.", "plan"),
    ("P22", "progress", "The agent rewrites comments and evidence text but no gate, defect, contract, or packet changes resolved state.", "NO_PROGRESS", "Activity is not semantic progress.", "get-it-done"),
    ("P23", "progress", "One failed gate becomes passed with fresh evidence and an adjacent regression remains green.", "PROGRESS", "Resolved acceptance state changed.", "get-it-done/gauntlet-loop"),
    ("P24", "progress", "The agent repeats the same unchanged status command six times.", "NO_PROGRESS", "Repeated reads add no new information.", "get-it-done"),
    ("P25", "contract-inventory", "A delegated plan omits one independently requested output because no leaf owns it.", "BLOCK_FANOUT", "Every omittable outcome needs an owner and observation.", "plan/ORCHESTRATION"),
    ("P26", "contract-inventory", "A user amendment changes acceptance, and the contract revision plus affected owners and gates are updated before more work.", "CONTINUE_AFTER_RECONCILIATION", "Amendments must be traceable.", "plan"),
    ("P27", "gate-placement", "A leaf's gate reads only files in that leaf's owned scope.", "LEAF_GATE", "Evidence is local to the leaf.", "ORCHESTRATION"),
    ("P28", "gate-placement", "An end-to-end regression involving four leaves is copied into every leaf ledger.", "MOVE_TO_BRANCH_GATE", "Cross-cutting checks should run once after composition.", "plan/ORCHESTRATION"),
    ("P29", "gate-placement", "Interface compatibility is checked only after all named child artifacts return.", "BRANCH_GATE", "The evidence exists at integration level.", "ORCHESTRATION"),
    ("P30", "ownership", "Two proposed parallel leaves both own the same configuration file.", "SEQUENTIAL_OR_ISOLATE", "Overlapping writers are not safely independent.", "ORCHESTRATION"),
    ("P31", "ownership", "A leaf ownership claim is released before the parent reruns its checks.", "REJECT_RELEASE", "Release follows parent verification.", "ORCHESTRATION"),
    ("P32", "parallelism", "The driver launches worker A, waits for its result, then launches worker B while reporting parallel execution.", "FALSE_PARALLEL_CLAIM", "No launch wave existed before the first wait.", "ORCHESTRATION"),
    ("P33", "parallelism", "Every READY worker is launched, each distinct host handle is recorded, and only then does the driver wait.", "PARALLEL_WAVE_PROVED", "The launch barrier supports the scheduling claim.", "ORCHESTRATION"),
    ("P34", "parallelism", "The host does not expose nonblocking starts or worker handles.", "SEQUENTIAL_FALLBACK", "Do not claim parallelism without observable starts.", "ORCHESTRATION"),
    ("P35", "parallelism", "A partial launch cannot recover, so the wave is preserved as an abandoned handoff rather than inventing a handle.", "HANDOFF_REQUIRED", "Failure state must remain auditable.", "ORCHESTRATION"),
    ("P36", "rolling-dispatch", "A verified leaf releases ownership and unblocks another while an unrelated worker is still running.", "LAUNCH_NEW_READY_WORK", "Rolling dispatch avoids an unnecessary global barrier.", "ORCHESTRATION"),
    ("P37", "shared-failure", "Every worker in a wave fails because the shared toolchain path is wrong.", "REPAIR_SHARED_CONTRACT", "More workers would repeat the same failure.", "get-it-done"),
    ("P38", "final-report", "The final report copies counts from the plan instead of recounting the current artifact and gate states.", "REMEASURE", "Final numeric claims require fresh measurement.", "get-it-done/gauntlet-loop"),
    ("P39", "lint-boundary", "A lexical gate linter warns that a title starts with review, but the gate has a strong direct oracle.", "ADVISORY_ONLY", "A heuristic warning is not proof of a bad gate.", "review/test"),
    ("P40", "runtime-boundary", "A generic Lean installation would bundle Unlazy's Node checker and Stop hook automatically.", "REJECT_GLOBAL_RUNTIME", "Keep the runtime upstream and project-local; absorb stable behavior only.", "skill-design"),
]
output = io.StringIO(newline="")
writer = csv.writer(output, lineterminator="\n")
writer.writerow(["id", "category", "scenario", "expected_behavior", "rationale", "owning_authority"])
writer.writerows(scenario_rows)
scenario_text = output.getvalue()
write("docs/evals/proof-integrity-scenarios-v8.4.0.csv", scenario_text)
write("releases/v8.4.0/proof-integrity-scenarios-v8.4.0.csv", scenario_text)

# ---------------------------------------------------------------------------
# Documentation, catalog, release notes, and audits
# ---------------------------------------------------------------------------
readme = read("README.md")
readme = replace_once(readme, "version-v8.3.2-2563eb", "version-v8.4.0-2563eb", "README badge")
readme = replace_once(
    readme,
    "V8.3.2 keeps the V8.3 skill behaviour and V8.3.1 repository hardening. It also embeds the complete Communication profile (`teach`, `wait-what`, and `writing`) into both the Get It Done and Gauntlet packs. These packs now carry adaptive prose, teaching, writing, and human-usable-information support without a second installation. Read the [project history](docs/HISTORY.md), [standards register](docs/STANDARDS-REGISTER.md), and [repository audit](docs/REPOSITORY-AUDIT.md).",
    "V8.4.0 keeps the 23-skill architecture and the communication-complete task packs. It absorbs selected Unlazy 2.1.0 mechanisms for falsifiable gates, current parent re-verification, honest handoff states, ownership-safe fan-out, launch barriers, leaf-versus-branch checks, and semantic progress. It does not bundle the Unlazy runtime, hooks, installer, or Node tools. Read the [Unlazy re-audit](docs/UNLAZY-REVIEW-v8.4.0.md), [project history](docs/HISTORY.md), [standards register](docs/STANDARDS-REGISTER.md), and [repository audit](docs/REPOSITORY-AUDIT.md).",
    "README release summary",
)
readme = readme.replace("-openai-v8.3.2.zip", "-openai-v8.4.0.zip")
readme = readme.replace("./artifacts/v8.3.2", "./artifacts/v8.4.0")
readme = replace_once(
    readme,
    "- Evidence before claims.",
    "- Evidence before claims. Acceptance oracles must observe the named outcome and fail honestly under a representative broken state.",
    "README design principle",
)
readme = replace_once(readme, "The source on `main` is canonical for V8.3.2.", "The source on `main` is canonical for V8.4.0.", "README canonical version")
write("README.md", readme)

changelog = read("CHANGELOG.md")
entry = f"""## 8.4.0 — 2026-08-31

- Keep all 23 canonical skills, all six profiles, and all invocation policies.
- Re-audit `Leonxlnx/unlazy` at commit `{UNLAZY_COMMIT}`; add no routed skill and vendor none of its Node runtime, checker, dispatcher, installer, approval store, or Stop hook.
- Strongly absorb falsifiable gate authoring, positive controls for absence tests, independent measurement of supplied numbers, representative-broken-state sensitivity, and status-versus-re-execution discipline.
- Add parent re-verification, revisioned contract inventories, exact ownership claim/release semantics, launch-wave barriers, rolling dispatch, and leaf-local versus branch-integration gate placement.
- Treat required abandonment, deferment, or owner-decision states as visible non-completion unless an authorized scope change removes the requirement; preserve Lean's explicit nonblocking residual rule.
- Count progress from resolved acceptance, contract, defect, packet, or dispatch state rather than cosmetic activity.
- Add 40 static proof-integrity scenarios and expand the release audit to 20 passes.

"""
changelog = replace_once(changelog, "# Changelog\n\n", "# Changelog\n\n" + entry, "changelog insertion")
write("CHANGELOG.md", changelog)

catalog = read("docs/SKILL-CATALOG.md")
catalog = replace_once(catalog, "# Lean Agent Skills V8.3.2 catalog", "# Lean Agent Skills V8.4.0 catalog", "catalog heading")
catalog = replace_once(
    catalog,
    "V8.3.2 keeps the same 23 canonical skills and invocation policy. The standalone Communication profile remains available, and its three skills are also included in the Get It Done and Gauntlet packs.",
    "V8.4.0 keeps the same 23 canonical skills, six profiles, and invocation policy. It adds proof-integrity and verified-orchestration rules to existing authorities; the Unlazy runtime remains upstream and project-local.",
    "catalog summary",
)
catalog = replace_once(catalog, "ISO 29148; ISO 12207; BCP 14 |", "ISO 29148; ISO 12207; BCP 14; Unlazy-informed proof integrity |", "catalog get-it-done source")
catalog = replace_once(catalog, "ISO 29119; TDD; test pyramid; property/state-machine testing; TLA+ escalation |", "ISO 29119; TDD; test pyramid; property/state-machine testing; TLA+ escalation; oracle calibration |", "catalog test source")
write("docs/SKILL-CATALOG.md", catalog)

release_audit = f"""# Lean Agent Skills V8.4.0 — 20-pass release audit

## Decision

**PASS STATIC — LIVE HOST AND USER VALIDATION PENDING**

V8.4.0 keeps 23 canonical skills, 17 implicitly selectable skills, 6 manual-only skills, and six deployment profiles. No routed skill, dependency, service, runtime hook, executable skill payload, installer, or automatic trusted-state mutation is added.

## Unlazy synthesis

Reviewed source: `Leonxlnx/unlazy` at commit `{UNLAZY_COMMIT}`. The source targeted an unreleased 2.1.0 and had no Git tag or GitHub Release at review time. Its current implementation is strong and unusually explicit about command trust, evidence freshness, orchestration, and limitations. The runtime remains upstream because it adds a substantial executable and host-specific control plane and had an open Windows/Node file-identity failure report at review time.

### Absorbed

- observable, falsifiable gate outcomes;
- process success plus success-only output when text matching is used;
- positive controls for negative or absence checks;
- independent measurement of supplied numbers;
- sensitivity against representative broken states;
- historical status versus current re-execution;
- parent re-verification of returned work;
- required abandonment as visible non-successful handoff;
- revisioned contract inventories;
- exact ownership claim/release lifecycle;
- launch all native workers and capture handles before waiting;
- rolling dispatch after verification;
- leaf-local versus branch-integration gates;
- semantic rather than cosmetic progress.

### Rejected or kept upstream

- a new `unlazy` route;
- Depth Tree effort multiplication;
- Node checker, parser, linter, dispatcher, installer, approval store, Stop hook, and host adapters;
- universal lexical warning thresholds or manual-gate ratios;
- claims that ownership leases provide process or filesystem isolation.

## Audit passes

| Pass | Perspective | Result |
|---:|---|---|
| 1 | Version, license, metadata, and six-profile alignment | PASS STATIC |
| 2 | 23-skill inventory and support-reference closure | PASS STATIC |
| 3 | OpenAI adapter schema and manual/implicit policy | PASS STATIC |
| 4 | Trigger overlap and routing-surface preservation | PASS STATIC |
| 5 | Adaptive prose and simple-turn restraint | PASS STATIC |
| 6 | Considerate agency and permission boundaries | PASS STATIC |
| 7 | Human-usable information and cognitive accessibility | PASS STATIC |
| 8 | Teaching, transfer, and Easy-to-Read boundaries | PASS STATIC |
| 9 | Explicit standards and project-influence provenance | PASS STATIC |
| 10 | Requirements, quality, lifecycle, and assurance traceability | PASS STATIC |
| 11 | Gate-to-outcome mapping and falsifiable oracle rules | PASS STATIC |
| 12 | Positive-control, supplied-number, and sensitivity rules | PASS STATIC |
| 13 | Executable verifier trust and approval-versus-proof boundary | PASS STATIC |
| 14 | Historical status, evidence freshness, and parent re-execution | PASS STATIC |
| 15 | Required abandonment and residual-risk disposition | PASS STATIC |
| 16 | Contract inventory, stable IDs, ownership, and revision handling | PASS STATIC |
| 17 | Launch waves, distinct handles, sequential fallback, and rolling dispatch | PASS STATIC |
| 18 | Leaf-local versus branch-integration verifier placement | PASS STATIC |
| 19 | Semantic progress and no-progress detection | PASS STATIC |
| 20 | Deterministic builds, archive validation, PowerShell 7, and Windows PowerShell 5.1 | PASS CI REQUIRED |

## Static evaluation corpus

The release includes 40 cases across oracle quality, negative controls, measurement, command trust, re-verification, freshness, handoff, semantic progress, contract inventory, gate placement, ownership, parallelism, rolling dispatch, shared failure, final reporting, and runtime boundaries.

## Remaining limits

- Live routing and instruction adherence in OMP, Codex, and ChatGPT were not measured.
- No claim is made that Lean reproduces Unlazy's mechanical enforcement without the upstream runtime.
- No target-user, accessibility, or task-success study was run.
- Static scenario classification does not prove every model will choose the correct behavior.
- Formal standards, security, accessibility, usability, or quality conformance is not claimed.
- Upstream Unlazy may change after the pinned reviewed commit.
"""
write("docs/AUDIT.md", release_audit)

repo_audit = read("docs/REPOSITORY-AUDIT.md")
repo_audit = replace_once(repo_audit, "# Repository integrity audit — V8.3.2", "# Repository integrity audit — V8.4.0", "repository audit heading")
proof_repo_section = """## Proof-integrity source checks

- The root package metadata pins the reviewed Unlazy commit and states that no runtime is vendored.
- The 40-row proof-integrity scenario corpus is counted from its canonical CSV and compared with the release mirror.
- Required proof-integrity phrases are checked in `AGENTS.md`, `ENGINEERING-CORE.md`, `test`, `get-it-done`, `ORCHESTRATION.md`, `gauntlet-loop`, and `review`.
- No Unlazy checker, dispatcher, installer, Stop hook, approval store, or Node runtime is required by any Lean profile.

"""
repo_audit = replace_once(repo_audit, "## Release gate\n", proof_repo_section + "## Release gate\n", "repository proof section")
repo_audit = replace_once(repo_audit, "V8.3.2 must be tagged", "V8.4.0 must be tagged", "repository release version")
write("docs/REPOSITORY-AUDIT.md", repo_audit)

release_notes = f"""# Lean Agent Skill Collection V8.4.0 — Proof Integrity & Verified Orchestration

V8.4.0 keeps the 23-skill routing surface and absorbs selected mechanisms from `Leonxlnx/unlazy` at commit `{UNLAZY_COMMIT}`.

## Main changes

- Acceptance gates must observe the named outcome and have a credible failure path.
- Output-matched gates require process success plus a success-only marker.
- Negative or absence checks need a known positive control when consequential.
- Supplied figures must be calculated independently from source data.
- Load-bearing verifiers should fail against a representative broken state when practical.
- Stored status, checked boxes, and worker reports are historical claims; parents and judges re-execute current critical checks.
- Required `ABANDONED`, `DEFERRED`, or `OWNER_DECISION` gates remain non-completion unless an authorized scope change removes them.
- Delegated plans inventory every omittable outcome and acceptance-changing constraint with a stable owner and observation.
- Parallel waves launch all workers and record distinct native handles before the first wait; hosts without that evidence use the sequential fallback.
- Ownership is released after parent verification, enabling rolling dispatch.
- Leaf gates remain local; interface, end-to-end, joined-state, and regression gates run at integration level.
- Progress is based on resolved work or acceptance state, not cosmetic edits or repeated status reads.

## Deliberate non-adoption

Lean does not bundle Unlazy's Node checker, parser, gate linter, dispatcher, installer, approval store, Stop hook, templates, or host adapters. Projects may install the upstream runtime separately after pinning and reviewing it. The upstream source was not tagged or released at review time, and an open Windows/Node issue reported a platform-specific fail-closed file-identity defect.

## Compatibility

- Same 23 canonical skills.
- Same six profile names and inventories.
- Same manual and implicit invocation policy.
- No new dependency, service, hook, installer, executable skill payload, or automatic trusted-state mutation.

## Validation

- 40 proof-integrity scenarios.
- 20-pass static release audit.
- Deterministic double builds.
- Validator rejection controls.
- Source, package, archive, and repository validation.
- PowerShell 7 and Windows PowerShell 5.1 CI.
- Annotated tag and public-release read-back.

## Evidence limits

This release does not establish live OMP, Codex, or ChatGPT behavior; it does not mechanically enforce gates without an external host or project runtime; and it makes no formal conformance claim.
"""
write("releases/v8.4.0/RELEASE-NOTES-v8.4.0.md", release_notes)
write("releases/v8.4.0/lean-agent-skills-v8.4.0-20pass-audit.md", release_audit)

# ---------------------------------------------------------------------------
# Build and validation contracts
# ---------------------------------------------------------------------------
build = read("scripts/build-release.ps1")
build = replace_once(
    build,
    '  "explicit_standards": {\n    "engineering_core_source_map": true,\n    "owning_skill_names": true,\n    "formal_conformance_claimed": false\n  },\n  "human_usable_information": {',
    '  "explicit_standards": {\n    "engineering_core_source_map": true,\n    "owning_skill_names": true,\n    "formal_conformance_claimed": false\n  },\n  "proof_integrity": {\n    "global_principles": true,\n    "oracle_must_be_falsifiable": true,\n    "status_is_not_reexecution": true,\n    "required_gate_abandonment_is_not_completion": true\n  },\n  "human_usable_information": {',
    "generated package proof metadata",
)
build = replace_once(
    build,
    '  "human_usable_information": true,\n  "skill_content_changed_from_v8_0_0": true,',
    '  "human_usable_information": true,\n  "proof_integrity": true,\n  "skill_content_changed_from_v8_0_0": true,',
    "release manifest proof flag",
)
write("scripts/build-release.ps1", build)

validate = read("scripts/validate.ps1")
validate = replace_once(validate, "    $human = $validation.human_usable_information\n", "    $human = $validation.human_usable_information\n    $proof = $validation.proof_integrity\n", "validator proof variable")
validate = replace_once(
    validate,
    "-or -not $human.easy_to_read_requires_intended_user_review -or $human.static_scenarios -ne 48)",
    "-or -not $human.easy_to_read_requires_intended_user_review -or $human.static_scenarios -ne 48 -or -not $proof.global_principles -or $proof.source_project -ne 'Leonxlnx/unlazy' -or $proof.source_commit -ne '473d4b80421c36d733042434cd4b938f81a19ef1' -or $proof.runtime_vendored -ne $false -or -not $proof.oracle_must_be_falsifiable -or -not $proof.status_is_not_reexecution -or -not $proof.required_gate_abandonment_is_not_completion -or -not $proof.native_parallel_claim_requires_launch_barrier -or $proof.scenario_file -ne 'docs/evals/proof-integrity-scenarios-v8.4.0.csv' -or $proof.static_scenarios -ne 40)",
    "validator proof metadata",
)
proof_checks = """    $proofChecks = @{
        'AGENTS.md'=@('representative broken state','historical state, not re-execution');
        'ENGINEERING-CORE.md'=@('Proof integrity and verified orchestration','known positive fixture','before the first wait');
        'skills/test/SKILL.md'=@('Calibrate the verifier','known positive fixture','representative broken implementation');
        'skills/get-it-done/SKILL.md'=@('verifier or oracle','historical status');
        'skills/get-it-done/ORCHESTRATION.md'=@('before the first wait','Leaf gate','ownership claim');
        'skills/gauntlet-loop/SKILL.md'=@('representative broken state','re-execute the current critical oracles');
        'skills/review/LANES.md'=@('Proof integrity and acceptance gates','positive controls for absence tests')
    }
    foreach ($relative in $proofChecks.Keys) {
        $checkPath = Join-Path $repoRoot $relative
        if (-not (Test-Path -LiteralPath $checkPath)) { Add-Failure "proof-integrity file missing: $relative"; continue }
        $checkText = Get-Content -Raw -LiteralPath $checkPath
        foreach ($needle in $proofChecks[$relative]) {
            if ($checkText -notmatch [regex]::Escape($needle)) { Add-Failure "proof-integrity contract missing '$needle' in $relative" }
        }
    }
"""
validate = replace_once(
    validate,
    "    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback|human-usable information' })) { Add-Pass \"$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, support references, and human-usable-information contract\" }",
    proof_checks + "    if (-not ($failures | Where-Object { $_ -match 'skill|adapter|frontmatter|support|fallback|human-usable information|proof-integrity' })) { Add-Pass \"$($actual.Count)-skill inventory, frontmatter, adapters, local fallbacks, support references, human-usable-information, and proof-integrity contracts\" }",
    "validator proof files",
)
validate = replace_once(
    validate,
    "$manifest.skill_content_changed_from_v8_0_0 -ne $true -or $manifest.considerate_agency -ne $true)",
    "$manifest.skill_content_changed_from_v8_0_0 -ne $true -or $manifest.considerate_agency -ne $true -or $manifest.proof_integrity -ne $true)",
    "validator release manifest proof flag",
)
write("scripts/validate.ps1", validate)

repo_auditor = read("scripts/audit-repository.ps1")
proof_audit = r'''
$proof = $package.proof_integrity
if ($null -eq $proof -or -not $proof.global_principles -or $proof.source_project -ne 'Leonxlnx/unlazy' -or $proof.source_commit -ne '473d4b80421c36d733042434cd4b938f81a19ef1' -or $proof.runtime_vendored -ne $false -or -not $proof.oracle_must_be_falsifiable -or -not $proof.status_is_not_reexecution -or -not $proof.required_gate_abandonment_is_not_completion -or -not $proof.native_parallel_claim_requires_launch_barrier) {
    Add-Failure 'PACKAGE-VALIDATION.json lacks the V8.4 proof-integrity contract'
} else {
    $proofScenarioRelative = [string]$proof.scenario_file
    $proofScenarioPath = Join-Path $RepositoryRoot $proofScenarioRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $proofMirrorRelative = 'releases/v8.4.0/proof-integrity-scenarios-v8.4.0.csv'
    $proofMirrorPath = Join-Path $RepositoryRoot $proofMirrorRelative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    if (-not (Test-Path -LiteralPath $proofScenarioPath -PathType Leaf)) { Add-Failure "proof-integrity scenario file missing: $proofScenarioRelative" }
    elseif (-not (Test-Path -LiteralPath $proofMirrorPath -PathType Leaf)) { Add-Failure "proof-integrity release mirror missing: $proofMirrorRelative" }
    else {
        $proofScenarioCount = @(Import-Csv -LiteralPath $proofScenarioPath).Count
        if ($proofScenarioCount -ne [int]$proof.static_scenarios) { Add-Failure "proof-integrity metadata says $($proof.static_scenarios) but CSV contains $proofScenarioCount rows" }
        if ((Get-Sha256 $proofScenarioPath) -ne (Get-Sha256 $proofMirrorPath)) { Add-Failure 'proof-integrity scenario mirror drift' }
    }
}
'''
repo_auditor = replace_once(repo_auditor, "$scenarioExpected = [int]$package.human_usable_information.static_scenarios\n", proof_audit + "\n$scenarioExpected = [int]$package.human_usable_information.static_scenarios\n", "repository proof scenario checks")
repo_auditor = replace_once(
    repo_auditor,
    "'docs/AUDIT.md','docs/SKILL-CATALOG.md','docs/STANDARDS-REGISTER.md','docs/REPOSITORY-AUDIT.md',",
    "'docs/AUDIT.md','docs/SKILL-CATALOG.md','docs/STANDARDS-REGISTER.md','docs/REPOSITORY-AUDIT.md','docs/UNLAZY-REVIEW-v8.4.0.md',",
    "repository text file list",
)
repo_auditor = replace_once(
    repo_auditor,
    "Add-Pass 'repository metadata, current release, 23-skill inventory, evaluation mirrors, text hygiene, and temporary-file checks'",
    "Add-Pass 'repository metadata, current release, 23-skill inventory, profile composition, proof-integrity scenarios, evaluation mirrors, text hygiene, and temporary-file checks'",
    "repository pass message",
)
write("scripts/audit-repository.ps1", repo_auditor)

# ---------------------------------------------------------------------------
# Refresh governed source hashes
# ---------------------------------------------------------------------------
manifest_path = ROOT / "UPSTREAM-CHECKSUMS.sha256"
lines: list[str] = []
for raw in manifest_path.read_text(encoding="utf-8").splitlines():
    match = re.fullmatch(r"([0-9a-fA-F]{64})\s+(.+)", raw)
    if not match:
        raise SystemExit(f"Malformed checksum line: {raw}")
    relative = match.group(2)
    target = ROOT / relative
    if not target.is_file():
        raise SystemExit(f"Checksum target is missing: {relative}")
    digest = hashlib.sha256(target.read_bytes()).hexdigest()
    lines.append(f"{digest}  {relative}")
write("UPSTREAM-CHECKSUMS.sha256", "\n".join(lines))

print("Applied V8.4.0 proof-integrity and verified-orchestration update.")
