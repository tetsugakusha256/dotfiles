#!/bin/bash

# add to playlist
option1=append
# play
option2=play
option3=playlist
music_dir="/home/anon/Documents/Music"
playlist_dir="/home/anon/Documents/Music/Playlists"

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
        mocp -l "${selected_music_path}"
        echo "Added to playlist"
    fi
elif [ $arg1 == $option3 ]; then
  #select playlist
    playlist=$(find "$playlist_dir" -type f -iname "*.m3u" | sed "s#^$music_dir##" | rofi -dmenu -i -p "Choose playlist" \
            -theme "$HOME"/.config/rofi/music_chooser.rasi\
        )
    if [ -z "$playlist" ]; then
        echo "Variable is empty."
    else
        echo "Playlist : ${playlist}"
        selected_music_path="$music_dir$playlist"
        echo "Playlist : ${selected_music_path}"
        mocp -c
        mocp -a "${selected_music_path}"
        echo "Added to playlist"
    fi
else
    echo "Invalide arguments"
fi
