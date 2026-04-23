---
title: "foundation-meeting-recap"
description: "Produces a topic-segmented post-meeting summary for attendees with decisions highlighted and actions captured inline per topic (plus a consolidated action view at the end). Auto-populates topic skeleton from a sibling meeting-agenda when available; reconciles planned vs. actual topics. Accepts transcripts from any tool, notes, or hybrid inputs."
tags:
  - Foundation
  - meeting
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Classification:** Foundation | **Version:** 1.0.0 | **Category:** meeting | **License:** Apache-2.0

**Try it:** `/meeting-recap @transcript.txt`
{ .md-button }

# Meeting Recap

A meeting recap is a post-meeting topic-segmented summary produced for attendees and light distribution. It organizes content by topic rather than chronology, highlights decisions visually, and captures actions inline (with owner, due date, dependencies) per topic segment, plus a consolidated actions view at the end.

This skill absorbs what would otherwise be a separate "meeting-actions" skill. Actions in this family live alongside the context that makes them meaningful.

This skill belongs to the [Meeting Skills Family](../../reference/skill-families/meeting-skills-contract.md).

## When to Use

- After any internal meeting that produces decisions or actions affecting attendees
- When a sibling `/meeting-agenda` exists and needs reconciliation
- When inputs include a transcript or mixed notes and transcript

## When NOT to Use

- Communicating outcomes to non-attendees. Use `/stakeholder-update` instead.
- Cross-meeting synthesis. Use `/meeting-synthesize`.
- Live note-taking. This skill consumes finished inputs.

## How to Use

```
/meeting-recap @transcript.txt
/meeting-recap @transcript.txt @live-notes.md
```

Or reference the skill file directly: `skills/foundation-meeting-recap/SKILL.md`

## Key features

- **Zero-friction execution**: reads inputs, auto-discovers sibling agenda, runs inference, presents brief summary, accepts `go` or corrections.
- **Agenda auto-discovery**: filename-prefix match on same-directory `*_{title}_agenda.md` loads topic skeleton and desired-outcomes.
- **Fabrication prohibition**: never invents owners or dates. Missing info is flagged as `[owner: unassigned]` or `[due: not specified]`.
- **Decision visual emphasis**: decisions are bold-flagged within topic segments. Inferred decisions carry confidence markers.
- **Consolidated actions by owner**: regrouped at the end for single-owner scannability.
- **Agenda reconciliation**: planned vs. hit vs. skipped vs. emerged, reported explicitly.
- **Meeting quality signals**: outcomes-achieved ratio, start/end-on-time, key attendee presence.

## Instructions

Full instructions in `skills/foundation-meeting-recap/SKILL.md`. See also:

- [Skill template](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-recap/references/TEMPLATE.md)
- [Worked example](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-recap/references/EXAMPLE.md)
- [Sample outputs](https://github.com/product-on-purpose/pm-skills/tree/main/library/skill-output-samples/foundation-meeting-recap)

## Related skills

- [`/meeting-agenda`](foundation-meeting-agenda.md). upstream: provides topic skeleton
- [`/meeting-synthesize`](foundation-meeting-synthesize.md). downstream: consumes recaps
- [`/stakeholder-update`](foundation-stakeholder-update.md). downstream: translates recap outcomes
