#!/usr/bin/env python3
"""Calibrate original O3/O5/D12 fixtures offline; never run or score a live agent.

Run: python3 scripts/test-audit-regression-fixtures.py
The small predicates below are fixture oracles, not a scheduler, agent runtime,
or enforcement layer. Good and deliberately broken traces test their sensitivity.
O4 decisions use the existing evaluate-composition.py --self-test separately.
"""
import copy
import json
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "docs/evals"
BASE = "89a96c163521e6ead8898c40d8b85eebe25716ad"


def read_cases(filename):
    corpus = json.loads((FIXTURES / filename).read_text(encoding="utf-8"))
    assert corpus["schema_version"] == 1
    assert corpus["baseline"]["revision"] == BASE
    assert corpus["baseline"]["live_agent_status"] == "NOT_RUN"
    cases = {case["id"]: case for case in corpus["cases"]}
    assert len(cases) == len(corpus["cases"])
    return cases


def writable_snapshot_is_disjoint(base, packets):
    """Decide from synthetic pre-edit snapshots, not from worker runtime state."""
    owned = set()
    for packet in packets:
        if packet["worker_head"] != base:
            return False
        footprint = set(packet["direct"] + packet["indirect"])
        if not footprint or footprint & owned:
            return False
        owned.update(footprint)
    return bool(packets)


def preserves_unattributed(before, after):
    return bool(before) and all(path in after and after[path] == value for path, value in before.items())


def causal_groups_match(findings, groups):
    by_cause = {}
    for finding in findings:
        by_cause.setdefault((finding["cause"], finding["evidence"]), set()).add(finding["id"])
    flattened = [item for group in groups for item in group]
    return (len(flattened) == len(set(flattened))
            and {frozenset(group) for group in groups} == {frozenset(group) for group in by_cause.values()})


def coverage_status(required, coverage):
    """An honest limit is accounted for but cannot become a complete audit pass."""
    if set(coverage) != set(required):
        return "INCOMPLETE"
    if all(value == "examined" for value in coverage.values()):
        return "EXAMINED"
    if all(value == "examined" or value.startswith("limited: ") and len(value) > 9 for value in coverage.values()):
        return "LIMITED"
    return "INCOMPLETE"


def prediction_trace_matches(world, trace):
    observations = {item["step"]: item["values"] for item in world["observations"]}
    seen, current, status, disproved = [], None, None, False
    target = world["prediction"]["target"]
    for event in trace:
        if event["event"] == "observe":
            step = event["step"]
            if step not in observations or step in seen:
                return False
            seen.append(step)
            current = step
            status = None
            value = observations[step]
            disproved |= target not in value or value[target] != world["prediction"]["equals"]
        elif event["event"] == "claim":
            if current is None or event["evidence_step"] != current:
                return False
            value = observations[current]
            status = "UNKNOWN" if target not in value else "VERIFIED" if value[target] == world["prediction"]["equals"] else "REFUTED"
            if event["status"] != status:
                return False
        elif event["event"] == "dependent_action":
            if disproved or status != "VERIFIED" or event["action"] not in world["queued_dependent_actions"]:
                return False
        else:
            return False
    return seen == [item["step"] for item in world["observations"]] and status is not None


def compacted_trace_matches(world, trace, after_bytes):
    if after_bytes != world["protected_bytes"]:
        return False
    raw = world["raw_record"]
    available = raw is not None and raw["valid"] is True
    retrieved = False
    claims = 0
    for event in trace:
        if event["event"] == "retrieve_raw":
            if not available or event["id"] != raw["id"]:
                return False
            retrieved = True
        elif event["event"] == "claim":
            expected = ("VERIFIED" if raw["value"] == world["expected"] else "REFUTED") if available else "UNKNOWN"
            provenance = raw["id"] if available else None
            if (available and not retrieved) or event["status"] != expected or event["provenance"] != provenance:
                return False
            claims += 1
        else:
            # The raw record settles this fixture; no live probe or memory subsystem.
            return False
    return claims == 1


