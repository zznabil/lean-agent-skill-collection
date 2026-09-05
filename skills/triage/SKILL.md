---
name: triage
description: "Triage a bug, request, alert, work item, or live incident by verifying evidence, classifying impact, stabilizing risk, and naming the next owner or action. Use when the report or operational state is uncertain."
---

# Triage

For live incidents, apply **NIST SP 800-61r3-inspired incident response** and **Google SRE** incident-management and blameless-postmortem practices. Mitigate harm first, preserve evidence, verify recovery, then assign owned corrective actions.

Choose **report** for an ordinary bug or work item and **incident** for an active service-impacting event. Read `INCIDENT.md` only for incident mode.

## Report mode

1. Restate the reported behavior, expected behavior, environment, and affected users or systems.
2. Inspect primary evidence and attempt a bounded reproduction. Redact secrets and personal data.
3. Classify as confirmed defect, feature request, support issue, duplicate, expected behavior, insufficient evidence, or security concern.
4. Assign severity from actual impact, not tone. Record confidence and missing evidence.
5. Identify the smallest next action and owner: close, request evidence, diagnose, plan, implement, review, or escalate.
6. Report reproduction, evidence, category, severity, confidence, dependencies, and next action.

Do not change a tracker, close an item, notify others, or mutate production without authorization.


**User-facing:** Apply the global outcome-first delivery overlay. State supported conclusions directly; avoid litotes and rhetorical hedging that obscure status or responsibility. Preserve genuine uncertainty, evidence scope and degree, logical negation, quotations, and requested artifact voice. Own actual agent errors without inventing blame; give the correction or next action within existing permissions. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
