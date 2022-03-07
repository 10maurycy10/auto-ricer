#!/bin/bash
export DISPLAY=':0'
export $(dbus-launch)
/usr/bin/notify-send "$1"
