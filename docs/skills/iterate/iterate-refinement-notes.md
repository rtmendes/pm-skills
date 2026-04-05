---
title: "iterate-refinement-notes"
description: "Documents backlog refinement session outcomes including stories refined, estimates, questions raised, and decisions made. Use during or after refinement to capture the results and share with absent team members."
tags:
  - Iterate
  - coordination
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Iterate | **Version:** 2.0.0 | **Category:** coordination | **License:** Apache-2.0

# Refinement Notes

Refinement notes capture the outcomes of backlog refinement (grooming) sessions—what was discussed, what was estimated, and what decisions were made. They serve as a quick reference for team members who missed the session and a historical record of how stories evolved from idea to ready-for-sprint.

## When to Use

- During refinement sessions to capture decisions in real-time
- After refinement to share outcomes with absent team members
- When onboarding new team members to explain backlog context
- Before sprint planning to review what's been refined
- When stories need re-refinement due to time elapsed

## How to Use

Use the `/refinement-notes` slash command:

```
/refinement-notes "Your context here"
```

Or reference the skill file directly: `skills/iterate-refinement-notes/SKILL.md`

## Instructions

When asked to document refinement notes, follow these steps:

1. **Record Session Metadata**
   Note the date, attendees, and duration. This helps track who was part of decisions and when discussions happened.

2. **List Stories Discussed**
   For each story, capture the outcome: estimated points, refined status, key discussion points, and any modifications made to the original scope.

3. **Document Questions Raised**
   Questions that couldn't be answered in the session need owners and due dates. Don't let them disappear—they often block sprint planning.

4. **Capture Decisions Made**
   Record any scope decisions, technical approaches agreed upon, or priority changes. These decisions are valuable context that gets lost without documentation.

5. **Note Action Items**
   Any follow-up work needed before stories are sprint-ready: mockups to create, technical spikes to run, stakeholders to consult.

6. **Flag Blocked Stories**
   Clearly identify stories that can't proceed until blockers are resolved. Include what the blocker is and who owns resolution.

7. **Plan Next Session**
   Note what should be refined next and any preparation needed.

## Output Template

# Refinement Notes: [Date]

## Session Info

| Attribute | Value |
|-----------|-------|
| **Date** | [Date and time] |
| **Duration** | [X minutes] |
| **Facilitator** | [Name] |
| **Sprint Preparing For** | [Sprint number] |

### Attendees

- [x] [Name, Role]
- [x] [Name, Role]
- [x] [Name, Role]
- [ ] [Name, Role] *(absent)*

---

## Summary

**Stories Discussed:** [X]
**Stories Refined (Ready):** [X]
**Stories Needing More Work:** [X]
**Total Points Estimated:** [X]

---

## Stories Refined

### [STORY-XXX]: [Story Title]

| Attribute | Value |
|-----------|-------|
| **Points** | [X] |
| **Status** | Ready / Needs Work / Blocked |
| **Assignee** | [If known] |

**Discussion Notes:**
- [Key point discussed]
- [Key point discussed]

**Scope Changes:**
- [Any changes from original story]

**Acceptance Criteria Confirmed:**
- [x] [Criterion 1]
- [x] [Criterion 2]
- [ ] [Criterion needs clarification]

---

### [STORY-XXX]: [Story Title]

| Attribute | Value |
|-----------|-------|
| **Points** | [X] |
| **Status** | Ready / Needs Work / Blocked |
| **Assignee** | [If known] |

**Discussion Notes:**
- [Key point discussed]
- [Key point discussed]

**Scope Changes:**
- [Any changes from original story]

**Acceptance Criteria Confirmed:**
- [x] [Criterion 1]
- [x] [Criterion 2]

---

### [STORY-XXX]: [Story Title]

| Attribute | Value |
|-----------|-------|
| **Points** | [X] |
| **Status** | Ready / Needs Work / Blocked |
| **Assignee** | [If known] |

**Discussion Notes:**
- [Key point discussed]
- [Key point discussed]

**Scope Changes:**
- [Any changes from original story]

---

## Stories Summary Table

