---
name: debug
description: "Diagnose a hard defect or performance regression through a tight reproducible feedback loop, evidence-first investigation, falsifiable competing hypotheses, targeted instrumentation, and verified regression coverage."
---
# Debug
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the finding or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive or consequential external actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
## Investigation procedure
1. **Protect data.** Redact secrets and unnecessary personal data from commands, logs, captures, and reports.
2. **Reproduce the symptom.** Accept the user's report as fact. Before choosing a cause, run a fast pass/fail loop for the exact behaviour.
   Use a failing test, repeatable command, replay, browser check, differential run or minimal harness. Failure to reproduce does not refute the report.
3. **Collect evidence.** Record behaviour, revision, environment, inputs, logs, configuration, dependencies and timing before forming a theory.
   Separate observations from interpretation. Keep a revisable playbook for long investigations.
4. **Isolate intermittent conditions.** Identify the changing dimension: timing, environment, state, data, dependency or revision. Change one factor; record conditions or seed.
5. **Minimise the reproduction.** Remove everything unnecessary.
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
