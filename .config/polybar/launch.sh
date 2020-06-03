#!/bin/bash

killall -q polybar

while pgrep -u %UID -x polybar >/dev/null; do sleep 1; done

polybar workspaces &
polybar tray &

echo "Polybar launched..."
