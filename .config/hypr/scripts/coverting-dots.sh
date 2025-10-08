#!/bin/bash

# Target directory
TARGET_DIR="/home/levrone/Downloads/__MACOSX/(@kyd.and.cambria) Best Pierre Bourne Kit Ever [Rare Sounds]/Percs/"

# Navigate to the directory
cd "$TARGET_DIR" || { echo "Failed to access target directory"; exit 1; }

# Loop through all files that start with a dot
for file in .*; do
    [[ "$file" == "." || "$file" == ".." ]] && continue
    
    # Remove leading dots from the filename
    new_name=$(echo "$file" | sed 's/^\.//')
    
    # Rename the file if the name changes
    mv "$file" "$new_name"
done

echo "Dots removed from filenames in $TARGET_DIR!"
