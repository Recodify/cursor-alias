#!/bin/bash

extract_version() {
    local filename="$1"
    if [[ $filename =~ cursor-([0-9]+\.[0-9]+\.[0-9]+) ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo "0.0.0"  # Return a default version for invalid formats
    fi
}

version_gt() {
    test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"
}

get_latest_version() {
    local dir="$1"

    if [ ! -d "$dir" ] || [ ! -r "$dir" ]; then
        echo "Error: Directory '$dir' does not exist or is not readable" >&2
        return 1
    fi

    local latest_version="0.0.0"
    local latest_file=""

    cd "$dir" || return 1


    for file in cursor-*AppImage; do
        [[ -f "$file" ]] || continue

        version=$(extract_version "$file")

        if version_gt "$version" "$latest_version"; then
            latest_version="$version"
            latest_file="$file"
        fi
    done

    if [ -z "$latest_file" ]; then
        echo "No Cursor AppImage files found in directory: $dir" >&2
        return 1
    fi

    echo "$dir/$latest_file"
    return 0
}