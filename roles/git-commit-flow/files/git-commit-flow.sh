#! /bin/bash
set -e

BRANCH_NAME=""
TICKET_ID=""
SHOW_HELPER=false

while getopts "h" arg; do
	case $arg in
		h)
			SHOW_HELPER=true
			;;
	esac
done

function is_git_repo () {
	if ! $(git rev-parse --is-inside-work-tree > /dev/null 2>&1); then
		echo "Error: Not in a git repository"
	fi
}

function is_gum_installed () {
	if ! command -v gum &> /dev/null
	then
  	echo "gum could not be found, please install https://github.com/charmbracelet/gum"
    exit 1
	fi
}

function get_branch_name () {
	BRANCH_NAME=$(git branch --show-current)
}

function is_feature_branch () {
	if [[ $BRANCH_NAME == feature* ]]; then
		TICKET_ID=$(echo "$BRANCH_NAME" | sed 's/feature\///')
	fi
}

function show_commit_type_helper () {
	local HELPER_TEXT="
		# Commit Type\n
		- build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)\n
		- ci: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)\n
		- docs: Documentation only changes\n
		- feat: A new feature\n
		- fix: A bug fix\n
		- perf: A code change that improves performance\n
		- refactor: A code change that neither fixes a bug nor adds a feature\n
		- style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)\n
	"

	echo -e $HELPER_TEXT | gum format
}

function initialize_commit () {
	local COMMIT_TYPE=$(gum choose "build" "ci" "docs" "feat" "fix" "perf" "refactor" "style" "test")

	[[ -z "$COMMIT_TYPE" ]] && { echo "Commit type is empty, it is required to have" ; exit 1; }

	local COMMIT_TICKET=$(gum input --value "$TICKET_ID" --placeholder "Ticket ID of commit")

	# Since Commit Ticket can be empty, wrap it in brackets if it has value
	[[ -n "$COMMIT_TICKET" ]] && COMMIT_TICKET="[$COMMIT_TICKET] "

	local COMMIT_SUMMARY=$(gum input --placeholder "Commit message" --width=100)

	[[ -z "$COMMIT_SUMMARY" ]] && { echo "Commit Summary can't be empty" ; exit 1; }

	local COMMIT_DETAILS=$(gum write --placeholder "Commit details, ctrl+c to skip")

	git commit -m "$COMMIT_TICKET$COMMIT_TYPE: $COMMIT_SUMMARY" -m "$COMMIT_DETAILS"
}

function init () {
	is_git_repo
	is_gum_installed
	get_branch_name
	is_feature_branch

	if $SHOW_HELPER; then
		show_commit_type_helper
	fi

	initialize_commit
}

init