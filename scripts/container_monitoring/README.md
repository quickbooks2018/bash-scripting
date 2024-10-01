# Docker Container Monitoring Script

This bash script monitors a specified Docker container and sends alerts to Slack based on its status. Below is a detailed explanation of each part of the script.

## Script Header

```bash
#!/bin/bash
# Purpose: Docker container monitoring & alerting
```

- `#!/bin/bash`: This shebang line specifies that the script should be executed by the Bash shell.
- The comment describes the purpose of the script.

## Variable Declarations

```bash
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YourSlack"
HOSTNAME=$(hostname)
CONTAINER_NAME="$1"
SEND_SUCCESS_ALERTS="${2:-false}"  # Default to false if not provided
```

- `SLACK_WEBHOOK_URL`: Stores the Slack webhook URL for sending alerts.
- `HOSTNAME`: Captures the current system's hostname.
- `CONTAINER_NAME`: Stores the name of the container to monitor (passed as the first argument).
- `SEND_SUCCESS_ALERTS`: Determines whether to send alerts for successful checks (passed as the second argument, defaults to false).

## Argument Validation

```bash
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]
then
    echo "Usage: $0 <container_name> [send_success_alerts(true/false)]"
    exit 126
fi
```

This block checks if the correct number of arguments (1 or 2) is provided. If not, it displays the usage message and exits with status code 126.

## Function Definitions

### get_container_logs Function

```bash
get_container_logs() {
    docker logs --tail 5 ${CONTAINER_NAME} 2>&1 || echo "Unable to retrieve container logs"
}
```

This function retrieves the last 5 lines of logs from the specified container. If it fails, it returns an error message.

### send_slack_alert Function

```bash
send_slack_alert() {
    local message="$1"
    local is_failure="$2"

    if [ "$is_failure" = "true" ] || [ "$SEND_SUCCESS_ALERTS" = "true" ]; then
        curl -X POST -H 'Content-type: application/json' --data "$message" "$SLACK_WEBHOOK_URL"
    else
        echo "Success alert not sent (success alerts disabled)"
    fi
}
```

This function sends an alert to Slack. It takes two parameters:
1. `message`: The JSON-formatted message to send.
2. `is_failure`: A boolean indicating if this is a failure alert.

It sends the alert if it's a failure or if success alerts are enabled.

## Container Status Check

```bash
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    # Container is down
    # ... (alert preparation for down container)
else
    # Container is running
    # ... (status message preparation for running container)
fi
```

This block checks if the specified container is running. It uses `docker ps` to list running containers and `grep` to search for the exact container name.

## Alert Preparation for Down Container

Inside the `if` block, the script:
1. Logs that the container is down.
2. Gets the recent container logs.
3. Prepares a JSON-formatted message for Slack, including:
    - An alert header
    - Host and container details
    - Container logs
    - A call to action
4. Sends the failure alert using the `send_slack_alert` function.

## Status Message for Running Container

Inside the `else` block, the script:
1. Logs that the container is running.
2. Gets the recent container logs.
3. Retrieves additional container status details.
4. Prepares a JSON-formatted message for Slack, including:
    - A success header
    - Host and container details
    - Container status and uptime
    - Container logs
    - An informational message
5. Sends the success alert using the `send_slack_alert` function (only if enabled).

## Script Completion

```bash
echo "Script execution completed."
```

This line indicates that the script has finished executing.

## Usage

To use this script:

1. Save it with a `.sh` extension (e.g., `monitor_container.sh`).
2. Make it executable: `chmod +x monitor_container.sh`
3. Run it with a container name: `./monitor_container.sh my_container`
4. Optionally, enable success alerts: `./monitor_container.sh my_container true`

Ensure that you have the necessary permissions to run Docker commands and that the Slack webhook URL is correct.

## Permission

- Other user's permissions for docker
```bash
usermod cloud_user -aG docker 
```