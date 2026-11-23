#!/bin/bash -e

# This is an example of how to revert severl commits
# References:
# - https://gist.github.com/kanzure/5558267

# shellcheck source=examples/common.sh
source common.sh

common_setup
common_create_repo_with_commits demo 10 "name"
echo "before revert"
history_before=$(set -e; common_show_history demo)
lines_before=$(wc -l <<<"${history_before}")
common_cd_repo demo
git revert --no-edit HEAD~2 HEAD~4 HEAD~6 HEAD~8
common_cd_repo_back
history_after=$(set -e; common_show_history demo)
lines_after=$(wc -l <<<"${history_after}")
((lines_before+=4))
if [[ "${lines_before}" -ne "${lines_after}" ]]
then
	common_error "error"
fi
common_finish
