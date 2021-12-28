#!/bin/sh

# remove hex code from emoji list
# feed into dmenu
# remove emoji description
# save as $emoji
emoji=$(cat ~/.local/share/emojilist | cut -d ';' -f 1 | dmenu -l 30 -i | sed "s/ .*//")

# Exit if no selection
[ -z "$emoji" ] && exit

# Copy to clipboard (Wayland specific!!)
printf "$chosen" | wl-copy
