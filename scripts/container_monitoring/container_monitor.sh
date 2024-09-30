#!/bin/bash
# Purpose: Docker container monitoring & alerting
# Usage: ./container_monitor.sh container_name example: ./container_monitor.sh mysql

SLACK_WEBHOOK_URL="https://hooks.slack.com/services/YOURSLACK"
HOSTNAME=$(hostname)
CONTAINER_NAME="$1"

if [ "$#" != "1" ]
then
    echo "This script requires 1 argument, name of docker container"
    exit 126
fi

# Function to get container logs
get_container_logs() {
    docker logs --tail 5 ${CONTAINER_NAME} 2>&1 || echo "Unable to retrieve container logs"
}

# Check if container is running
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "$CONTAINER_NAME container is down, sending a Slack alert"

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
else
    echo "$CONTAINER_NAME container is running"

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
fi

# Send the Slack alert
curl -X POST -H 'Content-type: application/json' --data "$MESSAGE" "$SLACK_WEBHOOK_URL"

# End