#!/bin/bash
THEME_SWITCHER_PATH="$HOME/.local/bin/ThemeSwitcher"
THEME_SWITCHER_CONFIG="$HOME/.local/bin/ThemeSwitcher/theme_switcher.conf"
WALLPAPER_PATH="$HOME/Pictures/Wallpapers/Catppuccin"
MOCHA_WALLPAPER_PATH="$HOME/Pictures/Wallpapers/Catppuccin/Fav_mocha/"
LATTE_WALLPAPER_PATH="$HOME/Pictures/Wallpapers/Catppuccin/Fav_latte/"

# Import the support for various program
source "${THEME_SWITCHER_PATH}/alacritty_switcher.sh"
source "${THEME_SWITCHER_PATH}/gtk_switcher.sh"
source "${THEME_SWITCHER_PATH}/polybar_switcher.sh"
source "${THEME_SWITCHER_PATH}/i3_switcher.sh"
source "${THEME_SWITCHER_PATH}/deadd_switcher.sh"
source "${THEME_SWITCHER_PATH}/starship_switcher.sh"
source "${THEME_SWITCHER_PATH}/nvim_switcher.sh"
source "${THEME_SWITCHER_PATH}/fcitx_switcher.sh"
source "${THEME_SWITCHER_PATH}/rofi_switcher.sh"

# Path to the lock file
LOCK_FILE="/tmp/theme_switcher.lock"

cleanup() {
    rm -f "$LOCK_FILE"
}
# Check if the lock file exists
if [ -e "$LOCK_FILE" ]; then
    echo "Another instance of the script is already running. Exiting."
    exit 1
fi

current_theme=$(head -n 1 "$THEME_SWITCHER_CONFIG")
echo "First line: $current_theme"


# Set mocha theme
option1=mocha
# Set latte theme
option2=latte

arg1=${1:-nothing}
if [ $current_theme == $arg1 ]
then
    echo "Theme already set, switching wallpaper"
    if [ $arg1 == $option1 ]
    then
        feh --randomize --bg-scale $MOCHA_WALLPAPER_PATH
    elif [ $arg1 == $option2 ]; then
        feh --randomize --bg-scale $LATTE_WALLPAPER_PATH
    fi
else
    if [ $arg1 == $option1 ]
    then
        echo "Setting mocha theme"
        # Switching multiple program
        alacritty_set_mocha
        gtk_set_mocha
        polybar_set_mocha
        i3_set_mocha
        deadd_set_mocha
        rofi_set_mocha
        starship_set_mocha
        neovim_set_mocha
        fcitx_set_mocha
        # Wallpapers
        feh --bg-scale "${WALLPAPER_PATH}/Fav_mocha/skull_girl_light_color.png"

        notify -n theme "  Dark theme on" "" --hint boolean:transient:true

    elif [ $arg1 == $option2 ]; then
        echo "Setting latte theme"
        # Switching multiple program
        alacritty_set_latte
        gtk_set_latte
        polybar_set_latte
        i3_set_latte
        deadd_set_latte
        rofi_set_latte
        starship_set_latte
        neovim_set_latte
        fcitx_set_latte
        # Wallpapers
        feh --bg-scale "${WALLPAPER_PATH}/Complex/colorful_landscape.png"

        notify -n theme "󰖨  Light theme on" "" --hint boolean:transient:true
    else
        echo "Invalide arguments"
        cleanup
        exit 1
    fi
    echo "$arg1" > $THEME_SWITCHER_CONFIG
    cleanup
fi
