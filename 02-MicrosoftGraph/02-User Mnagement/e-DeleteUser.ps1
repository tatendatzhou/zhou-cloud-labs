# ============================================================
# Script Name : DeleteUser.ps1
# Description : Delete user accounts in Microsoft Entra ID.
#
# Requirements:
# - Connected to Microsoft Graph
# - User.ReadWrite.All permission
#
# Author      : Tatenda Zhou
# ============================================================
Connect-MgGraph User.ReadWrite.All -NoWelcome

Get-MgUser -All `
-Property DisplayName, UserPrincipalName, Id `
| Select-Object DisplayName, UserPrincipalName, Id `
| Format-Table

$UserId = '6fe9aa13-a7a5-492b-8379-38acd6955b28'
Remove-MgUser `
-UserId $UserId
