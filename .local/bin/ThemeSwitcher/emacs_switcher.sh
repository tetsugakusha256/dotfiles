#!/bin/bash
# Changes theme for starship prompt

DOOM_CONFIG_PATH="$HOME/.doom.d/config.el"

emacs_set_mocha () {
  sed -i "s|^(setq catppuccin-flavor '.*)|(setq catppuccin-flavor 'mocha)|" $DOOM_CONFIG_PATH
}
emacs_set_latte () {
  sed -i "s|^(setq catppuccin-flavor '.*)|(setq catppuccin-flavor 'latte)|" $DOOM_CONFIG_PATH
}
