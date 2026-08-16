# The Git Bash Field Guide

**Plain-language Git + Git Bash for game developers (and everyone else).**

A hands-on guide and glossary that assumes nothing, re-explains every technical word every time it appears, and never expects you to remember a definition from three pages ago. Built so that even complete beginners can start using Git with confidence — and keep this around as a lookup reference forever after.

## Choose your format

| You want... | Open... |
|---|---|
| 📖 **Everything in one document** | [FULL-GUIDE.md](FULL-GUIDE.md) |
| 🍱 **Bite-size parts** (each stands alone) | the [part list below](#the-parts) |
| 🖨️ **A printable cheat sheet** | [cheat-sheet.html](cheat-sheet.html) — open in a browser, press Ctrl+P (or the plain-markdown [cheat-sheet.md](cheat-sheet.md)) |

## How this guide works — read this first

- **Every technical word gets re-explained, every time it appears.** You will never need to remember a definition from three pages ago. If a term shows up, its meaning is right there next to it.
- **You don't have to read in order.** Jump to whatever you need. Every part stands on its own.
- **You are not supposed to memorize any of this.** Professional developers look this stuff up every single day. Looking things up *is* the skill. That's what the [Glossary](parts/11-glossary.md) and [Cheat sheet](cheat-sheet.md) are for.
- **You can't break anything by looking.** Several commands only *show* you information and never change anything: `pwd`, `ls`, `git status`, `git log`, `git diff`. When in doubt, look first. The guide always warns clearly before any command that can destroy work.
- **"Try it" blocks are meant to be typed.** Reading about Git doesn't build confidence — typing does. Everything hands-on happens in a throwaway practice folder, so there's zero risk to your real projects.
- **Reading conventions:** lines starting with `$` are things you type (don't type the `$`); text after a `#` is a comment the terminal ignores, so examples are safe to copy-paste whole.

## The parts

| # | Part | What's inside |
|---|---|---|
| 0 | [What even is Git Bash?](parts/00-what-is-git-bash.md) | Git vs Bash vs terminal vs GitHub, reading the screen |
| 1 | [Terminal survival skills](parts/01-terminal-survival-skills.md) | The keys that get you un-stuck (`q`, Ctrl+C, escaping Vim...) |
| 2 | [Moving around: Bash basics](parts/02-moving-around-bash-basics.md) | `pwd`, `ls`, `cd`, `mkdir`, files — with a hands-on warm-up |
| 3 | [How Git thinks](parts/03-how-git-thinks.md) | Save points, the three zones, timelines — the 5-minute mental model |
| 4 | [One-time setup](parts/04-one-time-setup.md) | Name/email, `main`, editor, the line-endings warning |
| 5 | [The everyday loop](parts/05-the-everyday-loop.md) | `status → add → commit`, plus `diff` and `log` |
| 6 | [Branches: parallel timelines](parts/06-branches.md) | `switch`, `merge`, and conflicts without fear |
| 7 | [GitHub and remotes](parts/07-github-and-remotes.md) | `clone`, `push`, `pull`, pull requests, team rhythm |
| 8 | [Undo and rescue](parts/08-undo-and-rescue.md) | The "oh no" section — bookmark this one |
| 9 | [Game dev corner](parts/09-game-dev-corner.md) | `.gitignore` for **Godot / Unity / Unreal**, Git LFS, team etiquette |
| 10 | [Error messages, translated](parts/10-errors-translated.md) | What Git's scary messages actually mean |
| 11 | [Glossary A–Z](parts/11-glossary.md) | Every term, each entry self-contained |
| — | [Cheat sheet](cheat-sheet.md) | Everything daily on one printable page |

## If you remember nothing else

**`git status` never hurts, `q` quits, Ctrl+C cancels, and committed work is almost never truly lost.** Commit small and often — every save point is a place future-you can reload. The rest is looking things up, which is not cheating; it's the job.

---

*Maintenance note: [FULL-GUIDE.md](FULL-GUIDE.md) is generated from the files in `parts/` — edit those, then run `bash build.sh` to rebuild it.*
