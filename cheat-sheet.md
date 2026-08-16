# Git Bash — printable cheat sheet

One page of everything daily. You're allowed to look things up forever — everyone does. (Prefer a nicely formatted printout? Open [cheat-sheet.html](cheat-sheet.html) in a browser and press Ctrl+P.)

### Panic keys — when stuck, start here

| Key | When |
|---|---|
| **Ctrl+C** | Cancel whatever's happening; get the `$` back (it's NOT "copy" here) |
| **`q`** | Leave a scrolling view showing `:` or `(END)` |
| **Esc `:q!` Enter** | Escape the Vim editor, saving nothing |
| **↑** / **Tab** | Replay last command / autocomplete a name |
| `git status` | Always safe. When in doubt, run it and read it |

### Safe anytime — these only look, never change

```
pwd    ls    git status    git log    git diff    git branch    git remote -v
```

### Getting around (Bash)

| Command | Plain meaning |
|---|---|
| `pwd` | Where am I? |
| `ls` (`ls -a`) | What's in here? (`-a`: include hidden files) |
| `cd folder` / `cd ..` / `cd ~` / `cd -` | Enter folder / go up / go home / go back |
| `mkdir name` | Make a folder |
| `touch name` | Make an empty file |
| `cat file` | Show a file's contents |
| `cp a b` / `mv a b` | Copy / move-or-rename |
| `rm file` ⚠️ | Delete — permanent, no Recycle Bin |
| `clear` | Clean the screen (cosmetic only) |
| `explorer .` | Open this folder in File Explorer (Windows) |

### The everyday loop

| Command | Plain meaning |
|---|---|
| `git init` | Start watching this folder (once per project) |
| `git status` | What do you see, Git? (always safe) |
| `git add file` / `git add .` | Box this change / box everything, for the next save point |
| `git commit -m "caption"` | Save point! |
| `git diff` (`--staged`) | Show my unsaved edits (or what's boxed), line by line |
| `git log --oneline` | List all save points (`q` quits) |

### Branches (parallel timelines)

| Command | Plain meaning |
|---|---|
| `git branch` | List timelines (`*` = you are here) |
| `git switch -c name` | New timeline + go there |
| `git switch name` | Move to a timeline |
| `git merge name` | Fold that timeline into this one |
| `git branch -d name` | Delete a merged timeline |
| `git merge --abort` | Eject from a conflicted merge |
| `git log --oneline --graph --all` | Draw the timeline map |

### Online (GitHub)

| Command | Plain meaning |
|---|---|
| `git clone URL` | Download a whole project, first time |
| `git push` | Upload my new save points |
| `git pull` | Download + blend in everyone else's |
| `git push -u origin main` | First-ever push: upload and remember the pairing |
| `git fetch` | Check what's new without changing my files |
| `git remote -v` | Show saved online addresses |

### Undo & rescue

| Command | Plain meaning |
|---|---|
| `git restore file` ⚠️ | Discard my edits; back to last save (edits gone for real) |
| `git restore --staged file` | Take out of the box; edits untouched (safe) |
| `git commit --amend -m "..."` | Fix the last caption (only if not pushed) |
| `git stash` / `git stash pop` | Drawer my half-done work / take it back out |
| `git revert ID` | Safe undo: new save point cancelling an old one |
| `git reset --hard ID` ⚠️⚠️ | Erase history back to a save point — destroys work |
| `git reflog` | Diary of everywhere I've been; finds "lost" commits |

### Game dev extras

| Command | Plain meaning |
|---|---|
| `git lfs install` | Turn on Large File Storage (once per machine) |
| `git lfs track "*.psd"` | Route this file type through LFS (then commit `.gitattributes`) |
| `git rm -r --cached folder/` | Stop tracking committed junk (file stays on disk) |
| `git tag v0.3` + `git push --tags` | Name this save point (e.g. a playtest build) |

**Engine rules of thumb:** commit what *you* create; ignore what the engine generates. Unity: keep `Assets/ Packages/ ProjectSettings/` + all `.meta` files; ignore `Library/`. Unreal: keep `Content/ Config/ Source/ *.uproject`; ignore `Binaries/ DerivedDataCache/ Intermediate/ Saved/`; use LFS for `.uasset`/`.umap`. Godot: keep scenes/scripts/`project.godot`; ignore `.godot/` (v4) or `.import/` (v3).

**The whole of Git in one line:** edit → `add` → `commit` → `push` · `pull` to get everyone else's saves.
