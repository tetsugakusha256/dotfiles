#!/bin/bash
# Changes theme for my deadd-notification

ROFI_CONFIG_PATH="$HOME/.config/rofi/colors.rasi"
ROFI_MOCHA_CONFIG_PATH="$HOME/.config/rofi/colors-mocha.rasi"
ROFI_LATTE_CONFIG_PATH="$HOME/.config/rofi/colors-latte.rasi"

rofi_set_mocha() {
    # Copy mocha file and rename it dead.css to make the change effective
    cp $ROFI_MOCHA_CONFIG_PATH $ROFI_CONFIG_PATH
}
rofi_set_latte() {
    # Copy mocha file and rename it dead.css to make the change effective
    cp $ROFI_LATTE_CONFIG_PATH $ROFI_CONFIG_PATH
}
