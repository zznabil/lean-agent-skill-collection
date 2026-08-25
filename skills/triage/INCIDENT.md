# Live incident mode

The priority is to reduce harm and restore service safely, not to prove a root cause immediately.

1. Confirm current impact, affected users or systems, start time, confidence, and evidence. Assign severity from observed harm, not urgency language.
2. Establish roles when several people or agents are involved: incident lead, investigator or operator, and communicator. Keep one timestamped timeline.
3. Choose the smallest reversible mitigation: rollback, disable a feature, fail over, shed load, rate-limit, or isolate the fault. Production mutation and external communication require authorization.
4. Verify recovery with service metrics and a real user journey. Absence of new errors alone is not recovery proof. Continue monitoring until the signal is stable or a defined handoff occurs.
5. After stabilization, collect evidence without a favored story across recent changes, runtime artifacts, configuration, dependencies, capacity, and known failure modes.
6. Generate several distinct causal hypotheses with checkable predictions. Assign one falsifier to each important hypothesis and preserve falsified paths so they are not retried later.
7. Derive root-cause confidence from surviving hypotheses and evidence gaps. Do not assume the newest change is the cause or force one answer when several remain viable.
8. Write a blameless review: impact, timeline, detection, mitigation, root cause and confidence, falsified alternatives, contributing conditions, what worked, what failed, and corrective actions with owner, due condition, and verification.

Do not expose secrets or private user data in timelines or reports. Do not test destructive scenarios against production by default.
