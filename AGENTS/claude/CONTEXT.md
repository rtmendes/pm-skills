# Project Context

## Current State

**Status:** v2.3.0 shipped — MCP sync guardrail is blocking-by-default
**Last Updated:** 2026-02-14
**Release:** [v2.3.0](https://github.com/product-on-purpose/pm-skills/releases/tag/v2.3.0)
**Next Step:** Execute awesome-list PR submissions while preparing v2.4.0 contract-lock work (`B-03`/`B-04`)

## Project Overview

PM-Skills is an open source collection of Product Management skills for AI agents. Skills are reusable instruction sets that help AI assistants produce high-quality PM artifacts—PRDs, problem statements, user stories, experiment designs, and more.

**V1 Scope:** Complete Triple Diamond framework coverage (24 skills across 6 phases) ✅

## Key Files

- `README.md` — Comprehensive project overview with badges, skills inventory, quick start guides
- `CHANGELOG.md` — Version history (Keep a Changelog format)
- `LICENSE` — Apache 2.0 license
- `CONTRIBUTING.md` — Contribution guidelines with curated model
- `(internal-notes)/VISION.md` — Detailed vision document with full roadmap
- `(internal-notes)/v1-plan/plan-v1.md` — Implementation plan with 35 issues

## Architecture (v2.0+ Flat Structure)

```
pm-skills/
├── skills/               # PM skills — FLAT structure (v2.0+)
│   ├── define-hypothesis/
│   ├── define-problem-statement/
│   ├── deliver-prd/
│   ├── deliver-user-stories/
│   └── ...               # 24 skills total: {phase}-{skill}/
├── bundles/              # Workflow bundles (triple-diamond, lean-startup, feature-kickoff)
├── commands/             # Claude Code slash commands (25 total)
├── docs/                 # Documentation
│   ├── guides/           # How-to guides
│   ├── reference/        # Technical specs
│   ├── frameworks/       # Methodology docs
│   └── templates/        # Skill creation templates
├── scripts/              # Build and validation scripts
│   ├── build-release.sh  # Create versioned ZIP
│   ├── sync-claude.sh    # Sync to .claude/ for discovery
│   ├── validate-commands.sh
│   └── lint-skills-frontmatter.sh
├── .github/workflows/    # CI/CD
│   ├── validation.yml    # Runs on Ubuntu + Windows
│   ├── release.yml       # Create releases on tag
│   └── release-zips.yml  # Package ZIP artifacts
├── AGENTS/               # AI agent session continuity
│   └── claude/
│       ├── CONTEXT.md    # Project state (this file)
│       ├── DECISIONS.md  # Technical decisions
│       ├── SESSION-LOG/  # Session summaries
│       └── PLANNING/     # Working artifacts
├── AGENTS.md             # Universal agent discovery
└── README.md, CHANGELOG.md, CONTRIBUTING.md
```

## Recent Work

- **v2.3.0 Shipped — B-01 Closed, B-02 Blocking Mode Active** (2026-02-14)
  - Merged release PR #103 and published tag/release `v2.3.0`
  - Closed B-01 with evidence (`B-01a`, `B-01b`, `B-01c`) as `closed-aligned`
  - Switched `.github/workflows/validate-mcp-sync.yml` to blocking-default mode
  - Added release note doc `docs/releases/Release_v2.3.md`
  - Validation: sync check passes in `block` mode (`24` vs `24`), no drift

- **Awesome-List Submission Campaign Researched** (2026-02-13)
  - Investigated all 12 target repositories from the submission plan (`_NOTES/repo-submission/submission-targets-popular-plan_2026-02-13.md`)
  - Created 12 detailed task documents in `_NOTES/repo-submission/task_*.md`, each with copy-ready PR text, exact entry format, risk assessment, and execution checklist
  - Best-bet targets: BehiSecc (5.8K stars, active), e2b-dev (25.8K stars, ~71% acceptance), kyrolabs (1.7K stars, fast turnaround)
  - Key findings: travisvn has ~1% community merge rate (gatekeeping); Shubhamsaboo (95K stars) requires contributing SKILL.md files directly; `dend/awesome-product-management` (1.3K stars) surfaced as new high-impact target
  - Ready for PR execution phase

- **MCP Sync Automation Planned** (2026-01-29)
  - Created comprehensive planning document: `_NOTES/efforts/mcp-builder-automation/plan_mcp-skill-automation_claude-code.md`
  - Analyzed two approaches: Validation-Only vs Full Automation
  - Recommended Validation-Only approach (~2 hours, ~75 LOC)
  - Key insight: Automate the checking, not the doing
  - Script location best practice: `/.github/scripts/` for CI, `/scripts/` for users
  - Created GitHub Issue [#98](https://github.com/product-on-purpose/pm-skills/issues/98)
  - Architecture: `.github/workflows/validate-mcp-sync.yml` + `.github/scripts/validate-mcp-sync.js`

- **v2.1.0 Released — MCP Alignment Complete** (2026-01-28)
  - Executed full v2.1 plan for both pm-skills and pm-skills-mcp
  - **pm-skills-mcp v2.1.0:**
    - Updated `embed-skills.js` for flat source layout
    - Updated `loader.ts` to read phase from frontmatter
    - Flattened resource URIs: `pm-skills://skills/{skill}`
    - Added `deriveToolName()` in `server.ts` for stable tool names
    - Updated workflow skill lookups for new naming
    - All 66 tests passing
    - Published to npm: `pm-skills-mcp@2.1.0`
    - Created GitHub release with v2.1.0 tag
    - Fixed: Removed personal `.claude/` directory from tracking (40 files)
  - **pm-skills v2.1.0:**
    - Updated `docs/reference/ecosystem.md` with version alignment table
    - Updated `docs/guides/mcp-integration.md` with v2.1 notes
    - Updated CHANGELOG with MCP alignment milestone
    - Created GitHub release with v2.1.0 tag

- **v2.1 Execution Plan Created** (2026-01-27)
  - Created comprehensive v2.1 execution plan
  - Key decisions: flat URIs, stable tool names, frontmatter-based phase

- **v2.0.2 Released** (2026-01-27)
  - Validation workflow added (`validation.yml`) — runs on Ubuntu and Windows
  - Front-matter lint scripts created (`lint-skills-frontmatter.sh/ps1`)
  - Metadata cleanup: removed nested `metadata.version` from all 24 skills
  - Build scripts parameterized for versioned artifacts
  - Scripts guide renamed to `scripts/README_SCRIPTS.md`
  - Release typo fixed (`opensills` → `openskills`)

- **v2.0.0 Released** (2026-01-26)
  - Repository flattened to `skills/{phase-skill}/` structure
  - All 24 skills renamed with phase prefix (e.g., `deliver-prd`)
  - Sync helpers and build scripts added
  - Documentation updated for flat structure

- **v2.0 Execution Plans Complete** (2026-01-26)
  - Created detailed Claude execution plan with 8 phases, migration mapping for all 24 skills
  - Applied Codex's 5 feedback items: packaging, doc frontmatter, timeline dates, fail-fast sync helpers, validation
  - Created tool analysis comparing Claude Code vs Codex for execution
  - Recommendation: Codex 5.1/Max for execution (score 4.05/5), Claude for review/refinement (2.85/5)
  - Key decisions locked:
    - Flat structure: `skills/{phase}-{skill}/` replacing `skills/{phase}/{skill}/`
    - ZIP includes prebuilt `.claude/skills/` and `.claude/commands/`
    - Sync helpers validate SKILL.md, TEMPLATE.md, EXAMPLE.md with fail-fast
    - Two-path install guidance for Claude Code vs other tools
  - Packaging discrepancy noted between Claude and Codex plans (to reconcile before M4)
  - Plans located at `(internal-notes)/plans/v2.0-flat-extensions/`

- **v2.0 Planning: Structure, Output, MCP Impact** (2026-01-21)
  - Analyzed Claude Code skill discovery requirements (flat `.claude/skills/` vs hierarchical `skills/{phase}/`)
  - Created comprehensive planning documents in `AGENTS/claude/PLANNING/`:
    - `plan_skill-structure-revamp.md` — 6 options for restructuring (keep current, flatten, phase prefix, numeric prefix, dual structure, flat+metadata)
    - `plan_skill-output.md` — Configurable file output (always file, always prompt, configurable default)
    - `plan_revamp-mcp.md` — Impact analysis for pm-skills-mcp (tool names, resource URIs, workflows, embed script)
  - Key findings:
    - Current hierarchical structure is agentskills.io compliant but NOT Claude Code auto-discoverable
    - Current `commands/` workaround enables slash commands but not skill discovery
    - Recommended: Option 3 (phase prefix) or Option 5 (dual structure) for Claude Code compatibility
    - MCP can remain backwards-compatible if tool names aren't changed
  - Awaiting stakeholder review before implementation

- **README Cross-Linking with pm-skills-mcp** (2026-01-21)
  - Added MCP badge and callout in README header linking to pm-skills-mcp
  - Updated Platform Compatibility table with MCP links for Claude Desktop, Cursor
  - Added "Any MCP Client" row with protocol-level access
  - Added new MCP Server quick start section (collapsible)
  - Added Related Projects section explaining pm-skills vs pm-skills-mcp
  - Added FAQ entry: "What's the difference between pm-skills and pm-skills-mcp?"
  - Part of cross-linking initiative to clarify ecosystem relationship

- **Ecosystem & MCP Integration Documentation** (2026-01-21)
  - Created `docs/reference/ecosystem.md` — comprehensive ecosystem overview ([#94](https://github.com/product-on-purpose/pm-skills/issues/94))
    - Explains pm-skills vs pm-skills-mcp relationship
    - Decision matrix for choosing between approaches
    - Feature comparison table
    - Integration patterns (file-based, MCP-based, hybrid)
    - Customization workflow and version compatibility
  - Created `docs/guides/mcp-integration.md` — MCP integration guide ([#95](https://github.com/product-on-purpose/pm-skills/issues/95))
    - Quick start for Claude Desktop, Claude Code, Cursor, VS Code
    - Complete tool inventory (24 skill + 5 workflow + 6 utility tools)
    - Slash command to MCP tool mapping table
    - Customization and troubleshooting sections
  - Updated README.md with links to new documentation
  - Updated project structure documentation references

- **README Platform Compatibility & Getting Started Enhancements** (2026-01-20)
  - Expanded "Works for..." section with comprehensive platform compatibility table
  - Added status indicators (✅ Native, 🔶 Manual) for 10+ platforms
  - Added collapsible "Quick Start by Platform" sections for each platform
  - Cross-referenced PM-Skills MCP for programmatic access
  - Streamlined "Getting Started" section with Installation Options table
  - Aligned documentation style with pm-skills-mcp README

- **README Restructure & Project Structure Documentation** (2026-01-20)
  - Restructured README.md headings for better scannability:
    - "Forward March!" → "Project Status"
    - Contributing elevated to H2 with subsections
    - Created "About" section wrapping Author and License
    - "More Suggestions" → "Community"
  - Added Project Structure tree diagram to README.md
  - Created `docs/reference/project-structure.md` with comprehensive file/folder hierarchy
  - Updated FAQ: clarified openskills CLI question (bug resolved, structural limitation remains)
  - Updated pm-skills-mcp README.md to mirror same structure

- **v1.2.0 Released — Security & Community Infrastructure** (2026-01-20)
  - Added SECURITY.md with vulnerability reporting guidelines
  - Added CodeQL code scanning workflow (`.github/workflows/codeql.yml`)
  - Added Dependabot configuration for GitHub Actions and npm updates
  - Added issue templates: bug_report.yml, feature_request.yml, config.yml
  - Added pull request template with contribution checklist
  - Blank issues now disabled (must use templates)
  - Created open-source repo config guide at jpkb
  - Audited pm-skills against GitHub best practices (57% → targeting 85%+)
  - Remaining manual tasks: enable secret scanning, create tag ruleset

- **openskills #48 Resolved** (2026-01-20)
  - Bug fix released in openskills v1.3.1 (now at v1.5.0)
  - Root cause: hardcoded '/' path separator failed on Windows
  - Verified: `anthropics/skills` now installs all 17 skills successfully
  - Note: pm-skills 24 skills not auto-discovered (openskills looks in `.claude/skills/`, not `skills/phase/`)
  - Git clone remains the recommended installation method for pm-skills

- **Open-Skills Submissions Complete** (2026-01-17)
  - Submitted PR to awesome-claude-skills: [PR #62](https://github.com/ComposioHQ/awesome-claude-skills/pull/62)
  - Submitted to n-skills marketplace: [Issue #6](https://github.com/numman-ali/n-skills/issues/6)
  - Both submissions awaiting review (24-48 hours typical)

- **Open-Skills Preparation** (2026-01-16)
  - Added attribution headers to all 24 SKILL.md files (HTML comments)
  - Created dedicated PR guide: `(internal-notes)/efforts/open-skills/plan-pr--awesome-claude-skills.md`
  - Added CODE_OF_CONDUCT.md (Contributor Covenant v2.1)
  - Updated CONTRIBUTING.md to link to Code of Conduct
  - GitHub Discussions enabled, repository topics added
  - Ready for awesome-claude-skills PR submission

- **Documentation Expansion** (2026-01-16)
  - Verified accuracy of `docs/reference/categories.md` and `frontmatter-schema.yaml` — all 24 skills validated
  - Reorganized `/docs` with new taxonomy: `reference/`, `guides/`, `frameworks/`
  - Expanded `categories.md` from 54 → 420+ lines with diagrams, workflows, framework mappings
  - Expanded `frontmatter-schema.yaml` from 91 → 600 lines with validation rules, examples, best practices
  - Created `docs/reference/getting-started.md` — comprehensive setup guide for 5 methods (~600 lines)
  - Created `docs/guides/using-skills.md` — beginner to advanced usage guide (~750 lines)
  - Created `docs/guides/authoring-pm-skills.md` — skill creation and submission guide (~850 lines)
  - Verified all framework claims in README are accurate (Teresa Torres, Christensen, Nygard)

- **v1.0.2 Release & Cleanup** (2026-01-15)
  - Created v1.0.2 tag — release workflow ran successfully
  - Both ZIP artifacts created: pm-skills-v1.0.2.zip, pm-skills-claude-v1.0.2.zip
  - Renamed `_docs/` → `docs/` and `_templates/` → `templates/` for standard conventions
  - Created CLAUDE.md with documentation rules (never reference `(internal-notes)/` in public docs)
  - Cleaned `(internal-notes)/` references from CHANGELOG.md and CONTRIBUTING.md
  - Updated manual submission guide with copy-paste ready content
  - Ready for manual PR to awesome-claude-skills

- **Open-Skills Ecosystem Integration** (2026-01-15)
  - Created detailed execution plan for publishing to open-skills ecosystem
  - Tested openskills CLI — discovered bug with nested directories ([#48](https://github.com/numman-ali/openskills/issues/48))
  - Verified bug affects Anthropic's official `anthropics/skills` repo too
  - Updated README.md with accurate installation instructions (Git clone recommended)
  - Added "See It In Action" section to README.md
  - Created GitHub release workflow (`.github/workflows/release.yml`)
  - Prepared PR content for awesome-claude-skills submission
  - Prepared submission content for n-skills marketplace
  - Documentation at `(internal-notes)/efforts/open-skills/`

- **All 24 Slash Commands COMPLETE** (2026-01-15)
  - Created 20 missing slash commands in `commands/` directory:
    - Discover: `/competitive-analysis`, `/interview-synthesis`, `/stakeholder-summary`
    - Define: `/jtbd-canvas`, `/opportunity-tree`
    - Develop: `/adr`, `/design-rationale`, `/solution-brief`, `/spike-summary`
    - Deliver: `/edge-cases`, `/launch-checklist`, `/release-notes`
    - Measure: `/dashboard-requirements`, `/experiment-design`, `/experiment-results`, `/instrumentation-spec`
    - Iterate: `/lessons-log`, `/pivot-decision`, `/refinement-notes`, `/retrospective`
  - GitHub issues #43-62 created and closed
  - Updated README.md, AGENTS.md, CHANGELOG.md with complete command list
  - Version bumped to v1.0.1

- **Phase 3 P2 Skills COMPLETE** (2026-01-14)
  - Created 11 P2 Skills with SKILL.md, TEMPLATE.md, EXAMPLE.md each:
    - `skills/-/` — [GitHub #26](https://github.com/product-on-purpose/pm-skills/issues/26)
    - `skills/-/` — [GitHub #27](https://github.com/product-on-purpose/pm-skills/issues/27)
    - `skills/-/` — [GitHub #28](https://github.com/product-on-purpose/pm-skills/issues/28)
    - `skills/-/` — [GitHub #29](https://github.com/product-on-purpose/pm-skills/issues/29)
    - `skills/-/` — [GitHub #30](https://github.com/product-on-purpose/pm-skills/issues/30)
    - `skills/-/` — [GitHub #31](https://github.com/product-on-purpose/pm-skills/issues/31)
    - `skills/-/` — [GitHub #32](https://github.com/product-on-purpose/pm-skills/issues/32)
    - `skills/-/` — [GitHub #33](https://github.com/product-on-purpose/pm-skills/issues/33)
    - `skills/-/` — [GitHub #34](https://github.com/product-on-purpose/pm-skills/issues/34)
    - `skills/-/` — [GitHub #35](https://github.com/product-on-purpose/pm-skills/issues/35)
    - `skills/-/` — [GitHub #36](https://github.com/product-on-purpose/pm-skills/issues/36)
  - Created GitHub labels: `phase-3`, `P2`
  - All 11 issues closed

- **Phase 2 COMPLETE** (2026-01-14)
  - Created 8 P1 Skills with SKILL.md, TEMPLATE.md, EXAMPLE.md each:
    - `skills/-/` — [GitHub #18](https://github.com/product-on-purpose/pm-skills/issues/18)
    - `skills/-/` — [GitHub #19](https://github.com/product-on-purpose/pm-skills/issues/19)
    - `skills/-/` — [GitHub #20](https://github.com/product-on-purpose/pm-skills/issues/20)
    - `skills/-/` — [GitHub #21](https://github.com/product-on-purpose/pm-skills/issues/21)
    - `skills/-/` — [GitHub #22](https://github.com/product-on-purpose/pm-skills/issues/22)
    - `skills/-/` — [GitHub #23](https://github.com/product-on-purpose/pm-skills/issues/23)
    - `skills/-/` — [GitHub #24](https://github.com/product-on-purpose/pm-skills/issues/24)
    - `skills/-/` — [GitHub #25](https://github.com/product-on-purpose/pm-skills/issues/25)
  - Created GitHub labels: `phase-2`, `P1`
  - Created GitHub milestone: v0.3.0 - P1 Skills
  - All 8 issues closed

- **Phase 1 COMPLETE** (2026-01-14)
  - Created 5 P0 Core Skills with SKILL.md, TEMPLATE.md, EXAMPLE.md each:
    - `skills/-/` — [GitHub #10](https://github.com/product-on-purpose/pm-skills/issues/10)
    - `skills/-/` — [GitHub #11](https://github.com/product-on-purpose/pm-skills/issues/11)
    - `skills/-/` — [GitHub #12](https://github.com/product-on-purpose/pm-skills/issues/12)
    - `skills/-/` — [GitHub #13](https://github.com/product-on-purpose/pm-skills/issues/13)
    - `skills/-/` — [GitHub #14](https://github.com/product-on-purpose/pm-skills/issues/14)
  - Created GitHub labels: `skill`, `phase-1`, `P0`
  - Created GitHub milestone: v0.2.0 - P0 Core Skills

- **Phase 0 COMPLETE** (2026-01-14)
  - Created CONTRIBUTING.md with curated contribution model
  - Built full directory structure with .gitkeep files
  - Created `docs/frontmatter-schema.yaml`
  - Created `docs/categories.md`
  - Created `docs/templates/skill-template/` with SKILL.md, TEMPLATE.md, EXAMPLE.md
  - Verified VISION.md at `(internal-notes)/VISION.md`
  - GitHub issues #1-9 closed (plan review fixes)

## Recent Infrastructure (2026-01-15)

- **Slash Commands Complete (25 total):**
  - All 24 skills have corresponding slash commands
  - 1 bundle command: `/kickoff`
- **Workflow Bundles Complete:**
  - `_bundles/triple-diamond.md` — Complete product development cycle
  - `_bundles/lean-startup.md` — Build-Measure-Learn rapid iteration
  - `_bundles/feature-kickoff.md` — Quick-start workflow for features
- **Agent Discovery:**
  - `AGENTS.md` — Universal agent discovery file with all commands listed
- **GitHub Actions:**
  - `.github/workflows/sync-agents-md.yml` — Auto-sync on skill changes
  - `.github/workflows/release-zips.yml` — Package ZIPs on release

## Next Steps

1. **Awesome-List PR Campaign (immediate):**
   - [ ] Execute BehiSecc/awesome-claude-skills PR (#1 priority)
   - [ ] Execute e2b-dev/awesome-ai-agents PR (#5 priority, highest reach)
   - [ ] Execute kyrolabs/awesome-agents PR (#6 priority, fast turnaround)
   - [ ] Execute remaining PRs per task documents in `_NOTES/repo-submission/`
   - [ ] Investigate `dend/awesome-product-management` as new target
   - [ ] For Shubhamsaboo: adapt 4 skills to their SKILL.md format before PR

2. **v2.2+ Backlog:**
   - Config-driven output behavior (`pm-skills.config.json`)
   - Meta-skills: `/project`, `/common`, `/link-docs`, `/update-doc`
   - MCP file I/O capabilities
   - Project registry system

3. **Community/Ecosystem:**
   - [ ] Monitor submitted PRs for maintainer feedback
   - [ ] Add badges after PR merges
   - [ ] Star-boosting activities to strengthen VoltAgent/travisvn submissions

## Notes

- Follows [Agent Skills Specification](https://agentskills.io/specification)
- Primary Audience: Individual Product Managers using AI assistants
- Cross-platform: Claude Code, Claude.ai, GitHub Copilot, Cursor, Windsurf, OpenCode
- Implementation plan is in `(internal-notes)/v1-plan/plan-v1.md` with detailed issue-by-issue guidance
- All 24 skills are now complete!

## Skills Inventory (24/24 Complete)

### Discover Phase (3 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| interview-synthesis | research | P1 | ✅ Complete |
| competitive-analysis | research | P2 | ✅ Complete |
| stakeholder-summary | research | P2 | ✅ Complete |

### Define Phase (4 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| problem-statement | problem-framing | P0 | ✅ Complete |
| hypothesis | ideation | P0 | ✅ Complete |
| opportunity-tree | problem-framing | P2 | ✅ Complete |
| jtbd-canvas | problem-framing | P2 | ✅ Complete |

### Develop Phase (4 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| solution-brief | ideation | P1 | ✅ Complete |
| spike-summary | coordination | P1 | ✅ Complete |
| adr | specification | P1 | ✅ Complete |
| design-rationale | specification | P2 | ✅ Complete |

### Deliver Phase (5 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| prd | specification | P0 | ✅ Complete |
| user-stories | specification | P0 | ✅ Complete |
| edge-cases | specification | P1 | ✅ Complete |
| launch-checklist | coordination | P0 | ✅ Complete |
| release-notes | coordination | P1 | ✅ Complete |

### Measure Phase (4 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| experiment-design | validation | P1 | ✅ Complete |
| instrumentation-spec | validation | P1 | ✅ Complete |
| dashboard-requirements | validation | P2 | ✅ Complete |
| experiment-results | reflection | P2 | ✅ Complete |

### Iterate Phase (4 skills)

| Skill | Category | Priority | Status |
|-------|----------|----------|--------|
| retrospective | reflection | P2 | ✅ Complete |
| lessons-log | reflection | P2 | ✅ Complete |
| refinement-notes | coordination | P2 | ✅ Complete |
| pivot-decision | reflection | P2 | ✅ Complete |

