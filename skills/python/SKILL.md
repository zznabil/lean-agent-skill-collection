---
name: python
description: "Design, implement, or test maintainable Python, including typing, packaging, async I/O, concurrency, and project tooling. Follow the repository’s existing toolchain before adding one."
---

# Python

1. Inspect supported Python versions, project configuration, dependency manager, formatting, linting, typing, and test conventions.
2. Prefer clear data flow, small public interfaces, standard library features, and explicit types at module boundaries.
3. Validate inputs at the boundary. Use specific exceptions and preserve causes. Clean up files, sockets, tasks, and processes with context managers or structured lifetime.
4. For async work, use it only for I/O concurrency. Bound concurrency, propagate cancellation, set timeouts at external boundaries, and design backpressure.
5. Avoid global mutable state, import-time side effects, broad exception catches, clever metaprogramming, and dependencies for trivial utilities.
6. Test behavior with the project’s existing runner. Use deterministic fixtures; cover errors, cancellation, retry, and concurrency when relevant.
7. Run the configured formatter, linter, type checker, focused tests, and full relevant suite. Do not add or replace tools without evidence and approval.

Report versions, files changed, commands and actual results, compatibility concerns, and residual risk.

**User-facing overlay:** For eligible substantive chat prose, MUST keep `wait-what` active: **Summary** and answer, result, or next action first; friendly ASD-STE100-inspired prose; vital facts, uncertainty, failed or skipped checks, and truthful progress; **TL;DR** last. Exclude brief acknowledgments and machine or requested-artifact formats.
