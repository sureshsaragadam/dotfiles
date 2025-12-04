#!/bin/bash

xkb-switch -W | while read any; do
    echo "$any"
    pkill -RTMIN+12 i3blocks
done

