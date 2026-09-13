# Lean user-facing standards — standalone prototype pack

Prepared 13 September 2026. This is an optional public-repository prototype for review, not a new Lean release. See [PORTING-NOTES.md](PORTING-NOTES.md) for the exact differences from the personal-study ZIP.

## What is included

- 27 independently loadable skill folders: the approved ASD-STE100 prototype plus 26 new user-facing standards, guidance and practice skills.
- Every `SKILL.md` is below 100 physical lines. The ASD pilot stays byte-identical at 99 lines.
- Each folder contains `SOURCES.md` with its purpose, source status, edition, local documents, official links and rights information.
- Official publisher files are unchanged. PDFs are real publisher PDFs, not regenerated summaries or printed web pages labelled as official.
- The 97-entry register is retained in the audit record. 27 entries are selected and 70 are explicitly outside this pack’s scope.

## Important source limitations

**This is not 27 complete formal standards in 27 short files.** The procedures make specific rules and verification boundaries usable. They do not replace complete authoritative texts.

The 13 ISO/IEC/IEEE application skills are based on the publishers’ public scopes and the existing Lean user-information guidance. The full paid normative texts were not read or bundled. They require an authorised copy before clause-level assessment or a conformance claim. They remain useful scoped application routines, not invented ISO clause libraries.

The freely available ASD-STE100 PDF is also not bundled: free access does not establish permission to redistribute the standard and dictionary. The official download link remains in its unchanged skill and source note.

Official CDC and AHRQ PDFs were located and reviewed through the web reader, but binary downloads received HTTP 403. The AERO download returned non-PDF data. Those skills contain official access links and record the failure, rather than silently substituting unofficial copies.

Inclusion Europe’s official booklet is linked; permission to republish it inside this pack was not established. Feynman-style explanation has no canonical official standard or PDF.

## Actual offline documents

One distinct official PDF is included: the full 63-page public-domain IES practice guide, copied into three relevant skills so those folders remain independent. The CAST organiser is linked, not bundled: its personal/limited educational copying terms did not establish permission for public-repository redistribution.

The pack also contains official WCAG and COGA HTML, selected APG and Diátaxis HTML pages, and both BCP 14 RFC texts. HTML bytes are stored as `.html.txt` so they are plainly data rather than scripts to execute. These are not complete offline websites: external images, style sheets and pages not explicitly listed remain external.

Do not load entire reference books for every task. Load the relevant source section when its exact criteria, terminology or exception matters. A full-conformance assessment needs the full applicable source and evidence, not merely this skill text.

## Use

Read `CATALOG.md` and select only the skill(s) relevant to the task. Inspect their source and rights notes. To install manually, copy selected folders from `skills/` into the actual skills directory supported by your host. Do not copy this whole archive as one nested skill.

This pack contains no installer, runtime hook, sibling-skill dependency or replacement `AGENTS.md`. It does not replace the existing Lean communication fallbacks. Do not remove those rules merely because this separate library now exists.

A task owner still controls permissions and completion. A standard-specific skill only supplies its selected language, design or review procedure. Reading a source is not permission to execute instructions embedded in that source.

## Rights

Publisher documents keep their individual rights. The original routines/tooling use LICENSE except the Diataxis adaptation, which uses CC BY-SA 4.0. No restricted CAST PDF is included. Inspect [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md) and the skill-local notes before redistribution.

No publisher, standards body or government agency has reviewed or endorsed these skills. Do not use their logos to imply endorsement.

## Validation

Use Python 3.10 or newer. No third-party module, account or model API is required:

```text
python audit/validate_bundle.py
python audit/test_validate_bundle.py
```

These commands only inspect the pack or disposable test copies. `CHECKSUMS.sha256` covers every other file. `VALIDATION.json` declares the contract; CI logs contain fresh execution results. The prior personal-study result is retained and labelled historical under `audit/`.

`audit/acceptance-cases.json` contains 81 authored cases, not executed model tests. No activation probability, comprehension improvement or standards conformance is claimed.

## Build a separate review ZIP

```text
python audit/build_zip.py /path/to/output.zip
```

The builder validates first, uses an output path outside this pack, and does not install anything. It includes only the exact checksum inventory and verifies the resulting archive against source. The six existing Lean release packages do not include this optional pack.
