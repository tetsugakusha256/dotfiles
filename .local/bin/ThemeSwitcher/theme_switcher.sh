#!/bin/bash
source ./alacritty_switcher.sh 
source ./gtk_switcher.sh 

# Add song to queue
option1=dark
# Add song to playlist and directly play it
option2=light

arg1=${1:-nothing}
if [ $arg1 == $option1 ]
then
    echo "Setting mocha theme"
    # alacritty_set_mocha
    gtk_set_mocha
elif [ $arg1 == $option2 ]; then
    echo "Setting latte theme"
    # alacritty_set_latte
    gtk_set_latte
else
    echo "Invalide arguments"
    exit 1
fi
echo "next"
