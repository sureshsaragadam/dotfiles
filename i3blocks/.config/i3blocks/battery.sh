#!/bin/bash

# Dynamic battery detection (BAT0, BAT1, etc.)
BAT=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n 1)

# Dynamic AC/USB-C charger detection
AC=$(ls -d /sys/class/power_supply/* | grep -E "AC|ADP|ucsi|usb" | head -n 1)

PERC=$(cat "$BAT/capacity")
STATUS=$(cat "$BAT/status")

# AC online detection (some have 'online', some have 'status')
if [ -f "$AC/online" ]; then
    AC_ONLINE=$(cat "$AC/online")
else
    AC_ONLINE=0
fi

# Icons
if [ "$STATUS" = "Charging" ]; then
    ICON="⚡"
elif [ "$STATUS" = "Discharging" ]; then
    ICON="🔋"
elif [ "$STATUS" = "Full" ]; then
    ICON="✔"
else
    # Plugged in but unknown state
    if [ "$AC_ONLINE" = "1" ]; then
        ICON="🔌"
    else
        ICON="🔋"
    fi
fi

# Colors
if [ "$PERC" -ge 80 ]; then
    COLOR="#00FF00"
elif [ "$PERC" -ge 40 ]; then
    COLOR="#FFFF00"
else
    COLOR="#FF0000"
fi

echo "$ICON $PERC% ($STATUS)"
echo
echo "$COLOR"

