#!/bin/bash

# Todo try using cron
#Send notification every 60s if battery is below 15% and the plug is not on
while true
do
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    # if [ $battery_level -ge 95 ]; then
    #    notify-send "Battery Full" "Level: ${battery_level}%"
    #    # paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    if ! acpi -b | grep -q "Charging" ; then
        if [ $battery_level -le 20 ]; then
            notify --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
            # paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
        fi
    fi
    sleep 60
done
