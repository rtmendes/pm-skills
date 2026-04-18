---
title: "foundation-meeting-brief"
description: "Produces a private strategic preparation document for a meeting that matters. Captures stakes, stakeholder positions and reads, ranked desired outcomes, key messages, anticipated Q&A with prepared responses, risks, specific asks, and success signals. The user's personal tactical prep, distinct from the attendee-facing agenda."
tags:
  - Foundation
  - meeting
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Classification:** Foundation | **Version:** 1.0.0 | **Category:** meeting | **License:** Apache-2.0

**Try it:** `/meeting-brief "Your meeting context here"`
{ .md-button }

# Meeting Brief

A meeting brief is the user's private strategic preparation document for a meeting where context, stakes, or positioning matter. It captures what the user needs to know, what they want to accomplish, who they are engaging with, and how to navigate the conversation. This is strategic prep, not meeting structure, which keeps it distinct from a meeting agenda.

This skill belongs to the [Meeting Skills Family](../../reference/skill-families/meeting-skills-contract.md), a group of five foundation-phase skills that share a common behavioral contract and filename-based chaining.

## When to Use

- Walking into a stakeholder review, exec briefing, or negotiation-adjacent conversation
- First meeting with a new stakeholder where relationship calibration matters
- A meeting where the user needs something from others (capacity, decision, approval)
- Any conversation where specific positioning, messaging, or risk navigation is required

## When NOT to Use

- Preparing the agenda attendees will see. Use `/meeting-agenda` instead.
- Post-meeting summarization. Use `/meeting-recap`.
- Low-stakes recurring meetings (standups, routine syncs) where the agenda alone is sufficient.

## How to Use

```
/meeting-brief "Your meeting context here"
```

Or reference the skill file directly: `skills/foundation-meeting-brief/SKILL.md`

## Key features

- **Zero-friction execution** (per family contract): reads inputs, auto-discovers related artifacts, infers missing values, presents a brief inference summary, accepts one-word `go` or corrections.
- **Anti-meeting check**: shared with `/meeting-agenda`; proposes async alternative if the objective can be met async.
- **Per-stakeholder tactical reads**: position, stakes, likely concerns, relationship state, tactical notes. Inferred from prior recaps and stakeholder summaries when available.
- **Default `visibility: private`**: brief is not intended for sharing.
- **Ranked outcomes**: must achieve / should achieve / nice to achieve. Forces the tradeoff.
- **Success signals**: behavioral cues for knowing the meeting went well in the moment, not just outcome markers.

## Instructions

Full instructions are in the skill file at `skills/foundation-meeting-brief/SKILL.md`. See also:

- [Skill template](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-brief/references/TEMPLATE.md)
- [Worked example](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-brief/references/EXAMPLE.md)
- [Sample outputs](https://github.com/product-on-purpose/pm-skills/tree/main/library/skill-output-samples/foundation-meeting-brief)

## Related skills

- [`/meeting-agenda`](foundation-meeting-agenda.md) — attendee-facing agenda (shares anti-meeting check)
- [`/discover-stakeholder-summary`](../discover/discover-stakeholder-summary.md) — upstream input for stakeholder positions
