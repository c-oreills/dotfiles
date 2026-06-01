# Reading file contents

- To read specific lines from a file, use the `Read` tool with `offset` and `limit` parameters. Do not shell out to `sed -n '<start>,<end>p'`, `head`, `tail`, or `awk` for this purpose.
- This applies whether the goal is to view a single line, a small range, or a section of a large file.

# Checking PR / stack build status

- When I ask to check the build / CI / check status of a PR (or PRs, or "the stack"), run the `stack-ci` script (`~/.bin/stack-ci`) instead of assembling ad-hoc `gh pr checks` / `gh run view` commands.
- `stack-ci [<branch>|<pr-number>] [options]` reconstructs the full stack from PR base branches, reports per-PR pass/fail counts, and prints detailed error logs for failing GitHub Actions jobs. With no arg it uses the current HEAD's PR.
- Useful flags: `--no-logs` (status only, fast), `-c N` (context lines per error), `--full` (entire job logs), `--all` (all authors, not just mine). It's allowlisted, so it runs without a prompt.

# Writing scripts

- Write standalone helper/utility scripts (e.g. `~/.bin` tools) in Python, not bash — even for git/gh/CI glue. Default to `#!/usr/bin/env python3` with argparse/subprocess/json. Reserve bash for trivial one-liners.

# Scratch / temp files

- Never read from or write to `/tmp` (or any system temp dir) while working inside a git repo. The shared `/tmp` is world-writable, so scratch files there can leak to or be tampered with by other local processes.
- Instead, use the repo-local gitignored `tmp/` directory at the repo root (set up via the `~/.bin/repo-tmp` helper). It is private and already allowlisted in that repo's `.claude/settings.local.json`.
- If that `tmp/` directory does not exist in the current repo, stop and prompt me to set it up by running `repo-tmp` (rather than falling back to `/tmp`).
