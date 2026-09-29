---
name: standard-iso-9241-110
description: "Review interaction principles for a specific user task."
---
# ISO 9241-110: interaction review

## Use
- Use to review how a user interacts with a system during a specific task, not for prose-only copy editing. Deliver task-linked interaction findings or an authorised change.
- Draft, edit or review as requested. Read the target, intended users, task and authorised scope first.

## Source and scope
- Target edition: ISO 9241-110:2020. Official access and source status are in SOURCES.md.
- The full licensed normative text was not available when this prototype was authored and is not bundled.
- These steps apply Lean guidance to the published scope; they do not reproduce the standard’s clauses.
- For clause-level or conformance work, first obtain an authorised copy and read applicable clauses and exceptions. Without it, limit work to supported application guidance and mark standard-specific requirements unchecked.

## Procedure
1. Name the user task and walk through its actual sequence, including prerequisites and completion feedback.
2. Check whether the interaction helps that task without unnecessary steps or information.
3. Make each control’s purpose, available actions and current state understandable in context.
4. Compare control behaviour, terminology and navigation with the user’s established expectations.
5. Give first-time users enough instruction and feedback to learn without making experienced use unnecessarily slow.
6. Check that users can control pace and sequence where the task permits, and cancel or reverse safe actions.
7. Prevent likely use errors; make remaining errors recognisable and support correction without unexplained data
  loss.
8. Check whether feedback and interaction support continued useful engagement, not coercion or manipulative rewards.
9. Record conflicting needs, the chosen trade-off, affected task evidence and untested contexts. Do not claim one interface fits all users.

## Keep the task contract
- Preserve facts, quantities, terms, permissions, prohibitions, conditions, exceptions, warnings and required links.
- Do not invent a requirement, numerical threshold, clause number, user need or evidence to make a checklist look
  complete.
- A review or language edit does not authorise execution, deployment, source acquisition fees or user-data
  collection.
- These human-oriented principles can inform agent instructions, but do not prove how an agent will interpret them.

## Verify and deliver
- Check the actual task and a relevant failure or recovery path. Use intended-user evidence when available.
- Separate source-verified clause findings from Lean design suggestions and unchecked items.
- Return the artifact or scoped findings first. Name material limits and the evidence needed to resolve them.
- Do not claim formal conformance from this short routine, a readability score or an unexecuted review plan.

## Worked distinction
A Save control dismisses the dialog without saying whether the data was saved.
Check the actual state transition and expose the result; changing the label alone may not fix the interaction.

## Lean communication kernel (standalone fallback)
If root `AGENTS.md` is loaded, it governs. Otherwise apply these rules to communication. This skill’s source-specific procedure runs only for its task, not every reply.
- Lead with the supported result and next action. Use short, active ASD-STE100-inspired technical wording and CDC-style familiar words. Keep how-to, reference and explanation apart when Diátaxis separation helps.
- Preserve facts, exact negation, actors, conditions, exceptions, rights, permissions, uncertainty, evidence and requested format. Never call an unchecked result compliant or complete.
- In normative text, keep BCP 14 MUST/SHOULD/MAY force and exceptions. For important requirements, name one actor, action and observable check (NASA).
- Before a hazardous action, show the verified risk and an ANSI-style warning. For critical steps, use a WHO-style hold point and OSHA-style safe-state check; give the FDA-style expected result, failure sign and recovery when failure is plausible. These analogies do not replace task-specific controls.
- For measurable multi-step work, use a named 20-cell ASCII bar (# processed, - remaining) and floor percentage from durable counts; keep the PASS/FAIL/BLOCKED verdict separate. A failed, blocked, skipped or untested item counts only when classified with evidence. With no defensible total, report phase, evidence and next action without a bar. This does not invoke manual wait-what.
- Explain a difficult mechanism from foundations (Feynman). Use SEI CERT-style compliant/noncompliant contrast for code or configuration only when useful. Do not force examples or sections on simple tasks.

Source editions, local files, official links and reuse limits: [SOURCES.md](SOURCES.md).
