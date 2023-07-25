#!/bin/bash

# Define the program name
program="xcape"

/usr/bin/setxkbmap -option 'caps:ctrl_modifier,shift:both_capslock_cancel'
# Check if the program is already running
if pgrep -x "$program" > /dev/null; then
  echo "$program is already running."
else
  # Execute the command if the program is not running
  echo "Launching $program..."
  # Replace the following line with the command you want to execute
/usr/bin/xcape -e 'Caps_Lock=Escape' -t 200
# /usr/bin/xcape -e 'ISO_Level3_Shift=Control_L|BackSpace' -t 200
fi
