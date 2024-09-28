#!/bin/bash
#Author: Muhammad Asim
#Purpose: This script monitors internet connectivity
#Date: 28 sept 2024

# Exit status
# 124: The command was terminated by timeout because it exceeded the specified duration.
# 125: The timeout command itself encountered an error (e.g., invalid syntax).
# 126: The command specified by timeout could not be invoked (permission issue or invalid path).
# 127: The command specified by timeout was not found.

# -z: This option tells nc to scan for listening daemons without sending any data. It's used for port scanning.
# -w3: This sets the timeout for the connection attempt to 3 second.
# -w is the timeout option
# 1 specifies the number of seconds to wait
# -v is the verbose option

# Check if the domain is provided
check_domain() {
    if [ $# -eq 0 ]; then
        echo "Error: This script $(basename "$0") requires a domain name as an argument"
        exit 1
    fi
}

# Function to check internet connectivity
check_internet() {
    local domain="$1"
    local port=443

    # Capture the current date and time
    local current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

    if nc -zw3 "$domain" "$port" 2>/dev/null; then
        echo "$current_datetime - Internet is working"

        # When return 0 is used, it means the function executed successfully without any errors.
        return 0
    else
        echo "$current_datetime - Internet is not working"

        # When return 1 is used, it means the function encountered an error.
        return 1
    fi
}

# Main execution
# $@: This is an array of all the arguments provided to the script
check_domain "$@"

# $1: This is the first argument provided to the script
check_internet "$1"

exit $?

#End