---
title: "measure-experiment-design"
description: "Designs an A/B test or experiment with clear hypothesis, variants, success metrics, sample size, and duration. Use when planning experiments to validate product changes or test hypotheses."
tags:
  - Measure
  - validation
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Measure | **Version:** 2.0.0 | **Category:** validation | **License:** Apache-2.0

# Experiment Design

An experiment design document defines all parameters needed to run a rigorous A/B test or controlled experiment. It ensures the team aligns on what you're testing, how you'll measure success, and how long to run the test before drawing conclusions. Good experiment design prevents common pitfalls: underpowered tests, unclear success criteria, and decisions based on noise rather than signal.

## When to Use

- Before launching an A/B test to validate a product change
- When testing a hypothesis that requires quantitative validation
- After solution design to validate assumptions before full rollout
- When stakeholders want data-driven evidence for a decision
- To establish a culture of experimentation and learning

## How to Use

Use the `/experiment-design` slash command:

```
/experiment-design "Your context here"
```

Or reference the skill file directly: `skills/measure-experiment-design/SKILL.md`

## Instructions

When asked to design an experiment, follow these steps:

1. **Articulate the Hypothesis**
   Write a clear, testable hypothesis in the format: "We believe [change] for [users] will [outcome] as measured by [metric]." One hypothesis per experiment — if you're testing multiple things, run multiple experiments.

2. **Define the Variants**
   Describe the control (current experience) and treatment (new experience) in sufficient detail. Include screenshots, mockups, or precise descriptions so anyone can understand what users will see.

3. **Choose Primary and Secondary Metrics**
   Select one primary metric that will determine success or failure. Add 2-3 secondary metrics to understand the broader impact. Include guardrail metrics to catch unintended negative effects.

4. **Calculate Sample Size**
   Determine how many users you need per variant to detect your minimum detectable effect (MDE) with statistical significance. Specify your significance level (typically 0.05) and power (typically 0.80).

5. **Estimate Duration**
   Based on sample size and available traffic, calculate how long the experiment needs to run. Account for weekly patterns — avoid ending mid-week if behavior varies by day.

6. **Define Targeting and Allocation**
   Specify which users are eligible for the experiment and how traffic is split between variants. Document any exclusions (e.g., employees, specific segments).

7. **Set Success Criteria**
   Define upfront what constitutes a win, a loss, or an inconclusive result. This prevents post-hoc rationalization and moving goalposts.

8. **Document Risks and Mitigations**
   Identify what could go wrong and how you'll detect/address it. Include monitoring plans and rollback criteria.

## Output Template

# Experiment Design: [Experiment Name]

## Overview

| Field | Value |
|-------|-------|
| **Experiment Name** | [Short descriptive name] |
| **Owner** | [Name, role] |
| **Start Date** | [Planned start date] |
| **End Date** | [Planned end date] |
| **Status** | Draft / Ready / Running / Completed |

## Hypothesis

<!-- Format: We believe [change] for [users] will [outcome] as measured by [metric] -->

**We believe** [proposed change]

**for** [target user segment]

**will** [expected outcome]

**as measured by** [primary metric]

## Background

<!-- Why are we running this experiment? What's the context? -->

[Context explaining why this experiment matters and what led to the hypothesis]

## Variants

### Control (A)

**Description:** [What users currently experience]

**Details:**
- [Specific element 1]
- [Specific element 2]

**Screenshot/Mockup:** [Link or embed]

### Treatment (B)

**Description:** [What users will experience in the new variant]

**Details:**
- [Specific change 1]
- [Specific change 2]

**Screenshot/Mockup:** [Link or embed]

## Metrics

### Primary Metric

