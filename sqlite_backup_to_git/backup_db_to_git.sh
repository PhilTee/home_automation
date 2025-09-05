#!/bin/bash
set -euo pipefail

# Config
DB_PATH="/opt/inventory/development.sqlite3"
REPO_DIR="/opt/automation/sqlite_backup_to_git"
BACKUP_FILE="lego_inventory.sql"
BRANCH="main"

cd "$REPO_DIR"

# Dump the SQLite DB to a text file
sqlite3 "$DB_PATH" ".dump" > "$BACKUP_FILE"

# Check if anything changed
if ! git diff --quiet; then
    git add "$BACKUP_FILE"
    git commit -m "SQLite backup on $(date +'%Y-%m-%d %H:%M:%S')"
    git push origin "$BRANCH"
else
    echo "No changes detected, nothing to commit."
fi

