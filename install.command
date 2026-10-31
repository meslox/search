#!/bin/bash
set -e

# macOS installer for the "search" command.
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
PROFILE="$HOME/.zprofile"
BIN_DIR="$HOME/.local/bin"

if ! command -v g++ >/dev/null 2>&1; then
    echo "Error: g++ was not found."
    echo "Install Xcode Command Line Tools with: xcode-select --install"
    exit 1
fi

if [ ! -f "$SCRIPT_DIR/search.cpp" ]; then
    echo "Error: search.cpp must be in the same directory as this installer."
    exit 1
fi

echo "Compiling search.cpp..."
g++ "$SCRIPT_DIR/search.cpp" -o "$SCRIPT_DIR/search"

mkdir -p "$BIN_DIR"
install -m 755 "$SCRIPT_DIR/search" "$BIN_DIR/search"

PATH_LINE='export PATH="$HOME/.local/bin:$PATH"'
touch "$PROFILE"
if ! grep -Fqx "$PATH_LINE" "$PROFILE"; then
    printf '\n%s\n' "$PATH_LINE" >> "$PROFILE"
fi

echo
echo "Installation completed."
echo 'Open a new Terminal window, then run: search -h'
echo "Installed to: $BIN_DIR/search"
