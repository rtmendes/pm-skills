---
title: "define-hypothesis"
description: "Defines a testable hypothesis with clear success metrics and validation approach. Use when forming assumptions to test, designing experiments, or aligning team on what success looks like."
tags:
  - Define
  - ideation
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Define | **Version:** 2.0.0 | **Category:** ideation | **License:** Apache-2.0

# Hypothesis

A hypothesis is a testable prediction about how a change will affect user behavior or business outcomes. It transforms assumptions into explicit statements that can be validated or invalidated through experimentation. Well-formed hypotheses prevent teams from building features based on untested beliefs and create shared understanding of what success looks like.

## When to Use

- After problem framing, before committing to a solution
- When designing experiments or A/B tests
- When team members have differing assumptions about user behavior
- Before investing significant engineering resources in a feature
- When pivoting direction and need to validate the new approach

## How to Use

Use the `/hypothesis` slash command:

```
/hypothesis "Your context here"
```

Or reference the skill file directly: `skills/define-hypothesis/SKILL.md`

## Instructions

When asked to create a hypothesis, follow these steps:

1. **State the Belief**
   Articulate what you believe will happen. Use the structured format: "We believe that [action/change] for [target user] will [expected outcome]." Be specific about the intervention — vague hypotheses can't be tested.

2. **Identify the Target User**
   Define who this hypothesis applies to. A hypothesis about "users" is too broad. Specify the segment: new users in their first week, power users with 10+ sessions, churned users returning, etc.

3. **Define the Expected Outcome**
   What behavior change or result do you expect? Frame it in terms of user actions (complete onboarding, make a purchase, return within 7 days) rather than internal metrics when possible.

4. **Set Success Metrics**
   Choose a primary metric that directly measures the expected outcome. Include secondary metrics that provide context and guardrail metrics that ensure you're not causing harm elsewhere.

5. **Describe Validation Approach**
   How will you test this hypothesis? A/B test, user interviews, prototype testing, cohort analysis? Be specific about sample size, duration, and statistical requirements.

6. **Document Risks and Assumptions**
   What could invalidate this hypothesis beyond the test results? What are you assuming to be true that you haven't validated?

## Output Template

# Hypothesis: [Brief Title]

## Hypothesis Statement

**We believe that** [specific action or change]

**for** [target user segment]

**will** [expected outcome/behavior change]

**as measured by** [primary success metric]

## Background & Rationale

### Problem Context
<!-- What problem is this hypothesis attempting to solve? Link to problem statement if available. -->

[Problem context]

### Supporting Evidence
<!-- What data, research, or observations led to this hypothesis? -->

[Evidence that supports this belief]

### Alternative Hypotheses Considered
<!-- What other explanations or approaches did you consider? -->

[Alternative approaches]

## Target User Segment

### Definition
<!-- Specific criteria that define this user segment -->

[User segment definition]

### Segment Size
<!-- How many users fall into this segment? -->

[Estimated count or percentage]

### Current Behavior
<!-- How do these users currently behave? What's the baseline? -->

[Current state]

## Success Metrics

### Primary Metric
<!-- The main metric that determines if the hypothesis is validated -->

| Metric | Current Baseline | Target | Minimum Detectable Effect |
|--------|-----------------|--------|--------------------------|
| [Metric name] | [Current value] | [Target value] | [MDE %] |

### Secondary Metrics
<!-- Additional metrics that provide context -->

| Metric | Current Baseline | Expected Direction |
|--------|-----------------|-------------------|
| [Metric 1] | [Value] | [Increase/Decrease/No change] |
| [Metric 2] | [Value] | [Increase/Decrease/No change] |

### Guardrail Metrics
<!-- Metrics that should NOT be negatively impacted -->

| Metric | Current Value | Acceptable Range |
|--------|--------------|------------------|
| [Metric 1] | [Value] | [Range] |

## Validation Approach

### Method
<!-- How will you test this hypothesis? A/B test, prototype, interviews, etc. -->

[Validation method]

### Sample Size & Duration
<!-- Statistical requirements for the test -->

- Sample size: [Number per variant]
- Duration: [Time period]
- Traffic allocation: [Percentage]

### Pass/Fail Criteria
<!-- What results will validate or invalidate the hypothesis? -->

- **Validated if:** [Specific criteria]
- **Invalidated if:** [Specific criteria]
- **Inconclusive if:** [Specific criteria]

## Risks & Assumptions

### Key Assumptions
<!-- What are you assuming to be true? -->

- [Assumption 1]
- [Assumption 2]

### Risks
<!-- What could go wrong? What might invalidate results? -->

- [Risk 1]
- [Risk 2]

## Timeline

| Phase | Dates | Duration |
|-------|-------|----------|
| Setup & instrumentation | [Dates] | [Duration] |
| Test running | [Dates] | [Duration] |
| Analysis | [Dates] | [Duration] |
| Decision | [Date] | — |

## Example Output

