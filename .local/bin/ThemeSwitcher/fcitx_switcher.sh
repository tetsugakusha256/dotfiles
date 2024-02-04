#!/bin/bash
# Changes theme for fcitx5 popup

FCITX_CONFIG_PATH="$HOME/.config/fcitx5/conf/classicui.conf"

fcitx_set_mocha () {
    sed -i 's|^Theme=catppuccin-.*|Theme=catppuccin-mocha|' $FCITX_CONFIG_PATH
    fcitx_reload
}
fcitx_set_latte () {
    sed -i 's|^Theme=catppuccin-.*|Theme=catppuccin-latte|' $FCITX_CONFIG_PATH
    fcitx_reload
}
fcitx_reload () {
    fcitx5 -d -r
}
