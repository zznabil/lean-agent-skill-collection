---
name: plan
description: "Plan a multi-step change, architecture decision or unresolved requirement; do not implement a plan-only request."
---

# Plan

Produce a decision-ready path to the requested outcome. For a small clear task, a short next action is enough; do not create a plan artifact merely to unlock implementation.

Inspect only the relevant system, constraints and available evidence. Separate required outcomes from assumptions and optional ideas. Resolve discoverable questions yourself. Compare doing nothing, the smallest complete change and a broader alternative only when the choice matters.

Define what completion looks like and how to observe it. Expose the riskiest assumption with a cheap discriminating check before committing to a broad design. Ask one consolidated question only for a consequential choice the evidence cannot resolve; include the recommendation, trade-off and what it blocks.

Order work into small useful slices with real dependencies. Include compatibility, security, recovery and integration checks where the affected boundary needs them. For consequential work, give independently omittable requirements stable IDs and map them to an owner and acceptance check. Do not create a document tree for a local fix.

Return the proposed change, key decisions, checks and material open question. Keep research and planning within the requested authority. A plan-only request ends with the plan; an implementation request continues into action rather than stopping at this intermediate artifact.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

For material shared contracts, architecture, user-journey design or operations, use [ARCHITECTURE.md](ARCHITECTURE.md). When drafting or changing requirements, acceptance criteria or consequential risk decisions, use [REQUIREMENTS.md](REQUIREMENTS.md), even when the desired outcome is already known.
