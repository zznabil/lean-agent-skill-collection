---
name: gauntlet-loop
description: "Run an explicitly requested bounded adversarial acceptance loop when ordinary verification leaves material hidden-defect risk."
---

# Gauntlet Loop

Use only when explicitly requested or delegated within an authorised acceptance task. An ordinary small fix does not need this loop. Define the material risk that normal verification cannot settle before adding critics.

Freeze the goal, required behaviour, hard gates, evidence methods, scope and budget before repair. The benchmark is not negotiable merely because a test fails. A material gate must inspect its claim, detect representative broken states when practical and calibrate absence checks with a known positive case.

Keep builder, read-only critic and final judge roles distinct. Use actual independent contexts when available; otherwise disclose reduced independence and do not claim independent approval. The builder's own review cannot satisfy a required independent gate.

Use [STATE-FORMAT.md](STATE-FORMAT.md) for the acceptance record. Separate run state, artifact verdict, severity and blocking disposition. Required abandoned or deferred work remains non-passing unless an authorised scope change removes it.

Default ceilings are four repair rounds and two rounds without verified progress, never targets. Reserve a final integration check. Stop when required gates pass and no material blocker remains, or when budget, permission or evidence prevents progress. Another round needs a named unresolved risk.

Report PASS, CONDITIONAL PASS, FAIL or NOT JUDGED with the inspected scope and evidence. Conditional pass permits only explicitly accepted, owned nonblocking residuals outside every hard gate. Missing required evidence is NOT JUDGED unless a verified failure already decides FAIL. A completed audit or 100% processed count does not imply a passing artifact.

Run the artifact and required checks. Select distinct scopes from [CRITIC-LANES.md](CRITIC-LANES.md), verify findings, repair material defects and retest. Parent and judge inspect current evidence rather than inherit worker verdicts. Preserve dissent and mark missing coverage explicitly.

For user-facing prose, use clear words, visible next actions and preserved meaning and uncertainty (ASD-STE100-inspired; ISO 24495-1; W3C COGA). Respect the requested artifact voice.

For material AI-system acceptance or AI trust-boundary risks, use [AI-ASSURANCE.md](AI-ASSURANCE.md).
