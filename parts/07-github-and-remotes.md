<!-- bite-size-nav -->
> Part 7 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 6 — Branches: parallel timelines](06-branches.md) · [Index](../README.md) · [Part 8 — Undo and rescue ➡](08-undo-and-rescue.md)
<!-- /bite-size-nav -->
