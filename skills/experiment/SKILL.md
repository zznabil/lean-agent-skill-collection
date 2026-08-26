---
name: experiment
description: "Design a controlled product, performance, or engineering experiment with a falsifiable hypothesis, comparable baseline, decision metric, guardrails, and stopping rule before implementation or launch."
---

# Experiment

Choose **product** for an A/B or behavior test and **engineering** for performance, reliability, or implementation comparisons.

1. State the decision goal, derive the questions that settle it, then choose decision-relevant metrics. Record workload, intervention, control, mechanism, and falsifiable hypothesis.
2. Before buying a new live intervention, test the hypothesis against existing logs, traces, tests, diffs, historical outputs, or prior runs. Use a new probe only for uncertainty the record cannot settle.
3. Before a costly, irreversible, externally visible, or multi-step intervention, state the observable expected result. Stop dependent steps on the first material mismatch and preserve the counterexample.
4. Choose one primary outcome and a few correctness or safety guardrails. Define practical significance before seeing results.
5. Hold environment, data, build, warm-up, and measurement method constant unless one is the tested variable. For product work, define assignment, randomization, exclusions, exposure, contamination, and measurement window. For engineering work, capture the baseline, change one material variable, repeat enough to estimate noise, and record hardware, revision, and inputs.
6. Freeze analysis, stopping, segmentation, and data-quality rules. Use a staged ladder: degenerate validity gates → smoke or paired sample → more samples only when promising → full confirmation. Start serially. For expensive or noisy checks, repeat the unchanged build to estimate the noise floor and pre-register the promotion threshold.
7. Classify the result honestly: supported, falsified, inconclusive, timed out, invalid environment, or no meaningful change. A timeout or exhausted search inside one model is not proof of impossibility.
8. Analyze effect size and uncertainty. Keep a change only when it preserves correctness and beats the baseline enough to justify complexity; otherwise revert or mark inconclusive.
9. Record failed, neutral, and contradicted attempts so they are not repeated without new evidence.
10. For resilience work, define steady state, fault, abort conditions, and blast radius. Production fault injection requires authorization and rollback.

Do not launch when tracking, assignment, ethics, privacy, rollback, or correctness is unresolved. Do not present exploratory segments, source guesses, or simulated predictions as measured real-world results.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
