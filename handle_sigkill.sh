#!/bin/bash

SIGKILL_REQUESTED=0

handle_sigkill() {
	if  [ $SIGKILL_REQUESTED -eq 0 ]; then
		echo "Send SIGKILL again to terminate"
		SIGKILL_REQUESTED=1
	else
		echo "SIGKILL received, exiting now"
		exit 0
	fi
}

trap handle_sigkill SIGKILL

TIMEOUT=$(date +%s)
TIMEOUT=$(($TIMEOUT + 60))

read input
echo "User input: $input"
