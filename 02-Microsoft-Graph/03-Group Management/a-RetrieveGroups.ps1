# ============================================================
# Script Name : GetGroups.ps1
# Description : List groups in the tenant.
#
# Requirements:
# - Connected to Microsoft Graph
# - Group.Read.All permission
#
# Author      : Tatenda Zhou
# ============================================================

Connect-MgGraph -Scopes Group.Read.All

#Checking MgGroup Properties
Get-MgGroup | Get-Member

# Scenario 1
# Task: Retrieve all Groups in the tenant.
# Objective: Learn how to list groups and become familiar with the Get-MgGroup cmdlet.
Get-MgGroup -All -Property DisplayName, Description, GroupTypes `
| Select-Object DisplayName, Description, GroupTypes `
| Format-Table -AutoSize

# Scenario 2
# Task: Retrieve all Microsoft 365 groups in the tenant.
# Objective: Learn how to list groups and become familiar with the Get-MgGroup cmdlet.
Get-MgGroup -All -Filter "GroupTypes/any(c:c eq 'Unified')"

# Scenario 3
# Task: Retrieve single group using Group Id
Get-MgGroup -GroupId '8991727a-111c-4d09-919e-fe265790b446'
