#!/usr/bin/env bash

log=$1

if [[ -z "$1" ]]; then
	echo "Log file required"
	exit 1
fi

awk '
{
	balance[$1] -= $4
	balance[$3] += $4
}
END {
    for (player in balance) {
        if (balance[player] < 0) {
            print player
        }
    }
}
' "$log"
