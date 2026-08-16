<!-- bite-size-nav -->
> Part 11 of the [Git Bash Field Guide](../README.md). Every entry stands alone — no entry assumes you've read another one.
<!-- /bite-size-nav -->

# Part 11 — Glossary A–Z

Every entry stands alone — no entry assumes you've read another one.

**add / stage** — Put a change into the staging area (the "what goes into the next save point" box). Command: `git add`. "Staging a file" and "adding a file" mean the same thing.

**Bash** — The command language you type into the terminal: short instructions like `cd` (go to folder) and `ls` (list contents). Standard on Mac/Linux; Git Bash brings it to Windows.

**binary file** — A file that isn't human-readable text: images, audio, 3D models, executables, most Unity/Unreal files. Git stores them fine but can't show line-by-line changes in them or merge two people's edits to one — which is why game teams coordinate on scenes and use Git LFS (see LFS).

**branch** — A parallel timeline of the project. Work on a branch doesn't touch other branches, so `main` stays stable while experiments happen on the side. Timelines can be folded back together (see merge).

**checkout** — An older command (`git checkout`) that changed branches, restored files, and more, all in one confusing verb; you'll still see it constantly in tutorials. Modern Git split its jobs into `git switch` (change branch/timeline) and `git restore` (bring back a file's saved version).

**CLI / command line** — "Command Line Interface": controlling a computer by typing commands instead of clicking. The terminal window is where you do it.

**clone** — Download an entire repository (project + full history) from the internet to your computer, ready to use: `git clone <URL>`. Done once per project per machine.

**commit (noun)** — One saved snapshot of the whole project, with a caption, an author, a date, and an ID code. A save point. The project's history is a chain of commits.

**commit (verb)** — To create such a save point from whatever is in the staging area (the next-save-point box): `git commit -m "caption"`.

**conflict** — What happens when a merge (folding two timelines together) finds the same lines changed differently in each, and asks a human to choose. Announced with `CONFLICT`, marked in the file with `<<<<<<<` / `=======` / `>>>>>>>`. Annoying, normal, fixable — not damage.

**default branch (main / master)** — The branch (timeline) a project starts with and treats as official. Called `main` in modern projects, `master` in older ones — same concept, just a name.

**detached HEAD** — The state of looking directly at one old commit instead of standing on a branch (timeline). Sounds like a horror film; is actually read-only sightseeing. `git switch main` returns you to normal.

**diff** — The exact line-by-line difference between two versions: `-` lines removed, `+` lines added. `git diff` shows what you've changed but not yet staged (put in the next-save-point box).

**directory** — Folder. Same thing, older word. Appears inside command names: `pwd` (print working directory = show current folder), `mkdir` (make directory = make folder).

**fetch** — Download *information about* new commits from the remote (the online copy) without changing any of your files: `git fetch`. Window-shopping. (Contrast: pull, which downloads *and* blends in.)

**fork** — A GitHub-website concept (not a Git command): your own personal online copy of someone else's project, used to propose changes to projects you don't have edit rights on. Common in open source.

**Git** — The version-control program itself: software on your computer that snapshots a project over time so you can rewind, compare, and collaborate. Free, offline, no account.

**`.git` folder** — The hidden folder inside a repo where Git stores the entire history and settings. The repo's save-data. Never edit it by hand; deleting it deletes the project's history (current files survive).

**`.gitattributes`** — A small text file of per-file-type rules that lives in the repo. In this guide it appears as the list Git LFS writes its "route these file types through side-storage" rules into. Commit it, so teammates follow the same rules.

**GitHub / GitLab / Bitbucket** — Websites that host online copies of Git projects for backup and teamwork. GitHub is the most popular. None of them are Git itself — Git is the program; these are places it can sync with.

**`.gitignore`** — A text file listing files/folders Git should pretend not to see (engine caches, build output, logs). Keeps generated junk out of the project's history.

**hash / commit ID / SHA** — The unique fingerprint code naming each commit, like `f4e5d6c` (technically a "SHA-1 hash," hence the nicknames). Never memorized, always copy-pasted — from `git log`, usually.

**HEAD** — Git's name for "the exact spot in history you are currently standing on" — normally the newest commit of your current branch. Appears in messages and conflict markers; when you see it, read "my current position."

**index** — Another name for the staging area (the box of changes queued for the next commit/save point). Appears in some error messages; same thing as "staging area."

**LFS (Git LFS)** — "Large File Storage": a Git add-on that keeps big binary files (art, audio, models) in side-storage, leaving only tiny pointer notes in the repo so it stays small and fast to clone. Near-mandatory for Unreal, wise for any asset-heavy game project.

