<!-- bite-size-nav -->
> Part 10 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Every term is explained right where it's used.
<!-- /bite-size-nav -->

# Part 10 — Error messages, translated

Git's messages sound harsher than they are. Note especially: **`fatal:` just means "I'm stopping, I can't do that"** — dramatic old programmer word, but nothing is damaged; Git is refusing, not breaking.

**`fatal: not a git repository (or any of the parent directories)`**
You're standing in a folder Git isn't watching — Git commands only work inside a repo (repo = a folder where `git init` or `git clone` has happened). Fix: `cd` into your project folder. (Check with `pwd` — "where am I?")

**`git: command not found`** (or `bash: gti: command not found`)
Either a typo (Bash helpfully repeats the word it didn't recognize — `gti`, `giit`...) or, if `git` itself isn't found, Git isn't installed. Fix: retype, or install from gitforwindows.org.

**`Please tell me who you are`**
Git won't create commits (commits = save points, stamped with their author) until it knows your name and email. Fix: the two `git config` lines in Part 4.

**`warning: LF will be replaced by CRLF the next time Git touches it`**
Not an error — nothing is wrong and nothing needs fixing. Windows and Mac/Linux end text lines with different invisible characters (line endings), and Git for Windows converts between them automatically; this is just Git narrating that conversion. Ignore it and carry on. (One-line background and the recommended setting: Part 4.)

**`error: failed to push... Updates were rejected because the remote contains work that you do not have`**
A teammate pushed (uploaded) commits before you — the online copy is ahead of yours, and Git won't let you blindly stomp it. Not an emergency; this is Git working correctly. Fix: `git pull` (download + blend in their work), resolve any conflict (Part 6), then `git push` again.

**`error: src refspec main does not match any`**
You tried to push (upload) before making any commit (commit = save point) — there's nothing to send yet. Fix: `git add .` then `git commit -m "First commit"`, then push again. (Rarer cause: your branch is named `master` but you typed `main`, or vice versa — `git branch` shows the real name.)

**`fatal: refusing to merge unrelated histories`**
Your local repo and the online one each started life *separately* — classic cause: you ticked "Add a README" while creating the GitHub repo, so GitHub made its own first commit, unrelated to yours. Git balks at gluing two strangers together. Fix: `git pull origin main --allow-unrelated-histories` (tells Git "yes, glue them"), resolve any conflict, then push. Prevention: create the online repo **empty** (Part 7, Path B).

**`You have divergent branches and need to specify how to reconcile them`**
Modern Git asking, on a `pull`, *how* it should combine your commits with the remote's. One-time answer for the standard behavior this guide teaches (plain merging):
`git config --global pull.rebase false` — then `git pull` again.

**`CONFLICT (content): Merge conflict in <file> ... Automatic merge failed`**
The same lines were edited differently on two timelines, and Git wants a human to pick. Not broken — paused. Fix: Part 6's conflict walkthrough (edit file, delete `<<<<<<<`/`=======`/`>>>>>>>` markers, `add`, `commit`). Escape hatch: `git merge --abort`.

**`error: Your local changes to the following files would be overwritten`**
You tried to switch branches (branch = timeline) or pull while carrying unsaved edits that the move would clobber; Git protects them by refusing. Fix: commit the edits, or stash them (`git stash` — the work-in-progress drawer, Part 8), then retry.

**`You are in 'detached HEAD' state`**
Gloriously alarming name; harmless. It means you've time-traveled to *look directly at* an old commit instead of standing on a branch (HEAD = "where you're currently standing"; detached = not attached to any timeline). Look around freely. Return: `git switch main`. Made changes here you want to keep? `git switch -c rescued-work` puts them on a new branch first.

**`remote: Support for password authentication was removed` / `403 Forbidden`**
GitHub no longer accepts account passwords from Git. Fix on Windows: latest Git for Windows handles login via a browser pop-up automatically. If stuck, search "GitHub credential manager" — five-minute fix.

**`this exceeds GitHub's file size limit of 100.00 MB`**
GitHub rejects any single file over 100 MB, full stop. Fix: route big file types through Git LFS (Large File Storage — Part 9). Catch: if the huge file is already *in a commit*, tracking it now isn't enough — the simplest beginner-safe path is to move the file out of the project, commit, set up LFS tracking for that type, move it back, commit again. (Deep-cleaning old history is a "search for `git lfs migrate` when you need it" topic.)

**A full screen suddenly ignores your typing**
It's a program taking over the terminal, not a crash. Scrollable viewer showing `:` or `(END)` (the pager)? Press **`q`**. The Vim editor (weird modes, `-- INSERT --` at the bottom)? **Esc, then `:q!`, then Enter** — or `:wq` to save the message Git pre-wrote and continue. Neither can hurt anything.

---
<!-- bite-size-nav -->
[⬅ Part 9 — Game dev corner](09-game-dev-corner.md) · [Index](../README.md) · [Part 11 — Glossary A–Z ➡](11-glossary.md)
<!-- /bite-size-nav -->
