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
6. For a simple DIRECT defect, begin with the one or two cheapest plausible hypotheses. Generate three to five genuinely different hypotheses only when the problem is costly, intermittent, or multi-causal. Before buying a new live probe, retrodict each hypothesis against existing logs, traces, failures, and known-good runs; use live action only to separate the survivors.
7. Assign one focused falsification attempt to each surviving hypothesis when the problem is costly or multi-causal. Do not ask one reviewer to pick a favorite story.
8. Test one variable at a time with targeted, labeled instrumentation. Use revision bisect when known-good and known-bad boundaries exist.
9. Do not rerun an unchanged verifier under unchanged conditions and expect new information. After two materially similar failed attempts, change the hypothesis, boundary, instrumentation, environment, or representation; changing only a parameter inside the same failed mechanism is not a new strategy.
10. If deep search inside the current model finds nothing, challenge the boundary, representation, or supposedly verified rule. Search exhaustion and timeouts do not establish impossibility.
11. Fix the smallest surviving cause, add regression coverage at a real boundary, rerun the original and adjacent checks, remove probes, and record evidence and remaining uncertainty.
12. Derive confidence from the outcome: one survivor with rivals falsified is stronger than several survivors; zero survivors means the cause is unknown, not that the first theory wins.

If no truthful feedback loop can be built or bounded attempts do not converge, stop guessing. Report `BLOCKED` or `UNSTABLE`, what was tried, falsified paths, and the smallest missing artifact, access, permission, or separating test. Do not report `INFEASIBLE` while a material untested assumption and a safe probe remain.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
