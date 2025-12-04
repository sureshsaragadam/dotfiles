#!/bin/bash

# Source and destination
SRC="$HOME/dotfiles"
DEST="$HOME/archives/dotfiles-archive/"

# Create destination directory if not exists
mkdir -p "$DEST"

# Date format for the archive name
DATE=$(date +"%Y%m%d-%H%M%S")

# Output filename
ARCHIVE="$DEST/archi3sysconfigs-$DATE.tar.gz"

# Create the tar.gz archive
tar -czvf "$ARCHIVE" "$SRC"

echo "Backup created: $ARCHIVE"

