#!/usr/bin/env bash
# Arguments passed by Git: %O %A %B %L
BASE="$1"
CURRENT="$2"
OTHER="$3"

# Get commit SHAs
SHA_CURRENT=$(git log -1 --format="%h" -- "$CURRENT" 2>/dev/null || echo "unknown")
SHA_OTHER=$(git log -1 --format="%h" -- "$OTHER" 2>/dev/null || echo "unknown")

# Merge content
{
    echo "### Notes from commit: $SHA_CURRENT"
    cat "$CURRENT"
    echo
    echo "### Notes from commit: $SHA_OTHER"
    cat "$OTHER"
} > "$CURRENT"
