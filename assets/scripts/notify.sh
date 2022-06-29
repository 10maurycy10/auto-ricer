#!/bin/bash
XDG_RUNTIME_DIR=/run/user/$(id -u) notify-send '$1'
