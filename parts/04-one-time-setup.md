<!-- bite-size-nav -->
> Part 4 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Every term is explained right where it's used.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 3 — How Git thinks](03-how-git-thinks.md) · [Index](../README.md) · [Part 5 — The everyday loop ➡](05-the-everyday-loop.md)
<!-- /bite-size-nav -->
