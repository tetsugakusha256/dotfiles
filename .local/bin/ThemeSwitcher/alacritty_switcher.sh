#!/bin/bash

ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty/alacritty.toml"

alacritty_set_mocha () {
    sed -i 's|^import = \["/home/anon/.config/alacritty/catppuccin/catppuccin_.*|import = ["/home/anon/.config/alacritty/catppuccin/catppuccin_mocha.toml"]|' $ALACRITTY_CONFIG_PATH
    sed -i 's|^opacity = .*|opacity = 0.9|' $ALACRITTY_CONFIG_PATH
}
alacritty_set_latte () {
    sed -i 's|^import = \["/home/anon/.config/alacritty/catppuccin/catppuccin_.*|import = ["/home/anon/.config/alacritty/catppuccin/catppuccin_latte.toml"]|' $ALACRITTY_CONFIG_PATH
    sed -i 's|^opacity = .*|opacity = 0.95|' $ALACRITTY_CONFIG_PATH
}
