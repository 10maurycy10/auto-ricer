#!/bin/sh
MOUNTABLE=$(lsblk -lpo HOTPLUG,TYPE,NAME,SIZE,LABEL | awk '$1 == "1" {printf "%s %s (%s)\n",$3,$5,$4}')
[[ -z "$MOUNTABLE" ]] && exit 1
export CHOSEN=$(echo "$MOUNTABLE" | dmenu -i -p "Drive to mount" | awk '{print $1}')
[[ -z "$CHOSEN" ]] && exit 1
mount "$CHOSEN" && exit 0
export POINT=$(find /mnt /media /home -maxdepth 1 -type d 2>/dev/null | dmenu -i -p "Mount Point?")
st mounter
exit 0
