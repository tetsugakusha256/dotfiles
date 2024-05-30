#!/bin/bash

# Navigate to the directory containing the files
path=${1}

if [ -z "$path" ]
then
    echo "Invalide arguments zero"
elif [ -e "$path" ]; then
    echo "Valid path"
    if [ -d "$path" ]; then
        echo "Path is a directory."
        # Loop through each file in the directory
        for file in "$path"/*; do
            # Get the creation date of the file
            creation_date=$(stat -c %y "$file" | cut -d ' ' -f1,2)

            # Replace any special characters in the filename with underscores
            new_file_name=$(echo "$creation_date" | tr -s '[:punct:]' '_')
            
            old_file_name=$(basename "$file")

            # Append the creation date to the beginning of the filename
            new_file_name="${new_file_name}__${old_file_name}"

            # echo "$new_file_name"
            # echo "moved $file to \
            #   $new_file_name"

            # Rename the file
            mv "$file" "$new_file_name"
        done
    else
        echo "Path is not a directory"
    fi
else
    echo "Invalide arguments"
fi
