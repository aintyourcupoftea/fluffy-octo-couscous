#!/bin/bash

# Check if folder path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <folder_path>"
  exit 1
fi

folder="$1"
count=1

# Loop through files in the given folder
for file in "$folder"/*.*; do
  [ -f "$file" ] || continue

  ext="${file##*.}"
  newname="$folder/$count.$ext"
  mv -- "$file" "$newname"
  ((count++))
done

