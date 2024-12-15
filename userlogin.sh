#!/bin/bash

# Shell script to check user login information using the `finger` command and save it to a file

# Output file to store the results
OUTPUT_FILE="/var/log/user_login_info.txt"

# Check if the script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo." >&2
    exit 1
fi

# Ensure the finger command is installed
if ! command -v finger &> /dev/null; then
    echo "The 'finger' command is not installed. Installing it now..."
    apt-get update && apt-get install -y finger || { echo "Failed to install finger. Exiting."; exit 1; }
fi

# Get login information and store it in the output file
echo "Fetching user login information..."
finger > "$OUTPUT_FILE"

# Check if the output file was created successfully
if [ -f "$OUTPUT_FILE" ]; then
    echo "User login information has been saved to: $OUTPUT_FILE"
else
    echo "Failed to save user login information. Please check permissions."
    exit 1
fi
