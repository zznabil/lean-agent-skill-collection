---
name: debug
description: "Diagnose a defect, performance regression or incident; classify incomplete reports before attempting a fix."
---

# Debug

Establish the observed symptom, affected revision, environment and impact. Classify a report as defect, expected behaviour, duplicate, feature request, support issue or insufficient evidence; do not let urgency or tone substitute for proof. Preserve secrets and unrelated work.

Build the cheapest truthful feedback loop: a failing test, reproduction, replay, trace or minimal harness. Separate facts from a cause hypothesis. Start with one or two plausible causes; use competing hypotheses only when complexity warrants them. Test each against existing evidence before buying another probe.

Vary one meaningful factor. For intermittent failures, record state, timing, inputs and seed where relevant. Minimise the reproduction; use a known-good revision or bisect when useful. After two materially similar failed attempts, change the hypothesis, boundary or instrumentation rather than repeat the same mechanism.

Fix the smallest supported cause. Verify the original symptom and affected adjacent behaviour, add a practical regression check and remove probes. A surviving guess is not a confirmed cause; report remaining uncertainty.

Return the observed result, cause when established, actual checks and next action. When no reliable feedback loop exists or the bounded investigation does not converge, report BLOCKED or UNSTABLE with the missing evidence. Timeout or search exhaustion does not prove impossibility.

Tracker edits, production changes and external notifications require authority for those actions; diagnosis alone does not grant it.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

For an active incident, vulnerability prioritisation or postmortem, use [INCIDENT.md](INCIDENT.md).
