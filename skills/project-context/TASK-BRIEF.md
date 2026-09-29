# Task Brief / Context Preflight

Use this schema when the user asks to inventory the context needed before planning, implementation, delegation, review, or handoff.

The goal is **minimum sufficient context**, not maximum collection. Omit fields that cannot change a decision, action, safety boundary, or completion claim.

## Depth

### Direct

Use for clear, local, reversible work:

- outcome;
- current state;
- main constraint;
- decisive check;
- next action.

### Standard

Use for material bounded work:

- outcome, user, scope, and non-goals;
- current state and evidence;
- prerequisites, constraints, permissions, and dependencies;
- known issues, risks, assumptions, and unknowns;
- acceptance, recovery, and next action.

### Durable

Use for high-risk, delegated, or multi-session work. Use the full record below with stable identifiers, owners, revision, freshness triggers, and provenance.

## Record

```text
BRIEF ID AND REVISION
What stable ID identifies this brief? Record its revision and last verification date.

ACCOUNTABLE OWNER
Who maintains this brief and resolves changes? If none is assigned, mark UNKNOWN.

TASK
What work is being considered?

OUTCOME
What observable result should exist?

INTENDED USER
Who needs the result, and in what context?

SCOPE
What is included?

NON-GOALS
What is deliberately excluded?

CURRENT STATE
What exists now? Record revision, environment, and baseline where relevant.

INPUTS AND EVIDENCE
What user statements, files, data, documentation, sources, and runtime observations support the task?

PREREQUISITES
What must exist or be true before work begins?

CONSTRAINTS AND PERMISSIONS
What limits time, cost, access, compatibility, security, privacy, law, or platform choice?

KNOWN ISSUES
What confirmed defects, blockers, conflicts, and landmines matter?

UNKNOWNS AND ASSUMPTIONS
What remains unresolved? What temporary belief is being used, and how can it be tested?

DECISIONS
What is settled, by whom, why, and what would reopen it?

DEPENDENCIES
Which systems, people, credentials, tools, and upstream work are required?

RISKS
For each material risk: cause → event → consequence → treatment → owner or trigger.
In Durable briefs, record each risk as a material item in the traceable ledger.
Include its stable ID, status, evidence, owner or UNKNOWN, last-verified revision/date or UNKNOWN, and linked item IDs.

ACCEPTANCE AND VERIFIER
What observable evidence proves completion, and who or what evaluates it?

RECOVERY
What rollback, backup, or safe failure state applies?

NEXT ACTION
What is the cheapest useful action that reduces uncertainty or advances the task?

FRESHNESS
What change or date makes this brief stale?
```

## Provenance

Classify each material item:

- `VERIFIED` — supported by current evidence;
- `ASSUMED` — temporarily accepted but unverified;
- `REFUTED` — contradicted by evidence;
- `UNKNOWN` — unresolved and potentially material.

Record provenance proportionally:

- external fact → source, date, citation, confidence, contradiction;
- repository fact → path, symbol, revision;
- runtime observation → environment, action or command, observed result;
- user requirement → user statement or authorised specification;
- decision → decision maker, date, rationale, reopen trigger.

For Durable briefs, give each material item a stable ID, owner (or `UNKNOWN`), and last-verified revision or date. Link related IDs to show dependencies and handoff traceability.

## Readiness

End with exactly one state:

- `READY` — sufficient context exists to proceed.
- `READY_WITH_ASSUMPTIONS` — work can proceed reversibly with named assumptions.
- `NEEDS_DECISION` — one or more consequential human choices block safe progress.
- `BLOCKED_CONTEXT` — required evidence or access is unavailable and no safe useful route remains.

State the next action and the brief's freshness trigger. Do not treat this record as proof that implementation or verification occurred.
