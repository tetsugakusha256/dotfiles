#!/bin/bash
# Changes theme for my deadd-notification

DEAD_CONFIG_PATH="$HOME/.config/deadd/deadd.css"
DEAD_MOCHA_CONFIG_PATH=".config/catppuccin/css/mocha.css"
DEAD_LATTE_CONFIG_PATH=".config/catppuccin/latte.css"

deadd_set_mocha() {
    # Copy mocha file and rename it dead.css to make the change effective
    # cp $DEAD_MOCHA_CONFIG_PATH $DEAD_CONFIG_PATH
    sed -i 's|^@import ".config/catppuccin/css/.*|@import ".config/catppuccin/css/mocha.css";|' $DEAD_CONFIG_PATH
    # turn highlighting off
    notify-send.py a --hint boolean:deadd-notification-center:true \
        int:id:1 boolean:state:false type:string:buttons
    reload_deadd
}
deadd_set_latte() {
    # Copy mocha file and rename it dead.css to make the change effective
    # cp $DEAD_LATTE_CONFIG_PATH $DEAD_CONFIG_PATH
    # turn highlighting off
    sed -i 's|^@import ".config/catppuccin/css/.*|@import ".config/catppuccin/css/latte.css";|' $DEAD_CONFIG_PATH
    notify-send.py a --hint boolean:deadd-notification-center:true \
        int:id:0 boolean:state:false type:string:buttons
    reload_deadd
}
reload_deadd() {
    notify-send.py a --hint boolean:deadd-notification-center:true \
        string:type:reloadStyle
}
