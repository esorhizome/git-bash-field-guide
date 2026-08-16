<!-- bite-size-nav -->
> Part 2 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 1 — Terminal survival skills](01-terminal-survival-skills.md) · [Index](../README.md) · [Part 3 — How Git thinks ➡](03-how-git-thinks.md)
<!-- /bite-size-nav -->
