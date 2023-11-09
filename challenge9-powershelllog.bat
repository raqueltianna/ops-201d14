# Script Name:                               challenge9-powershelllog.bat
# Author:                                    Tianna Farrow
# Date of latest revision:                   11/6/2023
# Purpose:                                   Creating a set of Powershell commands that are useful in regards to the System event logs 
# Additional resources:                      https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-eventlog?view=powershell-5.1; https://www.pdq.com/powershell/get-eventlog/; https://superuser.com/questions/1448419/get-list-all-windows-event-log-events-in-the-last-n-minutes-in-powershell; https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-5.1



Get-WinEvent -Logname "System" -MaxEvents 0 | Where-Object { $_.TimeCreated -ge (Get-Date).AddHours(-24) } | Format-List -Property * | Out-File "$env:USERPROFILE\Desktop\last_24.txt"
# The above line outputs all events from the system within the last 24 hours and creates the file "last_24.txt"

Get-WinEvent -LogName "System" -MaxEvents 0 | Where-Object { $_.LevelDisplayName -eq "Error" } | Format-List -Property * | Out-File "$env:USERPROFILE\Desktop\errors.txt"
# The above line outputs all "error" events in the system log and creates the file "errors.txt"

Get-WinEvent -LogName "System" | Where-Object { $_.Id -eq 16 } | Format-Table -AutoSize
# The above line outputs events in the system log with the ID 16. 

Get-WinEvent -LogName "System" -MaxEvents 20 | Format-Table -AutoSize
# The above line output the 20 most recent entries on the event log. 

Get-WinEvent -LogName "System" -MaxEvents 500 | Format-Table -Property TimeCreated, Id, ProviderName, Message -AutoSize
# The above line outputs 500  of the most recent entry and includes the full lines of text on the event log. 