??? example "Hypothesis: Simplified Onboarding Flow"
    # Hypothesis: Simplified Onboarding Flow

    ## Hypothesis Statement

    **We believe that** reducing the onboarding flow from 7 steps to 3 essential steps

    **for** new users signing up for a free trial

    **will** increase onboarding completion rate

    **as measured by** percentage of users who complete all onboarding steps within their first session

    ## Background & Rationale

    ### Problem Context

    Our SaaS product has a 34% onboarding completion rate — meaning 66% of new signups never finish setup and experience the core value proposition. User research indicates the current 7-step onboarding feels overwhelming, with significant drop-off occurring at steps 4 and 5 (team invitation and integration setup). Users who don't complete onboarding are 4x more likely to churn within 14 days.

    ### Supporting Evidence

    - Session recordings show users hesitating and abandoning at the team invitation step
    - Support tickets frequently ask "Can I skip some of these steps?"
    - Competitor analysis shows market leaders use 3-4 step onboarding flows
    - Exit survey data: 42% of churned users cite "too complicated to get started"
    - Hotjar heatmaps show users scrolling to find a "skip" button that doesn't exist

    ### Alternative Hypotheses Considered

    - **Progress indicators:** Adding a progress bar might reduce anxiety without changing steps — rejected because underlying issue is step count, not visibility
    - **Tooltips/guidance:** More help content might reduce confusion — rejected because it adds more cognitive load
    - **Optional steps:** Making steps skippable might work — considered as fallback if simplification fails

    ## Target User Segment

    ### Definition

    New users who:
    - Sign up for a free trial (not paid conversion from trial)
    - Are the first user from their organization (not invited team members)
    - Access the product via web (not mobile app)

    ### Segment Size

    - 12,400 new trial signups per month meeting these criteria
    - 8,200 (66%) currently fail to complete onboarding

    ### Current Behavior

    - Average time to complete current onboarding: 18 minutes
    - Step 1-3 completion: 78%
    - Step 4 (team invitation) completion: 52%
    - Step 5 (integration) completion: 41%
    - Full completion (all 7 steps): 34%
    - Users who complete onboarding activate core feature within 24h: 89%

    ## Success Metrics

    ### Primary Metric

    | Metric | Current Baseline | Target | Minimum Detectable Effect |
    |--------|-----------------|--------|--------------------------|
    | Onboarding completion rate | 34% | 50% | 10% relative lift |

    ### Secondary Metrics

    | Metric | Current Baseline | Expected Direction |
    |--------|-----------------|-------------------|
    | Time to complete onboarding | 18 min | Decrease to <8 min |
    | Day-1 core feature activation | 30% | Increase |
    | Support tickets (first 24h) | 8.2% of users | Decrease |
    | User satisfaction (post-onboarding) | 3.2/5 | Increase |

    ### Guardrail Metrics

    | Metric | Current Value | Acceptable Range |
    |--------|--------------|------------------|
    | 14-day trial-to-paid conversion | 12% | No decrease >5% relative |
    | Team invitation rate (within 7 days) | 23% | No decrease >10% relative |
    | Integration connection rate (within 7 days) | 31% | No decrease >10% relative |

    ## Validation Approach

    ### Method

    A/B test with 50/50 traffic split between:
    - **Control:** Current 7-step onboarding flow
    - **Treatment:** New 3-step onboarding (account basics, workspace setup, first task creation)

    Deferred steps (team invitation, integrations) will be prompted via in-app messaging after initial activation.

    ### Sample Size & Duration

    - Sample size: 3,000 users per variant (6,000 total)
    - Duration: 14 days of enrollment + 7 days observation window
    - Traffic allocation: 50% control / 50% treatment
    - Statistical significance: 95% confidence level
    - Statistical power: 80%

    ### Pass/Fail Criteria

    - **Validated if:** Onboarding completion increases by ≥10% relative (34% → 37.4%+) with 95% confidence AND guardrail metrics stay within acceptable range
    - **Invalidated if:** Onboarding completion shows no significant change or decreases, OR guardrail metrics breach acceptable range
    - **Inconclusive if:** Results don't reach statistical significance within test window — extend test or increase sample

    ## Risks & Assumptions

    ### Key Assumptions

    - Users who complete a shorter onboarding will still discover team/integration features later
    - The 3 essential steps are sufficient to demonstrate core product value
    - In-app prompts can effectively drive deferred actions
    - Onboarding completion is a leading indicator of retention (not just correlated)

    ### Risks

    - **Feature discovery risk:** Users might never set up teams/integrations if not prompted during onboarding
    - **Segment spillover:** Results might not generalize to invited users or mobile signups
    - **Novelty effect:** Initial lift might fade as users become accustomed to flow
    - **Selection bias:** Users who would have completed 7-step flow might be different from marginal completers

    ## Timeline

    | Phase | Dates | Duration |
    |-------|-------|----------|
    | Setup & instrumentation | Jan 15-17, 2026 | 3 days |
    | Test running | Jan 18-31, 2026 | 14 days |
    | Observation window | Feb 1-7, 2026 | 7 days |
    | Analysis | Feb 8-10, 2026 | 3 days |
    | Decision | Feb 11, 2026 | — |

## Quality Checklist

Before finalizing, verify:

- [ ] Hypothesis is falsifiable (possible to prove wrong)
- [ ] Success metric has a specific numeric target
- [ ] Target user segment is clearly defined
- [ ] Validation approach is practical and time-bound
- [ ] Pass/fail criteria are unambiguous
- [ ] Hypothesis doesn't assume the solution works

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
