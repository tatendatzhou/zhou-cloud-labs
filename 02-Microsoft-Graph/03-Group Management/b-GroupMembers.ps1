# ============================================================
# Script Name : GroupMembers.ps1
# Description : Manage Group Membership
#
# Requirements:
# - Connected to Microsoft Graph
# - Group.ReadWrite.All permission
#
# Author      : Tatenda Zhou
# ============================================================

Connect-MgGraph -Scopes Group.ReadWrite.All

#Checking MgGroup Properties
Get-MgGroup | Get-Member


# # Scenario 1
# #Task:Retrieve all members of a specific group.
# Objective: Learn how to view group membership.
Get-MgGroupMember -GroupId 'd3ef91e0-acd8-486b-a784-3e606cec4ca3' `
-Property DisplayName, Id | Select-Object DisplayName, Id

Get-MgGroupMember -GroupId '3bfccbba-acc9-4b4a-b3bd-eecbd72a598d' |
Select-Object Id, AdditionalProperties | Format-List

# # Scenario 2
# #Task:Add a user to a group.
# Objective: Learn how to add a member in a group
Get-MgUser -All
Get-MgGroup -All

$User1 = Get-MgUser -UserId '6fe9aa13-a7a5-492b-8379-38acd6955b28'
$Group1 = Get-MgGroup -GroupId 'eb7599df-413f-45d1-82b6-7029a8212700'

#Getting Help
Get-Help Add-MgGroupMember -Examples
Get-Command *Add*
Get-Command *MgGroupMember*
Get-Help New-MgGroupMember -Examples
Get-Help New-MgGroupMember -Full
Get-Command New-MgGroupMember -Syntax

New-MgGroupMember `
-GroupId $Group1 `
-DirectoryObjectId $User1

#More Help
Get-Help New-MgGroupMemberByRef -Examples
Get-Command New-MgGroupMemberByRef -Syntax


New-MgGroupMemberByRef `
-GroupId $Group1 `
-DirectoryObjectId $User1
