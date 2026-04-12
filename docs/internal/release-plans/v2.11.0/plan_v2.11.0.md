# v2.11.0 Release Plan — Meeting Skills

Status: Planning
Owner: Maintainers
Type: Feature release (minor)

## Release Theme

**Meeting intelligence** — new domain skills for meeting preparation and
post-meeting synthesis, forming a complementary pair that bookends the
meeting lifecycle.

---

## Context

v2.10.0 expanded the utility skill set with mermaid diagrams, slideshow
creation, and the self-updater. v2.11.0 adds domain skills for the
meeting lifecycle — one of the highest-frequency PM workflows.

F-17 and F-18 share a meeting type taxonomy and are designed as a natural
pair: prep defines objectives, synthesis verifies they were met.

### Prerequisites

- [ ] v2.10.0 tagged and pushed

---

## Efforts

| ID | Name | Type | Effort Brief | Status |
|----|------|------|-------------|--------|
| **F-17** | [Meeting Synthesis](../../efforts/F-17-meeting-synthesis.md) | Feature | [brief](../../efforts/F-17-meeting-synthesis.md) | Backlog |
| **F-18** | [Meeting Prep](../../efforts/F-18-meeting-prep.md) | Feature | [brief](../../efforts/F-18-meeting-prep.md) | Backlog |
| **M-22** | [MCP Decoupling](../../efforts/M-22-mcp-decoupling.md) | Infrastructure | [brief](../../efforts/M-22-mcp-decoupling.md), [plan](../../efforts/M-22-mcp-decoupling/plan_mcp-decoupling.md) | Backlog |

---

## Decisions

| Decision | Answer | Rationale |
|----------|--------|-----------|
| **Version** | **v2.11.0** (minor) | New user-facing skills = new capability. |
| **F-17 classification** | `discover` (phase skill) | Parallels interview-synthesis — extracts structured insights from conversations. |
| **F-18 classification** | `develop` (phase skill) | Preparing to communicate and align fits the develop phase. |
| **Shared taxonomy** | F-17 and F-18 share a meeting type taxonomy | Consistent language across prep and synthesis (standup, planning, review, decision, brainstorm, 1:1). |
| **Skill count after** | **34 skills** | Current 32 (after v2.10.0) + F-17 + F-18. |
| **MCP decoupling** | **Freeze pm-skills-mcp, remove from release gating** | MCP server has no active users. Stop maintaining it in lockstep. Revisit when team adoption creates demand. See M-22. |
| **Additional efforts** | **TBD** | Candidates from backlog: F-20 (slideshow-themer), F-21 (content-voice), F-14 (workflow builder). |

---

## Deliverables

### F-17: discover-meeting-synthesis

| File | Description | Status |
|------|------------|--------|
| `skills/discover-meeting-synthesis/SKILL.md` | Meeting synthesis skill with type taxonomy, extraction workflow | Not started |
| `skills/discover-meeting-synthesis/references/TEMPLATE.md` | Structured synthesis output template | Not started |
| `skills/discover-meeting-synthesis/references/EXAMPLE.md` | Worked example (planning meeting synthesis) | Not started |
| `commands/meeting-synthesis.md` | Slash command | Not started |

### F-18: develop-meeting-prep

| File | Description | Status |
|------|------------|--------|
| `skills/develop-meeting-prep/SKILL.md` | Meeting prep skill with anti-meeting check, agenda design | Not started |
| `skills/develop-meeting-prep/references/TEMPLATE.md` | Structured prep output template | Not started |
| `skills/develop-meeting-prep/references/EXAMPLE.md` | Worked example (decision meeting prep) | Not started |
| `commands/meeting-prep.md` | Slash command | Not started |

### Cross-cutting updates

| File | What Changes |
|------|-------------|
| `AGENTS.md` | Add 2 new skill entries |
| `README.md` | Skill count 32→34, phase skill count increment, skill table entries |
| `docs/getting-started.md` + `index.md` | Skill/command counts |
| `QUICKSTART.md` + `docs/getting-started/quickstart.md` | Skill/command counts |
| `mkdocs.yml` | Nav entries for new skills |
| `docs/reference/commands.md` | 2 new command rows + count |
| `docs/reference/ecosystem.md` | Command count |
| `docs/reference/project-structure.md` | Command count |
| `docs/guides/mcp-setup.md` + `mcp-integration.md` | Skill tool counts |
| `docs/skills/index.md` | Skill count |
| `AGENTS/claude/CONTEXT.md` | Count updates |

### Release artifacts

| File | Description |
|------|------------|
| `CHANGELOG.md` | v2.11.0 entry |
| `docs/releases/Release_v2.11.0.md` | Release notes |
| `docs/releases/index.md` | Add v2.11.0 row |
| `skills-manifest.yaml` | New skills with versions |

---

## CI That Applies

| Workflow | Checks | Notes |
|----------|--------|-------|
| `lint-skills-frontmatter` | Frontmatter for 2 new skills | Must pass |
| `validate-commands` | 2 new command files reference valid skills | Must pass |
| `validate-agents-md` | AGENTS.md includes new entries | Must pass |
| `validate-version-consistency` | plugin.json == marketplace.json | Must pass |
| `check-count-consistency` | Skill/command counts updated across docs | Advisory |
| `check-mcp-impact` | Advisory — 2 new MCP tools needed | Advisory |
| `validate-script-docs` | No new scripts expected | Must pass |

---

## MCP Impact

| Question | Answer |
|----------|--------|
| New MCP tools needed? | **No** — MCP is being decoupled from pm-skills release cycle (M-22). |
| Separate MCP release required? | **No** — pm-skills-mcp is frozen until team adoption creates demand. |
| MCP decoupling effort | **M-22** — freeze MCP repo, remove from release gating, archive alignment steps. See [effort brief](../../efforts/M-22-mcp-decoupling.md). |

---

## Open Questions

1. **Workflow opportunity** — Should F-17 + F-18 ship with a `meeting-lifecycle` workflow (prep → [meeting happens] → synthesis)? Or defer workflows to a later release?
2. **Krisp MCP integration** — F-17 mentions optional Krisp transcript input. Should the skill reference the Krisp MCP tool explicitly, or keep it generic?
3. **Additional efforts** — Should F-20 (slideshow-themer) or other backlog items be pulled into v2.11.0?
4. **MCP revival criteria** — M-22 freezes the MCP server. What conditions would trigger unfreezing? (e.g., 3+ team users, non-Claude-Code tool adoption, enterprise demand)
