#!/bin/bash
BACKUP_DIR="/home/$USER/backups"
SOURCE="/home/$USER/myproject"
DATE=$(date +%F)  #Correct date foramt (YYYY-MM-DD)

# creat backup directory with proper permissions
mkdir -p "$BACKUP_DIR" || {
	echo "Failed to create backup directory" exit 1
 }

#create compressed backup (using -c to handle paths properly)
tar -czf "$BACKUP_DIR/full_backup_$DATE.tar.gz" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")" || 

# create backup log
{

echo "=== Backup Report ==="
echo "Date: $DATE"
echo "File: full_backup_$DATE.tar.gz"
echo -n "Size: "
du -h "$BACKUP_DIR/full_backup_$DATE.tar.gz" | cut -f1
echo "===================="
} >> "$BACKUP_DIR/backup.log" 2>&1

