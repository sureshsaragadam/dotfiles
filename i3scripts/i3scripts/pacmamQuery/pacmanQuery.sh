#!/bin/bash

# Directory to store backups
BACKUP_DIR="$HOME/.config/backpac"
mkdir -p "$BACKUP_DIR"

# Timestamp for filenames
DATE=$(date +"%Y-%m-%d")

# Backup all packages
pacman -Q > "$BACKUP_DIR/all-packages-$DATE.txt"

# Backup explicitly installed packages
pacman -Qe > "$BACKUP_DIR/explicit-packages-$DATE.txt"

echo "✔ Backup completed."
echo "   All packages:       $BACKUP_DIR/all-packages-$DATE.txt"
echo "   Explicit packages:  $BACKUP_DIR/explicit-packages-$DATE.txt"

