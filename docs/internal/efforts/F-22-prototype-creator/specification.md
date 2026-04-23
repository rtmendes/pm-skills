# Specification: utility-prototype-creator

## Overview

A utility skill that helps PMs produce self-contained HTML prototypes for communicating product concepts, user flows, and interaction patterns. Every prototype is a single-file, dependency-free HTML document that opens in any browser . no server, no build step, no framework. Designed for the agentic workflow: Claude generates the complete HTML file from a structured brief. The prototypes are communication artifacts, not production code.

## Skill Identity

| Field | Value |
|-------|-------|
| Name | utility-prototype-creator |
| Classification | utility |
| Version | 1.0.0 |
| License | Apache-2.0 |
| Category | coordination |
| Audience | Product Managers |

## Design Principles

### 1. Single-File, Zero-Dependency
The core value proposition: double-click to open. Every prototype is one `.html` file with inline CSS and JavaScript. No CDN links, no npm install, no localhost. This constraint enables sharing via email, Slack, or document embedding without setup instructions.

### 2. Communication Over Code Quality
Prototypes are disposable communication artifacts, not software. Inline styles are fine. Repeated markup is fine. The measure of quality is "does this clearly communicate the product concept?" not "is this production-ready code?"

### 3. Scoping Is the Hard Part
The skill's greatest value is helping PMs scope what to prototype. Most prototype failures come from trying to build too much. The scoping step explicitly separates "must demonstrate" from "can describe in comments" from "out of scope."

### 4. Progressive Interaction Complexity
Prototypes exist on a spectrum: static mockup, clickable flow, interactive demo. The skill defines three tiers with clear boundaries so PMs choose the right complexity level. Over-engineering a prototype wastes time; under-engineering one fails to communicate.

### 5. Accessible by Default
Even disposable prototypes should demonstrate accessible patterns . semantic HTML, keyboard navigation, focus indicators, contrast. This sets expectations for the real implementation and avoids communicating inaccessible patterns to engineering.

---

## File Architecture

```
skills/utility-prototype-creator/
├── SKILL.md
└── references/
    ├── TEMPLATE.md
    └── EXAMPLE.md

commands/
└── prototype-creator.md
```

### SKILL.md (~220-260 lines)

**Frontmatter:**
```yaml
name: utility-prototype-creator
description: >-
  Generates self-contained, single-file HTML prototypes from structured briefs
  for communicating product concepts, user flows, and interaction patterns.
  No server, no build, no framework . opens in any browser. Supports three
  interaction tiers (static, clickable, interactive) with accessible markup
  and optional custom styling via utility-prototype-styler.
version: "1.0.0"
updated: YYYY-MM-DD
license: Apache-2.0
classification: utility
metadata:
  category: coordination
  frameworks: []
  author: product-on-purpose
```

**Sections:**

1. **When to Use** (~10 lines)
   - Communicating a product concept to stakeholders, engineers, or users
   - Demonstrating a user flow or interaction pattern that wireframes can't capture
   - Testing a design hypothesis with a clickable artifact before investing in design tools
   - Creating a visual reference for a PRD or user story

2. **When NOT to Use** (~10 lines)
   - Building production features (this is a communication tool, not a development framework)
   - Creating high-fidelity design mockups (use Figma or design tools)
   - Prototypes requiring real data, APIs, or authentication
   - Multi-page applications with complex routing (cap at ~3-5 view states)
   - Usability testing that requires realistic performance or data volume

3. **Interaction Tiers** (~25 lines)
   - **Tier 1 . Static Mockup**: Visual layout only. No JavaScript. Use for: early concept communication, layout exploration, stakeholder alignment on visual direction.
   - **Tier 2 . Clickable Flow**: Navigation between states via tabs, modals, or view switching. Minimal JavaScript. Use for: user flow demonstration, screen-to-screen transitions, happy path walkthrough.
   - **Tier 3 . Interactive Demo**: Form interactions, data filtering, state changes, animations. Moderate JavaScript. Use for: interaction pattern demonstration, input/output flows, dynamic content behavior.
   - Decision guide: "If you're deciding, start with Tier 2. Drop to Tier 1 if layout is the question. Escalate to Tier 3 only if the interaction IS the thing you're communicating."

