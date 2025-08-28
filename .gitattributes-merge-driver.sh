#!/usr/bin/env bash
# Arguments: %O %A %B %L
BASE="$1"
CURRENT="$2"
OTHER="$3"

# Get commit author names from environment variables
AUTHOR_CURRENT="$(git log -1 --pretty=format:'%an' -- $CURRENT)"
AUTHOR_OTHER="$(git log -1 --pretty=format:'%an' -- $OTHER)"

# Output merged content
{
    echo "### Notes from $AUTHOR_CURRENT"
    cat "$CURRENT"
    echo
    echo "### Notes from $AUTHOR_OTHER"
    cat "$OTHER"
} > "$CURRENT"
