<!-- bite-size-nav -->
> Part 3 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Every term is explained right where it's used.
<!-- /bite-size-nav -->

# Part 3 — The big picture: how Git thinks

Five minutes here makes every command later feel obvious instead of magical. Gamer translation throughout.

### Commits are save points

A **commit** is a snapshot of your entire project at one moment, with a short caption — a *save point*. Your project's history is a chain of save points you can revisit, compare, or reload. Playing without Git is playing a roguelike with permadeath: one bad afternoon and there's no going back. With Git, you can always reload.

A folder that Git is tracking, together with its whole chain of save points, is called a **repository** — "**repo**" for short. Physically, a repo is just your normal project folder plus one hidden folder inside it named `.git`, where Git stores all the save data. Delete `.git` and the history is gone (current files stay); copy the project folder and the whole history travels with it.

### The three zones

Between "I edited a file" and "it's saved in history," files pass through three zones:

```
 1. WORKING FOLDER          2. STAGING AREA            3. HISTORY
 your files, right now      "what goes in the           the album of
 as you see them            next save point" box        commits made so far
        │                          │
        └────── git add ──────────►└────── git commit ──────►
                (pack the box)             (seal it + caption it)
```

1. **Working folder** — your project files as they actually are this second, edits and all.
2. **Staging area** — a waiting room where you list which changes go into the *next* save point. `git add` puts changes in. (Error messages sometimes call this "the index" — same thing.)
3. **History** — the chain of commits (commit = save point) made so far. `git commit` takes what's in the staging area and seals it into history with your caption.

**Why the middle step exists:** so each save point can be *one tidy idea*. Suppose you fixed a jump bug and also half-finished some coin code. Stage and commit only the jump fix — "Fix double-jump" — and leave the half-done coin work out of the snapshot. Save points that each mean one thing are save points you can actually find and reload later.

### Branches are parallel timelines

A **branch** is a parallel timeline of your project. Make a branch called `enemy-ai`, experiment freely on it, and the `main` timeline stays untouched and playable. Experiment works? **Merge** it (merge = fold one timeline's changes into another). Experiment fails? Delete the branch — as if it never happened. Part 6 is all about this.

### Remotes are the online copy

A **remote** is a copy of your repo (repo = project + history) stored elsewhere — usually on GitHub (the project-hosting website). Three verbs move save points around, and that's genuinely all they do:

- **clone** — download an entire repo for the first time
- **push** — upload your new commits (commits = save points) to the remote
- **pull** — download commits your teammates pushed, into your copy

The mental model in one line: **edit → add → commit → push, and pull to get everyone else's saves.** Every Git tutorial on earth is elaboration on that line.

---
<!-- bite-size-nav -->
[⬅ Part 2 — Moving around: Bash basics](02-moving-around-bash-basics.md) · [Index](../README.md) · [Part 4 — One-time setup ➡](04-one-time-setup.md)
<!-- /bite-size-nav -->
