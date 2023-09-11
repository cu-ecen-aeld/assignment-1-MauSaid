#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Both directory path and search string are required."
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the first argument is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $dilesdir is not a valid directory."
    exit 1
fi

# Get the count of files in the directory and its subdirectories
file_count=$(find "$filesdir" -type f | wc -l)

# Get the count of matching lines in the directory and its subdirectories
matching_lines_count=$(find "$filesdir" -type f -exec grep -c "$searchstr" {} \; | awk '{ sum += $1 } END { print sum }')

# Print the result
echo "The number of files are $file_count and the number of matching lines are $matching_lines_count"