#!/bin/bash
# This file is not called anymore, now using interception tools
# to set the ctrl_modifier remap at a lower level
# it should work in the ttc, wayland and x11

# Define the program name
program="xcape"

/usr/bin/setxkbmap -option 'caps:ctrl_modifier,shift:both_capslock_cancel'

# Check if the program is already running
if pgrep -x "$program" > /dev/null; then
    # Kill the program
    pkill -x "$program"
    echo "Program '$program' has been killed."
else
    echo "Program '$program' is not running."
fi
# Execute the command if the program is not running
echo "Launching $program..."
# Replace the following line with the command you want to execute
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 200
# /usr/bin/xcape -e 'ISO_Level3_Shift=Control_L|BackSpace' -t 200
