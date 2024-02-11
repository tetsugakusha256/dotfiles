#!/bin/bash

if [ $# -gt 2 -o $# -lt 1 ]; then
    echo "Usage: brightness_notif <inc|dec> <value>"
    exit 1
fi
if [ "$1" == "inc" ]; then
    if [ -z $2 ]; then
        echo "Usage: brightness_notif <inc|dec> <value>"
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$2%
    fi
fi

if [ "$1" == "dec" ]; then
    if [ -z $2 ]; then
        echo "Usage: brightness_notif <inc|dec> <value>"
    else
        pactl set-sink-volume @DEFAULT_SINK@ -$2%
    fi
fi
if [ "$1" == "toggle" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

value=$(pactl list sinks | grep -A 15 'Sink #' | grep 'Volume:' | awk -F '/' '{print $2}' | tail -n 2 | head -n 1 | sed 's/%//g' | sed 's/ //g')
symbole=$([[ $value > 50 ]] && echo "" || echo "")
echo $value
if [ $value -eq 0 ]
then
    symbole="󰝟"
elif [ $value -lt 30 ]
then
    symbole="󰕿"
elif [ $value -gt 60 ]
then
    echo "> 60"
    symbole="󰕾"
else
    symbole="󰖀"
fi

if pactl list sinks | grep -q 'Mute: yes'; then
    symbole="󰝟"
fi


notify "$symbole Volume" "$value/100" \
    --hint boolean:transient:true \
    --hint int:has-percentage:$value \
    -n "volume-popup" -a "󰖀  "
