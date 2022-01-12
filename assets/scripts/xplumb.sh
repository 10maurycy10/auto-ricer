#!/bin/bash
# no sh :(

function man {
	st man $1
}

function terminal {
	st -e $1
}

function qrcode {
	st qrwait "$1"
}

function map {
	$BROWSER "https://www.openstreetmap.org/search?query=$1"
}

function email {
	st mutt "$1"
}

function ddg {
	$BROWSER "https://duckduckgo.com/?t=ffab&q=$1"
}

function wikipedia {
	$BROWSER "https://en.wikipedia.org/w/index.php?search=$1"
}

SELECTION=$(xclip -o)

[[ -z "$SELECTION" ]] && exit 1

OPTIONS=$(declare -F | awk '{print $3}')
echo "$OPTIONS"
CHOSEN=$(echo "$OPTIONS" | dmenu -i -p "What do you want to do?")
[[ -z "$SELECTION" ]] && exit 1

echo "$CHOSEN $SELECTION"

$CHOSEN "$SELECTION"

exit 0
