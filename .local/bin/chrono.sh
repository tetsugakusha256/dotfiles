#!/bin/bash

# Run the script with nohup and send it to the background
nohup "$0" "$@" >/dev/null 2>&1 &

if [ $# -lt 1 ]; then
    echo "Usage: chrono.sh <start|stop>"
    exit 1
fi

kill_chrono() {
    kill $(ps aux | grep /.local/bin/chrono.sh | awk -F ' ' '{print $2}' | head -n 1)
}


# Function to calculate elapsed time
calculate_elapsed_time() {
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo $elapsed_time
}

last_time=""
update_time() {
    total_seconds=$1
    hours=$((total_seconds / 3600))
    remaining_seconds=$((total_seconds % 3600))
    minutes=$((remaining_seconds / 60))
    seconds=$((remaining_seconds % 60))
    result=""
    if [ $hours -ne 0 ]
    then
        result=$(printf "%02d:%02d:%02d" "$hours" "$minutes" "$seconds")
    elif [ $minutes -ne 0 ]
    then
        result=$(printf "%02d:%02d" "$minutes" "$seconds")
    else
        result=$(printf "%02d" "$seconds")
    fi
    echo $result
}


# Define a function to handle the kill signal
cleanup() {
    notify "Timer stopped 󱎬" "Final time: $last_time" -n chrono -a "󱎫  "
    echo "stop" $last_time
    exit 1
}

# Trap the kill signal and call the cleanup function
trap cleanup SIGINT SIGTERM
# Main function for the chronometer
chrono() {
    start_time=$(date +%s)
    times_to_run=3
    for (( i=1; i<=$times_to_run; i++ )); do
        elapsed=$(calculate_elapsed_time)
        formated_time=$(update_time $elapsed)
        last_time=$formated_time
        notify "Starting timer" "󱎫   $formated_time" -n chrono -a "󱎫  "
        sleep 1
    done
    while true; do
        # clear
        elapsed=$(calculate_elapsed_time)
        formated_time=$(update_time $elapsed)
        last_time=$formated_time
        notify "Timer" "󱎫   $formated_time" -n chrono -t 1 -a "󱎫  "
        echo $last_time
        sleep 1
    done
}

if [[ $1 = "stop" ]]
then
    kill_chrono
    exit 0
elif [[ $1 = "start" ]]
then
    # Call the main function
    chrono > /dev/null 
else
  echo "bad arg"
fi
