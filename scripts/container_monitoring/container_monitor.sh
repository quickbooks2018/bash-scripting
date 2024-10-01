#!/bin/bash
# Purpose: Docker container monitoring & alerting

SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YourSlack"
HOSTNAME=$(hostname)
CONTAINER_NAME="$1"
SEND_SUCCESS_ALERTS="${2:-false}"  # Default to false if not provided

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]
then
    echo "Usage: $0 <container_name> [send_success_alerts(true/false)]"
    exit 165
fi

# Function to get container logs
get_container_logs() {
    docker logs --tail 5 ${CONTAINER_NAME} 2>&1 || echo "Unable to retrieve container logs"
}

# Function to send Slack alert
send_slack_alert() {
    local message="$1"
    local is_failure="$2"

    if [ "$is_failure" = "true" ] || [ "$SEND_SUCCESS_ALERTS" = "true" ]; then
        curl -X POST -H 'Content-type: application/json' --data "$message" "$SLACK_WEBHOOK_URL"
    else
        echo "Success alert not sent (success alerts disabled)"
    fi
}

# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME container is down, sending alert"

    # Get the last 5 lines of container logs
    CONTAINER_LOG=$(get_container_logs)

    # Prepare the Slack message for down container
    MESSAGE=$(cat <<EOF
{
    "blocks": [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":red_circle: *Alert: $CONTAINER_NAME Container is Down* :warning:"
            }
        },
        {
            "type": "section",
            "fields": [
                {
                    "type": "mrkdwn",
                    "text": "*Host:*\n$HOSTNAME"
                },
                {
                    "type": "mrkdwn",
                    "text": "*Container:*\n$CONTAINER_NAME"
                },
                {
                    "type": "mrkdwn",
                    "text": "*Status:*\nOffline"
                }
            ]
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": "*Recent $CONTAINER_NAME Container Logs:*\n\`\`\`$CONTAINER_LOG\`\`\`"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":pushpin: Please investigate and restart the $CONTAINER_NAME container if necessary."
            }
        }
    ]
}
EOF
)
    # Send the failure alert (always sent)
    send_slack_alert "$MESSAGE" "true"
else
    echo "$CONTAINER_NAME container is running, preparing status message"

    # Get the last 5 lines of container logs
    CONTAINER_LOG=$(get_container_logs)

    # Get container status details
    CONTAINER_STATUS=$(docker inspect --format='{{.State.Status}}' ${CONTAINER_NAME})
    CONTAINER_UPTIME=$(docker inspect --format='{{.State.StartedAt}}' ${CONTAINER_NAME})

    # Prepare the Slack message for running container
    MESSAGE=$(cat <<EOF
{
    "blocks": [
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":large_green_circle: *$CONTAINER_NAME Container is Running* :white_check_mark:"
            }
        },
        {
            "type": "section",
            "fields": [
                {
                    "type": "mrkdwn",
                    "text": "*Host:*\n$HOSTNAME"
                },
                {
                    "type": "mrkdwn",
                    "text": "*Container:*\n$CONTAINER_NAME"
                },
                {
                    "type": "mrkdwn",
                    "text": "*Status:*\n$CONTAINER_STATUS"
                },
                {
                    "type": "mrkdwn",
                    "text": "*Started At:*\n$CONTAINER_UPTIME"
                }
            ]
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": "*Recent $CONTAINER_NAME Container Logs:*\n\`\`\`$CONTAINER_LOG\`\`\`"
            }
        },
        {
            "type": "section",
            "text": {
                "type": "mrkdwn",
                "text": ":information_source: The $CONTAINER_NAME container is running fine. No action required."
            }
        }
    ]
}
EOF
)
    # Send the success alert (only if SEND_SUCCESS_ALERTS is true)
    send_slack_alert "$MESSAGE" "false"
fi

echo "Script execution completed."