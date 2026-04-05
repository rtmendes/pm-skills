---
title: "deliver-release-notes"
description: "Creates user-facing release notes that communicate new features, improvements, and fixes in clear, benefit-focused language. Use when shipping updates to communicate changes to users, customers, or stakeholders."
tags:
  - Deliver
  - coordination
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Deliver | **Version:** 2.0.0 | **Category:** coordination | **License:** Apache-2.0

# Release Notes

Release notes communicate product changes to users in a way that highlights value and builds excitement. Unlike changelogs (which document what changed technically), release notes translate changes into user benefits. Good release notes help users discover new capabilities, understand improvements, and trust that issues are being addressed.

## When to Use

- Shipping product updates to customers
- Communicating changes to internal stakeholders
- Preparing app store update descriptions
- Writing customer-facing email announcements
- Documenting changes for support and sales teams

## How to Use

Use the `/release-notes` slash command:

```
/release-notes "Your context here"
```

Or reference the skill file directly: `skills/deliver-release-notes/SKILL.md`

## Instructions

When asked to create release notes, follow these steps:

1. **Gather the Changelog**
   Collect all changes included in this release: features, improvements, and bug fixes. Work from engineering changelogs, completed tickets, or pull request descriptions.

2. **Identify the Highlights**
   Select 1-3 changes that deserve top billing. These should be changes users will notice and care about most. Lead with the most impactful change.

3. **Translate to Benefits**
   Rewrite each change in terms of user value. Instead of "Added pagination to search results," write "Find what you need faster with improved search that handles large result sets." Focus on what users can now do or what's now better.

4. **Categorize Changes**
   Group remaining changes into clear categories: New Features, Improvements, and Bug Fixes. Within each category, order by impact (most valuable first).

5. **Write Scannable Descriptions**
   Each item should be 1-2 sentences. Lead with the benefit, optionally followed by the "how." Users scan release notes — make each line valuable.

6. **Acknowledge Known Issues**
   If there are known limitations or issues, be transparent. Users appreciate honesty, and it reduces support burden.

7. **Tease Coming Soon (Optional)**
   If appropriate, hint at what's coming next. This builds anticipation and shows momentum, but don't over-promise.

## Output Template

# [Product Name] [Version Number]

**Release Date:** [Month Day, Year]

## Highlights

<!-- 1-3 most impactful changes. These get the most prominent placement. -->

### [Highlight 1 Title]

[2-3 sentences describing what's new and why it matters to users. Focus on the benefit and how it improves their experience.]

### [Highlight 2 Title]

[2-3 sentences describing what's new and why it matters to users.]

---

## New Features

<!-- Features users couldn't do before. Lead with benefit. -->

- **[Feature Name]:** [Benefit-focused description of what users can now do]

- **[Feature Name]:** [Benefit-focused description of what users can now do]

## Improvements

<!-- Enhancements to existing features. Emphasize what's better. -->

- **[Improvement Area]:** [What's now better and how it helps users]

- **[Improvement Area]:** [What's now better and how it helps users]

- **[Improvement Area]:** [What's now better and how it helps users]

## Bug Fixes

<!-- Issues that were resolved. Mention the problem that's now fixed. -->

- Fixed an issue where [problem users experienced]

- Fixed an issue where [problem users experienced]

- Fixed an issue where [problem users experienced]

## Known Issues

<!-- Transparency about current limitations. Optional section. -->

- [Issue description and workaround if available]

---

## Coming Soon

<!-- Optional teaser for future releases. Don't over-promise. -->

We're working on [brief teaser of upcoming features]. Stay tuned for more updates.

---

## Feedback

Have thoughts on this release? [Feedback channel or contact method]

## Example Output

??? example "TaskFlow 3.4"
    # TaskFlow 3.4

    **Release Date:** January 14, 2026

    ## Highlights

    ### See Your Projects at a Glance with Gantt Charts

    Plan and track projects visually with our new Gantt chart view. See task dependencies, identify bottlenecks, and adjust timelines by simply dragging tasks on the timeline. Whether you're managing a product launch or a construction project, Gantt charts help you keep everything on track.

    ### Dark Mode for Late-Night Productivity

    Work comfortably in low-light environments with full dark mode support. Your eyes will thank you during those evening planning sessions. Toggle dark mode in Settings, or let it follow your system preferences automatically.

    ---

    ## New Features

    - **Export to PDF:** Share professional project reports with stakeholders who don't use TaskFlow. Export any project view — including Gantt charts — as a formatted PDF with your company logo.

    - **Keyboard Shortcuts:** Power users, rejoice. Navigate TaskFlow without touching your mouse. Press `?` anywhere to see the full shortcut list, or use `Cmd+K` (Mac) / `Ctrl+K` (Windows) to open the command palette.

    - **Recurring Task Templates:** Set up tasks that repeat on a schedule — daily standups, weekly reviews, monthly reports. Create once, and TaskFlow handles the rest.

    ## Improvements

    - **Faster Page Loads:** We've optimized how projects load, resulting in 40% faster page loads for large projects with 500+ tasks. Complex projects now feel snappy.

    - **Smarter Search:** Search now includes task comments and attachments, not just task titles. Find that discussion from last month without remembering which task it was on.

    - **Improved Mobile Navigation:** The bottom navigation bar now shows your most-used views first, based on your actual usage patterns. Get to what matters faster on mobile.

    - **Clearer Due Date Warnings:** Tasks due today show a yellow indicator; overdue tasks show red. No more missing deadlines because they blended into the background.

    ## Bug Fixes

    - Fixed an issue where calendar sync with Outlook 365 would occasionally fail for users with many calendars. All your meetings now sync reliably.

    - Fixed an issue where copying a task would not copy its attachments. Duplicated tasks now include all files.

    - Fixed an issue where notification emails would sometimes arrive hours late. Notifications now deliver within minutes.

    - Fixed an issue where the mobile app would crash when viewing projects with special characters in the name. International project names are now fully supported.

    - Fixed an issue where undoing a task deletion would not restore the task's comments. Undo now restores everything.

    ## Known Issues

    - Gantt chart export to PDF currently limits charts to 50 visible tasks. For larger projects, try filtering to a specific milestone before exporting. We're working on supporting larger exports.

    - Dark mode does not yet apply to email notifications. This is coming in a future update.

    ---

    ## Coming Soon

    We're putting the finishing touches on **AI-powered task suggestions** — TaskFlow will learn from your completed projects and suggest task breakdowns for new projects. Plus, **time tracking** is in beta testing and launching next month.

    ---

    ## Feedback

    Love the new Gantt charts? Have ideas for making TaskFlow even better? We'd love to hear from you at feedback@taskflow.app or in the #product-feedback channel in our community.

## Quality Checklist

Before finalizing, verify:

- [ ] Highlights feature the 1-3 most impactful changes
- [ ] Each item leads with user benefit, not technical description
- [ ] Language is jargon-free and accessible to all users
- [ ] Items are concise (1-2 sentences each)
- [ ] Bug fixes mention the problem that was solved
- [ ] Tone is positive and professional

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
