#!/usr/bin/env bash

# Check if a wallpaper path was provided
if [ -n "$NOCTALIA_WALLPAPER_PATH" ]; then
    echo "Wallpaper changed to: $NOCTALIA_WALLPAPER_PATH"

    niri msg action do-screen-transition --delay-ms 100
    # Example 1: Pass the wallpaper path to pywal
    wal -i "$NOCTALIA_WALLPAPER_PATH" --backend colorz

    pkill -USR2 ghostty
    # Example 2: Notify running Neovim instances to reload (via SIGUSR1)
    pkill -USR1 nvim
fi
