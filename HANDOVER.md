---
title: Handover — ai-for-resume
project: ai-for-resume
date: 2026-07-30
time: 21:53
phase: building
---

<mission>
Build an AI-powered resume toolkit as a Claude Code extension (skills + agents + MCP + plugin).
"Done" for this phase means: 5-skill pipeline works end-to-end, MCP server has real implementations, project is on GitHub.
</mission>

<current_state>
- 5-skill resume pipeline created at `.claude/skills/{dig,generate,review,polish,format}/SKILL.md` — content written, not yet tested
- 2 agents: `@resume-writer` (content optimization), `@ats-analyzer` (ATS analysis) — defined, not tested
- MCP server stub at `mcp/server.py` — 3 tools defined (parse_resume, analyze_jd, score_resume), all return TODO messages
- Plugin manifest at `.claude-plugin/plugin.json` — basic metadata
- `.mcp.json` — configured to launch `python3 mcp/server.py`
- `CLAUDE.md` — project instructions + session handover section
- Global handover skill installed at `~/.claude/skills/handover/` (from CoachSteff/handover-skills)
- Python 3.12 installed at `/usr/local/bin/python3.12`
- GitHub SSH configured: user `zaaztt`, key `~/.ssh/id_ed25519_github`
- NOT a git repo yet (git init pending)
- Skills were based on WeAIClub/resume-skills (dig/generate/review/polish/format) and chavangorakh1999/sde-skills (SWE resume review framework)
</current_state>

<artifacts>
- repo / branch: No git repo yet (working directory: ~/Codes/ai-for-resume)
- key files:
  - `.claude/skills/dig/SKILL.md` — Conversational experience mining against JD
  - `.claude/skills/generate/SKILL.md` — Resume creation with anti-hallucination rules
  - `.claude/skills/review/SKILL.md` — 5-dimension scoring (expression, structure, credibility, jdMatch, truthfulness)
  - `.claude/skills/polish/SKILL.md` — JD-driven optimization, preserve facts
  - `.claude/skills/format/SKILL.md` — Zero-loss markdown standardization
  - `.claude/agents/resume-writer.md` — Expert resume content writer
  - `.claude/agents/ats-analyzer.md` — ATS compatibility expert
  - `mcp/server.py` — MCP server (stdio JSON-RPC), stubs only
  - `CLAUDE.md` — Project instructions + handover
- spec / docs: README.md (overview), CLAUDE.md (instructions + handover)
- running app: N/A (skills-only project, no app to run)
- tests: None yet
</artifacts>

<decisions>
- Chose 5-skill pipeline (dig→generate→review→polish→format) over single monolithic skill — modular, composable, each works standalone
- Chose Python MCP server over Node.js — matches user's existing Python environment
- Chose markdown-based skills (no code in skills themselves) — pure prompt engineering, following WeAIClub approach
- review skill uses 0-10 scoring with weighted formula, not 1-5 rubric — provides more granularity
- Plugin packaging deferred until skills are stable
</decisions>

<constraints>
- Python 3.12+ for MCP server (installed via Homebrew at /usr/local/bin/python3.12)
- Skills follow Claude Code skill format: SKILL.md in `.claude/skills/<name>/` with YAML frontmatter
- All resume output must be ATS-compatible (no tables, single column, standard headers)
- GitHub user: zaaztt, use SSH (key: ~/.ssh/id_ed25519_github)
- Run with: `cd ~/Codes/ai-for-resume && claude --dangerously-skip-permissions`
</constraints>

<verification>
- Verified: Project structure exists on disk — confirmed via `find` listing
- Verified: Python 3.12 installed at /usr/local/bin/python3.12 (version 3.12.13)
- Verified: GitHub SSH works — `ssh -T git@github.com` returns "Hi zaaztt!"
- NOT verified: Skills work (need a real Claude Code session to test, each needs actual resume input)
- NOT verified: MCP server runs (needs `pip install`, haven't run it)
- NOT verified: Agents route correctly (need Claude Code session with resume tasks)
</verification>

<next_steps>
1. Initialize git repo: `cd ~/Codes/ai-for-resume && git init && git add -A && git commit -m "Initial commit: 5-skill resume pipeline, agents, MCP stub"`
2. Create GitHub repo for zaaztt/ai-for-resume and push
3. Set up Python venv: `python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`
4. Implement MCP server tools (replace stubs with real pdfplumber/python-docx/LLM integration)
5. Test each skill: `/dig`, `/generate`, `/review`, `/polish`, `/format` with real resume content
6. Test agents: `@resume-writer` and `@ats-analyzer`
7. Polish skills based on test results
8. Package as npm-installable skill when stable
</next_steps>

<unknowns_and_do_not_assume>
- Skills have NOT been tested — success depends on Claude correctly following SKILL.md instructions
- MCP server stub may need restructuring if mcp python library API differs from manual JSON-RPC
- Don't assume the review rubric weights (0.4/0.3/0.3) are right — may need tuning after real reviews
- Global handover skill may not auto-discover until Claude Code restarts
</unknowns_and_do_not_assume>

<source_of_truth_rank>
When this brief disagrees with reality, trust in this order:
running code > README.md > CLAUDE.md > PROGRESS.md > this HANDOVER > older handovers.
</source_of_truth_rank>

<startup_protocol>
What the next session must read and run BEFORE answering or editing:
1. Read: CLAUDE.md, PROGRESS.md, this HANDOVER.md, then skim the 5 SKILL.md files
2. Check: `ls .claude/skills/*/SKILL.md` — confirm all 5 exist
3. Check: `python3.12 --version` — confirm Python available
4. Confirm current_state matches what you see; note any drift out loud
5. Only then start next_steps[1]
</startup_protocol>
