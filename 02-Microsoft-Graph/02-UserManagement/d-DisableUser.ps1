# ============================================================
# Script Name : DisableUser.ps1
# Description : Disables user accounts in Microsoft Entra ID.
#
# Requirements:
# - Connected to Microsoft Graph
# - User.ReadWrite.All permission
#
# Author      : Tatenda Zhou
# ============================================================

#Connect and Get Users and their current status
Connect-MgGraph -Scopes User.ReadWrite.All
Get-MgUser -All -Property DisplayName, UserPrincipalName, Id, AccountEnabled `
| Where-Object AccountEnabled -eq $True `
| Select-Object DisplayName, UserPrincipalName, Id, AccountEnabled `
| Format-Table -AutoSize

# Scenario 1: Disable a single user account.
# Learn how to disable a Microsoft Entra user.
$Id = '6fe9aa13-a7a5-492b-8379-38acd6955b28'
Update-MgUser `
-UserId $Id `
-AccountEnabled:$False


# Scenario 2
# Task:
# Verify that the user account has been disabled.
# Objective:
# Confirm the account status after the update
Get-MgUser -UserId $Id `
-Property DisplayName, AccountEnabled `
| Select-Object DisplayName, AccountEnabled


# Scenario 3
# Task:
# Retrieve all disabled user accounts.
# Objective:
# Learn how to identify disabled users in the tenant.
Get-MgUser -All -Property DisplayName, Id, AccountEnabled | `
Where-Object AccountEnabled -eq $False `
| Select-Object DisplayName, Id, AccountEnabled

