#!/bin/bash
# Project to launch certain command into certain workspace on i3

# if [ $# -lt 1 ]; then
#     echo "Usage: $0 <Projects>"
#     exit 1
# fi

PROJECTS_PATH="$HOME/.local/bin/ProjectLauncher/projects"

choice=$(ls ${PROJECTS_PATH} | rofi -dmenu -i -p "Choose project" \
        -theme $HOME/.config/rofi/wide_chooser.rasi\
    )
if [ -z "$choice" ]; then
    echo "Variable is empty."
else
    echo "Lauching: "$PROJECTS_PATH$choice
    zsh $PROJECTS_PATH/$choice
fi
