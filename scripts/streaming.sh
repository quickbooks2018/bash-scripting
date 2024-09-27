#!/bin/bash
# Purpose: Stream in Linux are stdin, stdout, stderr, and network sockets.

# 1> redirects stdout.
# 2>&1 redirects stderr to where stdout is going (in this case, also to /dev/null).

# std in
cat < positional_param.shh  # This will try to read the file positional_param.shh via stdin.

# Redirecting both stdout and stderr
# cat positional_param.shh 1> /dev/null 2>&1  # This suppresses all output and error messages.

# Redirecting only stderr
# cat positional_param.shh 2> /dev/null  # This suppresses only error messages, but output (if any) will still be shown.

# End
