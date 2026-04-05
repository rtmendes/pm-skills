---
title: "develop-adr"
description: "Creates an Architecture Decision Record following the Nygard format to document significant technical decisions, their context, and consequences. Use when making technical choices that affect system architecture, technology selection, or development patterns."
tags:
  - Develop
  - specification
---

# <!-- PM-Skills | https://github.com/product-on-purpose/pm-skills | Apache 2.0 -->

!!! info "Quick facts"
    **Phase:** Develop | **Version:** 2.0.0 | **Category:** specification | **License:** Apache-2.0

# Architecture Decision Record (ADR)

An Architecture Decision Record documents a significant technical decision along with its context and consequences. ADRs capture the "why" behind architectural choices so future team members understand the reasoning — especially important when they question why something was done a particular way. This skill follows Michael Nygard's lightweight ADR format.

## When to Use

- Making significant technical decisions that affect system architecture
- Choosing between technology options (frameworks, databases, services)
- Establishing patterns that future development should follow
- Documenting the rationale for constraints or non-obvious approaches
- Preserving institutional knowledge about past decisions

## How to Use

Use the `/adr` slash command:

```
/adr "Your context here"
```

Or reference the skill file directly: `skills/develop-adr/SKILL.md`

## Instructions

When asked to create an ADR, follow these steps:

1. **Assign a Number and Title**
   ADRs are numbered sequentially (ADR-001, ADR-002, etc.) for easy reference. The title should be a short noun phrase describing the decision, like "Use PostgreSQL for order data" or "Adopt React for frontend."

2. **Set the Status**
   New ADRs start as "Proposed." After team review, they become "Accepted," "Deprecated," or "Superseded by ADR-XXX." Status changes should be tracked.

3. **Describe the Context**
   Explain the circumstances that led to this decision. What problem are you solving? What forces are at play (technical constraints, team expertise, timeline, cost)? This section should help a reader who wasn't there understand why this decision was needed.

4. **State the Decision**
   Clearly articulate what you decided. Use active voice: "We will use..." rather than "It was decided..." Be specific about what is and isn't included in the decision.

5. **Document the Consequences**
   List the outcomes of this decision — positive, negative, and neutral. Good ADRs are honest about trade-offs. What becomes easier? What becomes harder? What new constraints or options does this create?

## Output Template

# ADR-[NNN]: [Decision Title]

## Status

[Proposed | Accepted | Deprecated | Superseded by ADR-XXX]

**Date:** [YYYY-MM-DD]
**Deciders:** [List of people involved in the decision]

## Context

<!--
What is the issue that we're seeing that is motivating this decision or change?
What forces are at play (technical, business, organizational)?
Include relevant constraints, team expertise, timeline pressures, etc.
-->

[Describe the context and problem statement]

## Decision

<!--
What is the change that we're proposing and/or doing?
Use active voice: "We will..." not "It was decided..."
Be specific about what is included and excluded.
-->

[State the decision clearly]

## Consequences

<!--
What becomes easier or more difficult to do because of this change?
Include both positive and negative consequences.
Be honest about trade-offs.
-->

### Positive

- [Positive consequence 1]
- [Positive consequence 2]
- [Positive consequence 3]

### Negative

- [Negative consequence 1]
- [Negative consequence 2]

### Neutral

- [Neutral observation or implication]

## Alternatives Considered

<!-- Optional but recommended: document other options that were evaluated -->

### [Alternative 1]

[Brief description and why it was not chosen]

### [Alternative 2]

[Brief description and why it was not chosen]

## References

<!-- Links to supporting documents, research, or related ADRs -->

- [Related ADR or document]
- [Research or spike summary]
- [External reference]

## Example Output

