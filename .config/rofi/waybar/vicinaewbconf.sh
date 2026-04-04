#!/bin/bash

# Define paths
WAYBAR_DIR="$HOME/.config/waybar"
THEMES=("default" "minimal")

# Use vicinae's dmenu subcommand
# Added 'dmenu' before the flags
CHOICE=$(printf "%s\n" "${THEMES[@]}" | vicinae dmenu -p "Select Waybar Theme:")

# Exit if no choice was made (e.g., pressed Esc)
if [ -z "$CHOICE" ]; then
    exit 1
fi

# Path to the chosen theme folder
THEME_PATH="$WAYBAR_DIR/$CHOICE"

# Create/Overwrite symlinks
ln -sf "$THEME_PATH/config.jsonc" "$WAYBAR_DIR/config"
ln -sf "$THEME_PATH/style.css" "$WAYBAR_DIR/style.css"

# Restart Waybar to apply changes
killall waybar
waybar &
