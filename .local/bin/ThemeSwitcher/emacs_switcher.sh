#!/bin/bash
# Changes theme for starship prompt

DOOM_CONFIG_PATH="$HOME/.doom.d/config.el"
EARLY_DOOM_CONFIG_PATH="$HOME/.emacs.d/early-init.el"

emacs_set_mocha () {
  sed -i "s|^(setq catppuccin-flavor '.*)|(setq catppuccin-flavor 'mocha)|" $DOOM_CONFIG_PATH
  sed -i 's|\(.*\)background-color \. ".*|\1background-color \. "#1E1E2E")|' $EARLY_DOOM_CONFIG_PATH
}
emacs_set_latte () {
  sed -i "s|^(setq catppuccin-flavor '.*)|(setq catppuccin-flavor 'latte)|" $DOOM_CONFIG_PATH
  sed -i 's|\(.*\)background-color \. ".*|\1background-color \. "#EFF1F5")|' $EARLY_DOOM_CONFIG_PATH
}