??? example "ADR-007: Use PostgreSQL for Order Data"
    # ADR-007: Use PostgreSQL for Order Data

    ## Status

    Accepted

    **Date:** 2026-01-14
    **Deciders:** Chen Wei (Tech Lead), Sarah Park (Architect), Marcus Johnson (DBA)

    ## Context

    We are building a new order processing service to replace our legacy monolith's order management module. This service will handle approximately 50,000 orders per day initially, with projected growth to 500,000 orders per day within two years.

    The order data has the following characteristics:
    - Strong consistency requirements (cannot lose or duplicate orders)
    - Complex relationships (orders, line items, shipping addresses, payment records)
    - Need for ACID transactions during order creation and updates
    - Regulatory requirement to maintain complete audit history
    - Reporting queries against order data by business analysts

    Our team has experience with PostgreSQL, MongoDB, and DynamoDB. The company already runs PostgreSQL in production for other services, with established backup and monitoring infrastructure.

    Timeline pressure exists: we need to launch the new service within 4 months to meet a deprecation deadline for the legacy system.

    ## Decision

    We will use PostgreSQL as the primary database for the order processing service.

    Specifically:
    - PostgreSQL 16 on AWS RDS with Multi-AZ deployment
    - Read replicas for reporting workloads to avoid impacting transactional performance
    - Use of native JSON columns for flexible order metadata while keeping core fields relational
    - Connection pooling via PgBouncer

    ## Consequences

    ### Positive

    - **ACID compliance:** PostgreSQL guarantees the transaction consistency we require for financial data. Order creation spanning multiple tables will either fully succeed or fully rollback.

    - **Team expertise:** Three of our four backend engineers have significant PostgreSQL experience. No ramp-up time required, reducing project risk.

    - **Operational maturity:** We leverage existing PostgreSQL infrastructure, monitoring (Datadog), and backup procedures. Our DBA team is already trained.

    - **Rich query capability:** Complex reporting queries are straightforward with SQL joins. Business analysts can use existing BI tools without learning new query languages.

    - **Schema evolution:** PostgreSQL's migration tooling (we use Flyway) provides controlled schema evolution with rollback capability.

    ### Negative

    - **Horizontal scaling limits:** PostgreSQL scales vertically well but horizontal sharding is complex. If we exceed 500K orders/day significantly, we may need to revisit this decision.

    - **Schema rigidity:** Schema changes require migrations and potentially downtime for large tables. Adding new order attributes requires more planning than a document store.

    - **Cost at scale:** RDS PostgreSQL is more expensive than DynamoDB for high-throughput simple lookups. At 500K orders/day, we estimate $3,200/month vs. $1,800/month for DynamoDB.

    ### Neutral

    - We will need to implement our own soft-delete and audit logging (PostgreSQL doesn't provide this natively like some enterprise databases).

    - Read replica lag (typically <1 second) means reporting data may be slightly behind real-time.

    ## Alternatives Considered

    ### MongoDB

    MongoDB's document model would provide more flexibility for evolving order schemas. However, our need for strong consistency in a distributed write scenario made MongoDB less attractive. The eventual consistency model, while configurable, adds complexity. Additionally, none of our current engineers have production MongoDB experience.

    ### DynamoDB

    DynamoDB would excel at high-throughput single-item lookups and offers seamless horizontal scaling. We rejected it because:
    - Complex queries (e.g., "all orders for customer X in date range Y with status Z") require secondary indexes or full scans
    - No native join capability means denormalizing data or making multiple queries
    - The team would need to learn a new query paradigm and data modeling approach
    - Cost advantage only materializes at scales we may not reach

    ### CockroachDB

    CockroachDB offers PostgreSQL compatibility with built-in horizontal scaling. We considered it for future-proofing but rejected it due to:
    - Less operational experience in our organization
    - Higher complexity for a team our size
    - The PostgreSQL-compatible mode has some limitations that could surprise us

    ## References

    - Spike Summary: Database Options for Order Service (/spikes/order-db/summary.md)
    - PostgreSQL 16 Release Notes (https://www.postgresql.org/docs/16/release-16.html)
    - ADR-003: Use AWS RDS for managed databases (establishes RDS as our database platform)
    - Order Service Capacity Planning Document (/docs/order-service/capacity-planning.md)

## Quality Checklist

Before finalizing, verify:

- [ ] Title is a short, descriptive noun phrase
- [ ] Status is clearly indicated (Proposed/Accepted/Deprecated/Superseded)
- [ ] Context explains why this decision was needed
- [ ] Decision is stated clearly in active voice
- [ ] Consequences include both positive and negative outcomes
- [ ] ADR can stand alone without requiring other documents

## Output Format

Use the template in `references/TEMPLATE.md` to structure the output.
