---
name: debug
description: "Diagnose a hard defect or performance regression through a tight reproducible feedback loop, evidence-first investigation, falsifiable competing hypotheses, targeted instrumentation, and verified regression coverage."
---
# Debug
## Communication kernel
If trusted root AGENTS.md loads, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short active technical sentences and familiar words.
- Use ISO 704-inspired stable concepts and terminology.
- Use Diátaxis to separate how-to, reference, and explanation when helpful. These are communication guides, not formal standards conformance.
## Investigation procedure
1. **Protect data.** Redact secrets and unnecessary personal data from commands, logs, captures, and reports.
2. **Reproduce the symptom.** Accept the user-reported failure as a fact. Before choosing a cause, build and run a fast pass/fail loop for the exact behavior. Prefer a failing test, repeatable command, replay, browser check, differential run, or minimal harness. Failure to reproduce does not refute the report.
3. **Collect evidence first.** Collect observed behavior, revision, environment, inputs, logs, config, dependencies, and timing before forming a theory. Separate raw evidence from interpretation. For a long investigation, keep a compact playbook that you can revise.
4. **Classify intermittent conditions.** For an intermittent failure, identify the changing dimension: timing, environment, state, data, dependency, or revision. Change one factor. Record the conditions or seed.
5. **Minimize the reproduction.** Remove elements until every remaining element is necessary.
6. **Compare hypotheses.** For a simple DIRECT defect, start with the one or two cheapest plausible hypotheses.
   - Generate three to five genuinely different hypotheses only for a costly, intermittent, or multi-causal problem.
   - Before using a new live probe, check what each hypothesis predicts about existing logs, traces, failures, and known-good runs. Use live action only to distinguish the surviving hypotheses.
7. **Try to falsify survivors.** For a costly or multi-causal problem, assign one focused falsification attempt to each surviving hypothesis. Do not ask one reviewer to choose a favorite theory.
8. **Run a separating test.** Test one variable at a time. Use targeted, labeled instrumentation. Use revision bisect when known-good and known-bad boundaries exist.
9. **Change a failed strategy.** Do not expect new information from an unchanged verifier under unchanged conditions. After two materially similar failed attempts, change the hypothesis, boundary, instrumentation, environment, or representation. A parameter change within the same failed mechanism is not a new strategy.
10. **Challenge assumptions.** If deep search within the current model finds nothing, challenge the boundary, representation, or supposedly verified rule. Exhausted search and timeouts do not prove impossibility.
11. **Repair and test regression.** Fix the smallest surviving cause. Add regression coverage at a real boundary. Rerun the original and adjacent checks. Remove probes. Record evidence and remaining uncertainty.
12. **Assess confidence.** Base confidence on the outcome. One survivor with falsified rivals supports greater confidence than several survivors. Zero survivors means the cause is unknown; it does not validate the first theory.
If you cannot build a truthful feedback loop, or bounded attempts do not converge, stop guessing.
- Report `BLOCKED` or `UNSTABLE`. State what you tried, which paths you falsified, and the smallest missing artifact, access, permission, or separating test.
- Do not report `INFEASIBLE` while a material assumption remains untested and a safe probe remains available.
## Reporting and execution rules
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not narrate routine tool use or add praise.
- State conclusions directly. Do not hide verified failure or evidenced responsibility. Acknowledge actual agent errors and give a correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only to express normative force. For important requirements, name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, warn before the action. Add a hold point and check the safe state where needed. State the expected result, failure sign, and recovery. Explain difficult mechanisms simply. Contrast noncompliant and compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress. Calculate it from processed items and round down. Keep progress separate from the verdict. Otherwise report phase and evidence without a bar. Processed does not mean passed.
- Avoid unexpected scope changes. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or when helpful for substantial chat. Each must add distinct value.
