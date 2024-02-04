#!/bin/bash
# Changes theme for my polybar

POLYBAR_CONFIG_PATH="$HOME/.config/polybar/config.ini"

polybar_set_mocha () {
    sed -i 's|^include-file = $HOME/.config/polybar/themes/.*|include-file = $HOME/.config/polybar/themes/mocha.ini|' $POLYBAR_CONFIG_PATH
}
polybar_set_latte () {
    sed -i 's|^include-file = $HOME/.config/polybar/themes/.*|include-file = $HOME/.config/polybar/themes/latte.ini|' $POLYBAR_CONFIG_PATH
}
