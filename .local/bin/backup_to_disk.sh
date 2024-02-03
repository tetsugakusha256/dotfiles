#!/bin/bash

# Check if the device ID is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <partition_id> (sdb1)"
    exit 1
fi

# Extract the target device ID from the command-line argument
target_partition="$1"
if  echo $target_partition | grep -q "sda";then
    echo "Can't choose the sda drive"
    exit 1
fi

disk_name=$(udevadm info --name=/dev/${target_partition} --query=property | grep ID_USB_MODEL= | sed "s/ID_USB_MODEL=//")
echo "Target partition : ${target_partition} on disk: ${disk_name}"

# Check if the target drive is already mounted
if mount | grep -q "${target_partition}"; then
    echo "The partition is already mounted."
    read -r -p "Do you want to backup to /mnt/backup/ anyway ?[y/N] " response
    case "$response" in
        [yY][eE][sS]|[yY])
            ;;
        *)
            exit 0
            ;;
    esac
else
    # Use lsblk to list block devices and grep for the target device
    if lsblk -o NAME,UUID | grep -q "$target_partition"; then
        # Mount the drive
        echo "mounting /dev/$target_partition to /mnt/backup/"
        sudo mount "/dev/$target_partition" /mnt/backup/
        # Check if mounted was successful
        if [ $? -ne 0 ];then
          exit 1
        fi
        echo "Drive mounted successfully."
    else
        echo "Drive not found or does not match the specified device ID."
        exit 1
    fi
fi

# Start rsync
echo "Backup ongoing"
sudo rsync -av --no-o --no-g --progress --filter="merge /home/anon/.config/rsync/data_backup_list.txt" /home/anon/ /mnt/backup/backup_arch/
echo "backup done. Unmounting"
sudo umount /mnt/backup/
