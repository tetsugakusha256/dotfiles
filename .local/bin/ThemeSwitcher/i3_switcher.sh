#!/bin/bash
# Changes theme for my i3

I3_CONFIG_PATH="$HOME/.config/i3/config"

i3_set_mocha() {
    sed -i 's|^include ~/.config/i3/i3_theme_.*|include ~/.config/i3/i3_theme_mocha|' $I3_CONFIG_PATH
    i3-msg -q reload
}
i3_set_latte() {
    sed -i 's|^include ~/.config/i3/i3_theme_.*|include ~/.config/i3/i3_theme_latte|' $I3_CONFIG_PATH
    i3-msg -q reload
}
