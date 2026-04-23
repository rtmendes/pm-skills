---
title: "foundation-stakeholder-update"
description: "Produces async communication to stakeholders from a meeting recap. Supports channel variants (slack, teams, email, notion, exec-memo) and audience variants (engineering, design, leadership, customer-facing, mixed). Translates meeting outcomes into what-it-means language for readers, surfaces a primary CTA up front, flags technical-to-business translations, and detects thread continuation."
tags:
  - Foundation
  - meeting
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Classification:** Foundation | **Version:** 1.0.0 | **Category:** meeting | **License:** Apache-2.0

**Try it:** `/stakeholder-update @recap.md --channel=slack --audience=engineering`
{ .md-button }

# Stakeholder Update

A stakeholder update is async communication to readers who need to know the outcomes of a meeting. Primary audience is non-attendees; secondary audience is some attendees who want a reference version.

Distinct from `/meeting-recap` (summary of what happened for people in the room) and from `/discover-stakeholder-summary` (understanding stakeholders, not communicating to them).

This skill belongs to the [Meeting Skills Family](../../reference/skill-families/meeting-skills-contract.md).

## When to Use

- After a meeting with outcomes affecting teams who were not in the room
- When a decision needs to propagate async to downstream teams
- When the user needs something from readers (specific CTA) and cannot afford burial

## When NOT to Use

- Summarizing what happened for attendees. Use `/meeting-recap`.
- Broadcasting status with no specific audience tailoring.
- User research communications. Use `/discover-interview-synthesis` plus targeted comms.

## How to Use

```
/stakeholder-update @recap.md --channel=slack --audience=engineering
/stakeholder-update @recap.md --channel=email --audience=leadership --cta="FYI-only"
```

Or reference the skill file directly: `skills/foundation-stakeholder-update/SKILL.md`

## Key features

- **Zero-friction execution**: loads recap, detects thread continuation, runs inference, presents brief summary, accepts `go` or corrections
- **5 channel variants**: slack, teams, email, notion, exec-memo. each with format-appropriate rendering
- **5 audience variants**: engineering, design, leadership, customer-facing, mixed. each with tailored "what this means for you"
- **CTA surfaced up front**: action needed or explicit FYI-only, never buried
- **Technical-to-business translation log**: translations inspectable by the user before sending
- **Thread continuation detection**: auto-links to prior updates on the same project/topics
- **Entire output is shareable content**: no separate summary block needed (per family contract)

## Instructions

Full instructions in `skills/foundation-stakeholder-update/SKILL.md`. See also:

- [Skill template](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-stakeholder-update/references/TEMPLATE.md)
- [Worked example](https://github.com/product-on-purpose/pm-skills/blob/main/skills/foundation-stakeholder-update/references/EXAMPLE.md)
- [Sample outputs](https://github.com/product-on-purpose/pm-skills/tree/main/library/skill-output-samples/foundation-stakeholder-update)

## Related skills

- [`/meeting-recap`](foundation-meeting-recap.md). upstream: primary input source
- [`/discover-stakeholder-summary`](../discover/discover-stakeholder-summary.md). distinct purpose (understanding stakeholders)
