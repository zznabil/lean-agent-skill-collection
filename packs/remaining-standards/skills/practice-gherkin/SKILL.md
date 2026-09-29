---
name: practice-gherkin
description: "Describe adopted BDD behaviour as executable examples."
---
# Gherkin / BDD feature files

## Lean communication kernel fallback (standalone)
- If trusted root `AGENTS.md` is loaded, its policy governs this skill. Otherwise MUST apply this lean communication kernel fallback; skill-specific rules refine it.
- Lead with the main point and familiar words (CDC Clear Communication Index). Use short, active, direct technical sentences (ASD-STE100).
- Separate how-to, reference and explanation when useful (Diátaxis). Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. Use NASA-style one actor, action and observable verification target.
- For critical or risky work only, put ANSI-style warnings before hazards and WHO-style hold points before critical or irreversible steps.
- Before destructive or hazardous work, verify actual state (OSHA-style). When failure is plausible, state expected result, failure sign and recovery (FDA human-factors style).
- Explain difficult mechanisms from simple foundations (Feynman). Contrast noncompliant and compliant code or configuration when useful (SEI CERT).
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful; add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results; missing or stale evidence is not success.
- These are communication/control patterns, not transferred ANSI, WHO, OSHA, FDA or NASA legal or organisational authority. Use other domain standards only when the task requires them.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Write or review Gherkin scenarios in a project that already adopts BDD feature files.
- Do not introduce Cucumber, Gherkin or a parallel acceptance language as a global Lean requirement.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before a source-specific finding. This routine cannot supply missing requirements or prove conformance.
- Historical adoption decision: Reject globally; project-adopted only. Keep this boundary unless an authorised decision explicitly
  changes it.

## Procedure
1. Confirm project adoption, the feature's behaviour and the vocabulary understood by its stakeholders.
2. Use Feature and, where useful, Rule to organise behaviour rather than implementation file structure.
3. Use Given for relevant context, When for the event or action, and Then for observable outcomes.
4. Keep scenarios focused on one meaningful example; avoid long procedural scripts that obscure the behaviour.
5. Use Background only for genuinely shared context that remains easy to understand.
6. Use Scenario Outline and Examples for meaningful data variation, not to hide unrelated cases in a table.
7. Align step definitions with the actual system boundary and avoid ambiguous or duplicate wording.
8. Verify that each scenario executes and that its assertions can fail for an incorrect implementation.
9. Do not report a feature file, undefined steps or skipped scenarios as passed acceptance evidence.
10. Preserve existing requirement strengths and exceptions; readable examples supplement rather than erase the underlying contract.

## Verify and recover
- **Worked check (illustrative, not executed):** A feature file has readable scenarios but its step definitions are all pending.
- **Expected:** Report authored acceptance examples, not passing automated acceptance tests.
- **If blocked:** The repository does not adopt BDD or the actual step execution cannot be verified. Stop the affected assessment or action. Record the missing prerequisite, request it from the responsible owner and continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
