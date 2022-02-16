#!/bin/sh
[[ -z "$1" ]] && echo "no addresss" && exit 1

while true
	do echo -e 'Have a good day!' | mutt -s 'Happy Birthday!!' -- "$1" && exit 0
	sleep 10
done
