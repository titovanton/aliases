#!/usr/bin/env bash


is_fragment() {
    if [[ $1 =~ \.[0-9]{1,4}$ ]]; then
        # true
        return 0

    else
        # false
        return 1
    fi
}

remove_matching_fragments() {
  local target_file="$1"

  # cut out '.00x' ending from the filename
  base_filename="${target_file%.*}"

  for file in "$base_filename".*; do
    if [ -e "$file" ]; then
      rm "$file"
      echo "Deleted: $file"
    fi
  done
}

unpack_and_remove() {
    local target_file="$1"

    7zz x "$target_file" && (
        is_fragment "$target_file" &&
        remove_matching_fragments "$target_file" ||
        (rm "$target_file" && echo "Deleted: $target_file")
    )
}


alias 7zx="unpack_and_remove"
