#!/bin/sh
RESULT=`echo -e "No\nYes" | dmenu -p "$1"`
[ $RESULT == "Yes" ] && $2
