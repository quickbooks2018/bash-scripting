#!/bin/bash
# Purpose: backup files and directories and store remotely

backup_source="$1"
backup_name="$2"

backup_destination='/home/cloud_user/backups'

script_name=$(basename "$0")

# Using a custom date format with lowercase month and 'time' as a suffix
backup_file="$backup_destination/$backup_name-$(date +"%Y-%b-%-d-%H-%M-%S")"

count=$(ls $backup_destination/*.tar.gz | wc -l) 2> /dev/null
threshold=2

if [ "$#" != "2" ]; then
    echo "This script $script_name requires 2 arguments: backup source and backup name"
    exit 1
fi

function backup_dir() {
if [ ! -e "$backup_destination" ]; then
    echo "Creating $backup_destination"
    mkdir "$backup_destination"
else
    echo "$backup_destination already exists"
fi
}

function backup() {
# Get the directory and basename of the backup source
source_dir=$(dirname "$backup_source")
source_base=$(basename "$backup_source")


if [ $count -le $threshold ]
then
# Create the tar archive
tar -czvf "${backup_file}.tar.gz" -C "$source_dir" "$source_base"
 if [ "$?" != "0" ]
  then
  echo "Error creating backup"
  else
  echo "Backup created: ${backup_file}.tar.gz"
  fi
# You can add a logic to copy to aws s3 and add life cycle policies on that bucket regarding retention
else
   echo "Can not create new backup, 3 backups already taken"
fi
}
# Call the function
backup_dir
backup

# End