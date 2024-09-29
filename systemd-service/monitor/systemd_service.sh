#!/bin/bash

# Generic Systemd Service Monitor Creator with Slack Alerts
# Usage: sudo ./service_monitor_setup.sh <service_name> <port>

set -euo pipefail

# e: Exit immediately if a command exits with a non-zero status.
# u: Treat unset variables as an error when substituting.
# o pipefail: The return value of a pipeline is the status of the last command to exit with a non-zero stat

# ----------------------
# Customization Options
# ----------------------

# Monitoring Interval (in seconds)
MONITOR_INTERVAL="10sec"

# Log Location (leave empty for default logging to journalctl)
LOG_FILE=""

# Restart Behavior
RESTART_ON_FAILURE="on-failure"
RESTART_SEC="10"

# Slack Webhook URL (replace with your actual webhook URL)
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOUR/WEBHOOK/URL"

# Slack Message Format
SLACK_DOWN_MESSAGE=":warning: %s service is down. Attempting to restart..."
SLACK_RESTART_SUCCESS=":white_check_mark: %s service restarted successfully."
SLACK_RESTART_FAILURE=":x: Failed to restart %s service. Manual intervention required!"

# ----------------------
# Script Logic
# ----------------------

# Get the script name without the path
SCRIPT_NAME=$(basename "$0")

# Check for correct number of arguments
if [ $# -ne 2 ]; then
    echo "Usage: $SCRIPT_NAME <service_name> <port>"
    echo "Example: $SCRIPT_NAME mysql 3306"
    exit 1
fi

# Configuration
SERVICE_NAME="$1"
SERVICE_PORT="$2"
SCRIPT_PATH="/usr/local/bin/${SERVICE_NAME}_monitor.sh"

# Function to log messages
log() {
    local message="[$(date +'%Y-%m-%d %H:%M:%S')] $1"
    if [ -n "$LOG_FILE" ]; then
        echo "$message" >> "$LOG_FILE"
    else
        echo "$message"
    fi
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if required commands are available
for cmd in netstat systemctl curl
 do
    if ! command_exists "$cmd"; then
        log "Error: $cmd is not installed. Please install it and try again."
        exit 1
    fi
done

# Create the service monitor script
create_monitor_script() {
    cat <<EOF > "$SCRIPT_PATH"
#!/bin/bash

# $SERVICE_NAME Monitor Script

set -euo pipefail

SLACK_WEBHOOK_URL="$SLACK_WEBHOOK_URL"
LOG_FILE="$LOG_FILE"

log() {
    local message="[\$(date +'%Y-%m-%d %H:%M:%S')] \$1"
    if [ -n "$LOG_FILE" ]; then
        echo "\$message" >> "$LOG_FILE"
    else
        echo "\$message"
    fi
}

send_slack_alert() {
    local message="\$1"
    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"\$message\"}" "\$SLACK_WEBHOOK_URL"
}

# Check if $SERVICE_NAME service is running
if ! netstat -tuln | grep -q ":$SERVICE_PORT.*LISTEN"; then
    log "$SERVICE_NAME service is down. Attempting to restart..."
    send_slack_alert "$(printf "$SLACK_DOWN_MESSAGE" "$SERVICE_NAME")"
    if sudo systemctl restart $SERVICE_NAME; then
        log "$SERVICE_NAME service restarted successfully."
        send_slack_alert "$(printf "$SLACK_RESTART_SUCCESS" "$SERVICE_NAME")"
    else
        log "Failed to restart $SERVICE_NAME service."
        send_slack_alert "$(printf "$SLACK_RESTART_FAILURE" "$SERVICE_NAME")"
    fi
else
    log "$SERVICE_NAME service is running."
fi
EOF

    chmod +x "$SCRIPT_PATH"
    log "Created $SERVICE_NAME monitor script: $SCRIPT_PATH"
}

# Create the systemd service file
create_service_file() {
    cat <<EOF | sudo tee "/etc/systemd/system/${SERVICE_NAME}_monitor.service" > /dev/null
[Unit]
Description=$SERVICE_NAME Monitor Service
After=$SERVICE_NAME.service

[Service]
ExecStart=$SCRIPT_PATH
Restart=$RESTART_ON_FAILURE
RestartSec=$RESTART_SEC

[Install]
WantedBy=multi-user.target
EOF

    log "Created systemd service file: ${SERVICE_NAME}_monitor.service"
}

# Create the systemd timer file
create_timer_file() {
    cat <<EOF | sudo tee "/etc/systemd/system/${SERVICE_NAME}_monitor.timer" > /dev/null
[Unit]
Description=Run $SERVICE_NAME Monitor Service every $MONITOR_INTERVAL

[Timer]
OnBootSec=$MONITOR_INTERVAL
OnUnitActiveSec=$MONITOR_INTERVAL
Unit=${SERVICE_NAME}_monitor.service

[Install]
WantedBy=timers.target
EOF

    log "Created systemd timer file: ${SERVICE_NAME}_monitor.timer"
}

# Main execution
main() {
    log "Starting $SERVICE_NAME Monitor Systemd Service Creator"

    create_monitor_script
    create_service_file
    create_timer_file

    log "Reloading systemd daemon..."
    sudo systemctl daemon-reload

    log "Enabling and starting ${SERVICE_NAME}_monitor.timer..."
    sudo systemctl enable "${SERVICE_NAME}_monitor.timer"
    sudo systemctl start "${SERVICE_NAME}_monitor.timer"

    log "$SERVICE_NAME Monitor Service setup complete."
}

main