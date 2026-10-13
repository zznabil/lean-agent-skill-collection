# V8.19.0 — Regression Corpus and Release Boundary Repairs

## Changes

- Add four public executable anti-pattern cases for duplicated shipping policy, unknown write outcomes, tests that replace their target, and unbounded page reads. Each case has a broken example, a repair, a legitimate control and a candidate check. Source validation requires fresh calibration.
- Preserve a concurrent Hermes pack destination. Stage on the destination filesystem and use an exclusive rename instead of a nesting move. All four installer copies share the repair; destination and policy races have rejection controls.
- Reject linked release output ancestors and descendants before deleting or writing files. Safe existing and new output directories remain supported.
- Stop both CI pack jobs at every failed Python command. Use the calibrated artifact comparator in both main validation jobs, including exact names and hidden files.
- Record the repository-wide audit, source identity checks, evidence limits and repaired failures.

## Compatibility and evidence limits

The 24 base skills, 27 integrated routines, six profile memberships, adapter routes and both optional-pack boundaries remain unchanged. No runtime dependency, global workflow or publisher source change is introduced. Source validation still requires PowerShell 7 or Windows PowerShell 5.1 and Python 3.10 or later.

The regression corpus stays outside generated profiles. Its checks execute inspected candidate Python code in a child process; this is not a security sandbox. Public fixture calibration does not prove live agent skill use. No fresh live model trial, cross-model independent review or formal standards-conformance claim is made.

## Verification

Require final-revision source/archive validation, damaged controls, pack and publisher-baseline tests, prose preservation, installer boundaries, workflow failure controls and deterministic builds on both PowerShell hosts. Require exact merged-main CI before tagging. The attached release evidence records actual outcomes; this requirements list is not a test result.

## Use and recovery

Use the existing profile and Hermes installation instructions. No migration is required. If a concurrent destination appears, the installer fails without modifying it; review the competing installation before retrying. If a build output path contains a link, select a physical directory under `artifacts/` rather than bypassing the guard.

Keep V8.18.0 and installation backups for recovery. Remove only the installed pack and its marked policy block when reverting. Preserve later persona edits and unrelated user files. Existing releases remain unchanged.
