# ai-for-resume — Project Instructions

AI-powered resume toolkit for Claude Code — craft, analyze, and tailor resumes with AI assistance.

## Project Structure

```
ai-for-resume/
├── CLAUDE.md                  # This file — project instructions + session handover
├── README.md                  # Human-readable overview
├── requirements.txt           # Python deps (pdfplumber, weasyprint)
├── .claude/
│   ├── settings.json          # Permissions
│   ├── skills/                # 5-step resume pipeline
│   │   ├── dig/SKILL.md       # /dig — Mine experience against JD
│   │   ├── generate/SKILL.md  # /generate — Build structured resume
│   │   ├── review/SKILL.md    # /review — Score & diagnose
│   │   ├── polish/SKILL.md    # /polish — Optimize for target JD
│   │   └── format/SKILL.md    # /format — Standardize markdown
│   └── agents/                # (empty — skills cover everything)
├── .claude-plugin/
│   └── plugin.json            # Plugin manifest
├── scripts/
│   ├── export-pdf.sh          # Markdown → ATS-friendly PDF
│   └── resume.css             # PDF styling
└── output/                    # User's generated resumes (gitignored)
    ├── resume.md
    └── resume.pdf
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

## Session Handover (2026-07-30 ~22:30)

### What Was Completed
- [x] Project scaffolding with proper Claude Code extension structure
- [x] 5-skill pipeline: dig, generate, review, polish, format
- [x] 2 agents: resume-writer, ats-analyzer
- [x] Plugin manifest (.claude-plugin/plugin.json)
- [x] SSH key configured for GitHub (id_ed25519_github, user: zaaztt)
- [x] Git repo initialized and pushed to github.com/zaaztt/ai-for-resume
- [x] README updated to reflect actual 5-skill pipeline
- [x] Python venv with pdfplumber + weasyprint
- [x] Markdown → PDF export tooling (scripts/export-pdf.sh + resume.css)
- [x] MCP stub removed — skills handle everything natively, no Python server needed
- [x] Pipeline tested: /review → /polish → /format → PDF with real resume (Optiver JD)
- [x] Skills reviewed — all 5 are solid, pipeline flows correctly

### What Still Needs Doing
- [ ] Test /dig with a real conversational interview session
- [ ] Test /generate from scratch (currently only tested review→polish→format path)
- [ ] Test agents: @resume-writer, @ats-analyzer
- [ ] Consider LaTeX template option for PDF (nicer typography, heavier dependency)
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
