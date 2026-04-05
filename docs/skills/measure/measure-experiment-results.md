---
title: "measure-experiment-results"
description: "Documents the results of a completed experiment or A/B test with statistical analysis, learnings, and recommendations. Use after experiments conclude to communicate findings, inform decisions, and build organizational knowledge."
tags:
  - Measure
  - reflection
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Measure | **Version:** 2.0.0 | **Category:** reflection | **License:** Apache-2.0

# Experiment Results

An experiment results document captures what happened when you tested a hypothesis, including statistical outcomes, segment analysis, learnings, and clear recommendations. Good results documentation turns individual experiments into organizational knowledge that improves future decision-making.

## When to Use

- After an A/B test or experiment reaches statistical significance
- When an experiment is ended early (for any reason)
- To communicate findings to stakeholders who weren't involved
- During decision-making about whether to ship, iterate, or kill a feature
- To build a repository of learnings that inform future experiments

## How to Use

Use the `/experiment-results` slash command:

```
/experiment-results "Your context here"
```

Or reference the skill file directly: `skills/measure-experiment-results/SKILL.md`

## Instructions

When asked to document experiment results, follow these steps:

1. **Summarize the Experiment**
   Provide context: what was tested, when it ran, how much traffic it received. Link to the original experiment design document if one exists.

2. **Restate the Hypothesis**
   Remind readers what you believed would happen and why. This frames the results interpretation.

3. **Present Primary Results**
   Show the primary metric outcome clearly: what were the values for control and treatment? Include statistical significance (p-value), confidence intervals, and sample sizes. Be honest about whether results are conclusive.

4. **Analyze Secondary Metrics**
   Present guardrail metrics that ensure you didn't cause unintended harm. Note any secondary metrics that moved unexpectedly—both positive and negative.

5. **Segment the Data**
   Look for differential effects across user segments (platform, tenure, plan type, etc.). Sometimes overall results mask important segment-level insights.

6. **Extract Learnings**
   What did you learn beyond the numbers? Include surprising findings, questions raised, and implications for the product hypothesis. Negative results are valuable learnings.

7. **Make a Recommendation**
   Be clear: should we ship, iterate, or kill? Support the recommendation with the evidence. If the decision is nuanced, explain the trade-offs.

8. **Define Next Steps**
   Specify what happens now—engineering work to ship, follow-up experiments, metrics to continue monitoring, or documentation to update.

## Output Template

# Experiment Results: [Experiment Name]

## Summary

| Attribute | Value |
|-----------|-------|
| **Experiment ID** | [ID] |
| **Experiment Name** | [Name] |
| **Status** | Completed / Ended Early / Inconclusive |
| **Duration** | [Start date] to [End date] ([X] days) |
| **Traffic Allocation** | [X]% control / [Y]% treatment |
| **Total Sample Size** | [N] users |
| **Owner** | [Name] |
| **Design Doc** | [Link to experiment design] |

---

## Hypothesis Recap

**Original Hypothesis:**

> We believed that [change/treatment] would [expected outcome] because [rationale].

**Success Criteria:**

- Primary metric: [Metric] improves by [X]%
- Statistical significance: p < 0.05
- Minimum sample size: [N]

---

## Results

### Primary Metric: [Metric Name]

| Variant | Value | Sample Size | Confidence Interval |
|---------|-------|-------------|---------------------|
| Control | [X.XX%] | [N] | [Lower] - [Upper] |
| Treatment | [X.XX%] | [N] | [Lower] - [Upper] |

**Observed Difference:** [+/-X.XX%] ([Relative change]%)

**Statistical Significance:**
- p-value: [X.XXX]
- Confidence level: [XX]%
- Statistically significant: [Yes/No]

**Interpretation:**

[Plain language explanation of what these numbers mean]

---

### Secondary Metrics

| Metric | Control | Treatment | Difference | Significant? |
|--------|---------|-----------|------------|--------------|
| [Metric 1] | [Value] | [Value] | [+/-X%] | [Yes/No] |
| [Metric 2] | [Value] | [Value] | [+/-X%] | [Yes/No] |
| [Metric 3] | [Value] | [Value] | [+/-X%] | [Yes/No] |

### Guardrail Metrics

<!-- Metrics that should NOT degrade -->

