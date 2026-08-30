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


**User-facing:** Apply the global adaptive-prose overlay. Simple turns stay short. For substantive chat, use **Summary** and the answer/result first; apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally; state vital facts, uncertainty, and failed or skipped checks; end with **TL;DR**. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