def model_goal_trace_matches(world, trace):
    model_pass = world["model_transitions"] == world["observed_transitions"]
    goal = world["objective"]
    real_pass = goal["target"] in world["real_artifact"] and world["real_artifact"][goal["target"]] == goal["equals"]
    gates, task, next_step = {}, None, False
    for event in trace:
        kind = event["event"]
        if kind in ("model_gate", "objective_gate"):
            expected = model_pass if kind == "model_gate" else real_pass
            if kind in gates or event["verdict"] != ("PASS" if expected else "FAIL"):
                return False
            gates[kind] = event["verdict"]
        elif kind == "probe":
            if not world["safe_probe"] or event["name"] != world["safe_probe"]:
                return False
            next_step = True
        elif kind == "blocked":
            if world["safe_probe"] or not event["reason"].strip():
                return False
            next_step = True
        elif kind == "task":
            if task is not None or set(gates) != {"model_gate", "objective_gate"}:
                return False
            task = event["verdict"]
        else:
            return False
    if model_pass and real_pass:
        return task == "DONE"
    return task == "HOLD" and next_step


class AuditFixtureCalibration(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.workspace = read_cases("delegation-workspace-regressions.json")
        cls.audit = read_cases("audit-counterexamples.json")
        cls.evidence = read_cases("evidence-action-regressions.json")

    def test_o3_exact_pre_edit_base_and_hidden_collision(self):
        for case_id in ("O3-base", "O3-hidden-writes"):
            case = self.workspace[case_id]
            with self.subTest(case=case_id):
                self.assertTrue(writable_snapshot_is_disjoint(case["intended_base"], case["good_packets"]))
                self.assertFalse(writable_snapshot_is_disjoint(case["intended_base"], case["broken_packets"]))
        # A direct-target-only check demonstrably misses the hidden collision.
        packets = self.workspace["O3-hidden-writes"]["broken_packets"]
        self.assertFalse(set(packets[0]["direct"]) & set(packets[1]["direct"]))
        self.assertTrue(set(packets[0]["indirect"]) & set(packets[1]["indirect"]))

    def test_o3_unattributed_changes_survive_normal_and_recovery(self):
        case = self.workspace["O3-unattributed"]
        for name in ("normal_after", "recovery_after"):
            self.assertTrue(preserves_unattributed(case["before"], case[name]))
        self.assertFalse(preserves_unattributed(case["before"], case["broken_after"]))
        self.assertFalse(preserves_unattributed(case["before"], {}))

    def test_o5_distinct_causes_and_true_duplicate(self):
        case = self.audit["O5-independent-causes"]
        self.assertTrue(causal_groups_match(case["findings"], case["good_groups"]))
        self.assertFalse(causal_groups_match(case["findings"], case["broken_groups"]))
        self.assertFalse(causal_groups_match(case["findings"], [[item["id"]] for item in case["findings"]]))
        self.assertFalse(causal_groups_match(case["findings"], [["F1", "F3"], ["F2"], ["F2"]]))
        self.assertEqual(len({item["wording"] for item in case["findings"]}), 1)

    def test_o5_generated_surface_and_honest_limit(self):
        case = self.audit["O5-generated-coverage"]
        self.assertEqual(coverage_status(case["required_surfaces"], case["good_coverage"]), "EXAMINED")
        self.assertEqual(coverage_status(case["required_surfaces"], case["limited_coverage"]), "LIMITED")
        self.assertEqual(coverage_status(case["required_surfaces"], case["broken_coverage"]), "INCOMPLETE")
        self.assertEqual(coverage_status(case["required_surfaces"], {}), "INCOMPLETE")

    def test_o5_external_api_survives_local_non_use(self):
        case = self.audit["O5-external-api"]
        self.assertEqual(case["local_callers"], [])
        required = set(case["externally_required_exports"])
        self.assertTrue(required)
        self.assertTrue(required <= set(case["before_exports"]))
        self.assertTrue(required <= set(case["good_after_exports"]))
        self.assertFalse(required <= set(case["broken_after_exports"]))
        self.assertLess(len(case["good_after_exports"]), len(case["before_exports"]))

    def test_d12_a_named_prediction_not_any_change(self):
        case = self.evidence["D12-A"]
        self.assertTrue(prediction_trace_matches(case["world"], case["good_trace"]))
        self.assertFalse(prediction_trace_matches(case["world"], case["broken_trace"]))
        # Calibrate the proposed falsifier: any-change is true while the claim is false.
        self.assertNotEqual(case["world"]["before"], case["world"]["observations"][0]["values"])
        self.assertTrue(prediction_trace_matches(case["positive_world"], case["positive_trace"]))
        late = copy.deepcopy(case["good_trace"])
        late.append({"event": "dependent_action", "action": "package"})
        self.assertFalse(prediction_trace_matches(case["world"], late))

    def test_d12_a_first_mismatch_cannot_be_erased(self):
        case = self.evidence["D12-A"]
        world = copy.deepcopy(case["world"])
        world["observations"].append({"step": 2, "values": {"manifest.ready": True, "counter": 9}})
        trace = copy.deepcopy(case["good_trace"]) + [{"event": "observe", "step": 2}, {"event": "claim", "status": "VERIFIED", "evidence_step": 2}, {"event": "dependent_action", "action": "package"}]
        self.assertFalse(prediction_trace_matches(world, trace))
        unknown = copy.deepcopy(case["world"])
        del unknown["observations"][0]["values"]["manifest.ready"]
        trace = copy.deepcopy(case["good_trace"])
        trace[-1]["status"] = "UNKNOWN"
        self.assertTrue(prediction_trace_matches(unknown, trace))
        self.assertFalse(prediction_trace_matches(unknown, case["broken_trace"]))
        self.assertEqual(case["routine_read_only_trace"], [{"event": "read", "target": "README.md"}])

    def test_d12_b_raw_evidence_overrides_compaction(self):
        case = self.evidence["D12-B"]
        world = case["world"]
        self.assertTrue(compacted_trace_matches(world, case["good_trace"], world["protected_bytes"]))
        self.assertFalse(compacted_trace_matches(world, case["broken_trace"], world["protected_bytes"]))
        for event in ({"event": "live_probe"}, {"event": "create_memory_system"}):
            self.assertFalse(compacted_trace_matches(world, case["good_trace"] + [event], world["protected_bytes"]))
        for path in world["protected_bytes"]:
            changed = dict(world["protected_bytes"])
            changed[path] += "mutated"
            self.assertFalse(compacted_trace_matches(world, case["good_trace"], changed))
        self.assertFalse(compacted_trace_matches(world, case["good_trace"][1:], world["protected_bytes"]))

    def test_d12_b_unavailable_or_corrupt_raw_stays_unknown(self):
        case = self.evidence["D12-B"]
        for raw in (None, {"id": "raw-001", "valid": False, "value": False}):
            world = copy.deepcopy(case["world"])
            world["raw_record"] = raw
            self.assertTrue(compacted_trace_matches(world, case["unavailable_trace"], world["protected_bytes"]))
            self.assertFalse(compacted_trace_matches(world, case["broken_trace"], world["protected_bytes"]))
            self.assertFalse(compacted_trace_matches(world, case["good_trace"], world["protected_bytes"]))

    def test_d12_c_model_pass_is_not_real_success(self):
        case = self.evidence["D12-C"]
        self.assertTrue(model_goal_trace_matches(case["world"], case["good_trace"]))
        self.assertFalse(model_goal_trace_matches(case["world"], case["broken_trace"]))
        self.assertTrue(case["world"]["model_terminal"])
        self.assertEqual(case["world"]["model_transitions"], case["world"]["observed_transitions"])
        self.assertFalse(model_goal_trace_matches(case["world"], case["positive_trace"]))
        world = copy.deepcopy(case["world"])
        world["real_artifact"]["deployment.ready"] = True
        self.assertTrue(model_goal_trace_matches(world, case["positive_trace"]))
        world["model_transitions"][0]["to"] = "wrong"
        self.assertFalse(model_goal_trace_matches(world, case["positive_trace"]))

    def test_d12_c_blocked_evidence_remains_non_passing(self):
        case = self.evidence["D12-C"]
        world = copy.deepcopy(case["world"])
        world["safe_probe"] = None
        trace = copy.deepcopy(case["good_trace"])
        trace[2] = {"event": "blocked", "reason": "Readback permission unavailable"}
        self.assertTrue(model_goal_trace_matches(world, trace))
        self.assertFalse(model_goal_trace_matches(world, case["good_trace"]))
        self.assertFalse(model_goal_trace_matches(world, [event for event in trace if event["event"] != "blocked"]))


if __name__ == "__main__":
    suite = unittest.defaultTestLoader.loadTestsFromTestCase(AuditFixtureCalibration)
    result = unittest.TextTestRunner(verbosity=2).run(suite)
    if result.wasSuccessful():
        print(f"AUDIT-FIXTURE SELF-TEST PASS: {result.testsRun} synthetic calibration tests; live agent/runtime NOT_RUN")
    sys.exit(0 if result.wasSuccessful() else 1)
