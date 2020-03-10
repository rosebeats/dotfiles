#!/bin/bash

kill $(pgrep -f slideshow.sh | grep -v $$)
image=$(ls -d ~/Pictures/desktop_backgrounds/1920x1080/* | sort -R | tail -1)
while true
do
    feh --bg-fill "$image" &
    sleep 60
    newimage=$(ls -d ~/Pictures/desktop_backgrounds/1920x1080/* | sort -R | tail -1)
    ~/.config/i3/fade.py "$image" "$newimage"
    image=$newimage
done


