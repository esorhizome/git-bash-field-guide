<!-- bite-size-nav -->
> Part 9 of the [Git Bash Field Guide](../README.md). Lines starting with `$` are things you type — you don't type the `$` itself. Text after `#` is a comment the terminal ignores. Every term is explained right where it's used.
<!-- /bite-size-nav -->

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
<!-- bite-size-nav -->
[⬅ Part 8 — Undo and rescue](08-undo-and-rescue.md) · [Index](../README.md) · [Part 10 — Error messages, translated ➡](10-errors-translated.md)
<!-- /bite-size-nav -->
