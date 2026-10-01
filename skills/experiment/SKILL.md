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
1. **Define the decision and hypothesis.** State the decision goal. Derive questions that settle the decision. Select decision-relevant metrics. Record workload, intervention, control, mechanism, and a falsifiable hypothesis.
2. **Check existing evidence.** Before using a new live intervention, test the hypothesis against existing logs, traces, tests, diffs, historical outputs, or prior runs. Use a new probe only for uncertainty that the record cannot settle.
3. **Build a disposable separating test.** When an executable artifact is the cheapest separating test, build a disposable prototype. Give it one question, one observable signal, a time box, and explicit limits on what it proves. Keep it out of production until a separate review occurs.
4. **Define the expected result and abort.** Before a costly, irreversible, externally visible, or multi-step intervention, warn about the relevant risk. Verify the safe starting state. State the observable expected result, failure sign, and recovery. Pause for required authorization. At the first material mismatch, stop dependent steps and preserve the counterexample.
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
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not narrate routine tool use or add praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. Acknowledge actual agent errors and give a correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only to express normative force. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, warn before the action. Add a hold point and check the safe state where needed. State the expected result, failure sign, and recovery. Explain difficult mechanisms simply. Contrast noncompliant and compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Calculate it from processed items and round down. Keep progress separate from the verdict. Otherwise report phase and evidence without a bar. Processed does not mean passed.
- Avoid unexpected scope changes. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or when helpful for substantial chat. Each must add distinct value.
