# V8.10.1 — Quick Mode metadata repair

## Change

Harden release metadata validation so declared Boolean contracts require real Boolean values and preserve the intentional profile semantics: Core, Engineering, Complete, and Get It Done include engineering core; Communication and Gauntlet explicitly do not.

Record Quick Mode as implicitly selectable (18 implicit, 6 manual-only, 24 total selectable skills) while retaining explicit request and safety requirements.

Refresh the package version and release metadata for the V8.10.1 release package. The package contains source, validation records, notices, and generated archives; it does not bundle a runtime, installer, or host-enforcement layer.
