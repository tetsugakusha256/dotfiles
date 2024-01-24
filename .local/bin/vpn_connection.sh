#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <country_id> <vpn_number>"
    exit 1
fi

# Getting args
vpn_country="$1"
vpn_number="$2"
if [ $# -eq 1 ]; then
    vpn_number="1"
fi

# Getting list of vpn matching the country tag
vpn_list=$(ls "$XDG_CONFIG_HOME/openvpn/" -1 | grep -E "^.{0,1}$vpn_country")

# Number of matching vpn
number_config_available=$(echo "$vpn_list" | wc -l)

if [ -z "$vpn_list" ]
then
    echo "No vpn available for $vpn_country"
    exit 0
fi

if [[ $vpn_number -gt $number_config_available ]]
then
    echo "Only $number_config_available vpn available you chose n°$vpn_number"
else
    vpn_path=$(echo "$vpn_list" | sed -n "${vpn_number}p")
    full_path=$XDG_CONFIG_HOME/openvpn/$vpn_path
    echo "connecting to $vpn_path"
    sudo openvpn $full_path
fi
