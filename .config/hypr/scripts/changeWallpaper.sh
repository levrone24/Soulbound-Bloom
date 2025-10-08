#!/usr/bin/env bash

# Directory containing your wallpapers
DIR="$HOME/.config/Wallpapers"

# Find image files only (jpg, png, jpeg)
PICS=($(find "$DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \)))

# Select a random picture from the array
RANDOM_PIC="${PICS[$((RANDOM % ${#PICS[@]}))]}"

# Fallback if no image is found
if [[ -z "$RANDOM_PIC" ]]; then
  echo "No wallpaper found in $DIR. Check file types or directory."
  exit 1
fi

# Kill swaybg if running (optional cleanup)
if pidof swaybg >/dev/null; then
  pkill swaybg
fi

# Initialize swww if not already running
swww query || swww init

# Set the selected wallpaper with transition effects
swww img "$RANDOM_PIC" --transition-fps 30 --transition-type outer --transition-duration 1.5

# Apply Hellwal colors
hellwal -i "$RANDOM_PIC"

# Reload Pywal colors
wal -R

# Update Rofi wallpaper.rasi
cat <<EOF > ~/.config/rofi/wallpaper.rasi
* {
  wallpaper: url("$RANDOM_PIC", width);
}
EOF
