#!/bin/bash
# export-pdf.sh — Convert markdown resume to ATS-friendly PDF
# Usage: ./scripts/export-pdf.sh [input.md] [output.pdf]
# Defaults: output/resume.md → output/resume.pdf

set -euo pipefail

INPUT="${1:-output/resume.md}"
OUTPUT="${2:-output/resume.pdf}"
CSS="$(dirname "$0")/resume.css"

# Check dependencies
command -v pandoc >/dev/null 2>&1 || { echo "Error: pandoc not found. Install: brew install pandoc"; exit 1; }
command -v weasyprint >/dev/null 2>&1 || {
    echo "Error: weasyprint not found. Activate venv: source .venv/bin/activate"
    exit 1
}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo "Exporting: $INPUT → $OUTPUT"

pandoc "$INPUT" \
    -o "$OUTPUT" \
    --pdf-engine=weasyprint \
    --css="$CSS" \
    --metadata title="Resume" \
    --standalone

echo "Done: $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