| Metric | Definition | Current Baseline | Minimum Detectable Effect |
|--------|------------|------------------|---------------------------|
| [Metric name] | [How it's calculated] | [Current value] | [Smallest change we want to detect] |

### Secondary Metrics

| Metric | Definition | Purpose |
|--------|------------|---------|
| [Metric 1] | [Definition] | [Why we're tracking this] |
| [Metric 2] | [Definition] | [Why we're tracking this] |

### Guardrail Metrics

<!-- Metrics that should NOT decrease -->

| Metric | Definition | Threshold |
|--------|------------|-----------|
| [Metric 1] | [Definition] | [Must not decrease by more than X%] |
| [Metric 2] | [Definition] | [Must not decrease by more than X%] |

## Sample Size & Duration

### Sample Size Calculation

| Parameter | Value |
|-----------|-------|
| **Baseline conversion rate** | [X%] |
| **Minimum detectable effect (MDE)** | [X% relative / X pp absolute] |
| **Statistical significance (alpha)** | [0.05 typical] |
| **Statistical power (1-beta)** | [0.80 typical] |
| **Users per variant** | [Calculated number] |
| **Total users needed** | [Sum across variants] |

### Duration Estimate

| Parameter | Value |
|-----------|-------|
| **Daily eligible traffic** | [X users/day] |
| **Traffic allocation** | [X% to experiment] |
| **Users per day in experiment** | [Calculated] |
| **Minimum duration** | [X days to reach sample size] |
| **Recommended duration** | [X days, accounting for weekly patterns] |

## Audience Targeting

### Inclusion Criteria

- [Criterion 1: e.g., "All logged-in users"]
- [Criterion 2: e.g., "Users in US and Canada"]
- [Criterion 3: e.g., "Users on mobile web"]

### Exclusion Criteria

- [Exclusion 1: e.g., "Employees and internal testers"]
- [Exclusion 2: e.g., "Users in active experiments that may conflict"]

### Traffic Allocation

| Variant | Allocation |
|---------|------------|
| Control (A) | [X%] |
| Treatment (B) | [X%] |

## Success Criteria

<!-- Define BEFORE the experiment starts what each outcome means -->

### Win (Ship Treatment)

[Conditions that constitute a clear win for the treatment, e.g., "Primary metric improves by >= MDE with p < 0.05, and no guardrail metrics regress beyond threshold"]

### Loss (Keep Control)

[Conditions that indicate treatment is worse, e.g., "Primary metric decreases with p < 0.05, OR any guardrail metric regresses beyond threshold"]

### Inconclusive (More Data Needed)

[Conditions that require further investigation, e.g., "Primary metric change is not statistically significant after full duration"]

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [How we'll address it] |
| [Risk 2] | High/Med/Low | High/Med/Low | [How we'll address it] |

### Monitoring Plan

- [What we'll monitor during the experiment]
- [Alert thresholds that would trigger early review]
- [Rollback criteria]

## Implementation Notes

<!-- Technical details for engineering -->

- [Feature flag name/ID]
- [Instrumentation requirements]
- [Any technical considerations]

## References

- [Link to related hypothesis document]
- [Link to design mockups]
- [Link to previous related experiments]

## Example Output

??? example "Experiment Design: One-Page Checkout"
    # Experiment Design: One-Page Checkout

    ## Overview

    | Field | Value |
    |-------|-------|
    | **Experiment Name** | checkout-single-page-v1 |
    | **Owner** | Maria Santos, Product Manager |
    | **Start Date** | January 20, 2026 |
    | **End Date** | February 3, 2026 |
    | **Status** | Ready |

    ## Hypothesis

    **We believe** replacing our 3-step checkout with a single-page checkout

    **for** mobile web users

    **will** increase checkout completion rate

    **as measured by** checkout conversion rate (orders / checkout starts)

    ## Background

    Mobile checkout abandonment is at 73%, compared to 45% on desktop. User research identified friction points: confusion navigating between steps, anxiety about hidden costs appearing late in the flow, and form field frustration on small screens. A single-page checkout addresses these by showing all information upfront and reducing navigation.

    Competitor analysis shows that Amazon, Shopify stores, and Apple use single-page or minimal-step checkouts. Our hypothesis is that reducing cognitive load and providing visibility into the full process will improve conversion.

    ## Variants

    ### Control (A)

    **Description:** Current 3-step checkout flow

    **Details:**
    - Step 1: Shipping address entry
    - Step 2: Shipping method selection + payment information
    - Step 3: Order review and confirmation
    - Each step loads a new page
    - Progress indicator shows current step

    **Screenshot/Mockup:** [designs/checkout-control-v3.png]

    ### Treatment (B)

    **Description:** Single-page checkout with accordion sections

    **Details:**
    - All sections visible on one page (shipping, payment, review)
    - Accordion UI: one section expanded at a time, others collapsed but visible
    - Express payment buttons (Apple Pay, Google Pay) at top
    - Shipping cost shown immediately based on cart
    - Edit any section without losing data

    **Screenshot/Mockup:** [designs/checkout-treatment-v2.png]

    ## Metrics

    ### Primary Metric

    | Metric | Definition | Current Baseline | Minimum Detectable Effect |
    |--------|------------|------------------|---------------------------|
    | Checkout conversion rate | Orders completed / Checkout sessions started | 27% | 5% relative (1.35 pp absolute) |

    ### Secondary Metrics

    | Metric | Definition | Purpose |
    |--------|------------|---------|
    | Checkout completion time | Median seconds from checkout start to order | Confirm UX improvement |
    | Express payment usage | % of orders via Apple Pay / Google Pay | Track new feature adoption |
    | Cart abandonment rate | Carts abandoned before checkout start | Ensure we're not shifting drop-off |

    ### Guardrail Metrics

    | Metric | Definition | Threshold |
    |--------|------------|-----------|
    | Average order value | Total revenue / Orders | Must not decrease by more than 2% |
    | Payment failure rate | Failed payments / Payment attempts | Must not increase by more than 1pp |
    | Support tickets (checkout) | CS tickets tagged "checkout" | Must not increase by more than 20% |

    ## Sample Size & Duration

    ### Sample Size Calculation

    | Parameter | Value |
    |-----------|-------|
    | **Baseline conversion rate** | 27% |
    | **Minimum detectable effect (MDE)** | 5% relative (28.35% target) |
    | **Statistical significance (alpha)** | 0.05 (one-tailed) |
    | **Statistical power (1-beta)** | 0.80 |
    | **Users per variant** | 9,800 |
    | **Total users needed** | 19,600 |

    Calculation performed using Evan Miller's sample size calculator, assuming one-tailed test (we only ship if treatment is better).

    ### Duration Estimate

    | Parameter | Value |
    |-----------|-------|
    | **Daily eligible traffic** | 18,000 mobile checkout sessions/day |
    | **Traffic allocation** | 80% to experiment (20% holdout for safety) |
    | **Users per day in experiment** | 14,400 |
    | **Minimum duration** | 2 days to reach sample size |
    | **Recommended duration** | 14 days to capture weekly patterns and ensure stability |

    We're running for 14 days despite reaching sample size in 2 days to:
    - Capture full weekly shopping patterns (weekday vs. weekend)
    - Allow time to detect delayed effects on returns/chargebacks
    - Ensure novelty effect wears off

    ## Audience Targeting

    ### Inclusion Criteria

    - Logged-in or guest users
    - Mobile web (not native apps — app experiment runs separately)
    - Users in US and Canada (payment methods configured)
    - Cart value >= $10 (exclude micro-purchases)

    ### Exclusion Criteria

    - Employees (identified by email domain)
    - Users enrolled in conflicting experiments (cart-upsell-test, payment-method-test)
    - Users who have participated in checkout experiments in past 30 days

    ### Traffic Allocation

    | Variant | Allocation |
    |---------|------------|
    | Control (A) | 50% |
    | Treatment (B) | 50% |

    ## Success Criteria

    ### Win (Ship Treatment)

    Primary metric (checkout conversion) improves by >= 5% relative with p < 0.05, AND:
    - Average order value does not decrease by more than 2%
    - Payment failure rate does not increase by more than 1pp
    - No critical bugs or UX issues identified

    **Action:** Roll out to 100% of mobile web, begin desktop adaptation.

    ### Loss (Keep Control)

    Any of:
    - Checkout conversion decreases with p < 0.05
    - Any guardrail metric breaches threshold
    - Critical UX issues discovered affecting > 1% of users

    **Action:** Revert to control, analyze learnings, iterate on design.

    ### Inconclusive (More Data Needed)

    Primary metric change is between -5% and +5% relative and not statistically significant after 14 days.

    **Action:** Extend experiment to 21 days if traffic allows. If still inconclusive, treat as neutral and decide based on qualitative factors (user feedback, operational simplicity).

    ## Risks & Mitigations

    | Risk | Likelihood | Impact | Mitigation |
    |------|------------|--------|------------|
    | Apple Pay integration issues | Medium | High | Test extensively in staging; 5% initial ramp with monitoring |
    | Page load performance degradation | Low | Medium | Performance budget enforced; lazy-load payment forms |
    | Users confused by accordion UX | Low | Medium | Added progress indicators and clear "Continue" buttons |
    | Increased payment failures | Low | High | Same payment provider; monitor failure rate hourly |

    ### Monitoring Plan

    - **Real-time dashboard:** Checkout funnel by variant, updated every 5 minutes
    - **Alert thresholds:**
      - Payment failure rate > 5% in any 1-hour window
      - Checkout conversion drops > 20% relative to control
      - Error rate > 1% on any checkout action
    - **Rollback criteria:** Any alert sustained for 30 minutes triggers automatic rollback
    - **Daily check-ins:** Team reviews metrics at 10am daily for first 5 days

    ## Implementation Notes

    - Feature flag: `checkout_single_page_v1` in LaunchDarkly
    - Instrumentation: New events `checkout_section_opened`, `checkout_section_completed` for funnel analysis
    - Cache invalidation: Clear checkout page cache at experiment start
    - Mobile detection: User-Agent parsing; tablet = desktop experience

    ## References

    - Hypothesis Document: Mobile Checkout Improvement (internal doc link)
    - Design Mockups (Figma link)
    - Previous Experiment: Guest Checkout (results/guest-checkout-q3-2025.md) — 3% lift, informed this design
    - User Research: Checkout Friction Study (research PDF)

## Quality Checklist

Before finalizing, verify:

- [ ] Hypothesis is falsifiable and specific
- [ ] Only one primary metric is defined
- [ ] Sample size calculation is documented with assumptions
- [ ] Duration accounts for traffic patterns and statistical requirements
- [ ] Success criteria are defined before the experiment starts
- [ ] Guardrail metrics protect against unintended harm

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
