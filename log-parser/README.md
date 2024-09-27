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

## Commands and function Working

### usage() function
usage funntion() is called from validate_args() function.
usage function is only called if one of these conditions in validate_args "$@" is not met. If all arguments are correct, usage is never called.
If usage is called, it prints the usage information and then exits the script with exit 1, preventing further execution.

### date_to_timestamp() function
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

### validate_args function
We are calling in the main function
Note: In validate function, we are calling usage function

- check_log_file function
We are calling in the main function, it is checking the log file path, exist or not.

### parse_logs function
The `parse_logs` function is the core of the log parsing script. It processes the log file and extracts entries based on the specified time range and log type, while also counting the occurrences of each log type.

#### Function Parameters:

1. `start_time`: The start of the time range (Unix timestamp)
2. `end_time`: The end of the time range (Unix timestamp)
3. `log_type`: The type of log entries to filter (e.g., ERROR, INFO)
4. `log_file`: The path to the log file to be parsed

#### Implementation Details:

1. The function uses `awk` to process the log file efficiently.

2. It passes four variables to awk:
   - `start`: Start time (Unix timestamp)
   - `end`: End time (Unix timestamp)
   - `type`: Log type to filter
   - `ostype`: The operating system type ($OSTYPE)

3. Inside awk, a `to_timestamp` function is defined:
   - This function converts a date string to a Unix timestamp.
   - It uses different `date` commands based on the operating system:
      - For macOS (Darwin): `date -j -f "%Y-%m-%d %H:%M:%S"`
      - For other Unix-like systems: `date -d`
   - The function executes the appropriate `date` command and captures its output.

4. The main awk processing block:
   - Extracts the timestamp from each log entry (format: [YYYY-MM-DD HH:MM:SS]).
   - Converts this timestamp to Unix format using the `to_timestamp` function.
   - Checks if the converted timestamp falls within the specified time range.
   - Verifies if the log type (3rd field in the log entry) matches the specified type (case-insensitive).
   - If both conditions are met, it prints the entire log entry and increments the counter for the corresponding log type.

5. Log Entry Counting:
   - The function keeps track of the number of entries for each log type (ERROR, INFO, WARNING, CRITICAL).
   - After processing all entries, it prints a summary of log entry counts for each type.

#### Output:
The function produces two types of output:
1. Matching log entries within the specified time range and of the specified type (if any).
2. A summary of log entry counts for each log type.

#### Usage in the Script:

The `parse_logs` function is called from the `main` function after argument validation and time conversion:

```bash
parse_logs "$start_time" "$end_time" "$log_type" "$log_file"
```

### main function
The `main` function serves as the entry point and orchestrator for the log parsing script. It handles argument validation, input processing, and initiates the log parsing process.

### Function Signature

```bash
function main() {
    # Function body
}
```

### Purpose

The `main` function coordinates the following tasks:
1. Validates command-line arguments
2. Converts time inputs to Unix timestamps
3. Determines the log file path and optional log type filter
4. Verifies the existence of the log file
5. Initiates the log parsing process

### Arguments

The function uses the following command-line arguments:
- `$1`: Start time (format: YYYY-MM-DD HH:MM:SS)
- `$2`: End time (format: YYYY-MM-DD HH:MM:SS)
- `$3`: Log file path or log type (if 4 arguments are provided)
- `$4`: Log file path (if log type is specified in $3)

### Process Flow

1. **Argument Validation**
   ```bash
   validate_args "$@"
   ```
   Ensures the correct number and format of arguments are provided.

2. **Time Conversion**
   ```bash
   local start_time=$(date_to_timestamp "$1")
   local end_time=$(date_to_timestamp "$2")
   ```
   Converts the start and end times to Unix timestamps.

3. **Log File and Type Determination**
   ```bash
   local log_file="${4:-$3}"
   local log_type="${3:-}"
   ```
   Sets up variables for the log file path and optional log type filter.

4. **Log Type Verification**
   ```bash
   if [[ -f "$log_type" ]]; then
       log_file="$log_type"
       log_type=""
   else
       log_type=$(echo "$log_type" | tr '[:lower:]' '[:upper:]')
   fi
   ```
   Checks if the log type argument is actually a file path. If so, it adjusts the variables accordingly.

5. **Log File Validation**
   ```bash
   check_log_file "$log_file"
   ```
   Ensures the specified log file exists.

6. **Log Parsing Initiation**
   ```bash
   parse_logs "$start_time" "$end_time" "$log_file" "$log_type"
   ```
   Calls the `parse_logs` function to perform the actual log analysis.

### Usage

The `main` function is called at the end of the script with all command-line arguments:

```bash
main "$@"
```

This allows the script to be executed with the appropriate arguments, such as:

```bash
./script_name.sh "2023-01-01 00:00:00" "2023-01-31 23:59:59" /path/to/logfile.log [ERROR|INFO|WARNING|CRITICAL]
```

The `main` function ensures that these arguments are properly processed and utilized throughout the script's execution.

### Variable explanation

- ts = to_timestamp(substr($0, 2, 19)) variable used in function parse_logs()

This line is extracting a timestamp from the current log entry and converting it to a Unix timestamp. Let's examine it piece by piece:

$0:

In awk, $0 represents the entire current line being processed.
It contains the full text of the current log entry.


substr($0, 2, 19):

The substr() function in awk extracts a substring from a given string.
It takes three arguments: the string, the starting position, and the length.
In this case, it's extracting 19 characters from the current line, starting at the second character.
This assumes that the timestamp in the log entry starts at the second character and is 19 characters long.
The format is likely "YYYY-MM-DD HH:MM:SS" (which is exactly 19 characters).


to_timestamp(...):

This is calling the custom to_timestamp() function defined earlier in the awk script.
It takes the extracted date string as an argument.
The function converts this date string to a Unix timestamp (number of seconds since January 1, 1970).


ts = ...:

The result of the to_timestamp() function (the Unix timestamp) is assigned to the variable ts.



So, in summary, this line is:

Taking the current log entry line
Extracting the timestamp portion (assumed to be characters 2-20)
Converting that timestamp to a Unix timestamp
Storing the result in the ts variable

This ts variable is then used later in the script to compare against the start and end times for filtering the log entries. By converting all timestamps to Unix time (seconds), it makes time comparisons much simpler and more efficient. CopyRetryClaude does not have the ability to run the code it generates yet.Claude can make mistakes. Please double-check responses.

- awk -v 
```bash
echo "This is a test" > input.txt
awk -v name="Asim" '{ print "Hello, " name }' input.txt 
```