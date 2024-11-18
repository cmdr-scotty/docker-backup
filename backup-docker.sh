#!/bin/bash

# Setup crontab to run every night at midnight
# sudo crontab -e
# 0 0 * * * /path/to/your/backup-docker.sh

# Define the backup directory
backupDir="/backups/Docker"

# Get today's date
backupDate=$(date +'%F')
echo "Current backup date: $backupDate"
echo ""

# Changing directory to Docker config locations: /docker
echo "Changing directory to docker config location: /docker"
cd /docker
echo ""

# Stop all docker containers
echo "Stopping all docker containers..."
docker-compose stop
echo ""

# Compress and archive Docker config directory
echo "Compressing and archiving Docker config directory..."
tar -czpf /tmp/docker-backup-$backupDate.tgz *
echo ""

# Start all Docker containers
echo "Starting all Docker containers..."
docker-compose up -d
echo ""

# Copy backup to backup location
echo "Coping backup to backup location..."
sudo cp /tmp/docker-backup-$backupDate.tgz $backupDir
echo ""

# Remove tmp backup file
echo "Removing temporary backup file..."
rm /tmp/docker-backup-$backupDate.tgz
echo ""

# Delete backups older than 12 months
echo "Deleting backups older than 12 months..."
find $backupDir -type f -name "docker-backup-*" -mtime +365 -delete
echo ""

echo "Backup and cleanup complete!"
echo""
