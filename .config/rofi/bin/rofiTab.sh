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
    # TODO: remove the number based on the number that was match
    # I believe it might be useless because I think it never goes highes than 1
    # (need confirmation)
elif [[ "$title" =~ ^\([0-9]+\).* ]]; then
    echo 'case (1)'
    no_notif_title="${title#\(1\)}"
    bt_title=$(bt list | grep "${no_notif_title}" | cut -f 1)
    bt activate ${bt_title}
    i3-msg "[title=\"${no_notif_title}\"] focus" 2>&1
else
    bt_title=$(bt list | grep "${title}" | cut -f 1)
    bt activate ${bt_title}
    echo "searching workspace with title=${title}"
    i3-msg "[title=\"${title}\"] focus" 2>&1
fi
