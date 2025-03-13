#!/usr/bin/env bash

while read -r file; do
  ln -s "$file" "$(basename "$file")"
done < file_list.txt
