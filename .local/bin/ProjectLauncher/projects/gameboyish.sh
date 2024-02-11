#!/bin/bash

i3-msg 'workspace 3; exec /home/anon/.local/bin/ProjectLauncher/helper/gameboyish_ws3.sh'
sleep 1
i3-msg 'workspace 1; exec /home/anon/.local/bin/ProjectLauncher/helper/gameboyish_ws1.sh'
