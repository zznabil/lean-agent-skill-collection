---
name: practice-gherkin
description: "Describe adopted BDD behaviour as executable examples."
---
# Gherkin / BDD feature files

## Communication kernel
- If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise you MUST apply this standalone kernel. If trusted root `AGENTS.md` loads, its policy governs this skill. Otherwise you MUST apply this standalone kernel. Skill-specific rules refine it. Do not claim root activation without evidence.
- Use ASD-STE100-inspired short, active technical sentences. Lead with the main point and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference and explanation when useful. Keep simple replies short.
- For normative requirements, use BCP 14 (RFC 2119/8174) uppercase MUST, MUST NOT, SHOULD, SHOULD NOT and MAY without changing force. State one actor, action and observable verification target.
- For critical or risky work only, place warnings before hazards and hold points before critical or irreversible steps. Before destructive or hazardous work, verify actual state. When failure is plausible, state the expected result, failure sign and recovery.
- When explaining difficult mechanisms, start with simple foundations. When useful, contrast noncompliant and compliant code or configuration.
- For critical procedures, use Summary, Prerequisites, WARNING, Steps, PAUSE/VERIFY, Expected Result and Recovery where useful. Add contrast or TL;DR only when helpful.
- Preserve actors, facts, negation, conditions, exceptions, permissions, safety, source scope and evidence limits. Report observed results. Missing or stale evidence is not success.
- These communication and control rules do not transfer legal or organisational authority from ANSI, WHO, OSHA, FDA or NASA. Use other domain standards only when the task requires them; they are not default communication drivers.
- For measurable multi-step agent work, use a truthful named 20-cell ASCII progress format when applicable.

## Task and boundary
- Write or review Gherkin scenarios for a project that already adopts BDD feature files.
- Do not make Cucumber, Gherkin or a parallel acceptance language a global Lean requirement.
- Work only on the selected artifact or assessment. This routine does not permit attacks, deployment, publication or policy changes.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for source identity, applicable edition or part, available originals, access limits and copying terms.
- Check relevant source sections before making a source-specific finding. This routine cannot provide missing requirements or prove conformance.
- Historical adoption decision: Reject globally; project-adopted only. Retain this boundary unless an authorised decision explicitly changes it.

## Procedure
1. Confirm project adoption, the feature's behaviour and the vocabulary its stakeholders understand.
2. Use Feature and, where useful, Rule to organise behaviour. Do not organise behaviour by implementation file structure.
3. Use Given for relevant context. Use When for the event or action. Use Then for observable outcomes.
4. Focus each scenario on one meaningful example. Avoid long procedural scripts that obscure the behaviour.
5. Use Background only for genuinely shared context that remains easy to understand.
6. Use Scenario Outline and Examples for meaningful data variation. Do not use them to hide unrelated cases in a table.
7. Align step definitions with the actual system boundary. Avoid ambiguous or duplicate wording.
8. Verify that each scenario executes. Verify that its assertions can fail for an incorrect implementation.
9. Do not report a feature file, undefined steps or skipped scenarios as passed acceptance evidence.
10. Preserve existing requirement strengths and exceptions. Readable examples supplement the underlying contract; they do not erase it.

## Verify and recover
- **Worked check (illustrative, not executed):** A feature file has readable scenarios but its step definitions are all pending.
- **Expected:** Report authored acceptance examples, not passing automated acceptance tests.
- **If blocked:** The repository does not adopt BDD or the actual step execution cannot be verified. Stop the affected assessment or action. Record the missing prerequisite. Request it from the responsible owner. Continue only independent, authorised work.
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Distinguish planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or meet the line budget. Record any unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass. Recheck affected evidence. If a required issue remains, report it. Do not loop or claim completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement from this routine.
