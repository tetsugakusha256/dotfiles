#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <file1> <file2> ..."
    exit 1
fi

# Get a list of files sorted alphabetically
files=($(printf "%s\n" "$@" | sort))

# Counter for numbering files
count=1

# Iterate through each file and rename it
for file in "${files[@]}"; do
    # Get the file extension
    extension="${file##*.}"
    name=$(echo ${file} | cut -d'-' -f1)
    
    # Format the count with leading zeros
    formatted_count=$(printf "%03d" "$count")
    # Generate the new filename with the number prefix
    new_filename="$formatted_count-$name.$extension"
    # Rename the file
    mv "$file" "$new_filename"
    # Increment the counter
    ((count++))
done
