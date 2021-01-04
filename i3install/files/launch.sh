#!/usr/bin/env sh

## Add this to your wm startup file.

#~/scripts/polybar-spotify-controls/scripts/spotify/launchlistener.sh &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u 1000 -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main &
done