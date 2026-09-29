---
name: cli-design
description: "Design or review a command-line interface that humans and agents can run reliably. Use for headless automation, flags, help, output contracts, exit codes, pipelines, retries, dry-run, and safe state changes."
---

# CLI Design

Treat the CLI as a stable interface, not terminal decoration. Apply **IEC/IEEE 82079-1**, **ISO/IEC/IEEE 26514**, **ISO/IEC 23859**, and **ISO 704** proportionally to help, examples, prompts, warnings, errors, and recovery instructions.

## Contract

1. **Users and automation.** Start from the real human and automation jobs. Keep command and flag names predictable across the tool.
2. **Shared semantics.** When the CLI exposes a domain action also available through UI, HTTP, MCP, or jobs, reuse the same typed inputs, authorization, validation, idempotency, and error semantics. Keep CLI parsing and presentation as a thin adapter.
3. **Headless inputs.** Every required input MUST have a non-interactive flag, argument, environment variable, configuration field, or standard-input path. Interactive prompts MAY be a convenience, not the only path.
4. **Help and examples.** Provide useful top-level help, command help, defaults, prerequisites, and copyable examples. Before a consequential command, show a warning, safe-state or dry-run check, expected result, failure sign, and recovery. A user SHOULD discover the next valid command without external documentation.
5. **Streams and exit codes.** Write primary results to standard output and diagnostics to standard error. Use stable, documented exit codes.
6. **Machine-readable output.** When tools consume the result, provide a structured output mode or a deliberately stable line format. Do not require color, cursor control, or a TTY.
7. **Pipelines.** Support standard input and pipelines where they fit the job. Bound or paginate large output.
8. **Strict input boundary.** Apply **RFC 9413-inspired strict boundary behavior**: accept only documented input variants, normalize once, and reject ambiguity.
   - Fail fast with an actionable canonical error that names the invalid input, shows the next valid action, and states the state of partial work or data when relevant.
   - MUST NOT hide partial failure behind exit code zero.
9. **Safe retries.** Make retryable operations idempotent where practical. For consequential external mutations, support an idempotency mechanism or read-back check.
10. **Destructive-action preview.** Provide `--dry-run` for risky or broad changes when practical. Require an explicit confirmation flag such as `--yes` or `--force` for destructive actions; default to safety.
11. **Failure and cleanup.** Handle timeout, cancellation, interruption, cleanup, and partial state. Never print secrets or accept them through a command-line argument when a safer channel exists.

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


**User-facing:**

- Lead with the supported result, next action, or blocker. Keep simple turns short. Investigate enough to be right; report the outcome, fresh verification, material uncertainty, and remaining user action—not routine tool narration or praise.
- Use short, active technical sentences and familiar words (ASD-STE100/CDC). Separate how-to, reference, and explanation when useful (Diátaxis). State conclusions directly; do not hide verified failure or evidenced responsibility. Own actual agent errors with correction or next safe action.
- Preserve facts, exact negation, genuine uncertainty, evidence limits, permissions, quotations, requested voice, and machine or artifact formats. Do not claim formal standards conformance from stylistic guidance.
- Use BCP 14 only for normative force. Important requirements name one actor, one action, and an observable check (NASA-style); do not turn advice into an invented mandate.
- Before risky or failure-prone work, put an ANSI-style warning before the action, add a WHO-style hold point and OSHA-style safe-state check where needed, then state the FDA-style expected result, failure sign, and recovery. Explain a difficult mechanism simply (Feynman); contrast noncompliant/compliant code or configuration (SEI CERT) only when useful.
- For measurable multi-step work with a defensible total, show truthful named 20-cell ASCII progress from processed items, rounded down and separate from verdict; otherwise report phase and evidence without a bar. Processed is not passed.
- Avoid surprise scope and leave the result ready to use or resume. Use Summary and TL;DR only when requested or helpful for substantial chat; each must add distinct value.
