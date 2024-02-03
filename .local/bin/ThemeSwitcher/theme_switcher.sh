#!/bin/bash

# Add song to queue
option1=dark
# Add song to playlist and directly play it
option2=light

arg1=${1:-nothing}
if [ $arg1 == $option1 ]
then
    echo "dark theme"
elif [ $arg1 == $option2 ]; then
    echo "light theme"
else
    echo "Invalide arguments"
    exit 1
fi
echo "next"
