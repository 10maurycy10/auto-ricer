#!/bin/bash

echo -n 'pkg: reading pkg list '
PKGLIST=$(cat archpkglist)
echo '[DONE]'
echo 'pkg: installing packages, enter root password:'
su -c "pacman -S $PKGLIST"

echo -n 'dir: reading dir list '
DIRLIST=$(cat dirs)
echo '[DONE]'

while IFS= read -r line; do
echo -n "dir: creating $line "
mkdir -p ~/"$line"
echo "[DONE]"
done <<< $DIRLIST

echo -n 'files: reading file list '
FILELIST=$(cat files)
echo '[DONE]'

while IFS= read -r line; do
DEST=$(echo "$line" | cut -d " " -f 1)
SRC=$(echo "$line" | cut -d " " -f 2)
echo -n "files: copying $SRC to $DEST "
cp assets/"$SRC" ~/"$DEST"
echo "[DONE]"
done <<< $FILELIST
