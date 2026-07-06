# ============================================================
# Script Name : RestoreDeletedUser.ps1
# Description : Restore deleted user accounts in Microsoft Entra ID.
#
# Requirements:
# - Connected to Microsoft Graph
# - User.ReadWrite.All permission
#
# Author      : Tatenda Zhou
# ============================================================

Connect-MgGraph -Scopes User.ReadWrite.All -NoWelcome
#Investigating
Get-Command -Verb 'Restore'
Get-Help Restore*
Get-Command *MgUser*
Get-Help Restore-MgUser
Get-Command *Deleted*
Get-MgDirectoryDeletedUser -All
Get-Help Restore-MgDirectoryDeletedItem -Example

#RealWork
$DirectoryObjectId = '6fe9aa13-a7a5-492b-8379-38acd6955b28'
Restore-MgDirectoryDeletedItem -DirectoryObjectId $DirectoryObjectId
Get-MgUser -UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28'
Get-MgUser -All