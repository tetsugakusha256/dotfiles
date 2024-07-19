#!/bin/bash

i3-msg 'workspace 3; exec /home/anon/.local/bin/ProjectLauncher/helper/launch_ws3_kernel.sh'
sleep 1
i3-msg 'workspace 1; exec /home/anon/.local/bin/ProjectLauncher/helper/launch_ws1_kernel.sh'
