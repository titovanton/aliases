#!/usr/bin/env bash


is_fragment_7z() {
    if [[ "$1" =~ \.[0-9]{1,4}$ ]]; then
        return 0
    else
        return 1
    fi
}


is_fragment_rar() {
    if [[ "$1" =~ \.part[0-9]+\.rar$ ]]; then
        return 0
    else
        return 1
    fi
}


remove_files() {
    files=$@

    for file in $files; do
        if [ -e "$file" ]; then
            rm "$file"
            echo "Deleted: $file"
        fi
    done
}


remove_matching_fragments_7z() {
    local target_file="$1"

    # cut out '.00x' ending from the filename
    base_filename="${target_file%.*}"

    remove_files "$base_filename".*
}


remove_matching_fragments_rar() {
    local target_file="$1"

    # cut out extension
    base_filename="${target_file%.part*.rar}"

    remove_files "${base_filename}.part"*.rar
}


remove_seeds() {
    # just a list of possible seeds

    seeds=$(find . -name *CAUTION*.txt -o -name *.something.else)

    for seed in $seeds; do
        rm $seed
        echo "Delete: $seed"
    done
}


unpack_and_remove() {
    local target_file="$1"

    7zz x "$target_file" && (
        (is_fragment_7z "$target_file" && remove_matching_fragments_7z "$target_file") ||
        (is_fragment_rar "$target_file" && remove_matching_fragments_rar "$target_file") ||
        (rm "$target_file" && echo "Deleted: $target_file")
    ) && remove_seeds
}


alias 7zx="unpack_and_remove"
