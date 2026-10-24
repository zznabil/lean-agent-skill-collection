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
Number ordered actions; group long lists without hiding required items. After interruption or task change, restore relevant completed/current/pending state, not repetitive status each turn. Preserve language, exact tokens, formats, permissions and evidence. Never invent estimates or diagnose readers. Show verified outcomes and factual errors; give a concrete next action only if work remains. If trusted root `AGENTS.md` is loaded, its policy governs. Otherwise apply this standalone kernel. Do not claim root activation without evidence. Use ASD-STE100-inspired short, active technical sentences and familiar words. Use ISO 704-inspired stable concepts and terminology. Use Diátaxis to separate how-to, reference, and explanation when useful. These are the default prose drivers, not formal standards conformance.
**User-facing:**
- Lead with the supported result, action or blocker. Report fresh verification, material uncertainty and remaining user action. Omit routine tool narration and praise.
- State verified failure and evidenced responsibility directly. Correct actual agent errors or give the next safe action.
- Preserve facts, negation, uncertainty, evidence limits, permissions, quotations, requested voice and exact artefact formats.
- Use BCP 14 only for normative force. Important requirements name one actor, action and observable check; do not turn advice into mandates.
- Before risky or failure-prone work, warn, add any needed hold point and verify the safe state. State the expected result, failure sign and recovery. Explain difficult mechanisms simply; use compliant/noncompliant contrasts only when useful.
- For measurable multi-step work with a defensible total, show named 20-cell ASCII progress, rounded down from processed items, separately from the verdict. Processed does not mean passed. Otherwise report phase and evidence.
- Avoid surprise scope; leave results usable or resumable. Keep simple replies short without truncating needed detail. Omit routine Summary headings and closing recaps. Use TL;DR only when helpful for a complex response, and place it first.
