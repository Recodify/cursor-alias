#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./install.sh <cursor_tools_directory>"
    echo "Example: ./install.sh ~/tools"
    exit 1
fi

CURSOR_ROOT=$1

mkdir -p "$CURSOR_ROOT"

cp ./cursor.sh ~/

sed "s|~/tools|$CURSOR_ROOT|" ./alias.sh > ./alias.sh.tmp

cat ./alias.sh.tmp >> ~/.bashrc

rm ./alias.sh.tmp

echo "All done! Cursor tools directory set to: $CURSOR_ROOT"
echo "To make the alias available:"
echo "  - Either source your profile (source ~/.bashrc)"
echo "  - Alternatively, start a new terminal session"