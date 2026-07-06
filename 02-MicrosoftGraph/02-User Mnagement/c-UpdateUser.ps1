# ============================================================
# Script Name : UpdateUser.ps1
# Description : Update User Account
#
# Requirements:
# - Connected to Microsoft Graph
# - User.ReadWrite.All permission
#
#
# Author      : Tatenda Zhou
# ============================================================

#Getting users info
Get-MgUser -All -Property DisplayName, Id, Department | `
Select-Object  DisplayName, Id, Department

#..................................................................................................#

#Scenario 1. Update a user's Department to 'IT Support'
Update-MgUser `
-UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28' `
-Department 'IT Support'

#..................................................................................................#

#Scenario 2. Update a user's Job Title to: Senior IT Technician
Update-MgUser `
-UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28' `
-JobTitle 'Senior IT Technician'
##Confirming
Get-MgUser -UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28' `
-Property DisplayName, JobTitle | Select-Object DisplayName, JobTitle

#..................................................................................................#

#Scenario 3
Update-MgUser -UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28' `
-UsageLocation 'ZA'
##Confirming
Get-MgUser -UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28' `
-Property DisplayName, UsageLocation | Select-Object DisplayName, UsageLocation

#..................................................................................................#



