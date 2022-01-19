#!/bin/sh

MOUNTED=$(lsblk -o NAME,HOTPLUG,MOUNTPOINT -r | awk '$2 == 1 && $3 != "" {printf "%s (%s)\n",$3,$1}')
export CHOSEN=$(echo $MOUNTED | dmenu -p "what drive do you want to unmount?" | awk '{print $1}')
[[ -z "$CHOSEN" ]] && exit 1
echo $CHOSEN
st umounter
