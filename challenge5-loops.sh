#!/bin/bash
# passing arguments to a function

# Script Name:                          challenge5-loops.sh
# Author name:                          Tianna Farrow
# Date of latest revision:              10/27/2023
# Purpose:                              Loop pid information
# Execution:                            bash challenge5-loops.sh or ./challenge5-loops.sh chmod -x challenge5-loops.sh
# Additional resources:                 https://www.quora.com/How-do-you-make-a-shell-script-run-continuously; https://www.linuxquestions.org/questions/programming-9/how-to-make-a-while-loop-iterate-over-script-until-user-input-stops-4175624869/

# Decleration of the variables

# Decleration of the functions

while true; do
    echo "Running processes:"
    ps aux

    read -p "Enter the PID of the process you want to kill or press Ctrl + C to exit:" pid

    if ps -p "$pid" &> /dev/null; then
        process_name=$(ps -p "$pid" -o comm=)
        if [[ "process_name" != "kernel" && "$process_name" != "systemd" ]]; then
            kill -9 "$pid"
            echo "Process with PID $pid has been terminated." 
        else
            echo "Cannot kill essential OS process: $process_name"
        fi
    else
        echo "No process found with PID $pid."
    fi

    read -p "Do you want to kill another process? (yes/no): " continue
    if [[ "$continue" != "yes" ]]; then
        break
   fi
done



# Main

# End
