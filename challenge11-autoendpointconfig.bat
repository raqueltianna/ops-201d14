# Script Name:                                  challenge11-autoendpointconfig.bat
# Author Name:                                  Tianna Farrow
# Date of latest revision:                      11/6/2023
# Purpose:                                      Create a powershell script that automates the configuration of a new Windows 10 endpoint
# Additional Sources:                           https://github.com/superswan/Powershell-SysAdmin; https://www.appsloveworld.com/powershell/100/105/file-and-printer-sharing-status
# Google Drive for Second Part of Lab:          https://docs.google.com/document/d/1H4ChmneGYcSVtjHadLX4ZdUNQIzq1S0gmqmg8574TB8/edit?usp=sharing    

# Decleration of Variables

# Decleration of Functions 

# Main

# Enable File and Printer Sharing
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Allow ICMP traffic 
netsh advfirewall firewall add rule name="Allow incoming ping requests IPv4" dir=in action=allow protocol=icmpv4

# Enable Remote Management 
Enable-PSRemoting -Force 

# Remove bloatware 
Get-AppxPackage -AllUsers | Where-Object { $_.Name -like "*bloatware*" } | Remove-AppxPackage -AllUsers

# Enable Hyper-V 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Disable SMBv1
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol


# End 
