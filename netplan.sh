#!/bin/bash

# Shell script to apply a YAML network configuration using Netplan

# Function to display an error message and exit
error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    error_exit "This script must be run as root. Use sudo."
fi

# Path to the Netplan configuration file (adjust this as needed)
NETPLAN_CONFIG_FILE="/etc/netplan/01-netcfg.yaml"

# Check if the Netplan configuration file exists
if [ ! -f "$NETPLAN_CONFIG_FILE" ]; then
    error_exit "Netplan configuration file not found at $NETPLAN_CONFIG_FILE."
fi

# Validate the Netplan configuration
echo "Validating the Netplan configuration..."
netplan try --timeout=120 || error_exit "Netplan validation failed. Check the configuration file for errors."

# Apply the Netplan configuration
echo "Applying the Netplan configuration..."
netplan apply || error_exit "Failed to apply the Netplan configuration."

echo "Netplan configuration applied successfully."
