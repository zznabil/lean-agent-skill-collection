---
name: frontend
description: "Design, build, reconstruct, redesign, or polish a web, mobile, or desktop interface against real product needs and rendered evidence. Use for image-to-code, responsive states, and accessibility."
---

# Frontend

Select a mode: **direction**, **build**, **image-to-code**, **concept images**, **redesign**, or **polish**. Use `review` for independent acceptance.

1. Inspect the product goal, audience, content, brand, current design system, platform conventions, code stack, and supplied references.
2. State a one-line design read: artifact type, audience, desired character, and constraint that dominates. Tune three explicit axes before styling: layout variance, motion intensity, and information density.
3. Define the primary user journey and visual hierarchy before styling details.
4. Choose one coherent direction from `DIRECTIONS.md` or derive one from the subject. Use one design system or component language per surface; do not mix unrelated motifs or override most of an imported system.
5. For platform-native work, inspect current official samples and prefer native controls and interaction patterns before custom controls. Reuse accessible primitives before inventing new ones.
6. Put state at the narrowest durable boundary: local component first, URL or server when it must survive navigation or sharing, and shared client state only when several distant surfaces genuinely coordinate.
7. Establish type scale, spacing, layout grid, color roles, component states, imagery, and motion rules. Use real content and realistic data.
8. Follow the existing stack and component conventions. Verify a dependency exists before importing it.
9. Build loading, empty, error, focus, hover, active, disabled, validation, persistence, and recovery states that the journey needs.
10. For production web interfaces, target applicable WCAG 2.2 AA criteria unless project policy defines another target. Verify keyboard access, focus order, semantics, contrast, reduced motion, responsive behavior, overflow, scaling, and localization expansion according to scope.
11. Inspect the rendered artifact at representative viewports or window sizes. Capture screenshots and test the real journey; source code alone is not evidence.
12. For image-to-code, compare side by side or with an overlay and fix the largest geometric mismatch first.
13. For concept images, keep navigation, data, components, and state consistent across screens so the result is implementable.

Avoid default AI motifs, generic hero-card grids, decorative gradients without purpose, every-section animation, random glass effects, fake dashboards, and polish that hides broken interaction.

Output the design read, direction, changed artifacts, screenshots or render evidence, journeys and accessibility checks, known gaps, and next highest-value improvement.
