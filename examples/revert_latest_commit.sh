#!/bin/bash -e

# https://devconnected.com/how-to-undo-last-git-commit/
# This demos shows how to revent the lastest commit
# using the:
# $ git revert HEAD --no-edit
# command.
# It also checkes that the history is one less

# shellcheck source=examples/common.sh
source common.sh

common_setup
common_create_repo_with_commits demo 5 "commit"
echo "before revert"
common_show_history demo
history_before=$(set -e; common_show_history demo)
lines_before=$(wc -l <<<"${history_before}")
common_cd_repo demo
git revert HEAD --no-edit
common_cd_repo_back
common_show_history demo
echo "after revert"
history_after=$(set -e; common_show_history demo)
lines_after=$(wc -l <<<"${history_after}")
((lines_before=lines_before+1))
if [[ "${lines_before}" -ne "${lines_after}" ]]
then
	common_error "error"
fi
common_finish
