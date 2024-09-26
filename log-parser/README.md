# Log Parser

## Overview

This Bash script is designed to parse log files and extract entries based on specified time ranges and log types. It provides a flexible and efficient way to analyze log data across different operating systems.

## Features

- Cross-platform compatibility (Linux and macOS)
- Time range filtering
- Log type filtering
- Support for any log file path
- Robust error handling and input validation
- Efficient log parsing using AWK

## Prerequisites

- Bash shell (version 3.2 or later)
- AWK (GNU AWK or compatible version)
- Standard Unix utilities (date, tr)

## Installation

1. Clone this repository or download the script file.
2. Make the script executable:
   ```
   chmod +x log_parser.sh
   ```

## Usage

```
./log_parser.sh <start_time> <end_time> <log_type> <log_file>
```

### Parameters

- `<start_time>`: The start of the time range (format: YYYY-MM-DD HH:MM:SS)
- `<end_time>`: The end of the time range (format: YYYY-MM-DD HH:MM:SS)
- `<log_type>`: The type of log entries to filter (options: ERROR, INFO, WARNING, CRITICAL)
- `<log_file>`: The path to the log file to be parsed

### Example

```
./log_parser.sh "2023-01-01 00:00:00" "2023-01-31 23:59:59" ERROR /path/to/your/logfile.log
```

This command will parse the specified log file and display all ERROR entries between January 1, 2023, and January 31, 2023.

## Log File Format

The script expects the log file to follow this format:

```
[YYYY-MM-DD HH:MM:SS] LOG_TYPE Log message
```

Example:
```
[2023-01-15 14:30:45] ERROR Database connection failed
```

## Functions

### `usage()`
Displays usage information when the script is run with incorrect parameters.

### `date_to_timestamp()`
Converts a date string to a Unix timestamp, with cross-platform compatibility.

### `validate_args()`
Validates the command-line arguments for correct number and format.

### `check_log_file()`
Verifies the existence of the log file before processing.

### `parse_logs()`
The core function that uses AWK to parse the log file based on the given criteria.

### `main()`
Orchestrates the entire log parsing process.

## Error Handling

The script includes error handling for:
- Incorrect number of arguments
- Invalid log types
- Missing or inaccessible log file

- Script Usage example
```bash
./log.sh "2024-08-07 00:00:00" "2024-08-07 10:19:32" ERROR ${PWD}/log.txt
[2024-08-07 10:15:32] ERROR - An error occurred
[2024-08-07 10:18:05] ERROR - Failed to connect to database ${PWD}/log.txt

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:16:00" ERROR ${PWD}/log.txt
[2024-08-07 10:15:32] ERROR - An error occurred

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:17:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:17:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:16:00" info ${PWD}/log.txt

./log.sh "2024-08-07 00:00:00" "2024-08-07 10:30:00" info ${PWD}/log.txt
[2024-08-07 10:16:45] INFO - System is running
[2024-08-07 10:19:32] INFO - User logged in
```

### Commands and function Working

- usage() function
```bash
usage function is only called if one of these conditions in validate_args "$@" is met in the main() function. If all arguments are correct, usage is never called.
If usage is called, it prints the usage information and then exits the script with exit 1, preventing further execution. 
```

- date_to_timestamp() function
The date_to_timestamp function is called twice in the main function:

local start_time=$(date_to_timestamp "$1")
local end_time=$(date_to_timestamp "$2")

```bash
date -j -f "%Y-%m-%d %H:%M:%S" "2024-08-07 10:30:00" "+%s"

-date: The basic command to work with dates in Unix-like systems.
-j: This flag tells date not to set the date, but just to parse the input.
-f "%Y-%m-%d %H:%M:%S": This specifies the format of the input date string.
"2024-08-07 10:30:00": This is the actual date and time.
"+%s": This tells date to output the result as a Unix timestamp (seconds since the Unix epoch).

The result, 1723008600, is the Unix timestamp corresponding to August 7, 2024, at 10:30:00 AM. 

# Darwin (macOS)
date -d "%Y-%m-%d %H:%M:%S" "2024-08-07 10:30:00" "+%s"

date: illegal option -- d
usage: date [-jnRu] [-I[date|hours|minutes|seconds]] [-f input_fmt]
            [-r filename|seconds] [-v[+|-]val[y|m|w|d|H|M|S]]
            [[[[mm]dd]HH]MM[[cc]yy][.SS] | new_date] [+output_fmt]
```