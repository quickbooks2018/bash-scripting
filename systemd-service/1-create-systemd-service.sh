#!/bin/bash

# Define variables
SERVICE_NAME="mysql_service"
SCRIPT_PATH="/root/mysql_systemd_service.sh"

# Check if the script exists
if [[ ! -f $SCRIPT_PATH ]]; then
    echo "Script $SCRIPT_PATH not found!"
    exit 1
fi

# Create the systemd service file
sudo cat <<EOF > /etc/systemd/system/$SERVICE_NAME.service
[Unit]
Description=Run MySQL service script

[Service]
ExecStart=$SCRIPT_PATH
EOF

# Create the systemd timer file
sudo cat <<EOF > /etc/systemd/system/$SERVICE_NAME.timer
[Unit]
Description=Run MySQL service script every 10 seconds

[Timer]
OnBootSec=10sec
OnUnitActiveSec=10sec
Unit=$SERVICE_NAME.service

[Install]
WantedBy=timers.target
EOF

# Reload systemd, enable, and start the timer
sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME.timer
sudo systemctl start $SERVICE_NAME.timer

echo "Systemd service and timer for $SCRIPT_PATH created and started."

# End