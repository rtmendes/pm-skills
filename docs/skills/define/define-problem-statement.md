---
title: "define-problem-statement"
description: "Creates a clear problem framing document with user impact, business context, and success criteria. Use when starting a new initiative, realigning a drifted project, or communicating up to leadership."
tags:
  - Define
  - problem-framing
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Define | **Version:** 2.0.0 | **Category:** problem-framing | **License:** Apache-2.0

# Problem Statement

A problem statement is a concise document that frames the problem you're solving, articulates the impact on users and the business, and defines clear success criteria. It serves as the foundation for all subsequent product work by ensuring alignment on *what* problem to solve before jumping to *how* to solve it.

## When to Use

- Starting a new initiative or project to establish shared understanding
- Realigning a drifted project back to its original intent
- Communicating up to leadership or stakeholders about priorities
- Evaluating whether a proposed solution actually addresses the core problem
- Onboarding new team members to provide context

## How to Use

Use the `/problem-statement` slash command:

```
/problem-statement "Your context here"
```

Or reference the skill file directly: `skills/define-problem-statement/SKILL.md`

## Instructions

When asked to create a problem statement, follow these steps:

1. **Identify the User Segment**
   Ask who is experiencing this problem. Get specific about the user persona, role, or segment. Avoid vague descriptions like "users" — instead target "mobile shoppers completing checkout" or "enterprise admins managing 50+ users."

2. **Understand the Pain Points**
   Explore what friction, frustration, or unmet need the user experiences. Ask probing questions to understand the severity and frequency of the problem. Look for evidence from user research, support tickets, or behavioral data.

3. **Establish Business Context**
   Connect the user problem to business impact. How does this problem affect revenue, retention, growth, or strategic goals? Why should the organization invest in solving this now versus later?

4. **Define Success Metrics**
   Identify how you will measure success. What metrics will move if this problem is solved? Establish current baselines and target improvements. Be specific and time-bound.

5. **Surface Constraints and Considerations**
   Note any technical limitations, resource constraints, regulatory requirements, or dependencies that will shape the solution space.

6. **Capture Open Questions**
   Document what you don't know yet. What assumptions need validation? What additional research is needed?

## Output Template

# Problem Statement: [Problem Title]

## Problem Summary
<!-- 2-3 sentences that capture the essence of the problem. Should be understandable by anyone in the organization. -->

[Describe the problem in clear, jargon-free language. Focus on the user's experience and the gap between current state and desired state.]

## User Impact

### Who is affected?
<!-- Specific user segment, persona, or role -->

[User segment description]

### How are they affected?
<!-- Describe the friction, frustration, or unmet need -->

[Pain point description]

### Scale of impact
<!-- How many users? How often does this occur? -->

[Quantify the reach and frequency]

## Business Context

### Strategic Alignment
<!-- How does this connect to company goals, OKRs, or strategy? -->

[Connection to business priorities]

### Business Impact
<!-- Revenue, retention, growth, cost implications -->

[Quantified business impact]

### Why Now?
<!-- What makes this urgent or timely? -->

[Timing rationale]

## Success Criteria

| Metric | Current Baseline | Target | Timeline |
|--------|-----------------|--------|----------|
| [Primary metric] | [Current value] | [Target value] | [By when] |
| [Secondary metric] | [Current value] | [Target value] | [By when] |
| [Guardrail metric] | [Current value] | [Maintain] | [Ongoing] |

## Constraints & Considerations

<!-- Technical limitations, resource constraints, regulatory requirements, dependencies -->

- [Constraint 1]
- [Constraint 2]
- [Consideration 1]

## Open Questions

<!-- What don't we know yet? What assumptions need validation? -->

- [ ] [Question 1]
- [ ] [Question 2]
- [ ] [Question 3]

## Example Output

??? example "Problem Statement: Mobile Checkout Abandonment"
    # Problem Statement: Mobile Checkout Abandonment

    ## Problem Summary

    Mobile shoppers on our e-commerce platform abandon their carts at checkout at significantly higher rates than desktop users. Despite having items in their cart and reaching the checkout page, 73% of mobile users leave without completing their purchase, representing a substantial revenue opportunity and a frustrating experience for customers who intended to buy.

    ## User Impact

    ### Who is affected?

    Mobile shoppers who add items to their cart and initiate checkout. This segment represents 62% of our total traffic and skews toward younger demographics (18-34) who prefer shopping on their phones.

    ### How are they affected?

    Users report frustration with:
    - Small form fields that are difficult to complete on mobile keyboards
    - Having to re-enter payment information each session
    - Confusion about shipping costs that appear late in the flow
    - Slow page loads between checkout steps causing timeouts
    - Difficulty applying promo codes on the mobile interface

    ### Scale of impact

    - 2.3 million mobile checkout sessions per month
    - 73% abandonment rate (vs. 45% on desktop)
    - Approximately 1.68 million abandoned checkouts monthly
    - Average cart value of abandoned sessions: $67

    ## Business Context

    ### Strategic Alignment

    Mobile-first commerce is a key pillar of our 2026 strategy. The executive team has committed to achieving mobile revenue parity with desktop by Q4. Reducing mobile checkout friction directly supports OKR 2.1: "Increase mobile conversion rate by 25%."

    ### Business Impact

    - Potential monthly revenue recovery: $14.8M (assuming 20% of abandoned carts convert)
    - Estimated annual impact: $177M revenue opportunity
    - Secondary impact: Higher mobile conversion improves CAC payback for mobile ad spend
    - Customer lifetime value: Mobile-acquired customers have 23% higher repeat purchase rate

    ### Why Now?

    - Q4 holiday season approaching with 40% of annual mobile traffic
    - Competitor launched one-tap checkout in September, creating pressure
    - New payment provider integration enables Apple Pay/Google Pay
    - Mobile traffic growing 8% MoM while desktop is flat

    ## Success Criteria

    | Metric | Current Baseline | Target | Timeline |
    |--------|-----------------|--------|----------|
    | Mobile checkout abandonment rate | 73% | 60% | Q1 2026 |
    | Mobile conversion rate | 1.8% | 2.3% | Q1 2026 |
    | Checkout completion time (mobile) | 4.2 min | 2.5 min | Q1 2026 |
    | Mobile revenue as % of total | 38% | 45% | Q2 2026 |
    | Customer satisfaction (checkout NPS) | 32 | 50 | Q1 2026 |

    ## Constraints & Considerations

    - Payment provider contract limits changes to payment form UI until March
    - Must maintain PCI compliance for any checkout modifications
    - iOS and Android apps share checkout webview — changes affect both platforms
    - Engineering capacity: 2 engineers available, 6-week runway before feature freeze
    - Cannot remove guest checkout option (legal requirement in EU markets)
    - Must preserve existing promo code functionality for marketing campaigns

    ## Open Questions

    - [ ] What percentage of abandoners return later on desktop to complete purchase?
    - [ ] Are there specific points in the checkout flow where drop-off spikes?
    - [ ] How do abandonment rates vary by product category or cart value?
    - [ ] What do competitors' mobile checkout flows look like?
    - [ ] Would users prefer saved payment methods vs. digital wallet integration?
    - [ ] Is shipping cost surprise a larger factor than form friction?

## Quality Checklist

Before finalizing, verify:

- [ ] Problem is specific to a defined user segment (not "all users")
- [ ] Impact is quantified with data or reasonable estimates
- [ ] Success metrics have baselines and targets
- [ ] Problem describes the "what" without prescribing the "how"
- [ ] Business context explains why this matters now
- [ ] Open questions are captured for follow-up

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
