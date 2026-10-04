# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `examples/create_one_user_with_feature_branch.sh:18` - calls `common_create_commits` without sourcing `common.sh`, so the script dies with "command not found" (exit 127, verified); the same happens at `examples/create_two_users_feature_branches.sh:21` and `examples/create_two_users_working_on_master_with_unpushed_changes.sh:17`. Source `common.sh`, and note that `common_create_commits` expects a repo under `playground/` (`common.sh:24`), not the `user1`/`server` dirs these scripts create in cwd - pass the right path or create the clones under `playground/`.
- `examples/create_one_user_with_commits.sh:7` - a stray `common_` line aborts the script (exit 127, verified); beyond that, `cd ../../` at line 16 climbs two levels out of `user1` and `common_create_commits user1` looks for `playground/user1`, which is never created. Rewrite the script on top of the `common_*` helpers.
- `examples/remove_history_2.sh:14` - calls `commits`, which is defined nowhere (exit 127, verified); use `common_create_commits` (with a `playground/` repo) or an inline loop.
- `solutions/04_merge_vs_rebase.sh:4` - `source common.sh` fails because `common.sh` lives in `examples/`, so the solution exits immediately (exit 1, verified); source `../examples/common.sh` relative to the script dir (`$(dirname "$0")`).

## Medium

- `examples/common.sh:26` - `common_create_commits` runs `git rev-parse --abbrev-ref HEAD` before the `cd` at line 27, i.e. in the caller's directory: it records the branch of whatever repo encloses the examples dir, and outside a git checkout with commits every helper-based demo (`simple.sh`, `bisect.sh`, `reset_hard.sh`, ...) aborts with "ambiguous argument 'HEAD'" (verified). Move the `rev-parse` after the `cd`.
- `examples/common.sh:90` - `rm -rf playgroud/{server,user1,user2}` misspells `playground`, so stale clones are never removed and the `git clone` at line 92 fails whenever the function runs without a prior `common_cleanup`; fix the path.
- `examples/rebase_vs_merge.sh:20` - calls `debug` and `git_common_waitkey` (line 27 and onwards), which do not exist (`common.sh` defines `common_debug` and `common_waitkey`); the failures are hidden only because the whole run is wrapped in `{ ... } 1>/dev/null 2>/dev/null || true` (line 82). Same at `solutions/04_merge_vs_rebase.sh:20,27`. Use the `common_*` names and drop the `|| true` so real failures surface.
- `doc/fast_forward.txt:32` - says a merge pull yields the linear history `c1, c2, c3, a1, a2, a3, b1, b2, merge commit` and (line 35) that pushing afterwards changes the server's history; both are wrong (a merge keeps both lines as parents and a push of a merge only adds commits). Line 39's claim about commits keeping their checksums under rebase is also wrong. Correct the notes.

## Low

- `examples/remove_history.sh:17` - `rm -rf pytconf` and the second clone run inside the first `pytconf` clone (cwd changed at line 13), producing `pytconf/pytconf`; `cd ..` before line 17.
- `examples/.gitignore:1` - ignores only `/playground`, but many scripts create `server`, `user1`, `user2`, `example`, `project`, `pytconf` directly in `examples/`; move them under `playground/` or ignore those names.
- `examples/rebase_vs_merge.sh:65` - writes to fixed `/tmp/log1_*`/`/tmp/log2_*` paths (also `solutions/04_merge_vs_rebase.sh:70`, `examples/same_time_commit_of_same_data.sh:13`); use `mktemp` or the `playground/` dir.
- `README.md:1` - README is only the title; describe the `examples/`, `exercises/`, `solutions/` and `bare_commands/` layout and that the scripts must be run from inside `examples/` (they `source common.sh` relative to cwd).
