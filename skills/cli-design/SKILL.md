---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---
# CLI Design
Treat the CLI as a stable interface, not as terminal decoration. Apply **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514**, **ISO/IEC 23859**, and **ISO 704** proportionally to help, examples, prompts, warnings, errors, and recovery instructions.
## Contract
1. **Users and automation.** Start with the actual human and automation jobs. Keep command and flag names predictable across the tool.
2. **Shared semantics.** When the CLI exposes a domain action also available through UI, HTTP, MCP, or jobs, reuse the same typed inputs, authorization, validation, idempotency, and error semantics. Keep CLI parsing and presentation as a thin adapter.
3. **Headless inputs.** Every required input MUST have a non-interactive flag, argument, environment variable, configuration field, or standard-input path. Interactive prompts MAY provide convenience. They must not be the only path.
4. **Help and examples.** Provide useful top-level help, command help, defaults, prerequisites, and copyable examples. Before a consequential command, show a warning, safe-state or dry-run check, expected result, failure sign, and recovery. A user SHOULD be able to discover the next valid command without external documentation.
5. **Streams and exit codes.** Write primary results to standard output. Write diagnostics to standard error. Use stable, documented exit codes.
6. **Machine-readable output.** When tools consume the result, provide a structured output mode or a deliberately stable line format. Do not require color, cursor control, or a TTY.
7. **Pipelines.** Support standard input and pipelines where they fit the job. Bound or paginate large output.
8. **Strict input boundary.** Apply **RFC 9413-inspired strict boundary behavior**. Accept only documented input variants. Normalize once. Reject ambiguity.
   - Fail fast with an actionable canonical error. Name the invalid input and show the next valid action. When relevant, state the state of partial work or data.
   - The CLI MUST NOT hide partial failure behind exit code zero.
9. **Safe retries.** Make retryable operations idempotent where practical. For consequential external mutations, support an idempotency mechanism or a read-back check.
10. **Destructive-action preview.** Provide `--dry-run` for risky or broad changes when practical. Require an explicit confirmation flag such as `--yes` or `--force` for destructive actions. Default to safety.
11. **Failure and cleanup.** Handle timeout, cancellation, interruption, cleanup, and partial state. Never print secrets. Never accept secrets through a command-line argument when a safer channel exists.
## Verify
Run the CLI from a clean non-interactive environment. Check:
- help and examples;
- missing and malformed input;
- standard input and pipelines;
- human and machine-readable output;
- exit codes and standard-error behavior;
- repeated invocation and retry safety;
- dry-run with no side effect;
- cancellation and cleanup;
- cross-surface contract parity when applicable;
- backwards compatibility for established commands.
Report the interface contract, examples, executed checks, unsupported cases, and remaining risk.
## Communication kernel
If trusted root `AGENTS.md` loads, follow it; otherwise apply this standalone fallback. Do not claim root activation without evidence.
- **Brevity:** Use the fewest words that complete the task. Start with the answer, result or blocker. Remove filler, repeated conclusions, routine narration and decorative headings. Do not add a **Summary** heading or closing **TL;DR**. Use a leading **TL;DR** only when it improves a complex answer.
- **Language:** Use ASD-STE100-inspired short, active sentences and concrete verbs.
- **Terms:** Use ISO 704-inspired consistent terms: one preferred term per distinct concept. Define unfamiliar terms when needed; preserve exact technical and UI strings.
- **Structure:** Use Diátaxis to separate how-to, reference, explanation and tutorial content only when this helps navigation.
- **Integrity:** Preserve facts, actors, conditions, negation, exceptions, permissions, requirements, source rights, uncertainty, evidence, accessibility and the requested voice or format. Do not omit required details just to shorten text.
- **Safety and proof:** Use BCP 14 force only for normative rules. Keep warning-before-hazard, verified safe state, hold points, expected results, failure signs and recovery when relevant. Report actual test outcomes; do not invent a pass.
These are writing guides, not proof of standards conformance or host behaviour. Task-specific source rules still apply.