**line endings (LF / CRLF)** — The invisible characters marking "end of line" in a text file. Windows uses one pair (CRLF); Mac/Linux use another (LF). Git for Windows converts automatically, occasionally printing a harmless `LF will be replaced by CRLF` warning — informational, never a problem.

**local** — On *your* computer (your copy of the repo), as opposed to *remote* — the copy online. "Your local changes" = edits sitting on your machine.

**log** — The list of all commits (save points) so far, newest first: `git log`, or the compact `git log --oneline`. Press `q` to leave the scrolling view.

**main** — See *default branch*. The primary timeline; the version of the project that should always work.

**merge** — Fold one branch's (timeline's) changes into another: stand on the receiver, run `git merge other-branch`. Usually automatic; occasionally raises a conflict (see conflict) for a human to settle.

**origin** — The traditional nickname for a repo's main remote (the online copy's saved web address). Created automatically by `git clone`, or by you via `git remote add origin <URL>`. Just a saved address with a conventional name.

**pager** — The read-only scrolling viewer that long output (like `git log`) opens in — recognizable by `:` or `(END)` at the bottom. Scroll with arrows/space; **quit with `q`**.

**prompt** — The line the terminal prints when it's ready for input, ending in `$`. In a repo it also shows your current branch, like `(main)`.

**pull** — Download new commits (save points) from the remote (online copy) *and* blend them into your timeline: `git pull`. The start-of-session habit on any team.

**pull request (PR)** — A GitHub-website feature (not a Git command): a proposal to merge your branch, with a page where teammates review the changes, discuss, and click Merge. How teams do code review.

**push** — Upload your new commits (save points) to the remote (online copy): `git push`. Only commits travel — uncommitted edits stay behind, so commit first.

**remote** — A copy of the repo stored elsewhere, almost always on a hosting site like GitHub. Referred to by nickname (usually `origin`). "The remote" ≈ "the online copy."

**repository / repo** — A project folder that Git is tracking, including its entire history (kept in the hidden `.git` folder inside). "The repo" = the project-plus-its-history.

**reset** — Move your timeline backward to an older commit. Its `--hard` form **destroys** everything after that point, including unsaved work — the most dangerous everyday command. For shared history, use revert instead.

**restore** — Bring back the last committed (saved) version of a file, throwing away current edits: `git restore <file>`. Or un-stage without touching edits: `git restore --staged <file>`.

**revert** — Undo a commit *safely*, by creating a new commit that does the exact opposite: `git revert <ID>`. Nothing erased, history stays honest — the right undo for anything already pushed/shared.

**SSH / HTTPS** — Two ways your computer can connect to GitHub. HTTPS (web addresses starting `https://`) with the automatic browser sign-in is the beginner-friendly path; SSH uses stored keys and is a nice later upgrade. Both do the same job.

**stash** — A drawer for uncommitted work-in-progress: `git stash` empties your changes into it (folder snaps back to clean), `git stash pop` takes them back out. For "I must switch tasks mid-mess."

**staging area** — The box of changes queued for the next commit (save point). `git add` puts changes in; `git commit` seals the box into history. Exists so each save point can be one tidy idea. (Also called "the index.")

**switch** — Change which branch (timeline) you're standing on: `git switch main`, or create-and-go with `git switch -c new-branch`. Your folder's files change to match the chosen timeline.

**tag** — A permanent, human-friendly label pinned to one commit, like `v1.0` — a named save point for releases and builds: `git tag v1.0`, shared with `git push --tags`.

**terminal** — The window you type commands into. Interchangeable-in-practice words: console, shell, command line, CLI.

**tracked / untracked** — Tracked = a file Git has in at least one commit and is watching for changes. Untracked = a file Git can see in the folder but has never been told to save (`git status` lists these separately).

**upstream** — The remote branch your local branch is paired with (set by `git push -u ...`, where `-u` literally means "set upstream"). Once set, plain `git push` / `git pull` know where to go. In conversation it can also mean "the original project this was forked/copied from."

**version control** — Any system that records versions of files over time so you can go back, compare, and collaborate without overwriting each other. Git is the world's most-used one.

**working directory / working folder / working tree** — Your project files as they actually are right now on disk, edits and all — the "live" state, before anything is staged (boxed for the next save point) or committed (saved).

---
<!-- bite-size-nav -->
[⬅ Part 10 — Error messages, translated](10-errors-translated.md) · [Index](../README.md) · [Cheat sheet ➡](../cheat-sheet.md)
<!-- /bite-size-nav -->
