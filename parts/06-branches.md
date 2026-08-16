<!-- bite-size-nav -->
> Part 6 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 5 — The everyday loop](05-the-everyday-loop.md) · [Index](../README.md) · [Part 7 — GitHub and remotes ➡](07-github-and-remotes.md)
<!-- /bite-size-nav -->
