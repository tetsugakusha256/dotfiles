#!/bin/bash
# Changes theme for starship prompt

STARSHIP_CONFIG_PATH="$HOME/.config/starship.toml"

starship_set_mocha () {
    sed -i 's|^palette = "catppuccin_.*|palette = "catppuccin_mocha"|' $STARSHIP_CONFIG_PATH
}
starship_set_latte () {
    sed -i 's|^palette = "catppuccin_.*|palette = "catppuccin_latte"|' $STARSHIP_CONFIG_PATH
}
