#!/bin/bash
# export.sh — Convert markdown resume to ATS-friendly PDF and DOCX
# Usage: ./scripts/export.sh [input.md]
# Default: output/resume.md → output/resume.pdf + output/resume.docx

set -euo pipefail

INPUT="${1:-output/resume.md}"
BASENAME="$(basename "$INPUT" .md)"
OUTDIR="$(dirname "$INPUT")"
PDF_OUT="${OUTDIR}/${BASENAME}.pdf"
DOCX_OUT="${OUTDIR}/${BASENAME}.docx"
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

# --- PDF (ATS-safe text-based, styled with CSS) ---
echo "Exporting PDF: $INPUT → $PDF_OUT"
pandoc "$INPUT" \
    -o "$PDF_OUT" \
    --pdf-engine=weasyprint \
    --css="$CSS" \
    --metadata title="Resume" \
    --standalone
echo "  Done: $PDF_OUT ($(du -h "$PDF_OUT" | cut -f1))"

# --- DOCX (most reliable format for ATS parsing) ---
echo "Exporting DOCX: $INPUT → $DOCX_OUT"
pandoc "$INPUT" \
    -o "$DOCX_OUT" \
    --metadata title="Resume"
echo "  Done: $DOCX_OUT ($(du -h "$DOCX_OUT" | cut -f1))"

echo ""
echo "Both formats ready:"
echo "  PDF:  $PDF_OUT  (best for human reading)"
echo "  DOCX: $DOCX_OUT (best for ATS submission)"
