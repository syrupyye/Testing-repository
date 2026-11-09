#!/usr/bin/env bash

NICKNAME=$1
length=${#NICKNAME}



if [[ $length -ge 3 && $length -le 16 && $NICKNAME =~ ^[a-zA-Z0-9]+$ ]]; then
	echo "Welcome, $NICKNAME!"
else
	echo >&2 "Invalid nickname."
fi
