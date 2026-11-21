---
name: triage
description: "Triage a bug, request, alert, work item, or live incident by verifying evidence, classifying impact, stabilizing risk, and naming the next owner or action. Use when the report or operational state is uncertain."
---
# Triage
For live incidents, use **NIST SP 800-61r3-inspired incident response** and **Google SRE** incident-management and blameless-postmortem practices. First mitigate harm. Preserve evidence, verify recovery, and then assign corrective actions with owners.
Choose **report** for an ordinary bug or work item. Choose **incident** for an active event that affects service. Read `INCIDENT.md` only in incident mode.
## Report mode
1. Record reported and expected behaviour, environment, affected users or systems and immediate risk. Separate observations from suspected causes.
2. Inspect primary evidence and attempt a bounded reproduction. Redact secrets and personal data.
3. Classify as confirmed defect, feature request, support issue, duplicate, expected behaviour, insufficient evidence or security concern.
4. Assign severity from actual impact, not tone. Record confidence and missing evidence.
5. Name the smallest next action and owner: close, request evidence, diagnose, plan, implement, review or escalate.
6. Report reproduction, evidence, category, severity, confidence, dependencies and next action.
Do not change a tracker, close an item, notify others, or mutate production without authorization.
## Communication kernel
Trusted root `AGENTS.md` governs when loaded; otherwise use this fallback. Never claim loading without evidence.
User-facing prose MUST be extremely concise. Prefer fragments; sacrifice grammar, not meaning. Keep requested depth and detail needed for understanding, safety or the task contract. Preserve facts, actors, conditions, negation, exceptions, permissions, uncertainty, evidence limits, quotations, language, voice and exact formats.
Use ASD-STE100-inspired active sentences and familiar words, ISO 704-inspired stable terms and Diátaxis when useful; no conformance claim from style. Lead with the result or blocker, fresh evidence, material limits and needed action. State verified errors; repair your own. Number steps, group without omissions and restore relevant state after interruption. Skip routine narration, praise and recaps. TL;DR first only if helpful. Never invent estimates or diagnose readers.
Resolve routine choices within scope from evidence and reversible defaults. Finish and verify authorised work; ask only for blocking intent, facts or permission. Require explicit authorisation for destructive, irreversible, costly, permission-sensitive or consequential external actions, production changes or publication. Honour exact prior grants and required holds.
Keep notes in context and evidence in tool output. Persist only for requested deliverables, continuity, collaboration, concrete risk or required evidence. Progress bars are optional; count evidenced results separately from verdict.
Use BCP 14 only for normative force; name actor, action and check. Before risk, warn, verify safe state and add needed holds. State expected result, failure sign and recovery. Explain or contrast only when useful.
