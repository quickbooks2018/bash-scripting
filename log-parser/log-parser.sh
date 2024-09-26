#!/bin/bash

# Display usage information
usage() {
    echo "Usage: $0 <start_time> <end_time> <log_type> <log_file>"
    echo "Time format: YYYY-MM-DD HH:MM:SS"
    echo "Log type: ERROR, INFO, WARNING, or CRITICAL"
    echo "Log file: Path to the log file"
    exit 1
}

# Convert date to Unix timestamp
date_to_timestamp() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        date -j -f "%Y-%m-%d %H:%M:%S" "$1" "+%s"
    else
        date -d "$1" +%s
    fi
}

# Validate command-line arguments
validate_args() {
    [ $# -ne 4 ] && usage
    valid_types=("ERROR" "INFO" "WARNING" "CRITICAL")
    local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
    [[ ! " ${valid_types[*]} " =~ $log_type ]] && echo "Invalid log type." && usage
}

# Check if log file exists
check_log_file() {
    local log_file="$1"
    [ ! -f "$log_file" ] && echo "Error: Log file '$log_file' not found." && exit 1
}

# Parse logs based on given criteria
parse_logs() {
    local start_time="$1"
    local end_time="$2"
    local log_type="$3"
    local log_file="$4"

    awk -v start="$start_time" -v end="$end_time" -v type="$log_type" '
        function to_timestamp(dt) {
            cmd = "date -j -f \"%Y-%m-%d %H:%M:%S\" \"" dt "\" \"+%s\""
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
main() {
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
