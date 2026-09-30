# Live incident mode

For live incidents, use this mode, informed by **NIST SP 800-61r3** incident response and **Google SRE** incident-management and blameless-postmortem practice.

First reduce harm and restore service safely. Do not prioritize immediate proof of a root cause.

1. Confirm current impact, affected users or systems, start time, confidence, and evidence. Assign severity from observed harm, not language that expresses urgency.
2. When several people or agents participate, establish roles: incident lead, investigator or operator, and communicator. Maintain one timestamped timeline.
3. Choose the smallest reversible mitigation: rollback, disable a feature, fail over, shed load, rate-limit, or isolate the fault. Obtain authorization for production mutation and external communication.
4. Verify recovery with service metrics and a real user journey. Absence of new errors alone does not prove recovery. Monitor until the signal is stable or a defined handoff occurs.
5. After stabilization, collect evidence across recent changes, runtime artifacts, configuration, dependencies, capacity, and known failure modes. Do not favor one account of the cause.
6. Generate several distinct causal hypotheses with checkable predictions. Assign one falsifier to each important hypothesis. Preserve falsified paths so that they are not retried later.
7. Derive root-cause confidence from surviving hypotheses and evidence gaps. Do not assume that the newest change caused the incident. Do not force one answer when several remain viable.
8. Write a blameless review. Include impact, timeline, detection, mitigation, root cause and confidence, falsified alternatives, contributing conditions, what worked, what failed, and corrective actions. Give each corrective action an owner, due condition, and verification.

Do not expose secrets or private user data in timelines or reports. Do not test destructive scenarios against production by default.
