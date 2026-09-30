---
name: standard-iso-9241-110
description: "Review interaction principles for a specific user task."
---
# ISO 9241-110: interaction review
## Use
- Use this routine to review how a user interacts with a system during a specific task. Do not use it for prose-only copy editing. Deliver task-linked interaction findings or an authorised change.
- Draft, edit or review as requested. First read the target, intended users, task and authorised scope.
## Source and scope
- Target edition: ISO 9241-110:2020. See SOURCES.md for official access and source status.
- The author did not have the full licensed normative text when authoring this prototype. This collection does not bundle that text.
- This procedure applies Lean guidance to the published scope. It does not reproduce the standard’s clauses.
- For clause-level or conformance work, first obtain an authorised copy. Read the applicable clauses and exceptions. Without that copy, use only supported application guidance. Mark standard-specific requirements as unchecked.
## Procedure
1. Identify the user task. Walk through its actual sequence, including prerequisites and completion feedback.
2. Check that the interaction supports that task without unnecessary steps or information.
3. Make each control’s purpose, available actions and current state understandable in context.
4. Compare control behaviour, terminology and navigation with the user’s established expectations.
5. Give first-time users enough instruction and feedback to learn. Do not make experienced use unnecessarily slow.
6. Check that users can control pace and sequence where the task permits. Check that they can cancel or reverse safe actions.
7. Prevent likely use errors. Make remaining errors recognisable. Support correction without unexplained data loss.
8. Check that feedback and interaction support continued useful engagement, not coercion or manipulative rewards.
9. Record conflicting needs, the selected trade-off, affected task evidence and untested contexts. Do not claim that one interface fits all users.
## Keep the task contract
- Retain facts, quantities, terms, permissions, prohibitions, conditions, exceptions, warnings and required links.
- Do not invent requirements, numerical thresholds, clause numbers, user needs or evidence to make a checklist appear complete.
- A review or language edit does not authorise execution, deployment, source acquisition fees or user-data collection.
- These human-oriented principles can inform agent instructions. They do not prove how an agent will interpret those instructions.
## Verify and deliver
- Check the actual task and a relevant failure or recovery path. Use intended-user evidence when available.
- Report source-verified clause findings separately from Lean design suggestions and unchecked items.
- Return the artifact or scoped findings first. State material limits and the evidence needed to resolve them.
- Do not claim formal conformance based on this short routine, a readability score or a review plan that you have not executed.
## Worked distinction
A Save control dismisses the dialog without saying whether the data was saved.
Check the actual state transition. Expose the result. A label change alone may not correct the interaction.
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. If root `AGENTS.md` is loaded, it governs. Do not claim root activation without evidence. Use this skill’s source-specific procedure only for its task, not for every reply. This kernel takes inspiration from the named approaches; it does not claim formal standards conformance.
- Use ASD-STE100-inspired short, active technical sentences. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis organization to separate how-to, reference and explanation when helpful. Lead with the supported result and next action.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and the requested format. Never describe an unchecked result as compliant or complete.
- In normative text, preserve BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, identify one actor, action and observable check.
- Before a hazardous action, state the verified risk and give a warning. For critical steps, provide a hold point and check the safe state. When failure is plausible, give the expected result, failure sign and recovery. These controls do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining). Calculate the floor percentage from durable counts. Report the PASS/FAIL/BLOCKED verdict separately. Count a failed, blocked, skipped or untested item only after you classify it with evidence. If no total is defensible, report the phase, evidence and next action without a bar. This rule does not invoke manual wait-what.
- Explain difficult mechanisms from foundations. For code or configuration, show compliant/noncompliant contrasts only when useful. Do not force examples or sections on simple tasks.
See [SOURCES.md](SOURCES.md) for source editions, local files, official links and reuse limits.