4. **Prototype Scoping** (~20 lines)
   - **Must Demonstrate** . The core concept or interaction that motivated the prototype
   - **Can Describe in Comments** . Secondary features noted as HTML comments ("<!-- In production, this would filter by date range -->")
   - **Out of Scope** . Explicitly excluded to prevent scope creep
   - Scoping worksheet included (part of TEMPLATE.md)

5. **Instructions** (~40 lines, numbered steps)
   1. Define the communication goal . what should the viewer understand after seeing this?
   2. Identify the audience . engineers (show interaction detail), stakeholders (show concept), users (show value)
   3. Select interaction tier . Tier 1, 2, or 3 based on what needs demonstrating
   4. Complete the scoping worksheet . must demonstrate / can describe / out of scope
   5. Inventory screens and states . list every view, modal, and state transition
   6. Define the component inventory . buttons, forms, cards, tables, navigation, modals needed
   7. Apply styling . use default embedded styles or reference a prototype-styler theme (F-23)
   8. Generate the HTML file . single file, all CSS in `<style>`, all JS in `<script>`, inline comments
   9. Validate . opens in browser, interactions work, keyboard-navigable, no console errors
   10. Share . attach the .html file directly; no setup instructions needed

6. **HTML Structure Convention** (~20 lines)
   - Document structure: `<!DOCTYPE html>` > `<html lang="en">` > `<head>` (meta, title, style) > `<body>` (content, script)
   - CSS placement: single `<style>` block in `<head>`
   - JS placement: single `<script>` block before `</body>`
   - Comment convention: `<!-- SECTION: name -->` for major sections, `<!-- NOTE: explanation -->` for production intent, `<!-- TODO: future feature -->` for known gaps
   - Semantic HTML: `<nav>`, `<main>`, `<section>`, `<article>`, `<button>`, `<dialog>` . not `<div>` for everything

7. **Interaction Pattern Library** (~25 lines)
   - Tab switching (view state management)
   - Modal dialogs (open/close with backdrop)
   - Form flows (multi-step with state tracking)
   - Data filtering (show/hide based on criteria)
   - Accordion/expand-collapse
   - Toast notifications
   - Drag-and-drop (Tier 3 only)
   - Each pattern: when to use, complexity tier, accessibility requirements

8. **Output Contract** (~10 lines)
   - References TEMPLATE.md as the brief format
   - Final output: a single `.html` file
   - File size guideline: under 200KB for email-friendliness
   - Must validate: opens in Chrome/Firefox/Safari, no console errors, keyboard-navigable

9. **Quality Checklist** (~15 lines)
   - [ ] Single file, no external dependencies (no CDN links, no imports)
   - [ ] Opens in browser by double-clicking the file
   - [ ] Communication goal is clear within 5 seconds of viewing
   - [ ] Interaction tier appropriate . not over-engineered, not under-communicating
   - [ ] Scoping worksheet completed . out-of-scope items noted as HTML comments
   - [ ] Semantic HTML used (nav, main, section, button, dialog)
   - [ ] Keyboard-navigable . Tab key reaches all interactive elements
   - [ ] Focus indicators visible on interactive elements
   - [ ] Color contrast meets WCAG AA (4.5:1 body text)
   - [ ] Inline comments explain non-obvious structure and production intent
   - [ ] File size under 200KB

10. **Companion Skills** (~5 lines)
    - `utility-prototype-styler` (F-23) . optional, for custom component styling
    - `foundation-content-voice` (F-21) . optional, for consistent copy in prototype text
    - `deliver-prd` . prototypes can accompany PRDs as visual references

---

### references/TEMPLATE.md (~60-80 lines)

