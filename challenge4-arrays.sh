#!/bin/bash

# Script Name:                      challenge4-arrays.sh
# Author Name:                      Tianna Farrow
# Date of latest revision:          10/26/2023
# Purpose:                          Create an array using four directories
# Execution:                        bash arrays.sh or ./arrays.sh chmod -x arrays.sh
# Additional Sources:               https://chat.openai.com/c/9cd29f2e-4795-4e87-8617-c361dac02d58

# Decleration of the variables

dirs=("dir1" "dir2" "dir3" "dir4")

for dir in "${dirs[@]}"; do
    mkdir $dir 
    touch "$dir/newfile.txt"
done

# Decleration of functions

# Main

echo ${dirs[2]}

echo "Text files created in directories."
# End