| Story | Title | Points | Status | Notes |
|-------|-------|--------|--------|-------|
| [STORY-XXX] | [Title] | [X] | Ready | [Brief note] |
| [STORY-XXX] | [Title] | [X] | Ready | [Brief note] |
| [STORY-XXX] | [Title] | — | Needs Work | [What's needed] |
| [STORY-XXX] | [Title] | — | Blocked | [Blocker] |

---

## Questions Raised

| Question | Raised By | Owner | Due Date | Status |
|----------|-----------|-------|----------|--------|
| [Question 1] | [Name] | [Name] | [Date] | Open |
| [Question 2] | [Name] | [Name] | [Date] | Open |
| [Question 3] | [Name] | [Name] | [Date] | Resolved |

### Question Details

**Q: [Question 1]**
- Context: [Why this came up]
- Impact: [What's blocked until answered]
- Notes: [Any partial answers or direction]

---

## Decisions Made

| Decision | Context | Made By |
|----------|---------|---------|
| [Decision 1] | [Why we decided this] | [Name/Team] |
| [Decision 2] | [Why we decided this] | [Name/Team] |

---

## Action Items

| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| [Action 1] | [Name] | [Date] | Not Started |
| [Action 2] | [Name] | [Date] | Not Started |
| [Action 3] | [Name] | [Date] | In Progress |

---

## Blocked Stories

| Story | Blocker | Owner | Expected Resolution |
|-------|---------|-------|---------------------|
| [STORY-XXX] | [What's blocking] | [Name] | [Date/unknown] |

---

## Parking Lot

<!-- Topics raised but deferred -->

- [Topic 1]: [Why deferred]
- [Topic 2]: [Why deferred]

---

## Next Session

**Date:** [Next refinement date]
**Stories to Prepare:**
- [STORY-XXX]: [Title]
- [STORY-XXX]: [Title]

**Preparation Needed:**
- [Who needs to do what before next session]

---

*Notes captured by [Name] on [Date].*

## Example Output

??? example "Refinement Notes: January 14, 2026"
    # Refinement Notes: January 14, 2026

    ## Session Info

    | Attribute | Value |
    |-----------|-------|
    | **Date** | January 14, 2026, 2:00 PM EST |
    | **Duration** | 45 minutes |
    | **Facilitator** | Maya Chen (Scrum Master) |
    | **Sprint Preparing For** | Sprint 15 (Jan 20 - Feb 2) |

    ### Attendees

    - [x] Alex Rivera, Engineering Lead
    - [x] Jordan Kim, Senior Engineer
    - [x] Sam Patel, Engineer
    - [x] Taylor Brooks, Product Manager
    - [x] Maya Chen, Scrum Master
    - [ ] Chris Wong, Engineer *(on PTO)*

    ---

    ## Summary

    **Stories Discussed:** 5
    **Stories Refined (Ready):** 3
    **Stories Needing More Work:** 1
    **Blocked Stories:** 1
    **Total Points Estimated:** 13

    ---

    ## Stories Refined

    ### USER-342: Add CSV Export to Reports Dashboard

    | Attribute | Value |
    |-----------|-------|
    | **Points** | 3 |
    | **Status** | Ready |
    | **Assignee** | Jordan |

    **Discussion Notes:**
    - Export should include all visible columns, respecting current filters
    - Max export size: 10,000 rows (show warning, not error, at limit)
    - File naming convention: `report-{report-name}-{date}.csv`
    - Team agreed to use existing CSV library (PapaParse) for consistency

    **Scope Changes:**
    - Originally included Excel export—moved to separate story for future sprint

    **Acceptance Criteria Confirmed:**
    - [x] Export button visible on reports dashboard
    - [x] CSV includes all visible columns with headers
    - [x] Current filters applied to export
    - [x] Large export shows warning but completes
    - [x] Filename follows naming convention

    ---

    ### USER-345: Implement Password Reset Rate Limiting

    | Attribute | Value |
    |-----------|-------|
    | **Points** | 5 |
    | **Status** | Ready |
    | **Assignee** | Sam |

    **Discussion Notes:**
    - Limit: 5 reset requests per email per hour
    - After limit hit: show generic "check your email" message (no indication of limiting for security)
    - Rate limit data stored in Redis with 1-hour TTL
    - Security team reviewed and approved approach

    **Scope Changes:**
    - None

    **Acceptance Criteria Confirmed:**
    - [x] Max 5 reset requests per email per hour
    - [x] User sees same message whether limited or not (security)
    - [x] Rate limit resets after 1 hour
    - [x] Admin dashboard shows rate limit events for monitoring

    ---

    ### USER-347: Profile Page Loading Performance

    | Attribute | Value |
    |-----------|-------|
    | **Points** | 5 |
    | **Status** | Ready |
    | **Assignee** | Alex |

    **Discussion Notes:**
    - Current load time: 3.2 seconds average
    - Target: Under 1 second for 90th percentile
    - Main issue: N+1 query for user's projects
    - Solution: Eager loading + pagination (show first 10 projects, load more on scroll)
    - Jordan suggested we add performance test to prevent regression

    **Scope Changes:**
    - Added acceptance criterion for performance test

    **Acceptance Criteria Confirmed:**
    - [x] Profile page loads in <1 second (p90)
    - [x] Initial load shows first 10 projects
    - [x] Additional projects load on scroll (infinite scroll)
    - [x] Performance test added to CI pipeline

    ---

    ### USER-348: User Settings Redesign

    | Attribute | Value |
    |-----------|-------|
    | **Points** | — |
    | **Status** | Needs Work |
    | **Assignee** | TBD |

    **Discussion Notes:**
    - Story is too large—team estimated 13+ points
    - Decision: Split into 3 smaller stories
      - USER-348a: Settings navigation restructure (3 pts)
      - USER-348b: Notification preferences panel (5 pts)
      - USER-348c: Privacy settings panel (3 pts)
    - Taylor will create the split stories with UX guidance

    **Scope Changes:**
    - Entire story being split

    **Acceptance Criteria Confirmed:**
    - [ ] Pending split into smaller stories

    ---

    ### USER-350: Dark Mode Toggle

    | Attribute | Value |
    |-----------|-------|
    | **Points** | — |
    | **Status** | Blocked |
    | **Assignee** | TBD |

    **Discussion Notes:**
    - Design team hasn't provided dark mode color palette yet
    - Can't estimate until we know scope of color changes
    - Some components may need redesign (charts, badges with colored backgrounds)

    **Blocker:**
    - Missing design specs—blocked on design team

    ---

    ## Stories Summary Table

    | Story | Title | Points | Status | Notes |
    |-------|-------|--------|--------|-------|
    | USER-342 | CSV Export for Reports | 3 | Ready | Excel export moved to future |
    | USER-345 | Password Reset Rate Limiting | 5 | Ready | Security team approved |
    | USER-347 | Profile Page Performance | 5 | Ready | Added perf test criterion |
    | USER-348 | User Settings Redesign | — | Needs Work | Splitting into 3 stories |
    | USER-350 | Dark Mode Toggle | — | Blocked | Waiting on design specs |

    ---

    ## Questions Raised

    | Question | Raised By | Owner | Due Date | Status |
    |----------|-----------|-------|----------|--------|
    | Should CSV export include hidden columns? | Jordan | Taylor | Jan 15 | Open |
    | What's the plan for internationalization of exported dates? | Sam | Taylor | Jan 15 | Open |
    | Can we get design specs for dark mode by Thursday? | Maya | Design Lead | Jan 16 | Open |

    ### Question Details

    **Q: Should CSV export include hidden columns?**
    - Context: Users can hide columns in the report view. Should hidden columns appear in export?
    - Impact: Minor—doesn't block story, but affects implementation detail
    - Notes: Taylor leaning toward "export matches what you see" but will confirm with customers

    **Q: What's the plan for internationalization of exported dates?**
    - Context: We have users in multiple locales. Dates in CSV might be ambiguous.
    - Impact: Could affect USER-342 scope
    - Notes: Options: ISO 8601 dates (unambiguous) or locale-specific with locale in filename

    ---

    ## Decisions Made

    | Decision | Context | Made By |
    |----------|---------|---------|
    | Use ISO 8601 dates for CSV exports | Locale-specific dates too confusing; ISO is unambiguous | Team consensus |
    | Split USER-348 into 3 stories | Original story too large (13+ points) | Team consensus |
    | Add performance test to USER-347 | Prevent regression after optimization | Jordan's suggestion, team agreed |

    ---

    ## Action Items

    | Action | Owner | Due Date | Status |
    |--------|-------|----------|--------|
    | Create split stories for USER-348 | Taylor | Jan 15 | Not Started |
    | Answer CSV hidden columns question | Taylor | Jan 15 | Not Started |
    | Follow up with design on dark mode specs | Maya | Jan 16 | Not Started |
    | Update USER-342 with ISO 8601 date decision | Jordan | Jan 14 | Not Started |

    ---

    ## Blocked Stories

    | Story | Blocker | Owner | Expected Resolution |
    |-------|---------|-------|---------------------|
    | USER-350 | Missing dark mode design specs | Design Lead | Jan 16 (Maya to follow up) |

    ---

    ## Parking Lot

    - **Mobile responsive settings:** Jordan raised that settings page isn't mobile-friendly. Agreed to create a separate story rather than expand USER-348 scope. Taylor to add to backlog.
    - **Export to Google Sheets:** Customer request came in during session. Taylor will assess priority and create story if warranted.

    ---

    ## Next Session

    **Date:** January 21, 2026, 2:00 PM EST
    **Stories to Prepare:**
    - USER-348a, 348b, 348c: Split settings stories (after Taylor creates them)
    - USER-350: Dark mode (if design specs received)
    - USER-352: Bulk user invite (Taylor to write story by Thursday)

    **Preparation Needed:**
    - Taylor: Create split stories for USER-348 by Thursday
    - Maya: Confirm design specs timeline for dark mode
    - Chris: Review notes and raise any concerns async (returning from PTO)

    ---

    *Notes captured by Maya Chen on January 14, 2026.*

## Quality Checklist

Before finalizing, verify:

- [ ] All discussed stories have outcomes recorded
- [ ] Open questions have owners assigned
- [ ] Decisions are captured with enough context
- [ ] Blocked stories are clearly flagged
- [ ] Notes are understandable to someone who wasn't there

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
