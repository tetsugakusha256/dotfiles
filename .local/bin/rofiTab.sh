#!/bin/bash
	
title=$(bt list | cut -f 2,3 | rofi -dmenu \
  -theme "$HOME"/.config/rofi/tab_switcher.rasi\
  -i \
  -window-title "Tab Switcher" \
  | cut -f 1
)
echo ${title}
if [ -z "$title" ]; then
    echo "No choice made"
else
    bt_title=$(bt list | grep "${title}" | cut -f 1)
    bt activate ${bt_title}
    i3-msg "[title=\"${title}\"] focus" 2>&1
fi
