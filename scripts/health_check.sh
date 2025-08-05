#!/bin/bash
set -e

# Define log file to ensure directory exists
LOG_DIR="/home/$USER/myproject/logs"
LOG_FILE="$LOG_DIR/health_check.log"
mkdir -p "LOG_DIR"

#log function with timestamp
log() {
   echo "$(date '+%Y-%m-%d %H:%M:%S' ): $1" >> "$LOG_FILE"; }
check_cpu() {
load=$(uptime | awk -F'average:' '{print $2}' |awk '{print $1}' | tr -d ',')
  if [ "$(echo "$load > 1.0" | bc -l)" -eq 1 ]; then
    log "WARNING: High CPU load detected - $load"
  else
    log " CPU load normal - $load"
  fi
}

check_files(){
  count=$(find "/home/$USER/myproject" -type f | wc -l)
  log "Total files in project: $count"
}
# Main  execution
log "==== Starting health check ===="
check_cpu
check_files
log "==== Health check complete ===="
