---
name: skill-design
description: "Create, consolidate or evaluate an agent skill with a precise trigger, minimal instructions and testable boundaries."
---

# Skill Design

Inspect the target workflow and the existing owning skill before adding a route. Prefer absorbing a useful mechanism over creating overlapping controllers. A new skill needs a distinct user intent and meaningful procedure, not a persona, synonym or generic reminder.

Write a short description whose first words identify when the skill applies. Distinguish adjacent triggers. Keep the root focused on outcome, constraints, decision boundaries and completion. Put specialised detail in nearby references with explicit load conditions; do not hide essential safety behind another profile's file.

Use instructions before scripts unless deterministic code is necessary. Avoid duplicating model defaults, global prose rules or tool schemas. State each rule once per relevant scope; only minimal standalone safeguards justify repetition. Do not replace readable instructions with cryptic compression.

For upstream material, inspect the pinned revision, licence, dependencies and executable behaviour before adoption. Treat hooks, installers and evaluators as code, not harmless documentation. Adoption of an idea does not require its runtime, provider SDK or commercial service.

Test descriptions with positive, negative and near-neighbour requests. Test the loaded procedure against success, failure, missing authority and stopping cases. Compare against the baseline and a no-skill control where a real host is available. Structural checks and authored scenarios do not establish behavioural improvement.

Use [PLAYBOOKS.md](PLAYBOOKS.md) only for maintained lessons and procedure ownership. Change trusted instructions, installed skills, hooks or persistent memory only with scope-specific authorisation and a reviewed diff. Return the smallest useful artifact, observed evidence, migration and unmeasured claims.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

## Standards in use

- When choosing a tool or skill, evaluate representative tasks, failures, cost and integration against the existing or no-tool baseline before adoption. (ISO/IEC 20741).