| Metric | Control | Treatment | Threshold | Status |
|--------|---------|-----------|-----------|--------|
| [Metric 1] | [Value] | [Value] | No degradation > [X]% | Pass/Fail |
| [Metric 2] | [Value] | [Value] | No degradation > [X]% | Pass/Fail |

---

## Segment Analysis

### By [Segment Dimension 1]

| Segment | Control | Treatment | Difference | Significant? |
|---------|---------|-----------|------------|--------------|
| [Segment A] | [Value] | [Value] | [+/-X%] | [Yes/No] |
| [Segment B] | [Value] | [Value] | [+/-X%] | [Yes/No] |
| [Segment C] | [Value] | [Value] | [+/-X%] | [Yes/No] |

### By [Segment Dimension 2]

| Segment | Control | Treatment | Difference | Significant? |
|---------|---------|-----------|------------|--------------|
| [Segment A] | [Value] | [Value] | [+/-X%] | [Yes/No] |
| [Segment B] | [Value] | [Value] | [+/-X%] | [Yes/No] |

### Segment Insights

[Notable findings from segment analysis - where did treatment work better/worse?]

---

## Visualization

<!-- Include charts if available -->

### Primary Metric Over Time

[Link to chart or describe trend]

### Conversion Funnel Impact

[Link to chart or describe impact on funnel]

---

## Learnings

### What We Learned

1. **[Learning 1]**
   [Description and evidence]

2. **[Learning 2]**
   [Description and evidence]

3. **[Learning 3]**
   [Description and evidence]

### Surprising Findings

- [Unexpected result 1]
- [Unexpected result 2]

### What We Still Don't Know

- [Open question 1]
- [Open question 2]

---

## Recommendation

### Decision: [Ship / Iterate / Kill]

**Rationale:**

[Clear explanation of why this is the recommendation]

### If Shipping

- [ ] [Engineering task 1]
- [ ] [Engineering task 2]
- [ ] [Documentation update]
- [ ] [Metrics to continue monitoring]

### If Iterating

- **What to change:** [Changes based on learnings]
- **Next experiment:** [Brief description]
- **Timeline:** [When to run]

### If Killing

- **Why:** [Clear explanation]
- **Learnings to preserve:** [What we take forward]
- **Alternative approaches:** [What else might work]

---

## Next Steps

| Action | Owner | Due Date |
|--------|-------|----------|
| [Action 1] | [Name] | [Date] |
| [Action 2] | [Name] | [Date] |
| [Action 3] | [Name] | [Date] |

---

## Appendix

### Raw Data

[Link to data/dashboard]

### Statistical Methodology

- Test type: [Chi-squared / t-test / etc.]
- Power calculation: [Details]
- Multiple comparison correction: [If applicable]

### Known Issues

- [Any data quality issues or caveats]

---

*Results documented on [date]. Decision implemented on [date].*

## Example Output

