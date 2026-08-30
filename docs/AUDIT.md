# Lean Agent Skills V8.2.0 — 16-pass audit

## Decision

**PASS WITH LIVE-MEASUREMENT LIMITS**

V8.2.0 keeps the V8.1.0 architecture of 23 canonical skills, 17 implicitly selectable skills, and 6 manual-only skills. It adds explicit standards provenance and proportional user-facing prose without adding a routed skill, dependency, service, hook, or executable.

Static validation covered 342 checks and 48 scenario cells. Live OMP, Codex, and ChatGPT routing and behavioural improvement were not measured in this environment.

## Change summary

```text
Canonical skills:          23 → 23
Profiles:                    6 → 6
Invocation policies: unchanged
Primary SKILL.md lines:    808 → 837  (+29, 3.6%)
Primary SKILL.md words: 11,991 → 12,622 (+631, 5.3%)
Largest primary skill:     117 → 119 lines
New dependencies:            0
New executable payloads:      0
```

## Pass 1 — Source, version, licence, and inventory

**PASS**

- 23 canonical skill directories exist.
- Every directory contains `SKILL.md` and `agents/openai.yaml`.
- Frontmatter names match directory names.
- All adapters target Chat and Codex.
- MIT licence and third-party notices remain present.
- Package and plugin version is 8.2.0.

## Pass 2 — Adaptive prose proportionality

**PASS**

The global policy and `wait-what` now state:

- simple questions receive short direct answers;
- substantive explanations, decisions, research, plans, reviews, milestones, and final synthesis use the full wrapper;
- pure machine, code, legal, quotation, and requested artifact formats remain exempt.

The default eligible communication layer is explicitly:

```text
ASD-STE100
+ ISO 24495-1
+ W3C COGA
```

Feynman, Diátaxis, and BCP 14 activate only when their function applies.

## Pass 3 — Manual invocation and host composition

**PASS WITH LIVE LIMIT**

- Every non-`wait-what` skill carries a local adaptive-prose fallback.
- All OpenAI adapters reinforce adaptive prose and considerate agency.
- Manual-only and implicit-invocation policies are unchanged from V8.1.0.
- `wait-what` remains manual-only as a re-pitch skill; its presentation contract is global through `AGENTS.md` and local fallbacks.

Live host composition was not measured.

## Pass 4 — BCP 14 requirement strength

**PASS**

BCP 14 is named in `AGENTS.md`, `ENGINEERING-CORE.md`, `wait-what`, `plan`, `grilling`, and `get-it-done`. Uppercase normative words retain their defined strength. BCP 14 does not activate for ordinary descriptive prose.

## Pass 5 — Standards source map and provenance

**PASS**

`ENGINEERING-CORE.md` now maps communication, requirements, quality, testing, lifecycle, assurance, architecture, security, privacy, accessibility, contracts, operations, supply chain, AI, and data assurance to principal sources.

`docs/STANDARDS-REGISTER.md` is restored in the repository overlay and records versions, status, decisions, Lean homes, and review triggers. Named sources are provenance anchors; no formal conformance is claimed.

## Pass 6 — Requirements, quality, testing, lifecycle, and assurance

**PASS**

The owning skills explicitly name:

- ISO/IEC/IEEE 29148, EARS, and BCP 14 in planning and requirements discovery;
- ISO/IEC 25010 in planning, review, and Gauntlet quality selection;
- ISO/IEC/IEEE 29119 in testing and Gauntlet verification;
- ISO/IEC/IEEE 12207 in long-horizon completion and release;
- ISO/IEC/IEEE 15026-2 in consequential assurance cases;
- ISO/IEC 20246 in structured review.

The rules remain actionable and scoped.

## Pass 7 — Architecture, contracts, security, privacy, and accessibility

**PASS**

The owning skills explicitly name:

- ISO/IEC/IEEE 42010, ATAM, and ADR/MADR;
- OpenAPI, JSON Schema, RFC 9457, RFC 9413, AsyncAPI, and CloudEvents;
- NIST SP 800-218 SSDF and OWASP ASVS;
- ISO 31700-1 privacy by design;
- WCAG 2.2, WAI-ARIA APG, and ISO 9241.

