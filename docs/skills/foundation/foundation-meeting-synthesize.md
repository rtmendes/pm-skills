---
title: "foundation-meeting-synthesize"
description: "Cross-meeting archaeology skill. Consumes multiple meeting recaps over a period and surfaces patterns invisible in any single meeting: how decisions evolved, who said what, where threads are stalling, where contradictions have emerged. Produces a plain-text timeline, themes, stakeholder position tracking, contradiction flags, and prioritized follow-ups."
tags:
  - Foundation
  - meeting
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Classification:** Foundation | **Version:** 1.0.0 | **Category:** meeting | **License:** Apache-2.0

**Try it:** `/meeting-synthesize @recap1.md @recap2.md @recap3.md`
{ .md-button }

# Meeting Synthesize

Meeting synthesis is the archaeology skill for multi-meeting initiatives. It consumes a set of meeting recaps (and optionally raw notes) over a period, and surfaces patterns that no single meeting reveals: how decisions evolved, how stakeholder positions shifted, where threads are stalling, where contradictions have emerged.

Distinct from `/discover-interview-synthesis`: that skill works on user-research conversations with research-specific frameworks. This skill works on internal org meetings with org-specific patterns.

This skill belongs to the [Meeting Skills Family](../../reference/skill-families/meeting-skills-contract.md).

## When to Use

- Board prep or exec-brief preparation across a meeting sequence
- Onboarding a new team member into the history of an initiative
- Project retrospective input (the story of how we got here)
- Investigating why a multi-meeting initiative has stalled
- Quarterly review of a topic that has crossed many meetings

## When NOT to Use

- Single-meeting summary. Use `/meeting-recap` instead.
- Communicating outcomes outward. Use `/stakeholder-update`.
- User research conversation synthesis. Use `/discover-interview-synthesis`.

## How to Use

```
/meeting-synthesize @recap1.md @recap2.md @recap3.md
/meeting-synthesize --quarter=2026-Q1 @recap*.md
/meeting-synthesize --format=board-prep @recap*.md
```

Or reference the skill file directly: `skills/foundation-meeting-synthesize/SKILL.md`

## Key features

- **Zero-friction execution**: loads sources, runs inference on themes and stakeholder evolution, presents brief summary, accepts `go` or corrections
- **Filters**: time range (`--quarter`, `--range`), topic, stakeholder
- **Format hints**: `board-prep`, `onboarding`, `retro-input`, `exec-brief` control output presentation
- **Contradiction flags**: first-class section for decisions or positions in conflict
- **Stakeholder position tracking**: evolution over time, not just snapshots
- **Plain-text timeline**: renders everywhere (no binary images)
- **Confidence markers per theme**: tied to frequency across sources

## Instructions

Full instructions in `skills/foundation-meeting-synthesize/SKILL.md`. See also:

- [Skill template](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-synthesize/references/TEMPLATE.md)
- [Worked example](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-synthesize/references/EXAMPLE.md)
- [Sample outputs](https://github.com/product-on-purpose/pm-skills/tree/main/library/skill-output-samples/foundation-meeting-synthesize)

## Related skills

- [`/meeting-recap`](foundation-meeting-recap.md). upstream: primary input source
- [`/discover-interview-synthesis`](../discover/discover-interview-synthesis.md). sibling pattern for user research (different domain)
