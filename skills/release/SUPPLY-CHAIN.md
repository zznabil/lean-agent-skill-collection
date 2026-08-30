# Supply-chain assurance

Use **SLSA** for provenance claims, **SPDX or CycloneDX** for inventory, and **Reproducible Builds** for independent byte-level recreation. These answer different questions and do not prove correctness or security by themselves.

Load only for a public, security-sensitive, distributed, or regulated release, or when the user explicitly asks for provenance, an SBOM, signing, or reproducibility.

## Questions and evidence

Keep these claims separate:

- **Integrity:** Does this digest or signature identify the downloaded artifact?
- **Provenance:** Which source revision, builder, recipe, dependencies, and environment produced it?
- **Reproducibility:** Can an independent clean build produce the same bytes?
- **Inventory:** Which components, services, licences, and dependency relationships are present?
- **Security and correctness:** Were the relevant vulnerabilities, controls, and behavior actually evaluated?

One claim does not prove the others.

## Minimum release record

Record source revision, builder or workflow identity, build recipe, resolved dependency set, build environment, artifact digest, verification command, result, and evidence location. Pin build actions and toolchains where practical. Preserve the generated manifest beside the release.

## Provenance

Use SLSA-style provenance when the artifact crosses a trust boundary or the build chain matters. Record the exact SLSA specification version and verified controls. Do not claim a level or track from a self-description alone. A provenance statement from an untrusted builder can accurately describe an untrusted build.

## Dependency inventory

Use SPDX or CycloneDX when a machine-readable inventory changes licensing, vulnerability, customer, or regulatory decisions. Select one format from consumer needs and available tooling. Include services and configurations only when the chosen format and project scope support them. An SBOM is an inventory, not a vulnerability assessment or approval.

## Reproducible builds

Define the source, build instructions, dependency resolution, environment, and expected artifact. Build twice from clean independent workspaces when practical, compare bytes, and explain any controlled differences. Deterministic archives require stable file order, timestamps, permissions, path names, compression settings, and generated metadata.

## Signing and publication

Signing, tagging, uploading, attesting, or changing a release channel is an external consequential action and requires authorization. Verify the final remote asset, digest, signature or attestation, version, and release notes after publication. Protect signing keys and avoid exposing secrets in logs or artifacts.

## Stop conditions

Return `BLOCKED` or `NO-GO` when required provenance is missing, the source or builder cannot be identified, a clean rebuild materially differs without explanation, the SBOM omits required scope, or publication would exceed the evidence. Report unavailable checks rather than inventing a pass.
