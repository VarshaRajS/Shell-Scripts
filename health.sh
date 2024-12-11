#!/bin/bash

# This script checks the health of computer
echo "Disk Usage"
df -h

echo -e "\nMemory Usage"
free -h
 
echo -e "\nCPU Load"
uptime

echo -e "running processes:"
ps aux | head -n 10
