# Script Name:                               challenge10-systemprocess.bat
# Author:                                    Tianna Farrow
# Date of latest revision:                   11/9/2023
# Purpose:                                   Create a set of commands for Powershell that gathers info about running processes, open processes, and close processes.
# Additional resources:                      https://learn.microsoft.com/en-us/powershell/scripting/samples/managing-processes-with-process-cmdlets?view=powershell-7.3; https://superuser.com/questions/1587298/how-to-get-top-5-highest-cpu-consuming-processes-and-their-thread-count-using-po; https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-process?view=powershell-7.3; https://adamtheautomator.com/powershell-for-loop/

# Decleration of Variables

# Decleration of Function

# Main 

# Command to print all active processes order by highest CPU time at the top
Get-Process | Sort-Object CPU -Descending | Format-Table -Property ProcessName, CPU -AutoSize 

# Command to print all active processes ordered by highest process ID number at the top
Get-Process | Sort-Object Id -Descending | Format-Table -Property ProcessName, Id -AutoSize

# Command to print the top five active processes ordered by highest Working Set at the top
Get-Process | Sort-Object WS -Descending | Select-Object -First 5 | Format-Table -Property ProcessName, WS -Autosize

# Command to start a browser and have it open https://owasp.org/www-project-top-ten/.
Start-Process "googlechrome.exe" -ArgumentList "https:owasp.org/www-project-top-ten/"

# Command to start Notepad ten times using a for loop
for ($i = 1; $i -le 10; $++0){
    Start-Process "notepad.exe"
}

# Command to close all instances of Notepad 
Get-Process | Where-Object { $_.ProcessName -eq "notepad" } | ForEach-Object { $_.CloseMainWindow() }

# Command to kill a process by it's process identification number. (In my example the process identification number for google was 25476)
Stop-Process -Id 25476 -Force

# End 