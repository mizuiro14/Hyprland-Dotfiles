#!/usr/bin/env bash

sleep 0.1

WALLPAPER_DIR="$HOME/.config/hypr/wallpaper"
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

if [[ -z "$RANDOM_WALLPAPER" ]]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Start swww-daemon without loading previous wallpaper
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon --no-cache &
    sleep 0.2
fi

MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

for MON in $MONITORS; do
    swww img "$RANDOM_WALLPAPER" \
        --outputs "$MON" \
        --transition-type fade \
        --transition-duration 0.3
done

exit 0
