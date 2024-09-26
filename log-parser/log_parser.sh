#!/bin/bash
# Purpose: parsing log files based on specific time stamps
# Data format: ISO 8601 format: YYYY-MM-DD HH:MM:SS.

# Display usage information
function usage() {
    local script_name=$(basename "$0")
    echo "Usage: $script_name <start_time> <end_time> <log_file> [log_type]"
    echo "Time format: YYYY-MM-DD HH:MM:SS"
    echo "Log file: Path to the log file"
    echo "Log type (optional): ERROR, INFO, WARNING, or CRITICAL (case-insensitive)"
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
    if [ $# -lt 3 ] || [ $# -gt 4 ]; then
        usage
    fi
    if [ $# -eq 4 ]; then
        local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
        if [[ ! "$log_type" =~ ^(ERROR|INFO|WARNING|CRITICAL)$ ]]; then
            echo "Invalid log type. Must be ERROR, INFO, WARNING, or CRITICAL."
            usage
        fi
    fi
}

# Check if log file exists
function check_log_file() {
    local log_file="$1"
    [ ! -f "$log_file" ] && echo "Error: Log file '$log_file' not found." && exit 1
}

# Parse logs based on given criteria and count log types
function parse_logs() {
    local start_time="$1"
    local end_time="$2"
    local log_file="$3"
    local log_type="$4"

    awk -v start="$start_time" -v end="$end_time" -v type="$log_type" -v ostype="$OSTYPE" '
    BEGIN {
        error_count = 0
        info_count = 0
        warning_count = 0
        critical_count = 0
    }
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
        ts = to_timestamp(substr($0, 2, 19))

        # Print log entry if it matches criteria and count log types
        if (ts >= start && ts <= end && (type == "" || toupper($3) == type)) {
            print
            if (toupper($3) == "ERROR") error_count++
            else if (toupper($3) == "INFO") info_count++
            else if (toupper($3) == "WARNING") warning_count++
            else if (toupper($3) == "CRITICAL") critical_count++
        }
    }
    END {
        print "\n--- Log Entry Counts ---"
        print "ERROR:", error_count
        print "INFO:", info_count
        print "WARNING:", warning_count
        print "CRITICAL:", critical_count
    }
    ' "$log_file"
}

# Main function to orchestrate log parsing
function main() {
    validate_args "$@"

    local start_time=$(date_to_timestamp "$1")
    local end_time=$(date_to_timestamp "$2")
    local log_file="${4:-$3}"
    local log_type="${3:-}"

    # If log_type is a file path, assume no log_type was provided
    if [[ -f "$log_type" ]]; then
        log_file="$log_type"
        log_type=""
    else
        log_type=$(echo "$log_type" | tr '[:lower:]' '[:upper:]')
    fi

    check_log_file "$log_file"
    parse_logs "$start_time" "$end_time" "$log_file" "$log_type"
}

# Execute main function
main "$@"