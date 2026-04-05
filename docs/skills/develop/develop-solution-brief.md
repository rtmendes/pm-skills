---
title: "develop-solution-brief"
description: "Creates a concise one-page solution overview that communicates the proposed approach, key decisions, and trade-offs. Use when pitching solutions to stakeholders, aligning teams on approach, or documenting solution intent before detailed specification."
tags:
  - Develop
  - ideation
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Develop | **Version:** 2.0.0 | **Category:** ideation | **License:** Apache-2.0

# Solution Brief

A solution brief is a concise, one-page document that communicates the proposed solution to a problem. It serves as the bridge between problem understanding and detailed specification, providing enough context for stakeholders to align on the approach without getting lost in implementation details. The one-page constraint forces clarity and prioritization.

## When to Use

- Pitching a solution approach to stakeholders for buy-in
- Aligning cross-functional teams on what you're building and why
- Documenting solution intent before detailed PRD writing
- Comparing multiple solution options at a high level
- Communicating product direction to leadership

## How to Use

Use the `/solution-brief` slash command:

```
/solution-brief "Your context here"
```

Or reference the skill file directly: `skills/develop-solution-brief/SKILL.md`

## Instructions

When asked to create a solution brief, follow these steps:

1. **Recap the Problem**
   Summarize the problem in 2-3 sentences maximum. Don't re-explain the full problem statement — reference it if needed. The reader should immediately understand what pain point this solution addresses.

2. **Describe the Proposed Solution**
   Explain what you're building in clear, non-technical language. Focus on the user experience and core value proposition. Avoid implementation details — this is about *what*, not *how*.

3. **List Key Features**
   Identify 3-5 essential features that comprise the solution. These should be the minimum set needed to solve the problem. Resist the urge to include nice-to-haves — the one-page constraint demands focus.

4. **Define Success Metrics**
   Connect the solution to measurable outcomes. How will you know if this works? Reference metrics from the problem statement and set targets.

5. **Acknowledge Trade-offs**
   Document what you're explicitly NOT doing and why. Good solution briefs are honest about scope limitations and alternatives that were considered but rejected.

6. **Identify Risks and Mitigations**
   Surface the biggest risks to success and your plan to address them. This builds stakeholder confidence and surfaces concerns early.

7. **Outline Next Steps**
   Provide 3-5 immediate actions to move the solution forward. Be specific about who does what.

## Output Template

# Solution Brief: [Solution Title]

## Problem Recap
<!-- 2-3 sentences maximum. Reference the problem statement for details. -->

[Concise summary of the problem being solved]

## Proposed Solution
<!-- Clear description of what you're building. Focus on user experience, not implementation. -->

[Solution description in plain language]

## Key Features

<!-- 3-5 essential features. These are the minimum set needed to solve the problem. -->

1. **[Feature Name]:** [One-sentence description of what it does and why it matters]

2. **[Feature Name]:** [One-sentence description of what it does and why it matters]

3. **[Feature Name]:** [One-sentence description of what it does and why it matters]

4. **[Feature Name]:** [One-sentence description of what it does and why it matters]

5. **[Feature Name]:** [One-sentence description of what it does and why it matters]

## Success Metrics

| Metric | Current | Target | Timeline |
|--------|---------|--------|----------|
| [Primary metric] | [Baseline] | [Goal] | [By when] |
| [Secondary metric] | [Baseline] | [Goal] | [By when] |

## Trade-offs Considered

<!-- What are you explicitly NOT doing? What alternatives were rejected? -->

| What We're Not Doing | Why |
|---------------------|-----|
| [Scope exclusion 1] | [Rationale] |
| [Scope exclusion 2] | [Rationale] |
| [Alternative rejected] | [Why not chosen] |

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [How we'll address it] |
| [Risk 2] | High/Med/Low | High/Med/Low | [How we'll address it] |

## Next Steps

<!-- 3-5 immediate actions. Be specific about who does what. -->

1. [Action] — [Owner], [Timeline]
2. [Action] — [Owner], [Timeline]
3. [Action] — [Owner], [Timeline]

## Example Output

??? example "Solution Brief: Streamlined Mobile Checkout"
    # Solution Brief: Streamlined Mobile Checkout

    ## Problem Recap

    Mobile shoppers abandon checkout at a 73% rate, significantly higher than desktop's 45%. Users cite confusing multi-step flows, small form fields, and unexpected shipping costs as primary frustrations. This represents a $177M annual revenue opportunity.

    ## Proposed Solution

    We will redesign mobile checkout as a single-page experience with progressive disclosure. Instead of navigating through multiple screens, shoppers will complete their purchase on one streamlined page that expands sections as needed. The design prioritizes large touch targets, saved payment methods, and upfront shipping transparency.

    ## Key Features

    1. **Single-Page Checkout:** All checkout steps visible on one page with accordion sections that expand/collapse. Users always see their progress and can edit any section without losing data.

    2. **Express Payment Options:** Apple Pay, Google Pay, and PayPal one-tap buttons prominently displayed at top. Returning customers can checkout in under 30 seconds.

    3. **Upfront Shipping Calculator:** Shipping costs displayed based on cart contents before checkout begins. No surprise costs at the final step.

    4. **Smart Form Fields:** Large, mobile-optimized input fields with auto-formatting (phone, credit card). Address autocomplete via Google Places API reduces typing by 70%.

    5. **Guest Checkout Persistence:** Cart and partially-entered information saved for 7 days, allowing users to return and complete purchase without starting over.

    ## Success Metrics

    | Metric | Current | Target | Timeline |
    |--------|---------|--------|----------|
    | Mobile checkout abandonment | 73% | 60% | Q1 2026 |
    | Mobile checkout completion time | 4.2 min | 2.0 min | Q1 2026 |
    | Express payment adoption | 0% | 25% | Q2 2026 |

    ## Trade-offs Considered

    | What We're Not Doing | Why |
    |---------------------|-----|
    | Removing guest checkout | Legal requirement in EU markets; also helps first-time buyers |
    | Cross-sell/upsell in checkout | User research shows this adds friction; moving to cart instead |
    | Custom payment form design | Payment provider contract limits changes until March |
    | Cryptocurrency payment | Low demand (<1% of requests); complexity not justified |

    ## Risks & Mitigations

    | Risk | Likelihood | Impact | Mitigation |
    |------|------------|--------|------------|
    | Apple Pay integration delays | Medium | High | Parallel-path with card-only fallback; engage Apple early |
    | Page load performance on single-page | Medium | Medium | Lazy-load sections; aggressive image optimization |
    | User confusion with accordion UX | Low | Medium | A/B test against step-based alternative; quick iteration |

    ## Next Steps

    1. Finalize UI mockups and get stakeholder approval — Design Lead, Jan 20
    2. Scope technical requirements with engineering — PM + Tech Lead, Jan 22
    3. Begin Apple Pay sandbox integration — iOS Engineer, Jan 25
    4. Plan A/B test framework and success criteria — PM + Data, Jan 27
    5. Draft user communication for checkout change — Marketing, Feb 1

## Quality Checklist

Before finalizing, verify:

- [ ] Brief fits on one page when printed (approximately 500-700 words)
- [ ] Problem recap is concise (2-3 sentences maximum)
- [ ] Solution description avoids technical jargon
- [ ] Features are limited to 3-5 essential capabilities
- [ ] Trade-offs are explicitly stated
- [ ] Next steps are specific and actionable

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
