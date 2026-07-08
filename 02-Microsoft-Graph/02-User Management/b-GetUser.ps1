# ============================================================
# Script Name : GetUser.ps1
# Description : Retrieves user accounts from Microsoft Entra ID.
#
# Requirements:
# - Connected to Microsoft Graph
# - User.Read.All permission
#
# Author      : Tatenda Zhou
# ============================================================

#Scenario 1. Retrieve All Users
Get-MgUser -All


#Scenario 2. Retrieve only first 5 Users
Get-MgUser -Top 5


#Scenario 3. Retrieve a single user using their User Principal Name (UPN).
Get-MgUser -UserId 'test@mabhozaeng.com'


#Scenario 4. Retrieve all users in the IT Support department.
Get-MgUser -Filter "Department eq 'It Support'" `
-Property DisplayName, UserPrincipalName, Department `
| Select-Object DisplayName, UserPrincipalName, Department


#Scenario 5. Retrieve all users and display only: DisplayName & UserPrincipalName & Department
Get-MgUser -All -Property DisplayName, UserPrincipalName, Department `
| Select-Object DisplayName, UserPrincipalName, Department | Format-Table -AutoSize