<!-- bite-size-nav -->
> Part 8 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

# Part 8 — Undo and rescue: the "oh no" section

The section to keep bookmarked. First, the rule that defuses most disasters:

> **When panicking: stop. Run `git status` (always safe — it only looks). Read what it says. If truly worried, copy your whole project folder in File Explorer as a raw backup — then nothing you try can make things worse.** Never run commands you found on the internet without knowing what they do — *especially* anything containing `--force`.

And the comforting truth: **once work is committed (commit = save point), it is very hard to permanently lose.** Nearly everything in Git is recoverable. The genuinely dangerous zone is small, and clearly fenced below.

### "I ruined a file — give me the last saved version back"

```
$ git restore notes.txt
```

Throws away your *uncommitted* edits to that file and restores it to the latest commit. ⚠️ **Those edits are gone for real** (they were never in a save point, so there's nothing to recover them from). Be sure you want this.

### "I staged something I didn't mean to" (added to the next-save-point box)

```
$ git restore --staged secrets.txt
```

Takes it back *out of the box*. The file itself is untouched — your edits are all still there. This only changes what the next commit will include. Totally safe.

### "I just committed with the wrong message"

```
$ git commit --amend -m "The message I meant"
```

Rewrites the most recent commit's caption.

### "I just committed but forgot a file"

```
$ git add the-forgotten-file.txt
$ git commit --amend --no-edit
```

Adds it into the previous commit as if it was always there (`--no-edit` = keep the same caption).

> ⚠️ **Only amend commits you haven't pushed yet.** Amending rewrites history, and rewriting history that teammates already downloaded creates a mess. Already pushed? Just make a new commit with the fix — completely fine, nobody cares.

### "I'm mid-mess and suddenly need to switch tasks"

Half-finished work, not commit-worthy, but the boss bug needs fixing *now*:

```
$ git stash        # shove all uncommitted work into a drawer; folder snaps back to clean
   ...fix the urgent thing, commit it...
$ git stash pop    # reopen the drawer; your half-done work returns exactly as it was
```

**Stash** = Git's work-in-progress drawer. (`git stash list` shows what's in it — stashes are easy to forget about.)

### "That commit was a mistake — undo it, safely"

```
$ git log --oneline    # find the bad commit's ID (the code like f4e5d6c); q quits
$ git revert f4e5d6c
```

**Revert** makes a *new* commit that does the exact opposite of the bad one. Nothing is erased — history honestly shows both the mistake and the fix, which is why revert is **the safe undo, fine even on pushed/shared work.** (It may open an editor for the new commit's message — remember: Vim's exit is Esc, `:wq`, Enter to accept, or skip the editor entirely with `git revert f4e5d6c --no-edit`.)

### ⚠️⚠️ "Erase recent history — really reload an old save"

```
$ git reset --hard a1b2c3d
```

Drags your timeline back to commit `a1b2c3d` and **destroys everything after it: later commits AND all uncommitted work, no confirmation, no recycle bin.** The most dangerous command in this guide — `git reset --hard` and its cousin `git clean` (which bulk-deletes files Git isn't tracking) are the two commands here that can truly destroy work. On anything shared, use `revert` instead. Before ever running this, make that File-Explorer backup copy.

### "I think I just lost commits" — the safety net under the safety net

```
$ git reflog
```

Git's private diary of *every* position you've been at — even ones deleted by `reset --hard`. Find the lost commit's ID in the list (q quits), then `git switch -c rescue f4e5d6c` resurrects it on a new branch. You may never need this. Knowing it exists is why you can relax: **committed work is almost never truly gone.**

---
<!-- bite-size-nav -->
[⬅ Part 7 — GitHub and remotes](07-github-and-remotes.md) · [Index](../README.md) · [Part 9 — Game dev corner ➡](09-game-dev-corner.md)
<!-- /bite-size-nav -->
