#!/bin/bash
find "/home/levrone/Downloads/PIANOOOS/" -type f -iname "*.mp3" | while read -r mp3file; do
    wavfile="${mp3file%.mp3}.wav"
    
    # If output file exists, rename to avoid conflict
    if [[ -e "$wavfile" ]]; then
        count=1
        while [[ -e "${wavfile%.wav}_$count.wav" ]]; do
            ((count++))
        done
        wavfile="${wavfile%.wav}_$count.wav"
    fi

    # Convert with quoted paths for safety
    ffmpeg -i "$mp3file" "$wavfile"
done
