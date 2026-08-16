<!-- bite-size-nav -->
> Part 0 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Every term is explained right where it's used; nothing assumes you've read the other parts.
<!-- /bite-size-nav -->

# Part 0 — What even is Git Bash?

"Git Bash" is actually **three separate things wearing one trench coat:**

1. **Git** — a program that takes snapshots of a project folder over time, so you can rewind to any earlier version, see what changed, and work on the same project as other people without overwriting each other. Software that does this is called *version control* (version control = a system that remembers old versions of your files so you can go back).
2. **Bash** — a command language: short typed instructions for controlling a computer, like `cd` ("go to this folder") or `ls` ("list what's in here"). It's the standard command language on Mac and Linux.
3. **A terminal** — the actual window you type those commands into. (Also called a *console*, *shell*, or *command line* — people use these words interchangeably and that's fine.)

**Git Bash** is a Windows app that bundles all three: a terminal window that understands Bash, with Git pre-installed. It comes free with "Git for Windows" ([gitforwindows.org](https://gitforwindows.org)).

> **Mac/Linux note:** On Mac or Linux you don't need Git Bash — the built-in Terminal app already speaks Bash. Nearly everything in this guide works there identically.

### Git is not GitHub

This confuses everyone at first, so let's kill it now:

- **Git** = the save-system program running *on your computer*. Works fully offline. No account needed.
- **GitHub** = a *website* that stores an online copy of a Git project, so teammates can share work and you have an off-site backup. (GitLab and Bitbucket are competitor websites that do the same job.)

You can use Git alone forever. GitHub is the optional "online multiplayer" part — covered in Part 7.

### Reading the screen

When you open Git Bash, you'll see something like:

```
you@YOUR-PC MINGW64 ~/projects/my-game (main)
$
```

Decoded, piece by piece:

- `you@YOUR-PC` — your username @ your computer's name.
- `MINGW64` — the name of the technology Git Bash uses to run Bash on Windows. Ignore it completely.
- `~/projects/my-game` — the folder you're currently "standing in." The `~` symbol is shorthand for your home folder (on Windows, that's `C:\Users\YourName`).
- `(main)` — only appears inside a Git project. It names the *branch* you're on (branch = which parallel timeline of the project you're currently working in — fully explained in Part 6).
- `$` — Git Bash saying **"your turn — type here."** This whole line is called the *prompt* (prompt = the text the terminal prints when it's ready for your next command).

When you see `$` at the start of an example in this guide, it means "this is something you type." You don't type the `$` itself. Text after a `#` on the same line is a comment — a note for humans that the terminal ignores, so examples stay safe to copy-paste whole.

### "Do I have to give up buttons and windows?"

No. Graphical Git tools exist — **GitHub Desktop**, the Source Control panel built into **VS Code**, and others — and they're perfectly legitimate. They run the exact same Git underneath. This guide teaches the typed version because every tutorial, error message, and teammate speaks it, and because the buttons in those tools only make sense once you know what they're doing for you. Learn the five core commands here, and every GUI becomes self-explanatory.

---
<!-- bite-size-nav -->
[Index](../README.md) · [Part 1 — Terminal survival skills ➡](01-terminal-survival-skills.md)
<!-- /bite-size-nav -->
