#!/bin/bash

# Check if the arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Both arguments needs to be provided, path to a file and tex for the file"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
dir_path=$(dirname "$writefile")

if [ ! -d "$dir_path" ]; then
    mkdir -p "$dir_path" || { echo "Error: Failed to create directory."; exit  1; }
fi

# Write the content to the file

echo "$writestr" > "$writefile" || { echo "Error: Failed to write to the file."; exit1; }

echo "Content written successfully to $writefile"