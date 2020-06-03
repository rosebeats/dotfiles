#!/bin/sh

if wget --no-check-certificate https://source.unsplash.com/random/1920x1080 -O /tmp/wallpaper.jpg
then
    mv /tmp/wallpaper.jpg /usr/share/backgrounds/aether/space-1.jpg
else
    rm /tmp/wallpaper.jpg
fi
