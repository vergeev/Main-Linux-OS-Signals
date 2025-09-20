#!/bin/bash

SIGTERM_REQUESTED=0

handle_sigterm() {
	if  [ $SIGTERM_REQUESTED -eq 0 ]; then
		echo "Send SIGTERM again to terminate"
		SIGTERM_REQUESTED=1
	else
		echo "SIGTERM received, exiting now"
		exit 0
	fi
}

trap handle_sigterm SIGTERM

TIMEOUT=$(date +%s)
TIMEOUT=$(($TIMEOUT + 60))

echo "This script will exit in 60 seconds"
while [ $(date +%s) -lt $TIMEOUT ]; do
	sleep 1;
done
echo "Timeout reached, exiting now"

# run as `./handle_sigterm.sh &.`
# and then do `ps`:
# ps
#  PID TTY           TIME CMD
#14442 ttys000    0:01.04 -fish
#14736 ttys000    0:00.05 /bin/bash ./handle_sigterm.sh
#14812 ttys000    0:00.00 sleep 1
# and then kill 14736.
# TODO: why is there sleep 1 as a separate proccess?
#  how does it communicate with the main one?
#
# SIGQUIT is the same but also produces are core dump somewhere
# (TODO: where?)
