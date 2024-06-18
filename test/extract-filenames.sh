#!/bin/bash

# Check if input file is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

# Input README.md file
input_file="$1"

# Extract all filenames from the lines containing <!-- ...-start -->
file_names=$(grep -oP '(?<=<!-- ).*?(?=-start -->)' "$input_file")

# Iterate through the list of filenames and print each one with its extension
for file_name in $file_names; do
  echo "$file_name"
done

