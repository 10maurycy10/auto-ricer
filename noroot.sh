#!/bin/bash

function failed {
	echo ""
	read -p "$1, Do you want to exit? [Yy/Nn] "
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		exit -1
	fi
}


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
install.d/$line || failed "buildscript $line failed"
echo "$line: [DONE]"
done <<< $FILELIST

exit 0
