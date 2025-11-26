#!/usr/bin/env bash

# Get current volume (%)
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n 1
}

# Get mute status
is_muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}'
}

VOLUME=$(get_volume)
MUTED=$(is_muted)

if [ "$MUTED" = "yes" ]; then
    ICON="🔇"
else
    ICON="🔊"
fi

# Output for i3blocks
echo "$ICON  $VOLUME"

# The full_text for short_text
echo "$ICON"

# Color (optional)
if [ "$MUTED" = "yes" ]; then
    echo "#ff5555"   # red
else
    echo "#a3be8c"   # green
fi

exit 0

