---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---

# CLI Design

Treat the CLI as a stable interface, not terminal decoration. Apply **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514**, **ISO/IEC 23859**, and **ISO 704** proportionally to help, examples, prompts, warnings, errors, and recovery instructions.

## Contract

1. Start from the real human and automation jobs. Keep command and flag names predictable across the tool.
2. When the CLI exposes a domain action also available through UI, HTTP, MCP, or jobs, reuse the same typed inputs, authorization, validation, idempotency, and error semantics. Keep CLI parsing and presentation as a thin adapter.
3. Every required input MUST have a non-interactive flag, argument, environment variable, configuration field, or standard-input path. Interactive prompts MAY be a convenience, not the only path.
4. Provide useful top-level help, command help, defaults, prerequisites, and copyable examples. Show the expected result for consequential or non-obvious commands. A user SHOULD be able to discover the next valid command without external documentation.
5. Write primary results to standard output and diagnostics to standard error. Use stable, documented exit codes.
6. When tools consume the result, provide a structured output mode or a deliberately stable line format. Do not require color, cursor control, or a TTY.
7. Support standard input and pipelines where they fit the job. Bound or paginate large output.
8. Apply **RFC 9413-inspired strict boundary behavior**: accept only documented input variants, normalize once, and reject ambiguity. Fail fast with an actionable canonical error that names the invalid input, shows the next valid action, and states the state of partial work or data when relevant. MUST NOT hide partial failure behind exit code zero.
9. Make retryable operations idempotent where practical. For consequential external mutations, support an idempotency mechanism or read-back check.
10. Provide `--dry-run` for risky or broad changes when practical. Require an explicit confirmation flag such as `--yes` or `--force` for destructive actions; default to safety.
11. Handle timeout, cancellation, interruption, cleanup, and partial state. Never print secrets or accept them through a command-line argument when a safer channel exists.

## Verify

Run the CLI from a clean non-interactive environment and check:

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


**User-facing:** Apply the global outcome-first delivery overlay. Match reply length and structure to the weight of the ask. Investigate enough internally to be right, but report only the useful outcome, fresh verification, material uncertainty, and remaining user action; do not replay routine tool calls or internal process. Simple turns stay short. For substantive chat, use **Summary** and **TL;DR** when required by the active user or host contract or when they improve navigation; each MUST add distinct value and MUST NOT repeat the same conclusion. Apply **ASD-STE100**, **ISO 24495-1**, and **W3C COGA** proportionally. Add Feynman, Diátaxis, or BCP 14 only when their function applies. Use truthful named 20-cell progress separate from verdict. Preserve machine and artifact formats. Be considerate, avoid surprise scope, and leave the result ready to use or resume.
