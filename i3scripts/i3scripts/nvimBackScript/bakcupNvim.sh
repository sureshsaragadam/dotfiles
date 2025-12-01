#!/bin/bash

# Source directory (your actual Neovim config)
SRC="/home/suresh/dotfiles/nvim/.config/nvim"

# Backup destination directory
DEST="/home/suresh/i3scripts/nvim-backups/"

# Create destination directory if it does not exist
mkdir -p "$DEST"

# Timestamp
TS=$(date +%Y%m%d-%H%M%S)

# Output file
OUT="$DEST/nvim-backup-$TS.tar.gz"

# Create archive
tar -czvf "$OUT" -C "$(dirname "$SRC")" "$(basename "$SRC")"

echo "Neovim backup created: $(date)"
echo "$OUT"

