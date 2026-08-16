#!/usr/bin/env bash
# Rebuild FULL-GUIDE.md from the bite-size files.
# Usage: bash build.sh
# The <!-- bite-size-nav --> blocks in each part (the "you are here" note and
# the prev/next links) only make sense in the bite-size files, so they are
# stripped out of the combined guide.
set -e
cd "$(dirname "$0")"

strip_nav() {
  awk '/<!-- bite-size-nav -->/{skip=1;next} /<!-- \/bite-size-nav -->/{skip=0;next} !skip' "$1"
}

{
  cat parts/_header.md
  for f in parts/0*.md parts/10-errors-translated.md parts/11-glossary.md; do
    echo
    strip_nav "$f"
  done
  echo
  echo "# Part 12 — Cheat sheet"
  echo
  # Drop the cheat sheet's own H1 and its pointer to the HTML version
  tail -n +4 cheat-sheet.md
  echo
  echo "---"
  echo
  echo "## You're ready"
  echo
  echo "If you remember nothing else: **\`git status\` never hurts, \`q\` quits, Ctrl+C cancels, and committed work is almost never truly lost.** Commit small and often — every save point is a place future-you can reload. The rest is looking things up, which is not cheating; it's the job."
} > FULL-GUIDE.md

echo "Built FULL-GUIDE.md ($(wc -l < FULL-GUIDE.md) lines)"
