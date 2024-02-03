#!/bin/bash

ALACRITTY_CONFIG_PATH="$HOME/.config/alacritty/alacritty.toml"

alacritty_set_mocha () {
    sed -i 's|^import = \["/home/anon/.config/alacritty/catppuccin/catppuccin_.*|import = ["/home/anon/.config/alacritty/catppuccin/catppuccin_mocha.toml"]|' "$GTK_CONFIG_PATH"
}
alacritty_set_latte () {
    sed -i 's|^import = \["/home/anon/.config/alacritty/catppuccin/catppuccin_.*|import = ["/home/anon/.config/alacritty/catppuccin/catppuccin_latte.toml"]|' "$GTK_CONFIG_PATH"
}
