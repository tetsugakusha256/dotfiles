#!/bin/bash
# Changes theme for my i3

I3_CONFIG_PATH="$HOME/.config/polybar/config.ini"

i3_set_mocha () {
    sed -i 's|^include-file = $HOME/.config/polybar/themes/.*|include-file = $HOME/.config/polybar/themes/mocha.ini|' $I3_CONFIG_PATH
}
i3_set_latte () {
    sed -i 's|^include-file = $HOME/.config/polybar/themes/.*|include-file = $HOME/.config/polybar/themes/latte.ini|' $I3_CONFIG_PATH
}
