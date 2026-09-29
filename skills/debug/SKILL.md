---
name: debug
description: "Diagnose a hard defect or performance regression through a tight reproducible feedback loop, evidence-first investigation, falsifiable competing hypotheses, targeted instrumentation, and verified regression coverage."
---

# Debug

1. **Data protection.** Redact secrets and unnecessary personal data from commands, logs, captures, and reports.
2. **Reproduce the symptom.** Treat the user-reported failure as a fact; build and run a fast pass/fail loop for its exact behavior before settling on a cause. Prefer a failing test, repeatable command, replay, browser check, differential run, or minimal harness. Do not call inability to reproduce a refutation.
3. **Evidence before theory.** Collect facts before a story: observed behavior, revision, environment, inputs, logs, config, dependencies, and timing. Separate raw evidence from interpretation and keep a compact revisable playbook when the investigation is long.
4. **Intermittent conditions.** For an intermittent failure, classify the changing dimension: timing, environment, state, data, dependency, or revision. Vary one factor and record conditions or seed.
5. **Minimal reproduction.** Minimize the reproduction until each remaining element is necessary.
6. **Competing hypotheses.** For a simple DIRECT defect, begin with the one or two cheapest plausible hypotheses.
   - Generate three to five genuinely different hypotheses only when the problem is costly, intermittent, or multi-causal.
   - Before buying a new live probe, retrodict each hypothesis against existing logs, traces, failures, and known-good runs; use live action only to separate the survivors.
7. **Falsify survivors.** Assign one focused falsification attempt to each surviving hypothesis when the problem is costly or multi-causal. Do not ask one reviewer to pick a favorite story.
8. **Separating test.** Test one variable at a time with targeted, labeled instrumentation. Use revision bisect when known-good and known-bad boundaries exist.
9. **Change failed strategy.** Do not rerun an unchanged verifier under unchanged conditions and expect new information. After two materially similar failed attempts, change the hypothesis, boundary, instrumentation, environment, or representation; changing only a parameter inside the same failed mechanism is not a new strategy.
10. **Challenge assumptions.** If deep search inside the current model finds nothing, challenge the boundary, representation, or supposedly verified rule. Search exhaustion and timeouts do not establish impossibility.
11. **Repair and regression.** Fix the smallest surviving cause, add regression coverage at a real boundary, rerun the original and adjacent checks, remove probes, and record evidence and remaining uncertainty.
12. **Confidence.** Derive confidence from the outcome: one survivor with rivals falsified is stronger than several survivors; zero survivors means the cause is unknown, not that the first theory wins.

If no truthful feedback loop can be built or bounded attempts do not converge, stop guessing.

- Report `BLOCKED` or `UNSTABLE`, what was tried, falsified paths, and the smallest missing artifact, access, permission, or separating test.
- Do not report `INFEASIBLE` while a material untested assumption and a safe probe remain.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
