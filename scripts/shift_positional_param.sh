#!/bin/bash

echo "First argument: $1"
shift
echo "Second argument: $1"
shift
echo "Third argument: $1"

# output
# ./shift_positional_param.sh asim qasim taha
# First argument: asim
# Second argument: qasim
# Third argument: taha