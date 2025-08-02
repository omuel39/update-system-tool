#! /bin/bash

# ========== Configuration ==========
LOG_DIR="$HOME/myproject/logs"
LOG_FILE="$LOG_DIR/update.log"
EMAIL="osmuel90@mail.com"


# ========== Create log directory ==========
mkdir -p "$LOG_DIR"

log(){

    echo "$(date '+%Y-%m-%d %H:%M:%S') ] $1" >> "$LOG_FILE"
}
 # ========== Permission Root check ==========
if [ "$(id -u)" -ne 0 ]; then
   log "ERROR: This script must be run as root."
   exit 1

fi

# ========== Update Process ==========
log "INFO: Starting system update process"

# Show list of upgradable packages
log "INFO: Listing upgradable package ..."
apt list --upgradable >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
   log "ERROR: Unable to list upgradable packages ."
   exit 2
fi

# Update Package  list
log "INFO: Running apt update..."
DEBIAN_FRONTEND=noninteractive apt update -y >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
 log "ERROR: 'apt upgrade' failed."
 exit 3

fi

# Upgrade packages
log "INFO: Running apt upgrade..."
DEBIAN_FRONTEND=noninteractive apt upgrade -y  >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log "ERROR: 'apt upgrade' failed"
    exit 4
fi

# Clean unused packages
log "INFO: Cleaning up..."
apt autoremove -y >> "$LOG_FILE" 2>&1
apt clean >> "$LOG_FILE" 2>&1

# Finish log
log "INFO: System update completed successfully."
log "INFO: Review /var/log/apt/history.log for detailed APT actions"

# Optional: Send log summary via email
# mail -s "System Update log" "$EMAIL" < "$LOG_FILE"

# Email notification
if command -v mail &> /dev/null; then
   log "Sending email report to $EMAIL"
   mail -s "System Update Report $(date '+%Y-%m-%d')" "$EMAIL" < "$LOG_FILE"
fi
