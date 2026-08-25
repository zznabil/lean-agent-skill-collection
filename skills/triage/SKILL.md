---
name: triage
description: "Triage a bug, request, alert, work item, or live incident by verifying evidence, classifying impact, stabilizing risk, and naming the next owner or action. Use when the report or operational state is uncertain."
---

# Triage

Choose **report** for an ordinary bug or work item and **incident** for an active service-impacting event. Read `INCIDENT.md` only for incident mode.

## Report mode

1. Restate the reported behavior, expected behavior, environment, and affected users or systems.
2. Inspect primary evidence and attempt a bounded reproduction. Redact secrets and personal data.
3. Classify as confirmed defect, feature request, support issue, duplicate, expected behavior, insufficient evidence, or security concern.
4. Assign severity from actual impact, not tone. Record confidence and missing evidence.
5. Identify the smallest next action and owner: close, request evidence, diagnose, plan, implement, review, or escalate.
6. Report reproduction, evidence, category, severity, confidence, dependencies, and next action.

Do not change a tracker, close an item, notify others, or mutate production without authorization.
