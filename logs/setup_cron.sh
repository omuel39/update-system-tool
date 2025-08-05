#!/bin/bash

SCRIPT_PATH="/home/Sammy/myproject/scripts/update_system.sh"
CRON_PATTERN="0 2 * * 1 bash $SCRIPT_PATH"

echo " Checking for existing cron job..."

if sudo crontab -l | grep -q "$SCRIPT_PATH"; then
    echo "Cron job already exists for: $SCRIPT_PATH"
else
    echo " Adding new cron job to run every Monday at 2AM..."
    (sudo crontab -l: echo "$CRON PATTERN") | sudo crontab -
    echo "Cron job sucessfully scheduled."
fi
