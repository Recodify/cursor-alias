
# Launch latest version of cursor app image.
source ~/cursor.sh

CURSOR_ROOT="~/tools"

cursor() {
    local latest_version
    if latest_version="$(get_latest_version "$CURSOR_ROOT")"; then
        echo "Using: $latest_version" >&2  # Print to stderr so it doesn't interfere with command output
        "$latest_version" "$@"
    else
        return 1
    fi
}