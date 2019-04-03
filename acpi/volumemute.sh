#!/bin/bash

SINK=$( pactl --server=127.0.0.1 list sinks | grep -B1 "State: RUNNING" | awk -F'#' '/Sink/ { print $2 }' )
if [ -z $SINK ]; then
	SINK=0
fi
pactl --server=127.0.0.1 set-sink-mute $SINK toggle
pkill -RTMIN+10 i3blocks
