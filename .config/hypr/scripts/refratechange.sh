#!/bin/bash

# Define the path to the AC adapter status file
# This path is common, but may vary slightly between systems
AC_PATH="/sys/class/power_supply/ADP1"

# Check if the AC adapter directory/file exists
if [ ! -d "$AC_PATH" ] && [ ! -f "$AC_PATH/online" ]; then
  echo "Could not find AC adapter status information in $AC_PATH."
  echo "You may need to adjust the script to your specific system's path."
  # List available power supply entries for debugging
  echo "Available power supplies:"
  ls /sys/class/power_supply/
  exit 1
fi

# Read the status
# A value of '1' means online (plugged in), '0' means offline (on battery)
STATUS=$(cat "$AC_PATH/online")

if [ "$STATUS" -eq 1 ]; then
  hyprctl keyword monitor eDP-2,1920x1080@144,0x0,1
  powerprofilesctl set performance
else
  hyprctl keyword monitor eDP-2,1920x1080@60,0x0,1
  powerprofilesctl set balanced
fi
