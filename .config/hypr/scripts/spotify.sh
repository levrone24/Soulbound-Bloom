#!/bin/bash

player="spotify"

status=$(playerctl --player=$player status 2>/dev/null)
artist=$(playerctl --player=$player metadata artist 2>/dev/null)
title=$(playerctl --player=$player metadata title 2>/dev/null)

# Fallback
artist=${artist:-"Unknown Artist"}
title=${title:-"Unknown Title"}

# Clean double quotes just in case
artist_clean=$(echo "$artist" | sed 's/"/\\"/g')
title_clean=$(echo "$title" | sed 's/"/\\"/g')

echo "{\"text\": \"$artist_clean - $title_clean\", \"tooltip\": \"$artist_clean - $title_clean\", \"class\": \"$status\"}"
