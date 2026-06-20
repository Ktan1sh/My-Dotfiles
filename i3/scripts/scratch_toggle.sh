#!/bin/env bash
set -euo pipefail

if [ "$#" -lt 2]; then
	echo "Usage: $0 <instance> <command...>"
	exit 1
fi

INSTANCE="$1"
shift
CMD="$*"

TREE="$(i3-msg t get_tree)"

if echo "$TREE" | grep -q "\"instance\":\"$INSTANCE\""; then
	i3-msg "[instance=\"$INSTANCE\"] scratchpad show" >/dev/null
else
	eval "$CMD" &
fi
