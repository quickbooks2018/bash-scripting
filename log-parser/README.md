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

## Contributing

Contributions to improve the script are welcome. Please submit a pull request or open an issue to discuss proposed changes.

## License

This script is released under the MIT License. See the LICENSE file for details.
