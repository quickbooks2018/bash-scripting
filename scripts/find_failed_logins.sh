#!/bin/bash
# purpose: Find failed login attempts
# Note: we can use built-in command "lastb" to find failed login attempts

# Define USER variable
# -n switch means "True if string is not empty."

user_list=$(cat /etc/passwd | awk -F ':' '{print $1}')

user_exist=$(echo $user_list)

# check if 1 argument is passed
if [ "$#" != "1" ]
then
    echo "This script requires 1 argument which is the username"
    exit 1
fi


if [ -n "$1" ]; then
    user=$1

   # Initialize match variable
    match=0

    # check if user exists
   for i in $user_exist
   do
    if [ "$i" = "$user" ]; then
        match=1
    fi
    done

  if [ $match -eq 0 ]; then
    echo "User $user does not exist"
    exit 1
  fi

fi

# Source File
source_file="/var/log/auth.log"

# Define the search message
search_message="failed password for $user"


# Parse file for failed login attempts

records=$(grep -i "$search_message" $source_file) || echo "No failed login attempts found for $user"

if [ -n "$records" ]
then
   echo "$records"
fi

#End