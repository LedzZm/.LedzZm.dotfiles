#!/usr/bin/env bash
# TODO: USE SOCKETS AND WRITE IN ANOTHER LANGUAGE.
# How close to the bottom counts (in pixels)
THRESHOLD=2

# Get the height of the focused monitor
get_height() {
  hyprctl monitors -j | jq '.[] | select(.focused==true) | .height'
}

HEIGHT=$(get_height)

while true; do
  # Get cursor position: "x, y"
  POS=$(hyprctl cursorpos)
  Y=$(echo "$POS" | cut -d',' -f2 | tr -d ' ')

  if ((Y >= HEIGHT - THRESHOLD)); then
    killall -SIGUSR1 waybar
    sleep 0.5 # prevent spamming
  fi

  sleep 0.05
done
