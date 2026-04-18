---
title: "foundation-meeting-agenda"
description: "Produces an attendee-facing agenda that sets what will be discussed, who owns each topic, and how time will be spent. Supports ten meeting type variants. Emits a shareable summary suitable for Slack or email plus a full agenda with time-boxed topics, type tags, owners, attendee prep, and logistics."
tags:
  - Foundation
  - meeting
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Classification:** Foundation | **Version:** 1.0.0 | **Category:** meeting | **License:** Apache-2.0

**Try it:** `/meeting-agenda "Your meeting topic here"`
{ .md-button }

# Meeting Agenda

A meeting agenda is the attendee-facing structural document that sets expectations before a meeting. It answers "what will we discuss, who owns each topic, how will we spend the time, and what does done look like?" Distinct from a meeting brief, which is the user's private strategic prep; the agenda is shared with participants and focused on structure and flow.

This skill belongs to the [Meeting Skills Family](../../reference/skill-families/meeting-skills-contract.md), a group of five foundation-phase skills (agenda, brief, recap, synthesize, stakeholder-update) that share a common behavioral contract, frontmatter schema, and filename-based chaining.

## When to Use

- Running or chairing a cross-functional working session, project kickoff, stakeholder review, or decision meeting
- Any meeting with more than three attendees or more than thirty minutes
- Recurring meeting where a rolling structure (1-on-1, team sync) needs fresh framing
- Mid-initiative alignment moment where explicit desired outcomes prevent drift

## When NOT to Use

- The user's preparation is private and tactical. Use `/meeting-brief` instead.
- The meeting has already happened. Use `/meeting-recap` for post-meeting summarization.
- The user wants to communicate outcomes to non-attendees. Use `/stakeholder-update` after the meeting.

## How to Use

```
/meeting-agenda "Your meeting topic here"
```

Or reference the skill file directly: `skills/foundation-meeting-agenda/SKILL.md`

## Key features

- **Zero-friction execution** (per family contract): reads inputs, infers missing values, presents a brief inference summary, accepts one-word `go` or corrections. No blocking interrogation.
- **Anti-meeting check**: opens with "does this need to be a meeting?" If the objective can be handled async, proposes the alternative instead.
- **Ten meeting-type variants**: standup, planning, review, decision-making, brainstorm, 1-on-1, stakeholder-review, project-kickoff, working-session, exec-briefing, other. Each reshapes the topic list to match the meeting's purpose.
- **Topic time math validation**: sum of topic times must equal meeting duration. Overflows are flagged, not silently trimmed.
- **Default duration**: 30 min (per family contract).

## Instructions

Full instructions are in the skill file at `skills/foundation-meeting-agenda/SKILL.md`. See also:

- [Skill template](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-agenda/references/TEMPLATE.md)
- [Worked example](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-meeting-agenda/references/EXAMPLE.md)
- [Sample outputs](https://github.com/product-on-purpose/pm-skills/tree/main/library/skill-output-samples/foundation-meeting-agenda)

## Related skills

- [`/meeting-brief`](foundation-meeting-brief.md) — user's private prep (shares anti-meeting check)
- [`/meeting-recap`](foundation-meeting-recap.md) — downstream: auto-populates from this agenda's topic list
- [`/stakeholder-update`](foundation-stakeholder-update.md) — downstream: translates outcomes to non-attendees
