# ai-for-resume — Project Instructions

AI-powered resume toolkit for Claude Code — craft, analyze, and tailor resumes with AI assistance.

## Project Structure

```
ai-for-resume/
├── .mcp.json                  # MCP server config (resume-tools)
├── CLAUDE.md                  # This file — project instructions + session handover
├── README.md                  # Human-readable overview
├── requirements.txt           # Python deps for MCP server
├── .claude/
│   ├── settings.json          # Permissions
│   ├── skills/                # 5-step resume pipeline
│   │   ├── dig/SKILL.md       # /dig — Mine experience against JD
│   │   ├── generate/SKILL.md  # /generate — Build structured resume
│   │   ├── review/SKILL.md    # /review — Score & diagnose
│   │   ├── polish/SKILL.md    # /polish — Optimize for target JD
│   │   └── format/SKILL.md    # /format — Standardize markdown
│   └── agents/                # Specialized sub-agents
│       ├── resume-writer.md   # @resume-writer — content optimization
│       └── ats-analyzer.md    # @ats-analyzer — deep ATS analysis
├── .claude-plugin/
│   └── plugin.json            # Plugin manifest
└── mcp/
    └── server.py              # MCP server (stub — needs implementation)
```

## 5-Skill Resume Pipeline

```
dig ──→ generate ──→ review ──→ polish ──→ format
 │         │           │           │           │
 │         │           │           │           └─ Zero content loss, structure only
 │         │           │           └─ Improve expression, preserve facts
 │         │           └─ Score 0-10 across 5 dimensions, list issues
 │         └─ Anti-hallucination rules, source mapping for every claim
 └─ Conversational interview, JD as measuring stick
```

Each skill works standalone — jump in at any step.

## Session Handover (2026-07-30)

### What Was Completed
- [x] Project scaffolding with proper Claude Code extension structure
- [x] 5-skill pipeline: dig, generate, review, polish, format
- [x] 2 agents: resume-writer, ats-analyzer
- [x] MCP server stub with 3 tools defined (parse_resume, analyze_jd, score_resume)
- [x] Plugin manifest (.claude-plugin/plugin.json)
- [x] SSH key configured for GitHub (id_ed25519_github, user: zaaztt)

### What Still Needs Doing
- [ ] Implement MCP server tools (currently stubs)
- [ ] Install Python deps: `python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt`
- [ ] Initialize git repo: `git init && git add -A && git commit -m "Initial commit"`
- [ ] Create GitHub repo and push
- [ ] Test each skill end-to-end: `/dig`, `/generate`, `/review`, `/polish`, `/format`
- [ ] Test agents: `@resume-writer`, `@ats-analyzer`
- [ ] Consider adding more skills from ResumeSkills reference
- [ ] Package as npm-installable skill if desired

### Environment
- Python 3.12 at `/usr/local/bin/python3.12`
- GitHub user: zaaztt, SSH key: `~/.ssh/id_ed25519_github`
- Run with: `cd ~/Codes/ai-for-resume && claude --dangerously-skip-permissions`

## Conventions

- All resume output: clean, ATS-compatible formatting (no tables, columns, graphics)
- STAR method (Situation, Task, Action, Result) for bullet points
- Quantifiable achievements over generic descriptions
- Match keywords from target JD when tailoring

## Skills vs Agents

- **Skills** (`/dig`, `/generate`, `/review`, `/polish`, `/format`): quick, single-step tasks
- **Agents** (`@resume-writer`, `@ats-analyzer`): multi-step, deep analysis
