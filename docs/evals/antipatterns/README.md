# Code anti-pattern regression corpus

This corpus gives maintainers four executable cases for `implement`, `review`, and `test`.
It adds no skill or runtime rule. It stays outside generated release profiles.

## How to run the checks

Use Python 3.9 or later. The runner uses only the standard library.
Run these commands from the repository root:

```sh
python -B scripts/evaluate-antipatterns.py --self-test --out artifacts/antipatterns/calibration.json
python -B scripts/evaluate-antipatterns.py --case policy --candidate docs/evals/antipatterns/policy/repair.py
```

The first command checks every broken example, reference repair, and legitimate control.
It checks the query and fetched-row budgets with separate mutants.
It rejects a cursor that points past an exactly full final page.
It also checks that invalid code, an early exit, a timeout, and a forged marker produce an error.
It writes current measurements to the JSON report.
A successful calibration exits with code 0 and prints `ANTIPATTERN_CORPUS_PASS:`.
`scripts/validate.ps1` requires both signals. Both validation CI jobs run that gate.

The second command checks one candidate file against the selected case contract.
Use another case identifier and file path to check an alternative repair.
A successful candidate exits with code 0 and prints `ANTIPATTERN_CANDIDATE_PASS:<case>`.
Exit code 1 means a contract check failed. Exit code 2 means the run could not establish a result.
An import error or timeout cannot count as detection of the intended defect.

Warning: the runner executes candidate Python code. A child process is not a security sandbox.
Inspect the code first. Use an isolated environment without secrets or network access when code is untrusted.
Keep the trusted runner and manifest outside the candidate's writable workspace.
The runner limits each child process to 10 seconds. This limit does not restrict file or network access.

If a check fails, read its failure code and detail. Fix the candidate or report the evidence gap.
Do not change the expected result to accept a defect. Rerun after a relevant change.

### Run an agent trial

1. Choose one case and one starting variant. Use `broken.py` for repair or `control.py` for a false-positive check.
2. Copy only that file into an isolated candidate workspace as `candidate.py`.
3. Give the agent the case `prompt` from the manifest. Load the selected skill through the host's normal path.
4. For an implementation trial, request the smallest complete repair. For a review trial, request findings without edits.
5. For a test trial, request a regression test and evidence that it rejects the original defect.
6. Save the exact prompt, input hash, output hash, diff, response, and host trace. Record the model, settings, loaded skill evidence, and repository revision.
7. Inspect the candidate before execution. Run the trusted candidate check against the resulting file. Save its JSON report with `--out`.
8. Review the agent's diagnosis and diff against the manifest. Check the cause, minimal repair, and preservation of legitimate behavior.
9. Report the code check, diagnosis review, and skill-loading evidence separately. A review-only trial does not produce a repaired-code pass.

For the test-boundary case, the candidate is itself a test function.
For the other cases, the candidate is an implementation. Inspect any additional agent-written test separately.
Do not treat a repaired implementation as proof that its new test detects the original defect.

These are public cases. An agent with repository access can read the reference repairs.
For a blinded trial, withhold the reference repairs, controls, diagnosis fields, and trusted checks from its workspace.
Record any exposure. Do not describe a public or exposed case as held-out evidence.
No live agent trial is included with this corpus.

## Reference

A **broken example** is executable code with a known defect.
A **reference repair** is one small implementation that satisfies the case contract.
A **legitimate control** resembles the defect but satisfies the contract.
A **candidate** is the code supplied for a check. It can be an agent patch or a human patch.
A **project check** observes the behavior named by the case contract.
**Calibration** means that the project check rejects the broken example and accepts the repair and control.
A **mutant** is an implementation with one deliberate defect.

The [manifest](manifest.json) records each prompt, source rule, expected diagnosis, minimal repair, legitimate control, and project check.
The current JSON report maps each pattern to its skills, expected result, observed result, artifact hash, and check hash.
The report is evidence from that run. It is not a stored claim that later revisions pass.

| Case identifier | Pattern | Primary skill | Observable check | Legitimate control |
| --- | --- | --- | --- | --- |
| `policy` | Duplicated cross-surface policy | `implement` | Shipping threshold and output contracts on both adapters | Separate output formatting |
| `retry` | Retry after an unknown outcome | `implement` | Intent, readback, returned status, and order count | Bounded retry after definite failure |
| `test_boundary` | Test replaces its target | `test` | Correct checkout passes; three mutants fail | Mock only the external gateway |
| `query_budget` | Per-row queries and unbounded reads | `implement` | Page results, query count, and fetched row count | Loop over one bounded batch |

`review` supports each case with an independent diagnosis and diff review.
Use the manifest's skill order as a task map, not as a command to load all three skills.
The [implementation procedure](../../../skills/implement/SKILL.md), [review procedure](../../../skills/review/SKILL.md), and [test procedure](../../../skills/test/SKILL.md) retain their current ownership rules.

Each case directory contains `broken.py`, `repair.py`, and `control.py`.
The runner checks behavior. It does not require a candidate to match the reference source text.
For example, the query-budget check accepts both a join and a bounded batch query.

## Explanation and evidence limits

The corpus makes four existing instructions testable on small code examples.
It does not add a second policy catalogue or claim complete anti-pattern coverage.
The reference repairs help calibrate the checks. Their success does not show that an agent selected or used a skill.

The retry checks cover lost responses after the first submit and an allowed retry.
The retry service is a deterministic boundary model. It sends no real order and tests no provider's retry guarantees.
The query case uses real SQLite. Its budget measures queries and fetched rows, not database work, latency, or production scale.
Its row bound assumes the fixture's at-most-two lines per order. Other schemas need their own budget.
The shipping check proves the supplied threshold behavior. A reviewer must still check whether the candidate leaves duplicate policy owners.
The test-boundary check proves sensitivity to three named mutants. It does not prove complete checkout coverage.

A stronger skill-performance claim needs fresh agent traces, reviewed diagnoses, and candidate results.
It also needs a declared model, test set, exposure, and comparison method.
Static integrity, prose lint, fixture calibration, and live agent performance are separate evidence classes.
