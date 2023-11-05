#!/bin/bash
# add to playlist
option1=append
# play
option2=play
option3=append_mult
arg1=${1:-nothing}
if [ $arg1 == $option1 ]
then
    output=$(find /home/anon/Documents/Music -type f -iname "*.mp3" | fzf --bind=ctrl-e:up)
    echo "Adding : ${output} to playlist"
    mocp -a "${output}"
    echo "Added"
elif [ $arg1 == $option2 ]; then
    output=$(find /home/anon/Documents/Music -type f -iname "*.mp3" | fzf --bind=ctrl-e:up)
    mocp -l "${output}"
    mocp -a "${output}"
    echo "Playing : ${output}"
elif [ $arg1 == $option3 ]; then
    output=$(find /home/anon/Documents/Music -type f -iname "*.mp3" | fzf -m --bind=ctrl-e:up)
    # foroutputmatted_selection=$(echo "$output" | awk -v ORS=' ' '{$1=$1}1' | sed 's/ $//' | sed -e 's/^/"/' -e 's/ /" "/g' -e 's/$/"/')
formatted_selection=$(echo "$output" | sed 's/ /\\ /g' | tr '\n' ' ')
    echo "Adding : ${formatted_selection} to playlist"
    mocp -a ${formatted_selection}
    echo "Added"
else
    echo "Invalide arguments"
fi
