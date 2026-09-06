---
name: experiment
description: "Compare a hypothesis or prototype against a controlled baseline with decision-relevant measures and a stopping rule."
---

# Experiment

State the decision, falsifiable hypothesis, control, intervention and smallest useful signal. Check existing evidence first. Use a disposable prototype when it is the cheapest separating test, not as an unreviewed production implementation.

Choose one primary outcome, correctness and safety guardrails, practical significance and a budget before inspecting results. Keep revision, environment, data, warm-up and measurement method comparable except for the intended variable. For product experiments, define assignment, exclusions, exposure and contamination; for engineering work, capture a representative workload and noise floor.

Freeze analysis and stopping rules. Start with cheap validity and smoke checks, then increase samples only when useful. Record failed, neutral and stopped runs as well as successes. Repeated unchanged trials are justified to estimate noise, not to select a lucky pass.

For costly or consequential interventions, predict the observable result and stop dependent actions at a material mismatch.  Do not launch when consent, privacy, tracking or rollback is unresolved.

Report effect size and uncertainty, not a score without conditions. Classify supported, falsified, inconclusive, invalid environment, timed out or no meaningful change. Keep added complexity only when the actual gain justifies it while preserving correctness. Simulation, exploratory segments and predictions are not measured real-world outcomes; timeout is not proof of impossibility.

Return the decision and evidence first, then the limitation or next discriminating test.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

## Standards in use

- Before comparing interventions, start with the decision goal, the question that separates choices and the smallest measurable outcome. (Goal-Question-Metric).
- For authorised fault-injection experiments, state a steady-state hypothesis, bounded blast radius, abort condition and demonstrated recovery before running. (Principles of Chaos Engineering).
- Only for a project-scoped carbon comparison, define the functional unit and system boundary, measure the relevant inputs and report assumptions rather than inventing an emissions score. (Software Carbon Intensity / ISO/IEC 21031).
