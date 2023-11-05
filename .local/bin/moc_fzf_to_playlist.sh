#!/bin/bash

# add to playlist
option1=append
# play
option2=play
option3=append_mult
music_dir="/home/anon/Documents/Music"

arg1=${1:-nothing}

process_name=mocp
# Check for mocp process
if pgrep "$process_name" > /dev/null; then
    echo "$process_name is already running."
else
    echo "$process_name is not running. Starting it now..."
    # Start the process (replace with your actual command)
    mocp -S
fi

if [ $arg1 == $option1 ]
then
    output=$(find "$music_dir" -type f -iname "*.mp3" | sed "s#^$music_dir##" | rofi -dmenu -i -p "Choose music" \
            -theme "$HOME"/.config/rofi/music_chooser.rasi\
        )
    if [ -z "$output" ]; then
        echo "Variable is empty."
    else
        echo "Adding : ${output} to playlist"
        selected_music_path="$music_dir$output"
        mocp -a "${selected_music_path}"
        echo "Added"
    fi
elif [ $arg1 == $option2 ]; then
    output=$(find "$music_dir" -type f -iname "*.mp3" | sed "s#^$music_dir##" | rofi -dmenu -i -p "Choose music" \
            -theme "$HOME"/.config/rofi/music_chooser.rasi\
        )
    if [ -z "$output" ]; then
        echo "Variable is empty."
    else
        echo "Playing : ${output}"
        selected_music_path="$music_dir$output"
        mocp -a "${selected_music_path}"
        sleep 1 
        mocp -l "${selected_music_path}"
        echo "Added to playlist"
    fi
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
