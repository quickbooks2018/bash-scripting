#!/bin/bash
# awk, the -v option allows you to assign a value to a variable before the awk script begins processing input. This is useful when you want to pass an external value into your awk script.

echo "This is a test" > input.txt
awk -v name="Asim" '{ print "Hello, " name }' input.txt

# End