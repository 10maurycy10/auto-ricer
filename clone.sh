#!/bin/bash

echo -n 'files: reading file list '
FILELIST=$(cat files)
echo '[DONE]'

while IFS= read -r line; do
DEST=$(echo "$line" | cut -d " " -f 1)
SRC=$(echo "$line" | cut -d " " -f 2)
echo -n "files: copying $SRC to $DEST "
cp ~/"$DEST" assets/"$SRC" || failed "could not copy $SRC to $DEST"
echo "[DONE]"
done <<< $FILELIST


