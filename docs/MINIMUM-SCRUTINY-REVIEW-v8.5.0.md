# Minimum-scrutiny repository review — V8.5.0

## Decision

**ABSORB PROPORTIONAL RIGOR. DO NOT ADD A “LOW-SCRUTINY” ROUTED SKILL.**

The objective is not careless work. It is the **minimum sufficient scrutiny** that can establish the requested outcome while keeping small work small. Correctness, safety, explicit requirements, data integrity, authorization, accessibility, and claim-specific evidence remain hard floors.

## Reviewed sources

| Source | Reviewed revision | Decision | High-value contribution | Rejected boundary |
|---|---|---|---|---|
| `DietrichGebert/ponytail` | `2ed6c52c9d7e5e56942508591085fd45dea277d3` | Strongly absorb | necessity/reuse/stdlib/native ladder; root-cause fix; deletion review; stop when already lean | persona, separate route, blanket “one-liners need no tests,” universal benchmark claims |
| `xzhang17/quickflow` | `7ab6b93678e8a06c6357e7cc009bc8f9bc98ce48` | Strongly absorb | one visible foreground run; proportional inspection; one consolidated question; narrow evidence; no routine narration | mandatory workflow files and source-specific runtime |
| `tdwhere123/do-it` | `8e85add081b2793fb39529e1a57a36155fe03847` | Strongly absorb | Light/Standard/Heavy sizing; every skill, hook, and agent must earn its place | router runtime, hooks, subagent catalog, bypass commands, separate state system |
| `anshaneja5/scalpel` | `364b4bc498d7fe5d720c6ccfe3cea20d376d32b1` | Absorb | decide once after inspection; preserve validation, security, accessibility, and error handling | persona, separate route, benchmark claims as universal evidence |
| `matcha-gumii/small-correct-diff` | `50d5b79ebe8624e022e658d1dc8795d58c66b8af` | Strongly absorb | correctness → safety → architecture → simplicity → diff → LOC | duplicate skill |
| `Chisanan232/requirement-zero` | `a466fd82c37a3eb57bc6f9e4c0c1e6713e85f2c2` | Selectively absorb | quick necessity check; `BUILD HARD` protects mission-critical complexity | mandatory five-verdict ceremony; separate route; unmeasured downstream savings |
| `vfs1234/just-do-it` | `18879e9bafaab95875145ba939173b9b716f88d0` | Absorb | inspect and try safe work before asking; change strategy after repeated same-class failure | broad “fix everything nearby” authority and hook runtime |
| `BuilderIO/skills` `plow-ahead` | `5d447740266633b959e761e46e88def4033f2c03` | Absorb | proceed through ordinary ambiguity; true-blocker stop test; decision-ready handoff | background-execution implication and duplicate route |
| `iannuttall/ralph` | `5bc402540c45192bd1e9cacb84611ee2e5ba13a8` | Selective | one small complete story per long-running iteration; files and Git as durable memory | runtime, unsafe execution examples, and loops for bounded tasks |
| `open-gsd/gsd-pi` | `4f9c72dff602c68e37bbc59768fa43df81a9b484` | Selective | explicit quick path and fast/PR/merge verification ladder | TUI, database, provider routing, installer, and extension runtime |
| `JuliusBrussee/caveman` | `df2ccd85c94ec3c8289cb62ac020d241ccfb0c60` | Reject for Lean core | reminder to avoid output and context waste | prose compression can remove needed context; proxy, installers, hooks, mixed licensing, commercial surface, and broad runtime |

## Lean synthesis

Use four modes:

```text
DIRECT
Clear + local + reversible + one decisive check
Inspect → act → check → brief result

STANDARD
Bounded multi-file or one subsystem
One primary skill → compact checklist → targeted checks

DEEP
Long-running or consequential cross-boundary work
Durable state → lifecycle and integration evidence → get-it-done

ADVERSARIAL
Hidden-defect risk survives normal verification
Frozen evidence bar → independent attack → repair → gauntlet judge
```

The mode is selected from evidence, not prompt drama. Escalation is reversible. A task can start Direct, move to Standard when coupling appears, then return to a focused finish after the risk is resolved.

## Anti-underbuilding rules

Minimum scrutiny MUST NOT remove:

- explicit required behavior;
- correctness or completeness;
- authorization and security boundaries;
- data integrity and recovery;
- trust-boundary validation;
- required error handling;
- required compatibility or accessibility;
- evidence necessary for the completion claim.

A requirement can be deleted, reduced, deferred, built, or built hard. “Build hard” is correct when complexity is the mission-critical bottleneck rather than accidental scaffolding.

## Why no new skill

The leading actions already have owners:

- global mode selection: `AGENTS.md` and `ENGINEERING-CORE.md`;
- planning depth: `plan`;
- smallest complete change: `implement`;
- minimum sufficient proof: `test`;
- simplification: `review`;
- momentum and strategy change: `debug` and `get-it-done`;
- expensive scrutiny ceiling: `gauntlet-loop`;
- quiet user reporting: `wait-what`.

A new route would compete with these authorities and make the collection less lean.

## Evidence limits

The source repositories use different models, harnesses, tasks, and self-reported benchmarks. Their numerical claims are not treated as controlled cross-project comparisons. V8.5.0 adopts mechanisms, not performance promises. Live OMP, Codex, and ChatGPT routing and task outcomes remain unmeasured.
