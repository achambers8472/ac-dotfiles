#!/usr/bin/env bash

#xrandr --output DFP3 --primary --mode 1920x1080 --output CRT1 --mode 1280x1024 --left-of DFP3
xmodmap -e "pointer = 3 2 1"
exec awesome
