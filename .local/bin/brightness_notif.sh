#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: brightness_notif <inc|dec> <value>"
    exit 1
fi
if [ "$1" == "inc" ]; then
    brightnessctl set $2%+
fi

if [ "$1" == "dec" ]; then
    brightnessctl set $2%-
fi

current_b=$(brightnessctl g)
max_b=$(brightnessctl m)
value=$(($current_b * 100 / $max_b))
notify "󰌵 Brightness" "$value/100" \
                         --hint boolean:transient:true \
                         --hint int:has-percentage:$value \
                         -n "brightness-popup" -a "󰛨  "
