#!/bin/bash

# when incorrect usage
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <monitor-name>"
    echo "Refer 'https://hirusha.xyz/docs/linux/wacom-tablets' for more information"
    exit 1
fi

monitor_name=$1

# get wacom device ids
device_ids=$(xsetwacom list devices | grep -o 'id: [0-9]*' | awk '{ print $2 }')

# set
for id in $device_ids; do
    echo xsetwacom --set $id MapToOutput $monitor_name
    xsetwacom --set $id MapToOutput $monitor_name
done
