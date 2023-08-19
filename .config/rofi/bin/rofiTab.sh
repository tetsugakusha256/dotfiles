#!/bin/bash

title=$(bt list | cut -f 2,3 | rofi -dmenu \
        -theme "$HOME"/.config/rofi/tab_switcher.rasi\
        -i \
        -window-title "Tab Switcher" \
        | cut -f 1
)
echo ${title}
matching_window=$(bt list | grep "${title}")
echo "matching:${matching_window}"
if [ -z "$title" ]; then
    echo "No choice or input porvided"
elif [ -z "$matching_window" ]; then
  # TODO: make the switch to workspace smarter
    echo "No choice made: search term :${title}"
    search_window=$(bt windows | cut -f 1 | sed -n "1p")
    echo "Window match:  ${search_window}"
    echo "Search:  ${title}"
    bt new ${search_window} ${title}
    i3-msg workspace 2
elif [[ "$title" =~ ^\([0-9]+\).* ]]; then
    echo 'case ([0-9]+)'
    no_notif_title=$(echo "$title" | sed 's/^([0-9]\+)//')
    bt_title=$(bt list | grep "${no_notif_title}" | cut -f 1)
    bt activate ${bt_title}
    i3-msg "[title=\"${no_notif_title}\"] focus" 2>&1
else
    bt_title=$(bt list | grep "${title}" | cut -f 1)
    bt activate ${bt_title}
    echo "searching workspace with title=${title}"
    i3-msg "[title=\"${title}\"] focus" 2>&1
fi
