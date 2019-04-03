#!/bin/bash

SINK=$( pactl --server=127.0.0.1 list sinks | grep -B1 "State: RUNNING" | awk -F'#' '/Sink/ { print $2 }' )
if [ -z $SINK ]; then
	SINK=0
fi

case $1 in
	up)
		pactl --server=127.0.0.1 set-sink-volume $SINK +5%
		;;
	down)
		pactl --server=127.0.0.1 set-sink-volume $SINK -5%
		;;
	mute)
		pactl --server=127.0.0.1 set-sink-mute $SINK toggle
		;;
	*)
		echo "$1 wrong command"
		;;
esac

pkill -RTMIN+10 i3blocks
