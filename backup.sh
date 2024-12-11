#!/bin/bash

# Path to the source directory whose backup is required
source_dir=/workspaces/Shell-Scripts/test

# Path where the backup must be created
backup_dir=/workspaces/Shell-Scripts

#Time stamp of backup creation
timestamp=$(date +"%Y%m%d_%H%M%S")

echo "Creating a backup for $source_dir....."
tar -czvf $backup_dir/backup_$timestamp.tar.gz $source_dir

echo "Backup Completed: $backup_dir/backup_$timestamp.tar.gz"

