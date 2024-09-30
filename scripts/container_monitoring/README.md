# Docker Container Monitor Script

This Bash script monitors Docker containers and sends alerts to Slack. It checks if a specified container is running and sends appropriate messages to a Slack channel using a webhook URL.

## Features

- Checks if a specified Docker container is running
- Sends alerts to Slack when a container is down
- Provides container status information when the container is running
- Includes recent container logs in the Slack message

## Usage

```bash
./container_monitor.sh <container_name>
```

Example:
```bash
./container_monitor.sh mysql
```

## Requirements

- Docker installed and running on the host system
- `curl` command-line tool for sending HTTP requests
- A valid Slack webhook URL

## Script Breakdown

Here's a line-by-line explanation of the script:

```bash
#!/bin/bash
# Purpose: Docker container monitoring & alerting
# Usage: ./container_monitor.sh container_name example: ./container_monitor.sh mysql
```
These lines specify the script interpreter and provide a brief description of the script's purpose and usage.

```bash
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOURSCLACK"
HOSTNAME=$(hostname)
CONTAINER_NAME="$1"
```
- Sets the Slack webhook URL (replace with your actual URL)
- Gets the hostname of the current machine
- Sets the container name from the first command-line argument

```bash
if [ "$#" != "1" ]
then
    echo "This script requires 1 argument, name of docker container"
    exit 126
fi
```
Checks if exactly one argument is provided; if not, it displays an error message and exits.

```bash
get_container_logs() {
    docker logs --tail 5 ${CONTAINER_NAME} 2>&1 || echo "Unable to retrieve container logs"
}
```
Defines a function to get the last 5 lines of container logs.

```bash
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    # ... (code for when container is down)
else
    # ... (code for when container is running)
fi
```
Checks if the container is running. If not, it prepares a "container down" message; otherwise, it prepares a "container running" message.

```bash
MESSAGE=$(cat <<EOF
{
    "blocks": [
        # ... (Slack message JSON structure)
    ]
}
EOF
)
```
Prepares the Slack message in JSON format with appropriate status information and container logs.

```bash
curl -X POST -H 'Content-type: application/json' --data "$MESSAGE" "$SLACK_WEBHOOK_URL"
```
Sends the prepared message to Slack using the webhook URL.

## Customization

- Update the `SLACK_WEBHOOK_URL` variable with your actual Slack webhook URL.
- Modify the Slack message structure in the `MESSAGE` variable to customize the alert format.

## Note

Ensure that the script has execute permissions:

```bash
chmod +x container_monitor.sh
```

You can set up a cron job to run this script at regular intervals for continuous monitoring.