??? example "Experiment Results: One-Page Checkout vs. Multi-Step Checkout"
    # Experiment Results: One-Page Checkout vs. Multi-Step Checkout

    ## Summary

    | Attribute | Value |
    |-----------|-------|
    | **Experiment ID** | EXP-2026-001 |
    | **Experiment Name** | One-Page Checkout |
    | **Status** | Completed |
    | **Duration** | December 15, 2025 to January 10, 2026 (26 days) |
    | **Traffic Allocation** | 50% control / 50% treatment |
    | **Total Sample Size** | 47,832 users (23,891 control, 23,941 treatment) |
    | **Owner** | Sarah Martinez, Product Manager |
    | **Design Doc** | EXP-2026-001 Design (internal link) |

    ---

    ## Hypothesis Recap

    **Original Hypothesis:**

    > We believed that consolidating our 3-step checkout into a single page with accordion sections would increase checkout conversion rate because reducing perceived complexity and eliminating page loads would reduce drop-off at each step.

    **Success Criteria:**

    - Primary metric: Checkout conversion rate improves by at least 3%
    - Statistical significance: p < 0.05 (two-tailed)
    - Minimum sample size: 20,000 users per variant

    ---

    ## Results

    ### Primary Metric: Checkout Conversion Rate

    | Variant | Value | Sample Size | Confidence Interval (95%) |
    |---------|-------|-------------|---------------------------|
    | Control (3-step) | 62.4% | 23,891 | 61.8% - 63.0% |
    | Treatment (1-page) | 65.6% | 23,941 | 65.0% - 66.2% |

    **Observed Difference:** +3.2 percentage points (+5.1% relative improvement)

    **Statistical Significance:**
    - p-value: 0.0003
    - Confidence level: 95%
    - Statistically significant: **Yes**

    **Interpretation:**

    The one-page checkout significantly outperformed the 3-step checkout. We can be 95% confident that the true improvement is between 1.8% and 4.6% (absolute). The result exceeds our 3% threshold for success.

    ---

    ### Secondary Metrics

    | Metric | Control | Treatment | Difference | Significant? |
    |--------|---------|-----------|------------|--------------|
    | Cart-to-checkout start | 78.2% | 79.1% | +0.9% | No (p=0.12) |
    | Average order value | $87.42 | $86.91 | -0.6% | No (p=0.34) |
    | Items per order | 2.31 | 2.28 | -1.3% | No (p=0.22) |
    | Time in checkout | 4.2 min | 3.1 min | -26.2% | Yes (p<0.001) |
    | Payment errors | 2.1% | 1.8% | -14.3% | Yes (p=0.03) |

    ### Guardrail Metrics

    | Metric | Control | Treatment | Threshold | Status |
    |--------|---------|-----------|-----------|--------|
    | Return rate (7-day) | 8.2% | 8.4% | No increase > 1% | **Pass** |
    | Customer support tickets | 0.9% | 0.7% | No increase > 0.5% | **Pass** |
    | Payment failure rate | 3.4% | 3.2% | No increase > 0.5% | **Pass** |

    ---

    ## Segment Analysis

    ### By Device Type

    | Segment | Control | Treatment | Difference | Significant? |
    |---------|---------|-----------|------------|--------------|
    | Desktop | 68.3% | 69.5% | +1.2% | No (p=0.18) |
    | Mobile | 54.2% | 59.3% | +5.1% | **Yes** (p<0.001) |
    | Tablet | 61.7% | 64.1% | +2.4% | No (p=0.09) |

    ### By Customer Type

    | Segment | Control | Treatment | Difference | Significant? |
    |---------|---------|-----------|------------|--------------|
    | New customers | 51.8% | 57.2% | +5.4% | **Yes** (p<0.001) |
    | Returning customers | 71.3% | 72.1% | +0.8% | No (p=0.28) |

    ### By Cart Value

    | Segment | Control | Treatment | Difference | Significant? |
    |---------|---------|-----------|------------|--------------|
    | < $50 | 65.4% | 68.9% | +3.5% | **Yes** (p=0.008) |
    | $50-$100 | 62.1% | 65.2% | +3.1% | **Yes** (p=0.02) |
    | > $100 | 58.7% | 61.4% | +2.7% | No (p=0.07) |

    ### Segment Insights

    The treatment effect was **strongest on mobile devices** (+5.1% vs +1.2% desktop) and for **new customers** (+5.4% vs +0.8% returning). This makes sense: new customers benefit most from reduced cognitive load, and mobile users benefit most from fewer page loads and scrolling.

    Returning customers showed minimal improvement, likely because they've already learned the existing checkout flow.

    ---

    ## Visualization

    ### Conversion Rate Over Time

    The treatment consistently outperformed control throughout the experiment period. No significant interaction with time was observed (e.g., novelty effect wearing off).

    ```
    Conversion Rate by Day
           70% |
               |    ████████████████████████  (Treatment)
           65% |████████████████████████████
               |
           60% |████████████████████████████  (Control)
               |
           55% |________________________________
                  Dec 15                Jan 10
    ```

    ### Funnel Drop-off Comparison

    | Step | Control Drop-off | Treatment Drop-off | Improvement |
    |------|------------------|-------------------|-------------|
    | Cart → Checkout | 21.8% | 20.9% | +0.9% |
    | Shipping info | 8.4% | N/A (combined) | — |
    | Payment info | 5.2% | N/A (combined) | — |
    | Review → Purchase | 4.1% | 3.5% | +0.6% |
    | **Total checkout drop** | 37.6% | 34.4% | **+3.2%** |

    ---

    ## Learnings

    ### What We Learned

    1. **Reducing page loads matters more than expected**
       The 26% reduction in checkout time suggests page load latency was a bigger friction point than the form complexity itself. Users were abandoning during transitions between steps.

    2. **Mobile optimization is high-leverage**
       Mobile users saw 4x the improvement of desktop users. Our multi-step checkout was particularly problematic on smaller screens with more scrolling and tapping between pages.

    3. **New user experience is critical**
       New customers showed 5.4% improvement vs 0.8% for returning customers. First-time checkout experience has outsized impact on conversion; returning customers have already overcome the learning curve.

    4. **Form length matters less than perceived progress**
       The one-page design actually shows MORE fields at once, but the accordion UI creates a sense of progress and control. Perception matters more than raw field count.

    ### Surprising Findings

    - **Payment errors decreased by 14%:** We didn't expect this. Hypothesis: single-page reduces context-switching errors where users forget information between steps.
    - **No impact on AOV or items per order:** We worried that faster checkout might mean less consideration, leading to smaller orders. This didn't materialize.

    ### What We Still Don't Know

    - Will the mobile improvement persist on different device types (older phones, low-bandwidth connections)?
    - Is there a specific accordion section that causes the most friction? (We didn't instrument that level of detail)
    - How does this interact with guest checkout vs. account checkout?

    ---

    ## Recommendation

    ### Decision: Ship to 100%

    **Rationale:**

    The experiment delivered a clear, statistically significant improvement that exceeded our success threshold. The +3.2% lift in checkout conversion represents approximately $840K in additional annual revenue at current traffic levels. No guardrail metrics were violated, and the improvement was consistent across the experiment duration.

    The segment analysis reveals even higher impact on mobile and new customers—our strategic growth priorities.

    ### Shipping Plan

    - [ ] Merge feature branch to main (Eng: Chen, by Jan 17)
    - [ ] Update checkout analytics events for new flow (Eng: Chen, by Jan 17)
    - [ ] Remove experiment infrastructure and flags (Eng: Chen, by Jan 20)
    - [ ] Update help center documentation (Support: Lisa, by Jan 22)
    - [ ] Communicate change to CS team (PM: Sarah, by Jan 17)
    - [ ] Monitor conversion rate daily for 2 weeks post-launch (PM: Sarah, ongoing)

    ### Metrics to Continue Monitoring

    - Checkout conversion rate (daily for 2 weeks, then weekly)
    - Mobile vs. desktop conversion gap
    - Payment error rate
    - Customer support ticket volume related to checkout

    ---

    ## Next Steps

    | Action | Owner | Due Date |
    |--------|-------|----------|
    | Ship to 100% traffic | Chen (Eng) | Jan 17 |
    | Update analytics events | Chen (Eng) | Jan 17 |
    | Remove experiment flags | Chen (Eng) | Jan 20 |
    | Update help documentation | Lisa (Support) | Jan 22 |
    | Post-launch monitoring report | Sarah (PM) | Jan 31 |
    | Plan follow-up: guest checkout optimization | Sarah (PM) | Feb 1 |

    ---

    ## Appendix

    ### Raw Data

    - Experiment Dashboard (Looker link)
    - Raw data export (CSV link)
    - Statistical analysis notebook (analysis link)

    ### Statistical Methodology

    - **Test type:** Two-proportion z-test for primary metric
    - **Multiple comparison correction:** Benjamini-Hochberg for segment analysis
    - **Power calculation:** 80% power to detect 3% lift at α=0.05 required 18,500 per variant
    - **Sequential analysis:** Not used; experiment ran to planned end date

    ### Known Issues

    - **Dec 24-26 excluded:** Holiday traffic anomaly removed from analysis (both variants affected equally)
    - **Bot traffic:** Standard bot filters applied; no unusual activity detected
    - **One variant had 0.2% more iOS traffic:** Not statistically significant; analysis not adjusted

    ---

    *Results documented on January 14, 2026. Full rollout completed January 20, 2026.*

## Quality Checklist

Before finalizing, verify:

- [ ] Statistical methods and significance are clearly stated
- [ ] Confidence intervals are included (not just p-values)
- [ ] Segment analysis checked for differential effects
- [ ] Secondary/guardrail metrics are reported
- [ ] Learnings go beyond just the numbers
- [ ] Recommendation is clear and actionable
- [ ] Negative or inconclusive results are reported honestly

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
