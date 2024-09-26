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

##### usage() function
```bash
usage funntion() is called from validate_args() function.
usage function is only called if one of these conditions in validate_args "$@" is not met. If all arguments are correct, usage is never called.
If usage is called, it prints the usage information and then exits the script with exit 1, preventing further execution. 
```

##### date_to_timestamp() function
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

##### validate_args function
We are calling in the main function
Note: In validate function, we are calling usage function

- check_log_file function
We are calling in the main function, it is checking the log file path, exist or not.

##### parse_logs function
Function Parameters:

It takes four parameters: start time, end time, log type, and log file path.


AWK Command:
The function uses awk to process the log file.
It passes the start time, end time, and log type as variables to awk using the -v option.


Timestamp Conversion:
Inside awk, there's a to_timestamp function that converts date strings to Unix timestamps.
This function uses the date command (specifically tailored for macOS with the -j flag) to perform the conversion.


Log Entry Processing:
For each line in the log file:
It extracts the timestamp from the log entry (assuming a format like [YYYY-MM-DD HH:MM:SS]).
It converts this timestamp to a Unix timestamp using the to_timestamp function.

Filtering:
It checks if the extracted timestamp falls within the specified start and end times.
It also checks if the log type (3rd field in the log entry) matches the specified type.

Output:
If a log entry meets both the time range and log type criteria, it's printed to the output

1. It uses `awk` to process the log file line by line.
2. The function passes start time, end time, and log type as variables to awk.
3. Inside awk, it defines a `to_timestamp` function to convert date strings to Unix timestamps.
4. For each log entry:
   - It extracts the timestamp and converts it to a Unix timestamp.
   - It checks if the timestamp is within the specified range and if the log type matches.
   - If both conditions are met, it prints the log entry.


##### main function
The `main` function serves as the orchestrator for the entire log parsing process.

1. Argument Validation:
```bash
validate_args "$@"
```
- Calls `validate_args` with all script arguments.
- Ensures correct number and format of arguments.
- If validation fails, `usage` function is called, and the script exits.

2. Time Conversion:
```bash
   local start_time=$(date_to_timestamp "$1")
   local end_time=$(date_to_timestamp "$2")
```
- Converts start and end times to Unix timestamps.
- Uses `date_to_timestamp` function for each conversion.

3. Log Type Processing:
```bash
   local log_type=$(echo "$3" | tr '[:lower:]' '[:upper:]')
```
- Converts the log type to uppercase for consistency.

4. Log File Assignment:
```bash
local log_file="$4"
```
- Assigns the log file path to a local variable.

5. Log File Verification:
```bash
   check_log_file "$log_file"
```
- Verifies the existence of the specified log file.

6. Log Parsing:
```bash
   parse_logs "$start_time" "$end_time" "$log_type" "$log_file"
```
- Calls `parse_logs` to process and filter the log file.

The `main "$@"` at the end executes the main function with all script arguments.

Note: Without "$@", the main() function wouldn't have access to the script's command-line arguments.
