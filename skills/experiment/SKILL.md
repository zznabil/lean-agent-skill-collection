---
name: experiment
description: "Design a controlled product, performance, or engineering experiment—or a disposable prototype—with a falsifiable hypothesis, comparable baseline, guardrails, and stopping rule."
---

# Experiment

Apply **Goal–Question–Metric (GQM)**: begin with the decision goal, derive the questions, then choose metrics that answer them. Use **ISO 31000-inspired risk treatment** where needed. Apply the **Principles of Chaos Engineering** only for authorized resilience experiments with steady state, abort conditions, and controlled blast radius.

Choose **product** for an A/B or behavior test and **engineering** for performance, reliability, or implementation comparisons.

1. State the decision goal, derive the questions that settle it, then choose decision-relevant metrics. Record workload, intervention, control, mechanism, and falsifiable hypothesis.
2. Before buying a new live intervention, test the hypothesis against existing logs, traces, tests, diffs, historical outputs, or prior runs. Use a new probe only for uncertainty the record cannot settle.
3. When an executable artifact is the cheapest separating test, build a disposable prototype with one question, one observable signal, a time box, and explicit limits on what it proves. Keep it out of production until separately reviewed.
4. Before a costly, irreversible, externally visible, or multi-step intervention, state the observable expected result. Stop dependent steps on the first material mismatch and preserve the counterexample.
5. Choose one primary outcome and a few correctness or safety guardrails. Define practical significance before seeing results.
6. Hold environment, data, build, warm-up, and measurement method constant unless one is the tested variable. For product work, define assignment, randomization, exclusions, exposure, contamination, and measurement window. For engineering work, capture the baseline, change one material variable, repeat enough to estimate noise, and record hardware, revision, and inputs.
7. Freeze analysis, stopping, segmentation, and data-quality rules. Use a staged ladder: degenerate validity gates → smoke or paired sample → more samples only when promising → full confirmation. Start serially. For expensive or noisy checks, repeat the unchanged build to estimate the noise floor and pre-register the promotion threshold.
8. Classify the result honestly: supported, falsified, inconclusive, timed out, invalid environment, or no meaningful change. A timeout or exhausted search inside one model is not proof of impossibility.
9. Analyze effect size and uncertainty. Keep a change only when it preserves correctness and beats the baseline enough to justify complexity; otherwise revert or mark inconclusive.
10. Record failed, neutral, and contradicted attempts so they are not repeated without new evidence.
11. For resilience work, define steady state, fault, abort conditions, and blast radius. Production fault injection requires authorization and rollback.

Do not launch when tracking, assignment, ethics, privacy, rollback, or correctness is unresolved. Do not present exploratory segments, source guesses, or simulated predictions as measured real-world results.


**User-facing:** Apply the global outcome-first delivery overlay. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
