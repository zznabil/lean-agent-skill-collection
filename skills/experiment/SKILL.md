---
name: experiment
description: "Design a controlled product, performance, or engineering experiment—or a disposable prototype—with a falsifiable hypothesis, comparable baseline, guardrails, and stopping rule."
---
# Experiment
## Communication kernel
If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short active technical sentences and familiar words.
- Use ISO 704-inspired stable concepts and terminology.
- Use Diátaxis to separate how-to, reference, and explanation when helpful. These are communication guides, not formal standards conformance.
## Experiment method
Apply **Goal–Question–Metric (GQM)** to experiments. Start with the decision goal. Derive the questions. Then select metrics that answer those questions.
- Use **ISO 31000-inspired risk treatment** where needed.
- Apply the **Principles of Chaos Engineering** only to authorized resilience experiments. These experiments must have a steady state, abort conditions, and a controlled blast radius.
Choose **product** for an A/B or behavior test. Choose **engineering** for performance, reliability, or implementation comparisons.
## Experiment procedure
1. **Decision and hypothesis.** State the decision goal, questions and decision-relevant metrics. Record workload, intervention, control, mechanism and a falsifiable hypothesis.
2. **Existing evidence.** Test the hypothesis against logs, traces, tests, diffs, historical outputs or prior runs. Use a new live probe only for uncertainty those records cannot settle.
3. **Disposable separating test.** Build a disposable prototype when execution is the cheapest way to distinguish alternatives. Give it one question, observable signal, time box and evidence limits. Keep it out of production pending separate review.
4. **Expected result and abort.** Before costly, irreversible, external or multi-step interventions, warn about risk and verify the safe starting state. State the expected result, failure sign and recovery. Pause for required authorisation. At the first material mismatch, stop dependent steps and preserve the counterexample.
5. **Define outcomes and guardrails.** Select one primary outcome and a few correctness or safety guardrails. Define practical significance before you see results.
6. **Control the comparison.** Keep environment, data, build, warm-up, and measurement method constant unless one is the tested variable.
   - For product work, define assignment, randomization, exclusions, exposure, contamination, and the measurement window.
   - For engineering work, capture the baseline. Change one material variable. Repeat enough to estimate noise. Record hardware, revision, and inputs.
7. **Freeze analysis and stopping rules.** Freeze analysis, stopping, segmentation, and data-quality rules.
   - Use stages in this order: degenerate validity gates, then smoke or paired sample, then more samples only when promising, then full confirmation.
   - Start serially.
   - For expensive or noisy checks, repeat the unchanged build to estimate the noise floor. Pre-register the promotion threshold.
8. **Classify the result.** Classify it honestly as supported, falsified, inconclusive, timed out, invalid environment, or no meaningful change. A timeout or exhausted search within one model does not prove impossibility.
9. **Assess effect and uncertainty.** Analyze effect size and uncertainty. Keep a change only if it preserves correctness and beats the baseline enough to justify complexity. Otherwise revert it or mark it inconclusive.
10. **Record failed attempts.** Record failed, neutral, and contradicted attempts. Do not repeat them without new evidence.
11. **Set resilience limits.** For resilience work, define steady state, fault, abort conditions, and blast radius. Production fault injection requires authorization and rollback.
Do not launch while tracking, assignment, ethics, privacy, rollback, or correctness remains unresolved. Do not describe exploratory segments, source guesses, or simulated predictions as measured real-world results.
## Reporting and execution rules
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats. Style does not prove formal conformance.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not turn advice into mandates.
- Before risky or failure-prone work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when useful.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
