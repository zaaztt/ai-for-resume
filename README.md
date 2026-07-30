# ai-for-resume

AI-powered resume toolkit for Claude Code — craft, analyze, and tailor resumes with AI assistance.

## Structure

```
ai-for-resume/
├── .mcp.json                  # MCP server config (resume tools)
├── CLAUDE.md                  # Project instructions
├── .claude/
│   ├── settings.json          # Permissions & hooks
│   ├── skills/                # Custom slash commands
│   │   ├── analyze-resume/    # /analyze-resume
│   │   ├── tailor-resume/     # /tailor-resume
│   │   └── generate-resume/   # /generate-resume
│   └── agents/                # Custom sub-agents
│       ├── resume-writer.md   # @resume-writer
│       └── ats-analyzer.md    # @ats-analyzer
├── .claude-plugin/
│   └── plugin.json            # Plugin manifest
└── mcp/
    └── server.py              # MCP server (Python)
```

## Installation

```bash
# As a Claude Code project
cd ai-for-resume
claude

# As a plugin (from project root)
claude --plugin-dir .
```

## Skills

| Command | Description |
|---|---|
| `/analyze-resume <file>` | ATS compatibility analysis |
| `/tailor-resume <resume> <jd>` | Tailor resume to job description |
| `/generate-resume` | Generate a resume from scratch |

## Agents

| Agent | Description |
|---|---|
| `@resume-writer` | Write and optimize resume content |
| `@ats-analyzer` | Deep ATS keyword analysis |

## MCP Server

Provides tools for resume parsing, PDF generation, and job description analysis.

```bash
pip install -r requirements.txt
python mcp/server.py
```

## Credits

Inspired by [ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills).
