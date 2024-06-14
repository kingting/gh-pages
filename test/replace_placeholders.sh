#!/bin/bash

# Parameters
start_marker=$1
end_marker=$2
script_filename=$3
script_type=$4

# Check if all parameters are provided
if [ -z "$start_marker" ] || [ -z "$end_marker" ] || [ -z "$script_filename" ] || [ -z "$script_type" ]; then
  echo "Usage: $0 <start_marker> <end_marker> <script_filename> <script_type>"
  exit 1
fi

# Use awk to process the README.md and insert the file content between markers
awk -v start_marker="$start_marker" -v end_marker="$end_marker" -v script_type="$script_type" -v script_filename="$script_filename" '
BEGIN {
    # Read the file content into a variable
    while ((getline line < script_filename) > 0) {
        content = content line "\n"
    }
    close(script_filename)
}
{
    print
    if ($0 ~ start_marker) {
        print "```" script_type
        print content
    }
    if ($0 ~ end_marker) {
        print "```"
    }
}
' README.md > README.tmp && mv README.tmp README.md

