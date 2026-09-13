---
name: practice-gherkin
description: "Describe adopted BDD behaviour as executable examples."
---
# Gherkin / BDD feature files

## Task and boundary
- Write or review Gherkin scenarios in a project that already adopts BDD feature files.
- Do not introduce Cucumber, Gherkin or a parallel acceptance language as a global Lean requirement.
- Work only on the selected artifact or assessment. This routine does not grant permission to run attacks, deploy, publish or change
  policy.

## Source and limits
- Read [SOURCES.md](SOURCES.md) for the selected edition, official files, source boundaries and copying terms.
- Read the relevant source sections before making a source-specific decision. A compact routine is not the complete specification.
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

## Preserve and verify
- Preserve facts, identifiers, links, required checks, permissions, negation, exceptions and failure/recovery paths.
- Separate planned work, actual evidence and unknown results. Missing or stale evidence is not a pass.
- Do not delete requirements to improve a score or satisfy the line budget; record an unresolved source or task conflict.
- Use the smallest check that can detect the relevant defect. A schema, linter or inventory alone does not prove task success.

## Worked case — authored, not an executed model result
- **Situation:** A feature file has readable scenarios but its step definitions are all pending.
- **Expected:** Report authored acceptance examples, not passing automated acceptance tests.
- **Missing-evidence case:** The repository does not adopt BDD or the actual step execution cannot be verified.

## Finish and stop
- Return the scoped result, evidence, unresolved requirements and next permitted action.
- Make one correction pass and recheck affected evidence. If a required issue remains, report it rather than looping or claiming
  completion.
- Identify the checked scope, source edition, evidence and limits. Do not claim formal conformance or model-behaviour improvement
  from this routine.
