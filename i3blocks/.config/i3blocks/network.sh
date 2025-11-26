#!/usr/bin/env bash

# Priority: Ethernet (eno1) → WiFi (wlan0)

ETH="eno1"
WIFI="wlan0"

get_ip() {
    ip -4 -o addr show "$1" 2>/dev/null | awk '{print $4}' | cut -d/ -f1
}

# Check ethernet
ETH_STATE=$(cat /sys/class/net/$ETH/operstate 2>/dev/null)
ETH_IP=$(get_ip $ETH)

if [[ "$ETH_STATE" == "up" && -n "$ETH_IP" ]]; then
    echo "$ETH_IP"
    echo "Ethernet"
    exit 0
fi

# Else check WiFi
WIFI_STATE=$(cat /sys/class/net/$WIFI/operstate 2>/dev/null)
WIFI_IP=$(get_ip $WIFI)

if [[ "$WIFI_STATE" == "up" && -n "$WIFI_IP" ]]; then
    SSID=$(iwgetid -r 2>/dev/null)
    echo "  $WIFI_IP ($SSID)"
    echo "WiFi"
    exit 0
fi

# If no connection
echo "  offline"
echo "offline"
