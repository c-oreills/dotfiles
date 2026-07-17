# Reading file contents

- To read specific lines from a file, use the `Read` tool with `offset` and `limit` parameters. Do not shell out to `sed -n '<start>,<end>p'`, `head`, `tail`, or `awk` for this purpose.
- This applies whether the goal is to view a single line, a small range, or a section of a large file.

# Running awk

- Never invoke bare `awk`. Always run it as `gawk --sandbox ...` (gawk installed via Homebrew), with `--sandbox` placed immediately after `gawk`.
- `--sandbox` disables `system()`, `getline`/`print` input/output redirection, and dynamic extensions, so the program can only read its input (stdin / file operands) and print to stdout. Bare `awk` can execute shell commands and write files, which is why it triggers a permission prompt; `gawk --sandbox` is allowlisted and runs without one.
- This is for filtering/printing only. To read specific file contents, still use the `Read` tool (see above), not awk.

# Checking PR / stack build status

- When I ask to check the build / CI / check status of a PR (or PRs, or "the stack"), run the `stack-ci` script (`~/.bin/stack-ci`) instead of assembling ad-hoc `gh pr checks` / `gh run view` commands.
- `stack-ci [<branch>|<pr-number>] [options]` reconstructs the full stack from PR base branches, reports per-PR pass/fail counts, and prints detailed error logs for failing GitHub Actions jobs. With no arg it uses the current HEAD's PR.
- Useful flags: `--no-logs` (status only, fast), `-c N` (context lines per error), `--full` (entire job logs), `--all` (all authors, not just mine). It's allowlisted, so it runs without a prompt.

# Consolidating fixups

- When I ask to "consolidate fixups" / "collapse fixups" / similar in the context of the replay-fixup workflow, run `~/.bin/consolidate-fixups` instead of writing an inline `GIT_SEQUENCE_EDITOR` script.
- `consolidate-fixups [<base>] [options]` collapses multiple `fixup!` commits per target into exactly one consolidated `fixup!` commit per target (preserving the reviewable shape — a plain `--autosquash` would merge them into the target and destroy that). With no arg it auto-detects the merge base vs `origin/develop`.
- Useful flags: `-n` / `--dry-run` (print the rewritten todo list without rebasing), `--base BASE` (alternative to the positional arg). It's allowlisted, so it runs without a prompt. Pre-flight refuses to run on a dirty tree or while another rebase is in progress.

# Writing scripts

- Write standalone helper/utility scripts (e.g. `~/.bin` tools) in Python, not bash — even for git/gh/CI glue. Default to `#!/usr/bin/env python3` with argparse/subprocess/json. Reserve bash for trivial one-liners.

# Replay-fixup work pattern

- When I ask for a "replay-fixup", I'm asking to introduce one or more changes into an existing commit stack as reviewable `fixup!` commits — not amended in place, and not squashed.
- Step 1 — locate (this is your job; I won't hand you SHAs): find the relevant place(s) where each change should be introduced — i.e. which existing commit each change logically belongs to (the one that introduced the code/context it modifies). Determine the target commits yourself.
- Step 2 — rewind: run `~/.bin/git-edit-commits <sha>...` to start an interactive rebase that pauses (`edit`) at those commits, with `--update-refs` (its default). No autosquash. This puts the working tree in the state of the world at each commit.
- Step 3 — change: at each pause, make that commit's change against the paused state.
- Step 4 — fixup commit: create a NEW commit with `git commit --fixup=<target-sha>` (not `--amend`). Passing the SHA is just a lookup — git resolves it immediately to the target's subject and records the message as `fixup! <subject>`; the SHA is never stored. That subject line is what makes the fixup survive further rebases (SHAs churn, subjects don't) and is what `--autosquash` later matches on. So locating by SHA is fine; just make sure the target's subject is unique in the stack, or the eventual autosquash match is ambiguous.
- Step 5 — continue: run `git rebase --continue` to replay the rest. Leave the `fixup!` commits standing — do NOT autosquash.
- I review the standalone `fixup!` commits and squash them myself later (e.g. `git rebase -i --autosquash`). Squashing is never part of this pattern.
- This needs `git commit` to be allowlisted. Without it the fallback is only `git commit --amend` of the paused commit, which folds the change in and defeats the reviewable-fixup goal.

# Scratch / temp files

- Never read from or write to `/tmp` (or any system temp dir) while working inside a git repo. The shared `/tmp` is world-writable, so scratch files there can leak to or be tampered with by other local processes.
- Instead, use the repo-local gitignored `tmp/` directory at the repo root (set up via the `~/.bin/repo-tmp` helper). It is private and already allowlisted in that repo's `.claude/settings.local.json`.
- If that `tmp/` directory does not exist in the current repo, stop and prompt me to set it up by running `repo-tmp` (rather than falling back to `/tmp`).
