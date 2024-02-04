#!/bin/bash

GTK_CONFIG_PATH="$HOME/.config/gtk-3.0/settings.ini"
GTK_DOT_PATH="$HOME/.gtkrc-2.0"

gtk_set_mocha () {
    sed -i 's/^gtk-theme-name = .*/gtk-theme-name = Catppuccin-Mocha-Standard-Peach-Dark/' $GTK_CONFIG_PATH
    sed -i 's/^gtk-application-prefer-dark-theme = .*/gtk-application-prefer-dark-theme = true/' $GTK_CONFIG_PATH
    sed -i 's/^gtk-theme-name = .*/gtk-theme-name = "Catppuccin-Mocha-Standard-Peach-Dark"/' $GTK_DOT_PATH
    sed -i 's/^gtk-application-prefer-dark-theme = .*/gtk-application-prefer-dark-theme = true/' $GTK_DOT_PATH
}
gtk_set_latte () {
    sed -i 's/^gtk-theme-name = .*/gtk-theme-name = Catppuccin-Latte-Standard-Peach-Light/' $GTK_CONFIG_PATH
    sed -i 's/^gtk-application-prefer-dark-theme = .*/gtk-application-prefer-dark-theme = false/' $GTK_CONFIG_PATH
    sed -i 's/^gtk-theme-name = .*/gtk-theme-name = "Catppuccin-Latte-Standard-Peach-Light"/' $GTK_DOT_PATH
    sed -i 's/^gtk-application-prefer-dark-theme = .*/gtk-application-prefer-dark-theme = false/' $GTK_DOT_PATH
}