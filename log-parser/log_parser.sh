#!/bin/bash
# Purpose: parsing log files based in specific time stamps
# data format: ISO 8601 format: YYYY-MM-DD HH:MM:SS.

# Display usage information
function usage() {
    local script_name=$(basename "$0")
    echo "Usage: $script_name <start_time> <end_time> <log_type> <log_file>"
    echo "Time format: YYYY-MM-DD HH:MM:SS"
    echo "Log type: ERROR, INFO, WARNING, or CRITICAL"
    echo "Log file: Path to the log file"
    exit 1
}

# Convert date to Unix timestamp
function date_to_timestamp() {
    local input_date="$1"
    # Add ":00" for seconds if only hours and minutes are provided
    if [[ "$input_date" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}$ ]]; then
        input_date="${input_date}:00"
    fi

    local result
    if [[ "$OSTYPE" == "darwin"* ]]; then
        result=$(date -j -f "%Y-%m-%d %H:%M:%S" "$input_date" "+%s" 2>&1)
    else
        result=$(date -d "$input_date" +%s 2>&1)
    fi

    if [[ $? -ne 0 ]]; then
        echo "Error: Invalid date format - $1" >&2
        return 1
    fi
    echo "$result"
}

# Validate command-line arguments
function validate_args() {
    if [ $# -ne 4 ]; then
        usage
    fi
    valid_types=("ERROR" "INFO" "WARNING" "CRITICAL")
    local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
    if [[ ! " ${valid_types[*]} " =~ $log_type ]]; then
        echo "Invalid log type."
        usage
    fi
}

# Check if log file exists
function check_log_file() {
    local log_file="$1"
    [ ! -f "$log_file" ] && echo "Error: Log file '$log_file' not found." && exit 1
}

# Parse logs based on given criteria
function parse_logs() {
    local start_time="$1"
    local end_time="$2"
    local log_type="$3"
    local log_file="$4"

    awk -v start="$start_time" -v end="$end_time" -v type="$log_type" -v ostype="$OSTYPE" '
        function to_timestamp(dt) {
            if (ostype ~ /^darwin/) {
                cmd = "date -j -f \"%Y-%m-%d %H:%M:%S\" \"" dt "\" \"+%s\""
            } else {
                cmd = "date -d \"" dt "\" +%s"
            }
            cmd | getline ts
            close(cmd)
            return ts
        }
        {
            # Extract timestamp from log entry and convert to Unix timestamp
            ts = to_timestamp(substr($1, 2) " " substr($2, 1, length($2)-1))

            # Print log entry if it matches criteria
            if (ts >= start && ts <= end && $3 == type) print
        }
    ' "$log_file"
}

# Main function to orchestrate log parsing
function main() {
    validate_args "$@"

    local start_time=$(date_to_timestamp "$1")
    local end_time=$(date_to_timestamp "$2")
    local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
    local log_file="$4"

    check_log_file "$log_file"
    parse_logs "$start_time" "$end_time" "$log_type" "$log_file"
}

# Execute main function
main "$@"