These activate according to actual interface, security, privacy, and accessibility scope.

## Pass 8 — Operations, supply chain, AI, and data assurance

**PASS**

The source map and conditional references explicitly name:

- Google SRE SLI/SLO and error-budget practice;
- OpenTelemetry and W3C Trace Context;
- SLSA, SPDX, CycloneDX, and Reproducible Builds;
- NIST AI RMF and SP 800-218A;
- OWASP AISVS, LLMSVS, and Agentic Top 10;
- MITRE ATLAS;
- ISO/IEC 5259, ISO/IEC 25012/25024, Model Cards, Data Cards, Datasheets for Datasets, FAIR, and ISO/IEC 42005.

No external runtime is bundled.

## Pass 9 — Correct-time activation and anti-ceremony

**PASS WITH LIVE LIMIT**

The 48-scenario corpus includes:

```text
8 simple turns
8 substantive replies
8 documentation/normative modes
24 standards-context activation cases
```

Anti-trigger cases include tiny scripts, DORA misuse, unnecessary SLSA ceremony, and unauthorized production chaos. The written policy selects standards only when they change the decision or verification method.

Live model classification was not measured.

## Pass 10 — Routing precision and collision control

**PASS**

- No skill description changed.
- No invocation policy changed.
- No `standards` skill was added.
- Relevant names live inside owning skills rather than becoming new routing aliases.
- The one-primary-skill rule remains intact.

This minimizes routing-surface growth.

## Pass 11 — Context economy and bloat

**PASS WITH ACCEPTED COST**

V8.2.0 adds 631 primary-skill words, mainly through explicit source names and the adaptive local fallback. The increase is 5.3%, with no new skill or reference dependency.

The cost is accepted because explicit provenance must survive manual skill selection. The complete standards register remains documentation-only and is not auto-loaded.

## Pass 12 — Standalone closure and profile consistency

**PASS**

- All six profiles contain only declared skills.
- Required references stay inside their owning skill directory.
- Engineering profiles include `ENGINEERING-CORE.md`.
- Standalone Gauntlet and communication packages remain self-contained.
- Internal checksums match extracted bytes.

## Pass 13 — No-skill ablation readiness

**PASS AS TEST DESIGN; NOT LIVE MEASURED**

The 48-scenario corpus is suitable for comparing:

```text
V8.2 selected skill
vs V8.1 selected skill
vs trusted root policy only
```

Outcome quality, over-formatting, missed standards activation, token cost, and corrections still require live runs.

## Pass 14 — Usage and sunset discipline

**PASS**

V8.2.0 adds no skill. V8’s pruning decisions remain intact. Standards names do not create new authorities. Existing sunset rules remain in `skill-design/PLAYBOOKS.md`.

## Pass 15 — Human effort and loop closure

**PASS BY POLICY; LIVE SATISFACTION NOT MEASURED**

Adaptive prose reduces avoidable formatting on simple turns while preserving substantive summaries. Considerate-agency rules still require defaults, safe follow-through, decision-ready questions, ready-to-use artifacts, and explicit remaining user action.

## Pass 16 — Initiative and restraint

**PASS**

ACT / ASK / DO NOT ACT remains unchanged. Explicit standards do not grant permission or broaden scope. Heavy standards, formal methods, supply-chain controls, telemetry, AI assurance, and chaos testing remain conditional.

## Packaging validation

```text
Archives tested:            10
Profile archives:            6
Overlay/update archives:     3
Master archives:              1
CRC failures:                0
Duplicate members:           0
Case collisions:             0
Unsafe paths:                0
Symlinks:                    0
Executable payloads:         0
Internal checksum failures:  0
Deterministic rebuild drift: 0
```

## Remaining limits

- Live OMP, Codex, and ChatGPT routing was not executed.
- The scenario corpus defines expected behaviour but does not prove model compliance.
- ISO and other licensed standards were not reproduced; rules are independent summaries.
- Naming a standard does not establish conformance, certification, or complete coverage.
- Living standards and practices require future version review through the standards register.
