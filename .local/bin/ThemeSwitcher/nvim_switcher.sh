#!/bin/bash
# Changes theme for neovim

NEOVIM_CONFIG_PATH="$HOME/.config/nvim/init.lua"

neovim_set_mocha() {
    sed -i 's#^vim.cmd(\[\[colorscheme catppuccin-.*#vim.cmd([[colorscheme catppuccin-mocha]])#' $NEOVIM_CONFIG_PATH
}
neovim_set_latte() {
    sed -i 's#^vim.cmd(\[\[colorscheme catppuccin-.*#vim.cmd([[colorscheme catppuccin-latte]])#' $NEOVIM_CONFIG_PATH
}
