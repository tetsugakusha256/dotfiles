#!/bin/bash

# Check if the device ID is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <partition_id> (sdb1)"
    exit 1
fi

# Extract the target device ID from the command-line argument
target_partition="$1"
echo "Target partition : ${target_partition}"

# Check if the target drive is already mounted
if mount | grep -q "${target_partition}"; then
    echo "The partition is already mounted."
    echo "Do you want to backup to the already mounted drive?"
    read run_backup
    if ["$run_backup" == "yes"]; then
        run_backup
    else
        exit 0
    fi
else
    # Mount the drive
    echo "mounting /dev/$target_partition to /mnt/test/"
    sudo mount "/dev/$target_partition" /mnt/test/
    echo "Drive mounted successfully."
fi

# Start rsync
sudo rsync -av --no-o --no-g --progress --dry-run --filter="merge /home/anon/.config/rsync/include_backup_list.txt" /home/anon/ /mnt/test/backup_arch/
