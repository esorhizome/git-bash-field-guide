<!-- bite-size-nav -->
> Part 1 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Every term is explained right where it's used; nothing assumes you've read the other parts.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 0 — What even is Git Bash?](00-what-is-git-bash.md) · [Index](../README.md) · [Part 2 — Moving around: Bash basics ➡](02-moving-around-bash-basics.md)
<!-- /bite-size-nav -->
