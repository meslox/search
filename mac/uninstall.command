#!/bin/bash
set -e

BIN_DIR="$HOME/.local/bin"
PROFILE="$HOME/.zprofile"
PATH_LINE='export PATH="$HOME/.local/bin:$PATH"'

rm -f "$BIN_DIR/search"

# Remove the PATH line added by install.command, if present.
if [ -f "$PROFILE" ]; then
    TEMP_PROFILE="$(mktemp)"
    grep -Fvx "$PATH_LINE" "$PROFILE" > "$TEMP_PROFILE" || true
    cat "$TEMP_PROFILE" > "$PROFILE"
    rm -f "$TEMP_PROFILE"
fi

echo "Uninstallation completed."
echo "Removed: $BIN_DIR/search"
