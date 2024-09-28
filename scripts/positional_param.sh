#!/bin/bash

# $0: This is the name of the script
echo Name of the scrit is $0
echo Name of the script is `basename $0`

# $1: This is the first argument provided to the script
echo First argument is $1

# $@: This is an array of all the arguments provided to the script
echo All arguments are $@

# $#: This is the number of arguments provided to the script
echo Number of arguments are $#