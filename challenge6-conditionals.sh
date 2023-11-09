#!/bin/bash

# Script Name:                        Conditionals.sh
# Author:                             Tianna Farrow 
# Date of Latest Revision:            10/30/2023
# Purpose:                            Check for files/directories and create them if they do not exist.
# Execution:                          bash conditionals.sh  or ./conditionals.sh chmod -x conditionals.sh
# Additional resources:               https://github.com/codefellows/seattle-ops-201d14/tree/main/class-06/challenges; https://github.com/codefellows/seattle-ops-201d14/blob/main/class-06/demo/demo.sh

# Decleration of the variables 

items=("file.txt" "directory")

# Decleration of functions

for item in "${items[@]}"; do
    if [ -e "$item" ]; then
        echo "$item already exists."
    else
        if [[ "$item" == *"/"* ]]; then
            mkdir -p "$item"
            echo "$item created as a directory."
        else
            touch "$item"
            echo "$item created as a file."
        fi
    fi
done


# End
