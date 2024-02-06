#!/bin/bash

# Add song to queue
option1=append
# Add song to playlist and directly play it
option2=play
# Add playlist
option3=playlist
music_dir="/$HOME/Documents/Music"
playlist_dir="/$HOME/Documents/Music/Playlists"

arg1=${1:-nothing}

if [ $arg1 == $option1 ]
then
    song_list=$(find "$music_dir" -type f \( -iname "*.mp3" -o -iname "*.flac" \) | sed "s#^$music_dir/##")
    echo "${song_list}"
    output=$(echo "${song_list}" | rofi -dmenu -i -p "Queue" \
            -theme $HOME/.config/rofi/queue_music_chooser.rasi\
        )
    if [ -z "$output" ]; then
        echo "Variable is empty."
    else
        echo "Adding : ${output} to playlist"
        mpc del "${output}"
        mpc insert "${output}"
        notify "  Next" "${output}" \
            --hint boolean:transient:true \
            -n "music_queue" -a "  "
        echo "Added"
    fi
elif [ $arg1 == $option2 ]; then
    output=$(find "$music_dir" -type f \( -iname "*.mp3" -o -iname "*.flac" \) | sed "s#^$music_dir/##" | rofi -dmenu -i -p "Play" \
            -theme $HOME/.config/rofi/play_music_chooser.rasi\
        )
    if [ -z "$output" ]; then
        echo "Variable is empty."
    else
        echo "Playing : ${output}"
        mpc del "${output}"
        mpc insert "${output}"
        mpc next
        mpc play
        echo "Added to playlist"
    fi
elif [ $arg1 == $option3 ]; then
    #select playlist
    playlist=$(find "$playlist_dir" -type f -iname "*.m3u" | sed "s#^$playlist_dir/##" | \
            sed "s#.m3u##" | rofi -dmenu -i -p "Playlist" \
            -theme $HOME/.config/rofi/playlist_music_chooser.rasi\
        )
    if [ -z "$playlist" ]; then
        echo "Variable is empty."
    else
        echo "Playlist : ${playlist}"
        mpc clear
        mpc load ${playlist}
        mpc random on
        mpc repeat on
        mpc next
        mpc play
        echo "Added to playlist"
    fi
else
    echo "Invalide arguments"
fi
