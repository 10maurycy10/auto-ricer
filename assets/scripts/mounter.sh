#!/bin/sh

if stat "$POINT"
then sudo mount "$CHOSEN" "$POINY"
else
MK=$(echo -e "yes\nno" | dmenu -p "Cant fine $POINT, do you want to create it?")
[[ $MK == "yes" ]] && sudo mkdir "$POINT"
[[ $MK == "yes" ]] && sudo mount "$CHOSEN" "$POINT"
[[ $MK == "yes" ]] || exit 1
fi

exit 0


