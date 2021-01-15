#!/bin/bash

# Dependencies:
# imagemagick
# i3lock
# scrot (optional but default)

IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
ICON="/home/gisty/.config/i3/locked.png"

scrot $IMAGE

convert $IMAGE -scale 20% -scale 500% $IMAGE
convert $IMAGE $ICON -gravity center -composite -matte $IMAGE

xkb-switch -s us

i3lock -e -f -i $IMAGE
rm $IMAGE
