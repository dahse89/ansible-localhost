#! /bin/bash

set -e

if [ $# -ne 1 ]
then
	echo "Usage: git commit-flow [commit message]"
	exit 1
fi

COMMIT_MESSAGE="$1"
BRANCH_NAME=""

function is_git_repo () {
	if ! $(git rev-parse --is-inside-work-tree > /dev/null 2>&1); then
		echo "Error: Not in a git repository"
	fi
}

function get_branch_name () {
	BRANCH_NAME=$(git branch --show-current)
}

function initialize_commit () {
	local SHORT_BRANCH_NAME=$(echo "$BRANCH_NAME" | sed 's/feature\///')
	git commit -m "[$SHORT_BRANCH_NAME] $COMMIT_MESSAGE"
}

function is_feature_branch () {
	if [[ $BRANCH_NAME != feature* ]]; then
		echo "Error: Not Feature branch"
		exit 1
	fi
}

function init () {
	is_git_repo
	get_branch_name
	is_feature_branch
	initialize_commit
}

init