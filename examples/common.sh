# shellcheck shell=bash
function common_cleanup() {
	rm -rf playground
}

redirect=false

function common_setup() {
	common_cleanup
	if ${redirect}
	then
		exec &>/dev/null
	fi
}

function common_finish() {
	common_cleanup
}

function common_create_commits() {
	local repo=$1
	local number=$2
	local name=$3
	local folder="playground/${repo}"
	local branch
	branch=$(git rev-parse --abbrev-ref HEAD)
	cd "${folder}" || exit
	((x=1))
	while [ "${x}" -le "${number}" ]
	do
		touch "${name}_${x}"
		git add "${name}_${x}" > /dev/null
		git commit -m "${branch} - ${name} - ${x}" > /dev/null
		((x=x+1))
	done
	cd ../../
}

function common_cd_repo() {
	local repo=$1
	local folder="playground/${repo}"
	cd "${folder}" || exit
}

function common_cd_repo_back() {
	cd ../../ || exit
}

function common_show_history() {
	local repo=$1
	local folder="playground/${repo}"
	cd "${folder}" || exit
	git log --pretty=format:"%h %s" --graph
	cd ../../ || exit
}

function common_log() {
	local repo=$1
	local folder="playground/${repo}"
	cd "${folder}" || exit
	git log
	cd ../../ || exit
}

function common_create_repo() {
	local repo=$1
	local name=$2
	local folder="playground/${repo}"
	git init "${folder}" > /dev/null
}

function common_create_repo_with_one_commit() {
	local repo=$1
	local name=$2
	local folder="playground/${repo}"
	git init "${folder}" > /dev/null
	common_create_commits "${repo}" 1 "${name}"
}

function common_create_repo_with_commits() {
	local repo=$1
	local number=$2
	local name=$3
	local folder="playground/${repo}"
	git init "${folder}"
	common_create_commits "${repo}" "${number}" "${name}"
}

function common_server_two_users() {
	rm -rf playgroud/{server,user1,user2}
	git init --bare playground/server
	git clone playground/server playground/user1
	git clone playground/server playground/user2
	cd playground/user1 || exit
	touch hello.txt
	git add hello.txt
	git commit -m "first commit"
	git push
	cd ../user2 || exit
	git pull
	cd ../../ || exit
}

do_wait=0

function common_waitkey() {
	if [[ "${do_wait}" -eq 1 ]]
	then
		read -r
	fi
}

debug=false

function common_debug() {
	local msg=$1
	if "${debug}"
	then
		echo "${msg}"
	fi
}

function common_error() {
	local msg=$1
	echo "${msg}" 1>&2
}

notice=false

function common_notice() {
	local msg=$1
	if "${notice}"
	then
		echo "${msg}"
	fi
}
