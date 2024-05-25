#!/bin/bash

# Directory containing the wallpapers
WALLPAPER_DIR=~/Sync/Wallpapers

# Get a list of all wallpapers
WALLPAPERS=("$WALLPAPER_DIR"/*)

# Select a random wallpaper
RANDOM_WALLPAPER=${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}

# Function to change wallpaper on macOS
change_wallpaper_macos() {
  osascript -e "tell application \"System Events\" to set picture of every desktop to \"$RANDOM_WALLPAPER\""
}

# Function to change wallpaper on KDE Plasma (Linux)
change_wallpaper_linux() {
  plasma-apply-wallpaperimage "$RANDOM_WALLPAPER"
}

# Detect the OS and call the appropriate function
if [[ "$OSTYPE" == "darwin"* ]]; then
  change_wallpaper_macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  change_wallpaper_linux
else
  echo "Unsupported OS: $OSTYPE"
  exit 1
fi

