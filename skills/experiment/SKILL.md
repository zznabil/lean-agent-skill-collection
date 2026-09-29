---
name: experiment
description: "Design a controlled product, performance, or engineering experiment—or a disposable prototype—with a falsifiable hypothesis, comparable baseline, guardrails, and stopping rule."
---

# Experiment

Apply **Goal–Question–Metric (GQM)**: begin with the decision goal, derive the questions, then choose metrics that answer them.

- Use **ISO 31000-inspired risk treatment** where needed.
- Apply the **Principles of Chaos Engineering** only for authorized resilience experiments with steady state, abort conditions, and controlled blast radius.

Choose **product** for an A/B or behavior test and **engineering** for performance, reliability, or implementation comparisons.

1. **Decision and hypothesis.** State the decision goal, derive the questions that settle it, then choose decision-relevant metrics. Record workload, intervention, control, mechanism, and falsifiable hypothesis.
2. **Use existing evidence.** Before buying a new live intervention, test the hypothesis against existing logs, traces, tests, diffs, historical outputs, or prior runs. Use a new probe only for uncertainty the record cannot settle.
3. **Disposable separating test.** When an executable artifact is the cheapest separating test, build a disposable prototype with one question, one observable signal, a time box, and explicit limits on what it proves. Keep it out of production until separately reviewed.
4. **Expected result and abort.** Before a costly, irreversible, externally visible, or multi-step intervention, warn about the relevant risk, verify the safe starting state, and state the observable expected result, failure sign, and recovery. Pause for required authorization; stop dependent steps on the first material mismatch and preserve the counterexample.
5. **Outcomes and guardrails.** Choose one primary outcome and a few correctness or safety guardrails. Define practical significance before seeing results.
6. **Controlled comparison.** Hold environment, data, build, warm-up, and measurement method constant unless one is the tested variable.
   - For product work, define assignment, randomization, exclusions, exposure, contamination, and measurement window.
   - For engineering work, capture the baseline, change one material variable, repeat enough to estimate noise, and record hardware, revision, and inputs.
7. **Frozen analysis and stopping.** Freeze analysis, stopping, segmentation, and data-quality rules.
   - Use a staged ladder: degenerate validity gates → smoke or paired sample → more samples only when promising → full confirmation.
   - Start serially.
   - For expensive or noisy checks, repeat the unchanged build to estimate the noise floor and pre-register the promotion threshold.
8. **Result classification.** Classify the result honestly: supported, falsified, inconclusive, timed out, invalid environment, or no meaningful change. A timeout or exhausted search inside one model is not proof of impossibility.
9. **Effect and uncertainty.** Analyze effect size and uncertainty. Keep a change only when it preserves correctness and beats the baseline enough to justify complexity; otherwise revert or mark inconclusive.
10. **Failed attempts.** Record failed, neutral, and contradicted attempts so they are not repeated without new evidence.
11. **Resilience limits.** For resilience work, define steady state, fault, abort conditions, and blast radius. Production fault injection requires authorization and rollback.

Do not launch when tracking, assignment, ethics, privacy, rollback, or correctness is unresolved. Do not present exploratory segments, source guesses, or simulated predictions as measured real-world results.


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
