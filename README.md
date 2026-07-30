# ai-for-resume

AI-powered resume toolkit for Claude Code — craft, analyze, and tailor resumes with AI assistance.

## 5-Skill Pipeline

```
dig ──→ generate ──→ review ──→ polish ──→ format
 │         │           │           │           │
 │         │           │           │           └─ Standardize markdown, zero content loss
 │         │           │           └─ Improve expression, optimize for JD
 │         │           └─ Score 0-10 across 5 dimensions, list issues
 │         └─ Build structured resume with anti-hallucination rules
 └─ Conversational experience mining against JD
```

Each skill works standalone — jump in at any step.

## Structure

```
ai-for-resume/
├── .mcp.json                  # MCP server config (resume-tools)
├── CLAUDE.md                  # Project instructions
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
    └── server.py              # MCP server (Python)
```

## Skills

| Command | Description |
|---|---|
| `/dig <JD>` | Mine your career experience against a job description |
| `/generate` | Build a structured, ATS-optimized resume from mined materials |
| `/review` | Score resume across 5 dimensions (0-10), list issues |
| `/polish` | Optimize resume for a target JD, preserve all facts |
| `/format` | Standardize markdown — zero content changes |

## Agents

| Agent | Description |
|---|---|
| `@resume-writer` | Write and optimize resume bullet points and summaries |
| `@ats-analyzer` | Deep ATS compatibility analysis with keyword matching |

## MCP Server

Provides tools for resume parsing, job description analysis, and scoring.

```bash
python3.12 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
python mcp/server.py
```

## Credits

Inspired by [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills) and [WeAIClub/resume-skills](https://github.com/WeAIClub/resume-skills).
