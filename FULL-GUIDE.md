# The Git Bash Field Guide
### Plain-language Git + Git Bash for game developers (and everyone else)

---

## How this guide works — read this first

- **Every technical word gets re-explained, every time it appears.** You will never need to remember a definition from three pages ago. If a term shows up, its meaning is right there next to it.
- **You don't have to read in order.** Jump to whatever you need. Every part stands on its own.
- **You are not supposed to memorize any of this.** Professional developers look this stuff up every single day. Looking things up *is* the skill. That's what the Glossary (Part 11) and Cheat Sheet (Part 12) at the back are for.
- **You can't break anything by looking.** Several commands only *show* you information and never change anything: `pwd`, `ls`, `git status`, `git log`, `git diff`. When in doubt, look first. This guide will always warn you clearly before any command that can destroy work.
- **"Try it" blocks are meant to be typed.** Reading about Git doesn't build confidence — typing does. Everything hands-on here happens in a throwaway practice folder, so there's zero risk to your real projects.
- **Reading conventions:** lines starting with `$` are things you type (don't type the `$`); text after a `#` is a comment the terminal ignores, so examples are safe to copy-paste whole.

---

## Table of contents

- **Part 0 — What even is Git Bash?**
- **Part 1 — Terminal survival skills** (the keys that get you un-stuck)
- **Part 2 — Moving around: Bash basics**
- **Part 3 — The big picture: how Git thinks** (save points!)
- **Part 4 — One-time setup**
- **Part 5 — The everyday loop: status → add → commit**
- **Part 6 — Branches: parallel timelines**
- **Part 7 — GitHub and remotes: sharing your project**
- **Part 8 — Undo and rescue: the "oh no" section**
- **Part 9 — Game dev corner: .gitignore for Godot/Unity/Unreal, big files, team etiquette**
- **Part 10 — Error messages, translated**
- **Part 11 — Glossary A–Z**
- **Part 12 — Cheat sheet**

---


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


# Part 1 — Terminal survival skills

These few keys solve 90% of "help, I'm stuck" moments. This is the most rescue-per-word section in the guide.

### Nothing happens until you press Enter
You can type, edit, and backspace freely. A command only runs when you press **Enter**. Typing a command does nothing by itself.

### Up arrow = replay
**↑** brings back your previous command. Press it again for the one before that. **↓** goes forward again. Enormous time-saver — most terminal work is "the same five commands, repeated."

### Tab = autocomplete
Type the first few letters of a file, folder, or command, then press **Tab** — the terminal finishes the name for you. If nothing happens, press **Tab twice** to see all the possibilities. Use this constantly: it's faster *and* it prevents typos, because the terminal only completes names that actually exist.

### Ctrl+C = cancel (NOT copy!)
In a terminal, **Ctrl+C** means "stop whatever is running and give me my prompt back" (prompt = the `$` line where you type). Terminal frozen? Command taking forever? Typed half a command and want out? **Ctrl+C.** It cancels the current activity — it does not undo work that already finished, and it never deletes files.

### Stuck on a screen showing `:` or `(END)`? Press `q`
Some commands (like `git log`, which shows project history) open their results in a scrollable viewer called a *pager* (pager = a read-only screen for scrolling through long output — arrow keys or space to scroll). Your typing seems broken because the pager is waiting for *its* keys. **Press `q` (for quit)** and you're back to normal. This traps every beginner. Now it won't trap you.

### Trapped in a bizarre screen that ignores your typing? That's Vim
Sometimes Git opens a text editor *inside the terminal* to ask you for a message. By default that editor is **Vim**, which is famously confusing (typing doesn't insert text until you press special keys). The escape hatch, in order:

1. Press **Esc**
2. Type `:q!` (colon, q, exclamation mark)
3. Press **Enter**

You're out, and nothing was saved or harmed. Part 4 shows a one-line setting so Git opens a friendly editor instead and you never see Vim again.

### Copy and paste work differently here
Since **Ctrl+C** means "cancel" in a terminal, copy/paste has its own rules in the standard Git Bash window:

- **Copy:** just select text with the mouse — it's copied automatically. (Or select, then Ctrl+Insert.)
- **Paste:** **Shift+Insert**, or right-click → Paste, or a plain **middle-click** of the mouse wheel.

> **Running Git Bash inside Windows Terminal or VS Code instead?** There, copy/paste is **Ctrl+Shift+C** / **Ctrl+Shift+V** (and plain Ctrl+V usually works too). Same Bash, slightly different window rules.

### `clear` = clean screen
Type `clear` (or press **Ctrl+L**) to wipe the screen. Purely cosmetic — nothing is undone or deleted. Nice for reducing visual noise when the scrollback gets overwhelming.

### Spelling and lowercase matter
Bash is picky: commands are lowercase and exact. `git status` works; `Git Status` fails with `command not found`. A `command not found` message almost always just means "typo" — it's never damage.

### The safe-anytime commands
These only **look** — they cannot change or delete anything, ever:

```
pwd          ls          git status
git log      git diff    git branch
```

Feeling lost or nervous? Run `git status`. It's Git's way of telling you exactly what it currently sees. You'll use it more than any other command, and it never hurts.

---


# Part 2 — Moving around: Bash basics

The terminal is always "standing in" exactly one folder, and commands act on the folder you're standing in. So the first skill is moving around. (Heads up: terminals call folders **directories** — same thing, older word. This guide says "folder.")

### `pwd` — "Where am I?"

Stands for **p**rint **w**orking **d**irectory ("working directory" = the folder you're currently standing in). It prints that folder's full location:

```
$ pwd
/c/Users/you/projects
```

> **Windows note:** Git Bash writes paths its own way: `C:\Users\you` appears as `/c/Users/you` — the drive letter becomes `/c/`, and slashes lean forward. Same place, different spelling.

### `ls` — "What's in here?"

Short for **l**i**s**t. Shows what's in the current folder:

```
$ ls
Assets/   ProjectSettings/   README.md
```

Useful variations:

- `ls -a` — list **a**ll, *including hidden files*. Files whose names start with a dot (like `.gitignore`) are hidden by default. This is also how you can see the hidden `.git` folder — the folder where Git keeps a project's entire save history (much more on that in Part 3).
- `ls -l` — **l**ong form: adds file sizes and modified dates.

### `cd` — "Go to folder"

Short for **c**hange **d**irectory (directory = folder). Your main way of moving:

```
$ cd projects     # go into the "projects" folder (it must be inside the current one)
$ cd my-game      # then into "my-game"
$ cd ..           # go UP one level, to the parent folder (".." always means "the folder above me")
$ cd ~            # jump to your home folder ("~" = your home folder, C:\Users\YourName)
$ cd -            # jump back to wherever you just were (great "undo" for a wrong turn)
```

Three quality-of-life tricks:

- **Spaces in names need quotes:** `cd "My Cool Game"`. Without quotes, Bash thinks the space separates two different instructions. (This is why developers name folders `my-cool-game` instead — dashes dodge the problem entirely.)
- **Drag and drop:** drag a folder from Windows File Explorer onto the Git Bash window — its full path is typed for you. So "get to a deep folder" becomes: type `cd `, drag folder in, press Enter.
- **Even easier:** in File Explorer, right-click inside any folder and choose **"Open Git Bash here"** — a terminal opens already standing in that folder. (On Windows 11 this option hides behind **"Show more options"** in the right-click menu, or hold **Shift** while right-clicking.)

### `mkdir` — "Make a folder"

Short for **m**a**k**e **dir**ectory (directory = folder):

```
$ mkdir playtest-notes
```

### `touch` — "Make an empty file"

Creates a new empty file (or updates the timestamp of an existing one — hence "touch"):

```
$ touch notes.txt
```

### `cat` — "Show me a file's contents"

Prints a file's contents right in the terminal (the name is short for "concatenate," a historical accident — just think "show me the file"):

```
$ cat notes.txt
```

### `cp` and `mv` — copy and move

```
$ cp notes.txt notes-backup.txt   # copy: make "notes-backup.txt" as a duplicate of "notes.txt"
$ mv notes.txt design/            # move: relocate "notes.txt" into the "design" folder
$ mv notes.txt ideas.txt          # rename: "moving" a file onto a new name renames it
```

### `rm` — remove. ⚠️ The one Bash command to respect

```
$ rm oldfile.txt      # delete a file
$ rm -r oldfolder     # delete a folder and everything inside it ("-r" = recursive, meaning "and all contents")
```

> **⚠️ Careful:** `rm` does **not** use the Recycle Bin. Deleted means *gone*. Before pressing Enter on any `rm`, reread it once. (Good news: Part 8 shows how Git makes even deletions recoverable — for files Git has saved.)

### Two Windows-only superpowers

```
$ explorer .        # open the current folder in Windows File Explorer ("." means "here, this folder")
$ start file.png    # open a file with its normal Windows program (image viewer, editor, etc.)
```

You are never locked into the terminal — any time you'd rather see things as familiar icons and windows, `explorer .` and you're home.

### Try it — two minutes of moving around

```
$ cd ~                    # go home
$ mkdir practice-game     # make a practice folder (we'll reuse it all guide long)
$ cd practice-game        # step inside
$ pwd                     # confirm where you are
$ touch notes.txt         # make an empty file
$ ls                      # see it listed
$ cat notes.txt           # show its contents (empty, so: nothing — that's correct!)
```

That's the terminal: know where you are (`pwd`), see what's around (`ls`), move (`cd`), make things (`mkdir`, `touch`). Everything else is Git.

---


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


# Part 4 — One-time setup

Five minutes, once per computer, never again.

### 1. Check Git is installed

```
$ git --version
git version 2.55.0.windows.4
```

Any version number = you're fine. `command not found` = install from [gitforwindows.org](https://gitforwindows.org).

### 2. Tell Git your name and email

Every commit (commit = save point) is stamped with who made it — that's how a team's history shows who changed what. Git refuses to commit until it knows your name:

```
$ git config --global user.name "Your Name"
$ git config --global user.email "you@example.com"
```

(`--global` = "this setting applies to every project on this computer," not just the current folder. Use the email of your GitHub account if you have one, so the website credits your commits to you. **Privacy tip:** GitHub can give you a no-reply address to use here instead of your real email — on github.com: Settings → Emails → "Keep my email addresses private.")

### 3. Name the default timeline "main"

The starting branch (branch = timeline) is called `main` in modern setups, but some tools still default to the older name `master`. Same thing, just a name — but let's match the modern convention:

```
$ git config --global init.defaultBranch main
```

### 4. Escape Vim forever (recommended)

When Git needs to ask you for text, it opens an editor — by default Vim, the confusing in-terminal one from Part 1. If you use VS Code, make Git open that instead:

```
$ git config --global core.editor "code --wait"
```

No VS Code? Skip this; just remember the exit spell: **Esc, `:q!`, Enter.**

### 5. The line-endings thing (read once, then relax)

Windows and Mac/Linux end each line of a text file with different invisible characters (Windows uses a pair called "CRLF"; Mac/Linux use a single "LF" — you never see either, but programs care). Git for Windows smooths this over by converting automatically, and while doing so it sometimes prints:

```
warning: LF will be replaced by CRLF the next time Git touches it
```

**This is not an error and nothing is wrong** — it's Git narrating the conversion it's handling *for* you. The recommended Windows setting (the Git for Windows installer usually sets it already) is:

```
$ git config --global core.autocrlf true
```

That's the whole story. If you ever see that warning: shrug, continue.

### 6. Check your work

```
$ git config --list
```

Shows all your settings (it may open in the scrolling pager — press `q` to quit). See your name and email? Setup done, forever.

---


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


# Part 6 — Branches: parallel timelines

A **branch** is a parallel timeline of your project. The killer use for game dev: `main` (the default timeline) stays *always playable*, while risky experiments — new enemy AI, an inventory rewrite — happen on side branches. Experiment works? Fold it into `main`. Experiment dies? Delete the branch; `main` never knew.

### See your branches

```
$ git branch
* main
```

The `*` marks the timeline you're standing on. (Also always visible in your prompt: `(main)`.)

### Create one and switch to it

```
$ git switch -c enemy-ai
Switched to a new branch 'enemy-ai'
```

`git switch` moves between branches; `-c` means **c**reate this one first. Naming convention: short, lowercase, dashes — `enemy-ai`, `fix/jump-bug`, `experiment/fog`.

> **Old tutorials will say `git checkout -b enemy-ai`.** Same result. `checkout` is an older command that did many unrelated jobs; `switch` is its modern, clearer replacement. When a tutorial says `checkout` to change branches, read it as `switch`.

Now work normally — edit, `git add .`, `git commit -m "..."` — exactly the Part 5 loop. Every commit (commit = save point) you make lands on the `enemy-ai` timeline only. `main` is frozen where you left it.

### Switch back

```
$ git switch main
```

**The files in your folder physically change** to match the `main` timeline — your enemy-AI edits vanish from view. **This is normal, and nothing is lost:** the work is safely on the `enemy-ai` timeline, and `git switch enemy-ai` brings it all back. Branch switching = swapping which timeline your folder displays.

> If Git *refuses* to switch, complaining about "local changes" — you have unsaved edits it won't risk clobbering. Commit them, or stash them (stash = a drawer for work-in-progress, Part 8), then switch.

### `git merge` — fold a timeline in

When the experiment earns its place: stand on the branch that should *receive* the changes, and merge the other one in.

```
$ git switch main       # stand on the receiving timeline
$ git merge enemy-ai    # pull the enemy-ai work into it
```

`main` now contains everything from `enemy-ai`. Done with the branch? Tidy up:

```
$ git branch -d enemy-ai
```

(Lowercase `-d` is polite — it refuses if the branch has unmerged work. That refusal is a safety feature, not an error.)

See the timelines drawn as an actual map at any time:

```
$ git log --oneline --graph --all    # q quits the scrolling view
```

### Merge conflicts — not an emergency

Usually merging is automatic. But if **the same lines of the same file** were changed differently on both timelines, Git won't guess which version is right:

```
$ git merge enemy-ai
CONFLICT (content): Merge conflict in notes.txt
Automatic merge failed; fix conflicts and then commit the result.
```

Scary-looking. Actually fine. **Nothing is broken** — Git has paused mid-merge to ask a human. It marks the disputed spot inside the file like this:

```
<<<<<<< HEAD
player speed = 7
=======
player speed = 5
>>>>>>> enemy-ai
```

Decoded: between `<<<<<<< HEAD` and `=======` is *your current timeline's* version (HEAD = Git's name for "the spot you're currently standing on"). Between `=======` and `>>>>>>> enemy-ai` is the *incoming branch's* version. To resolve:

1. Open the file in any editor.
2. Keep what's right — either version, both, or something new entirely. Your call; you're the human Git asked.
3. **Delete the three marker lines** (`<<<<<<<`, `=======`, `>>>>>>>`).
4. Save, then seal the decision:

```
$ git add notes.txt
$ git commit -m "Merge enemy-ai, keep speed 7"
```

Merged. And if mid-conflict you'd rather just back out entirely:

```
$ git merge --abort    # eject: everything returns to how it was before the merge attempt
```

> **🎮 Game dev warning:** conflicts are only fixable like this in *text* files (code, JSON, Godot scenes). In *binary* files — Unity scenes, images, audio, 3D models — Git can't merge line-by-line at all, so prevention beats cure: **one person per scene/asset at a time.** Part 9 covers the etiquette.

---


# Part 7 — GitHub and remotes: sharing your project

A **remote** is a copy of your repo (repo = project folder + its save history) stored elsewhere — almost always on GitHub, the project-hosting website. It gives you an off-site backup, and it's the meeting point where a team exchanges commits (commits = save points). Two ways to start, depending on which exists first:

### Path A: the project already exists online → `git clone`

Someone shares a project (or you created one on github.com). Grab its URL (green **Code** button → HTTPS → copy), then:

```
$ cd ~/projects
$ git clone https://github.com/team/space-game.git
$ cd space-game
```

`clone` downloads the *entire* repo — every file **and every save point ever made** — into a new subfolder, already connected to the online copy. One command, fully set up. This is also how you get *your own* project onto a second computer.

### Path B: your project exists locally → connect it up

On github.com: **New repository**, name it, create it **empty** (skip the "add a README" checkbox — your project already has files; starting empty avoids the "unrelated histories" tangle translated in Part 10). GitHub then literally displays the commands to run, which will look like:

```
$ git remote add origin https://github.com/you/practice-game.git
$ git push -u origin main
```

Decoded:

- `git remote add origin <URL>` — "Save this web address under the nickname **origin**." That's all `origin` is: the traditional nickname every repo gives its main remote (remote = the online copy). Not magic, just a saved address.
- `git push -u origin main` — "Upload (**push**) my `main` branch to `origin`, and (`-u`) remember this pairing." Thanks to `-u`, every future upload is just plain `git push`.

Check what's saved any time with `git remote -v` — it lists the nicknames and the web addresses they point to (safe: it only looks).

> **First push?** A browser window pops up asking you to sign in to GitHub. Normal — that's Git for Windows handling your login securely. Roughly once per machine, then it remembers.

### The three verbs of online Git

**`git push` — upload my new save points**

```
$ git push
```

Sends commits that exist on your machine but not yet on the remote (remote = online copy). Push doesn't send loose edits — **only commits travel.** Commit first, then push.

**`git pull` — download everyone else's save points**

```
$ git pull
```

Fetches new commits from the remote and merges them into your timeline. **The team habit that prevents 90% of Git pain: pull before you start working, every session.** Starting from stale files is how conflicts breed.

**`git fetch` — check what's new, touch nothing**

```
$ git fetch
```

Downloads *information about* new remote commits without changing any of your files. Window-shopping. (`git pull` is literally fetch + merge in one step.) Optional for beginners — `pull` covers daily life.

### The solo-dev rhythm (using GitHub as backup)

```
work → add → commit → push at end of session. Done.
```

### The team rhythm

```
$ git pull    # ① start of session: get everyone's latest
   ...work, commit small and often (Part 5 loop)...
$ git pull    # ② before sharing: blend in anything new
$ git push    # ③ upload
```

If step ③ ever answers `rejected... the remote contains work that you do not have` — no problem: a teammate pushed while you worked. Run `git pull` (resolve a conflict if one appears — Part 6), then `git push` again.

### "Pull request" — a GitHub thing, not a Git thing

On teams you'll hear **pull request** ("**PR**"): a feature of the GitHub *website* — not a Git command — where you propose "please merge my branch into main," teammates review and comment on the changes, and someone clicks **Merge** on the web page. The flow: push your branch (`git push -u origin my-branch`), open github.com, click the green **"Compare & pull request"** button, describe what you did. It's code review with a comment thread; the Git you already know is doing the work underneath.

---


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


# Part 9 — Game dev corner

Game projects strain Git in specific ways: engines generate mountains of junk files, and game assets are huge binary files (binary = not human-readable text — images, audio, models, most scene files). This part is the difference between a smooth repo and a 4 GB nightmare nobody can clone.

## `.gitignore` — the "pretend these don't exist" list

A **`.gitignore`** is a plain text file, named exactly that (dot included, no other extension), sitting at the top level of your repo (repo = the folder Git watches). Every file or folder matching a line in it becomes invisible to Git: never listed by `git status`, never grabbed by `git add .`, never uploaded.

**Why it's essential for game dev:** engines auto-generate caches, build output, and per-machine settings. These are *huge*, *different on every computer*, and *fully regenerable* — the engine rebuilds them on demand. Committing them bloats the repo and creates fake conflicts between teammates. Golden rule: **commit what you create; ignore what the engine generates.**

Syntax is simple — one pattern per line (this block is safe to copy-paste as-is; lines starting with `#` are comments):

```
# Lines starting with # are comments, for humans
# A trailing / means "this is a folder"
Library/

# * means "anything", so this ignores every file ending in .log
*.log

# build output
build/

# ! means "exception — do NOT ignore this one after all"
!important.log
```

> **⚠️ Create the `.gitignore` FIRST — before your first `git add`.** It only affects files Git isn't already tracking. If junk already slipped into a commit, ignoring it later isn't enough; you must also tell Git to stop tracking it: `git rm -r --cached Library/` then commit. (`--cached` = "forget it from Git's tracking but leave the actual folder on my disk alone.")
>
> **Easiest correct start:** when creating a repo on github.com, pick a ready-made `.gitignore` template from its dropdown (Unity, UnrealEngine, Godot, and dozens more exist). Or grab the same templates from [github.com/github/gitignore](https://github.com/github/gitignore). The short versions below cover the core; the official templates are longer and also fine.

### Unity

```
# --- Unity .gitignore (core) ---
[Ll]ibrary/
[Tt]emp/
[Oo]bj/
[Bb]uild/
[Bb]uilds/
[Ll]ogs/
[Uu]ser[Ss]ettings/
[Mm]emoryCaptures/
.vs/
*.csproj
*.sln
```

(The `[Ll]` pattern means "capital or lowercase L" — catches `Library` and `library`.)

**Commit:** `Assets/`, `Packages/`, `ProjectSettings/`. **Ignore:** everything above — `Library/` alone is often gigabytes of pure cache.

Two Unity-specific musts:

- **Always commit `.meta` files.** Unity creates a `.meta` sidekick file for every asset — it's the asset's ID card, holding the ID other objects use to reference it. Lose a `.meta` and every reference to that asset breaks ("missing script/prefab" errors). The templates above deliberately do *not* ignore them.
- **One-time project settings:** in Unity, *Edit → Project Settings → Editor* → set **Version Control: Visible Meta Files** and **Asset Serialization: Force Text**. "Force Text" makes Unity write scenes and prefabs as text instead of binary, which lets Git at least *show* changes — and occasionally merge them. (Recent Unity versions ship with both already set — worth thirty seconds to confirm.)

### Unreal Engine

```
# --- Unreal .gitignore (core) ---
Binaries/
DerivedDataCache/
Intermediate/
Saved/
.vs/
*.sln
```

**Commit:** `Content/`, `Config/`, `Source/`, the `.uproject` file — and if you use plugins, each plugin's source under `Plugins/` (the patterns above have no leading `/`, so they automatically also catch the generated `Binaries/` and `Intermediate/` folders *inside* every plugin — handy).

**Unreal reality check:** almost everything you make in-editor (`.uasset`, `.umap`) is *binary* — Git can't show differences in it or merge it. Two consequences: **Git LFS (next section) is effectively mandatory** for Unreal, and only one person should edit a given asset or level at a time (etiquette below).

Three more Unreal-specific notes:

- **UE5's "One File Per Actor" helps teams.** With World Partition / One File Per Actor enabled, each actor placed in a level is stored as its own tiny file (under `Content/__ExternalActors__/` and `__ExternalObjects__/`) instead of one giant level file — so two people editing different parts of the same map no longer collide. Commit those folders like any other content.
- **The editor has revision control built in.** Unreal's Revision Control menu can connect to Git (via the bundled Git plugin) and offers a *visual diff* for Blueprints — a picture of what changed, since Blueprint files aren't readable text. Setting that up is beyond this guide, but know it exists; many teams simply use Git Bash alongside the editor.
- **C++ projects:** your own code lives in `Source/` (commit it); everything the compiler produces lands in the ignored folders above. If Visual Studio files feel missing after cloning, right-click the `.uproject` → *Generate Visual Studio project files* — they're regenerable, which is exactly why they're ignored.

### Godot

```
# --- Godot .gitignore (core) ---
# Godot 4 — the generated cache folder
.godot/
# Godot 3 — its older equivalent
.import/
# generated translation files
*.translation
# export settings — can contain android keystore/signing PASSWORDS, so
# the official template keeps it out of the repo to be safe
export_presets.cfg
```

**Commit:** your scenes, scripts, assets, and `project.godot`. Good news: Godot is the most Git-friendly engine here — its scene files (`.tscn`) and resources (`.tres`) are *text*, so `git diff` (show what changed) and even merges often just work.

(About `export_presets.cfg`: if yours contains no passwords and the team wants to share export settings, committing it is a valid choice — just look inside the file first before deciding.)

## Git LFS — Large File Storage

**The problem:** Git saves the full story of every file, forever. For code that's cheap. For a 300 MB `.psd` edited weekly, every version stays in the repo's history *permanently* — cloning eventually means downloading tens of gigabytes. Also, GitHub flatly **rejects any single file over ~100 MB**.

**The fix:** **Git LFS** (Large File Storage) — a free Git add-on that stores big files in a separate side-storage. Inside the repo, each big file is replaced by a tiny pointer note ("the real file lives in side-storage, fetch on demand"), so the repo itself stays small and fast. You work completely normally; LFS shuffles the real files behind the scenes. (It's included with Git for Windows; on Mac/Linux it may need a one-off install.)

Setup — once per machine:

```
$ git lfs install
```

Then, per project, declare which *types* of files LFS should handle — **before committing any of them:**

```
$ git lfs track "*.psd"
$ git lfs track "*.wav"
$ git lfs track "*.fbx"
$ git lfs track "*.uasset"    # Unreal folks: this one and *.umap
```

Each `track` line writes into a small text file called `.gitattributes` — LFS's tracking list, which **must be committed** so teammates' Git follows the same rules:

```
$ git add .gitattributes
$ git commit -m "Track large binary types with LFS"
```

From then on: the normal loop (`add`, `commit`, `push`) — LFS is invisible day-to-day. Run `git lfs track` with nothing after it to see the current list. Typical types worth tracking: source art (`.psd`, `.blend`, `.fbx`), audio (`.wav`, `.mp3`, `.ogg`), video (`.mp4`), archives (`.zip`), and for Unreal `.uasset`/`.umap`. Heads-up: hosting sites give LFS a free storage/bandwidth allowance and charge beyond it — fine for most indie projects, worth knowing it exists.

## Team etiquette for game repos

- **Binary files cannot be merged — so don't race on them.** If two people edit the same Unity scene or Unreal map, one person's work *will* be thrown away (a conflict on a binary file forces choosing one whole version). Prevention is social, not technical: claim loudly — "I'm in MainLevel today" — and split work into many small scenes/prefabs so people rarely collide.
- **Pull before you start, every session** (pull = download teammates' new save points). Working from stale files breeds conflicts.
- **Commit and push scene/asset work promptly.** The longer a binary file sits changed only on your machine, the bigger the collision window.
- **Keep builds out of the repo.** The playable `.exe`/`.apk` is generated output — huge and regenerable. Ship builds via itch.io, Steam, or GitHub's "Releases" page instead. And mark the moment in history with a **tag** (tag = a permanent human-friendly name pinned on one commit):

```
$ git tag v0.3
$ git push --tags
```

Later, `git log --oneline` shows exactly which save point was "the build we sent to playtesters."

- **Game jam mode:** commit every single time the game runs. Jam disasters at 3 a.m. are legendary; a save point every few minutes makes them funny instead of fatal.

---


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

# Part 12 — Cheat sheet


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

---

## You're ready

If you remember nothing else: **`git status` never hurts, `q` quits, Ctrl+C cancels, and committed work is almost never truly lost.** Commit small and often — every save point is a place future-you can reload. The rest is looking things up, which is not cheating; it's the job.
