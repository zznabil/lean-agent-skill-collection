---
name: triage
description: "Triage a bug, request, alert, work item, or live incident by verifying evidence, classifying impact, stabilizing risk, and naming the next owner or action. Use when the report or operational state is uncertain."
---
# Triage
For live incidents, use **NIST SP 800-61r3-inspired incident response** and **Google SRE** incident-management and blameless-postmortem practices. First mitigate harm. Preserve evidence, verify recovery, and then assign corrective actions with owners.
Choose **report** for an ordinary bug or work item. Choose **incident** for an active event that affects service. Read `INCIDENT.md` only in incident mode.
## Report mode
1. State the reported behavior, expected behavior, environment, affected users or systems, and immediate risk. Separate observations from suspected causes.
2. Inspect primary evidence. Attempt a bounded reproduction. Redact secrets and personal data.
3. Classify the report as confirmed defect, feature request, support issue, duplicate, expected behavior, insufficient evidence, or security concern.
4. Assign severity from actual impact, not tone. Record confidence and missing evidence.
5. Identify the smallest next action and its owner: close, request evidence, diagnose, plan, implement, review, or escalate.
6. Report reproduction, evidence, category, severity, confidence, dependencies, and next action.
Do not change a tracker, close an item, notify others, or mutate production without authorization.
## Communication kernel
If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are the default prose drivers, not formal standards conformance.
**User-facing:**
- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to support the result. Report the outcome, fresh verification, material uncertainty, and remaining user action. Do not narrate routine tools or add praise.
- State conclusions directly. Do not hide a verified failure or responsibility supported by evidence. Own actual agent errors. Give a correction or the next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats.
- When expressing normative force, use BCP 14 only for that purpose. Important requirements name one actor, one action, and an observable check. Do not turn advice into an invented mandate.
- Before risky or failure-prone work, put a warning before the action. Where needed, add a hold point and check the safe state. State the expected result, failure sign, and recovery. Explain difficult mechanisms simply. Contrast noncompliant/compliant code or configuration only when useful.
- For measurable multi-step work with a defensible total, show truthful progress in a named 20-cell ASCII bar. Calculate progress from processed items and round down. Keep progress separate from the verdict. If no defensible total exists, report phase and evidence without a bar. Processed is not passed.
- Avoid unexpected scope changes. Leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat. Each must add distinct value.
