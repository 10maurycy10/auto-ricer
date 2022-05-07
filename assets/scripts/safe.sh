#!/bin/sh
export ALT="$USER-$1"
export ALTHOME="/home/$ALT"
. ~/.safe_env
sudo -E -H -u "$ALT" "${@:2}"
