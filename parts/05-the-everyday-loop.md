<!-- bite-size-nav -->
> Part 5 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

# Part 5 — The everyday loop: status → add → commit

This is the heart of Git — the loop you'll run hundreds of times. Do this hands-on in the `practice-game` folder from Part 2 (or any fresh folder — never someone else's real project for practice).

### `git init` — "Start watching this folder"

```
$ cd ~/practice-game
$ git init
Initialized empty Git repository in C:/Users/you/practice-game/.git/
```

Short for *initialize*. Git created the hidden `.git` folder (the save-data folder where all history will live). Your folder is now a **repository** — "repo," a folder Git is watching. Notice your prompt (the `$` line) now shows `(main)`: you're on the `main` branch (branch = timeline). Nothing has been saved yet — Git is watching, not saving. Saving is manual, and that's next.

> You only ever run `git init` **once per project**, at the very start. (And never inside a folder that's already a repo.)

### `git status` — "What do you see, Git?"

Your always-safe, use-constantly command. Right now it says (shortened — Git adds a few hint lines):

```
$ git status
On branch main
No commits yet
Untracked files:
        notes.txt
```

Translation: "I'm on the `main` timeline. No save points exist yet. I can see `notes.txt`, but it's **untracked** — I've never saved it and I'm not responsible for it." Untracked = new to Git, not in any snapshot yet.

Put a line of text in the file so there's something to save (this `echo` trick writes text into a file — or just open it in any editor and type):

```
$ echo "player speed = 5" > notes.txt
```

### `git add` — "This goes in the next save point"

```
$ git add notes.txt
```

This *stages* the file — puts it in the staging area, the "what goes in the next save point" box from Part 3. Check the difference:

```
$ git status
Changes to be committed:
        new file:   notes.txt
```

"Changes to be committed" = in the box, ready. Two forms you'll use constantly:

```
$ git add notes.txt   # stage one specific file
$ git add .           # stage EVERYTHING changed in this folder ("." = here)
```

`git add .` is the everyday workhorse. Its one risk: it grabs *everything*, including junk you didn't mean to save — which is why `.gitignore` exists (a list of files Git should pretend not to see — Part 9).

### `git commit` — "Save point!"

```
$ git commit -m "Add player speed notes"
[main (root-commit) a1b2c3d] Add player speed notes
 1 file changed, 1 insertion(+)
```

The `-m` means **m**essage — the caption in quotes. (Forget `-m` and Git opens an editor to ask for one... possibly Vim. **Esc, `:q!`, Enter.**)

That `a1b2c3d` is the commit's **ID** (also called a *hash*): a unique fingerprint code Git generates to name each save point. You never memorize IDs — you copy-paste them when needed.

**Writing good captions:** finish the sentence *"This commit will…"* → "Add wall-jump", "Fix crash when inventory is empty", "Balance boss HP". Future-you, scrolling history at midnight for where a bug appeared, is the audience. ("Stuff", "asdf", and "more work" tell future-you nothing.)

### `git diff` — "What exactly did I change?"

Edit the file, then ask:

```
$ echo "player speed = 7" > notes.txt
$ git diff
-player speed = 5
+player speed = 7
```

Lines starting with `-` were removed; lines with `+` were added. `git diff` shows edits you haven't staged yet (staged = added to the next-save-point box); after staging, `git diff --staged` shows what's in the box. Long output opens the scrolling pager — `q` to quit. Perfect pre-commit ritual: *see* what you're about to save.

Commit the change:

```
$ git add .
$ git commit -m "Increase player speed after playtest"
```

### `git log` — "Show me the save points"

```
$ git log --oneline
f4e5d6c Increase player speed after playtest
a1b2c3d Add player speed notes
```

Newest first: each line is one commit — ID, then caption. Plain `git log` gives the long form (author, date); it opens in the pager, so scroll with arrows and **press `q` to quit**. This is why captions matter: `git log --oneline` of a well-captioned project reads like a changelog for free.

### The loop, forever

```
   ...edit files...
$ git status                    # what changed?
$ git diff                      # (optional) show me exactly
$ git add .                     # pack the box
$ git commit -m "what I did"    # save point!
   ...repeat until bedtime...
```

**When to commit?** Whenever the project runs and one new thing works. Finished a feature? Commit. Fixed a bug? Commit. About to try something scary? *Definitely* commit — that's the save point you'll reload if the scary thing explodes. Small frequent commits beat giant rare ones: more save points = more places to rewind to. There is no cost. Commits are instant and nearly free.

---
<!-- bite-size-nav -->
[⬅ Part 4 — One-time setup](04-one-time-setup.md) · [Index](../README.md) · [Part 6 — Branches: parallel timelines ➡](06-branches.md)
<!-- /bite-size-nav -->