A structured prototype brief template. Sections:

1. **Communication Goal** . One sentence: what should the viewer understand after seeing this prototype?
2. **Target Audience** . Who will view this and what do they need from it? (Engineers: interaction detail. Stakeholders: concept/value. Users: experience.)
3. **Interaction Tier** . Tier 1 (static) / Tier 2 (clickable) / Tier 3 (interactive) with rationale for choice
4. **Scoping Worksheet**
   - Must Demonstrate: [list core interactions/concepts]
   - Can Describe in Comments: [list secondary features to note but not build]
   - Out of Scope: [list explicitly excluded items]
5. **Screen & State Inventory** . Table: screen name / description / states (default, active, error, empty) / transitions to/from
6. **Component Inventory** . Table: component type / count / interaction behavior / accessibility notes
7. **Style Reference** . Default embedded styles OR reference to a prototype-styler theme file
8. **Validation Criteria** . What "done" looks like for this specific prototype

---

### references/EXAMPLE.md (~350-450 lines)

A worked example: **PM creating a task management dashboard prototype to communicate a feature concept to engineering**.

Demonstrates the full TEMPLATE workflow:

1. **Communication Goal** . "Engineering should understand the proposed task filtering and grouping interaction pattern for the new dashboard view"
2. **Audience** . Engineering team (need interaction detail, not just layout)
3. **Interaction Tier** . Tier 3 (interactive) . the filtering interaction IS the concept being communicated
4. **Scoping Worksheet**
   - Must Demonstrate: task list with filter dropdown, group-by toggle (status/assignee/priority), card expand/collapse
   - Can Describe: real-time updates, drag-and-drop reordering, search
   - Out of Scope: authentication, settings, notifications, data persistence
5. **Screen Inventory** . Main dashboard (default state, filtered state, grouped-by-status, grouped-by-assignee, empty state)
6. **Component Inventory** . Navigation bar, filter dropdown, group-by toggle, task cards (5 sample items), expand/collapse detail panel, empty state message
7. **The Prototype** . Complete HTML file (~150 lines) with:
   - Inline CSS using CSS custom properties for theming
   - Semantic HTML (nav, main, section, button)
   - JavaScript for filter and group-by interactions
   - HTML comments explaining production intent
   - Accessible: keyboard-navigable, focus indicators, ARIA labels
8. **Validation** . Walkthrough showing the prototype passes all quality checklist items

---

### commands/prototype-creator.md

```yaml
---
name: prototype-creator
description: Generate a self-contained HTML prototype from a structured brief
skill: utility-prototype-creator
---
```

Body: brief instruction to invoke the skill with the product concept and target audience.

---

## Companion Skill Dependencies

- **F-23 (utility-prototype-styler)**: Soft dependency. The creator ships with a default embedded style system. When a prototype-styler theme is provided, the creator uses it instead. The style integration is a CSS custom properties swap . the creator expects a defined set of variable names.
- **F-21 (foundation-content-voice)**: Soft dependency. Copy in prototypes can optionally follow a content voice guide.

## Acceptance Criteria

1. **Given** a PM completes a prototype brief with a communication goal and screen inventory, **when** the prototype is generated following SKILL.md instructions, **then** the output is a single `.html` file under 200KB that opens in any browser without a server.

2. **Given** a Tier 2 (clickable) prototype, **when** a viewer interacts with it, **then** all navigation between screens/states works via click/tap and all interactive elements are reachable via keyboard Tab.

3. **Given** a prototype with no prototype-styler theme referenced, **when** the prototype is generated, **then** it uses the default embedded styles and looks professional (consistent spacing, readable typography, adequate contrast).

4. **Given** a scoping worksheet with "Can Describe" items, **when** the prototype HTML is inspected, **then** those items appear as HTML comments in the appropriate locations explaining production intent.

5. **Given** a completed prototype, **when** opened in Chrome, Firefox, and Safari, **then** no console errors appear and all interactions function correctly.
