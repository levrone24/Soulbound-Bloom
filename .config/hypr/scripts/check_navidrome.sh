#!/bin/bash
MUSIC_PATH="/run/media/levrone/BC92-6EAE1/Music"

if [ -d "$MUSIC_PATH" ] && [ "$(ls -A "$MUSIC_PATH")" ]; then
    docker-compose -f ~/navidrome/docker-compose.yml restart
fi
