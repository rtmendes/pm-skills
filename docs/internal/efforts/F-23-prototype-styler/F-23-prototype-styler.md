# [F-23] Prototype Styler Utility Skill
Status: Backlog
Milestone: TBD
Issue: TBD
Agent: Claude Opus 4.6

## Scope

Create a `utility-prototype-styler` skill that helps establish agent-optimized UX/UI component standards for use with the prototype-creator skill (F-22). Produces a reusable style system — CSS variables, component patterns, layout conventions, and interaction standards — that the prototype-creator consumes to generate visually consistent prototypes.

The critical design principle: styles optimized for agentic creation differ from traditional design systems. They must be **deterministic** (same input → same visual output), **self-contained** (inline-able in a single HTML file), and **error-resistant** (graceful degradation when Claude misuses a component).

## Problem

When AI assistants generate HTML prototypes without a style system:
1. Every prototype looks different — inconsistent colors, spacing, typography, component patterns
2. Claude makes ad-hoc CSS decisions that produce unprofessional results (wrong spacing, clashing colors, inconsistent border radii)
3. No reusable component vocabulary — every button, card, form, and modal is coded from scratch
4. Interaction patterns (hover states, transitions, focus indicators) are missed or inconsistent
5. Accessibility is an afterthought — missing focus styles, insufficient contrast, no semantic HTML patterns

A style system designed for agentic consumption needs different properties than a human design system: it needs to be copy-pasteable (not imported), fault-tolerant (works even if Claude misses a class), and self-documenting (CSS variable names that communicate intent).

## How It Would Work

### Input
- Visual direction (minimal, corporate, playful, technical)
- Brand colors (if any) or preference (light/dark, warm/cool)
- Target prototype types (dashboards, forms, landing pages, multi-step flows)
- Optional: existing CSS to build on

### Process
1. **Define design tokens** — CSS custom properties for colors, spacing scale, typography scale, border radii, shadows, transitions
2. **Build component library** — Buttons, cards, forms, modals, navigation, tables, alerts, badges, tabs — all as CSS classes with consistent naming
3. **Establish layout conventions** — Grid patterns, page structures, responsive breakpoints, container widths
4. **Define interaction standards** — Hover states, focus indicators, transitions, loading states, empty states
5. **Validate accessibility** — WCAG AA contrast, focus visibility, semantic markup patterns
6. **Package for inline use** — All CSS in a single `<style>` block, copy-pasteable into any HTML file

### Output
A complete prototype style system including:
- CSS custom properties (design tokens) block
- Component CSS classes with usage examples
- Layout pattern CSS with grid/flexbox conventions
- Interaction CSS (hover, focus, transitions)
- Accessibility baseline (focus rings, contrast-safe defaults)
- Usage guide: which classes to apply for each component type
- HTML snippet library: copy-paste patterns for common UI elements

## Key Decisions

| Decision | Recommendation | Rationale |
|----------|---------------|-----------|
| **Classification** | utility | Meta-tooling for the prototype system |
| **CSS methodology** | BEM-inspired with CSS custom properties | Predictable naming Claude can follow; custom properties enable theming |
| **Dependency on F-22** | Hard — styles are meaningless without the creator | Style system format defined by what prototype-creator expects |
| **Inline vs external** | Inline (single `<style>` block) | Maintains the self-contained HTML constraint from F-22 |
| **Component count** | 12-15 core components | Covers ~90% of prototype needs without overwhelming the style system |
| **Dark mode** | Include as a variant | Toggle via CSS custom property swap, not duplicate styles |
| **Responsive approach** | Mobile-first with 2 breakpoints | Desktop + tablet + mobile; more breakpoints add complexity without prototype value |

## Quality Forecast

| Zone | Weight | Rationale |
|------|--------|-----------|
| Knowledge | 45 | CSS architecture, component design, accessibility standards, responsive patterns |
| Constraint | 30 | Inline-ability, self-contained, WCAG AA, deterministic rendering |
| Process | 15 | Step-by-step style system creation workflow |
| Wisdom | 10 | Balancing comprehensiveness with simplicity, choosing which components to include |

## Dependencies

- **F-22 (prototype-creator)** — defines what the style system must support; styler produces what creator consumes
- **F-21 (content-voice)** — optional, for typography choices aligned with content voice

## Artifacts Produced

- `skills/utility-prototype-styler/SKILL.md`
- `skills/utility-prototype-styler/references/TEMPLATE.md` (style system template)
- `skills/utility-prototype-styler/references/EXAMPLE.md` (worked example: SaaS dashboard style system)
- `commands/prototype-styler.md`

## Estimated Complexity

Medium-High — requires deep CSS/design system expertise. The "agent-optimized" angle (fault tolerance, self-documentation, inline-ability) adds novel design constraints not found in traditional design systems.

## PRs

TBD
