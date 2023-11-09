#!/bin/bash
# passing arguments to a function

# Script Name:                          systemops.sh
# Author name:                          Tianna Farrow
# Date of latest revision:              10/31/2023
# Purpose:                              Use lshw to gather system information
# Execution:                            sudo ./systemops.sh
# Additional Resources:                 https://github.com/codefellows/seattle-ops-201d14/blob/main/class-07/challenges/demo/bash.md; https://github.com/codefellows/seattle-ops-201d14/tree/main/class-07/challenges; https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/; https://www.binarytides.com/linux-lshw-command/

# Decleration of the variables

# Decleration of functions

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root using sudo."
    exit 1
fi

# Main

system_info=$(lshw)

# Display computer name 
echo "Computer Name:"
echo "$system_info" | grep "description: Computer" | sed -e 's/^\s*//'

# Display CPU information
echo "CPU:"
echo "$system_info" | grep "description: CPU" -A7 | grep -v "description"

# Display RAM information
echo "RAM:"
echo "$system_info" | grep "description: System Memory" -A14 | grep -v "description"

# Display Display Adapter information
echo "Display Adapter:" 
echo "$system_info" | grep "description: VGA compatible controller" -A8 | grep -v "description"

# Display Network Adapter Information
echo "Network Adapter"
echo "$system_info" | grep "description: Ethernet interface" -A16 | grep -v "description"

# End
