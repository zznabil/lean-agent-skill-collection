---
name: debug
description: "Diagnose a hard defect or performance regression through a tight reproducible feedback loop, evidence-first investigation, falsifiable competing hypotheses, targeted instrumentation, and verified regression coverage."
---

# Debug

1. Redact secrets and unnecessary personal data from commands, logs, captures, and reports.
2. Build and run a fast pass/fail loop for the exact symptom before forming a root-cause theory. Prefer a failing test, repeatable command, replay, browser check, differential run, or minimal harness.
3. Collect facts before a story: observed behavior, revision, environment, inputs, logs, config, dependencies, and timing. Separate raw evidence from interpretation and keep a compact revisable playbook when the investigation is long.
4. For an intermittent failure, classify the changing dimension: timing, environment, state, data, dependency, or revision. Vary one factor and record conditions or seed.
5. Minimize the reproduction until each remaining element is necessary.
6. Generate three to five genuinely different hypotheses with checkable predictions. Before buying a new live probe, retrodict each hypothesis against existing logs, traces, failures, and known-good runs; use live action only to separate the survivors.
7. Assign one focused falsification attempt to each surviving hypothesis when the problem is costly or multi-causal. Do not ask one reviewer to pick a favorite story.
8. Test one variable at a time with targeted, labeled instrumentation. Use revision bisect when known-good and known-bad boundaries exist.
9. Do not rerun an unchanged verifier under unchanged conditions and expect new information. Change the hypothesis, state, instrumentation, environment, or representation first.
10. If deep search inside the current model finds nothing, challenge the boundary, representation, or supposedly verified rule. Search exhaustion and timeouts do not establish impossibility.
11. Fix the smallest surviving cause, add regression coverage at a real boundary, rerun the original and adjacent checks, remove probes, and record evidence and remaining uncertainty.
12. Derive confidence from the outcome: one survivor with rivals falsified is stronger than several survivors; zero survivors means the cause is unknown, not that the first theory wins.

If no truthful feedback loop can be built or bounded attempts do not converge, stop guessing. Report `BLOCKED` or `UNSTABLE`, what was tried, falsified paths, and the smallest missing artifact, access, permission, or separating test. Do not report `INFEASIBLE` while a material untested assumption and a safe probe remain.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
