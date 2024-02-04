#!/bin/bash
THEME_SWITCHER_PATH="$HOME/.local/bin/ThemeSwitcher"
WALLPAPER_PATH="$HOME/Pictures/Wallpapers/Catppuccin"
source "${THEME_SWITCHER_PATH}/alacritty_switcher.sh"
source "${THEME_SWITCHER_PATH}/gtk_switcher.sh" 
source "${THEME_SWITCHER_PATH}/polybar_switcher.sh" 

# Set mocha theme
option1=mocha
# Set latte theme
option2=latte

arg1=${1:-nothing}
if [ $arg1 == $option1 ]
then
    echo "Setting mocha theme"
    alacritty_set_mocha
    gtk_set_mocha
    polybar_set_mocha
    feh --bg-fill "${WALLPAPER_PATH}/mocha/catppuccin_main.png"
elif [ $arg1 == $option2 ]; then
    echo "Setting latte theme"
    alacritty_set_latte
    gtk_set_latte
    polybar_set_latte
    feh --bg-fill "${WALLPAPER_PATH}/Complex/colorful_landscape.png"
else
    echo "Invalide arguments"
    exit 1
fi
