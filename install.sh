#!/bin/bash

export MAKEFLAGS="-j $(nproc)"

function failed {
	echo ""
	read -p "$1, Do you want to exit? [Yy/Nn] "  < /dev/tty
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		exit -1
	fi
}

export XORG="yes"

read -p "Do you want xorg support? If unsure, say yes. [Yy/Nn]: "

[[ $REPLY =~ ^[Nn] ]] && export XORG=""

export WAYLAND="yes"

read -p "Do you want wayland support? If unsure, say yes. If you answer no, xorg will be default. [Yy/Nn]: "

[[ $REPLY =~ ^[Nn] ]] && export WAYLAND=""

echo -n 'pkg: reading pkg list '
PKGLIST=$(cat archpkglist)
[[ ! -z $WAYLAND ]] && PKGLIST="$(cat archpkglist-wayland)$PKGLIST"
[[ ! -z $XORG ]] && PKGLIST="$(cat archpkglist-xorg)$PKGLIST"


echo '[DONE]'
echo 'pkg: installing packages, enter root password:'
su -c "pacman -S $PKGLIST" || failed "failed to su"

echo -n 'dir: reading dir list '
DIRLIST=$(cat dirs)
echo '[DONE]'

while IFS= read -r line; do
echo -n "dir: creating $line "
mkdir -p ~/"$line" || failed "failed to create $line"
echo "[DONE]"
done <<< $DIRLIST

echo -n 'files: reading file list '
FILELIST=$(cat files)
echo '[DONE]'

while IFS= read -r line; do
DEST=$(echo "$line" | cut -d " " -f 1)
SRC=$(echo "$line" | cut -d " " -f 2)
echo -n "files: copying $SRC to $DEST "
cp assets/"$SRC" ~/"$DEST" || failed "could not copy $SRC to $DEST"
echo "[DONE]"
done <<< $FILELIST


echo -n 'build: reading script lisst '
FILELIST=$(ls install.d)
echo '[DONE]'

while IFS= read -r line; do
echo "build: running $line "
install.d/$line < /dev/tty || failed "buildscript $line failed" 
echo "$line: [DONE]"
done <<< $FILELIST

echo "----[ AUTO RICE COMPLETE ] ---"
echo ""
echo "log in on tty1 and press mod4/Windows/Command + Q to get keybind help"
echo ""

exit 0

