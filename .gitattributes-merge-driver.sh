#!/usr/bin/env bash
# Arguments: %O %A %B %L
BASE="$1"
CURRENT="$2"
OTHER="$3"

BRANCH_CURRENT=$(git rev-parse --abbrev-ref HEAD)
BRANCH_OTHER=${GIT_MERGE_BRANCH:-"other-branch"}

{
    echo "### Notes from branch: $BRANCH_CURRENT"
    cat "$CURRENT"
    echo
    echo "### Notes from branch: $BRANCH_OTHER"
    cat "$OTHER"
} > "$CURRENT"
