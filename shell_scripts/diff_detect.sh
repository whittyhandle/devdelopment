#!/bin/bash

# This script is meant to check a directory for changes every

# Define the directory we want to check for differences
diff_dir=/some/path

# Capture 'before' snapshot of directory
/bin/ls -lah $diff_dir > /tmp/original_ls

# Initialize while loop to check for differences every 30 seconds
while true; do

# Check $diff_dir for differences

    /bin/ls -lah $diff_dir > /tmp/current_ls
    if [ $(diff /tmp/original_ls /tmp/current_ls) ]; then

# If a difference is detected, invoke mail daemon to notify the user and then break out of loop

        break;
    else
# If no change is detected then wait 30 seconds and try again
        sleep 30
    fi
done