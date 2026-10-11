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
Get-MgUser -UserId 'francis@loxovea.com'


#Scenario 4. Retrieve all users in the IT Support department.
Get-MgUser -Filter "Department eq 'It Support'" ` -Property DisplayName, UserPrincipalName, Department |
 Select-Object DisplayName, UserPrincipalName, Department


#Scenario 5. Retrieve all users and display only: DisplayName & UserPrincipalName & Department
Get-MgUser -All -Property DisplayName, UserPrincipalName, Department |
 Select-Object DisplayName, UserPrincipalName, Department | Format-Table -AutoSize

# Scenario 6: Retrieve all disabled user accounts
$Props = 'DisplayName', 'UserPrincipalName', 'AccountEnabled'
Get-MgUser -All -Property $Props | Where-Object {$_.AccountEnabled -eq $false} |
Select-Object $Props

# Scenario 7: Retrieve all Guest users
$Props = 'DisplayName', 'UserPrincipalName', 'UserType'
Get-MgUser -All -Property $Props -Filter "UserType eq 'Guest'" |
Select-Object $Props


# Scenario 8: Retrieve users whose DisplayName starts with 'Fran'
$Props = 'DisplayName', 'UserPrincipalName'
Get-MgUser -All -Property $Props -Filter "startswith(DisplayName,'T')" |
Select-Object $Props


# Scenario 9: Retrieve users who do not have a JobTitle assigned
$Props = 'DisplayName', 'JobTitle'
Get-MgUser -Property $prop | Where-Object {$_.JobTitle -eq $null} | Select-Object $Props

# Scenario 10: Retrieve users created on or after January 1, 2026
$Props = 'DisplayName', 'UserPrincipalName', 'createdDateTime'
Get-MgUser -Filter "createdDateTime ge 2026-09-24T00:04:00z" -Property $Props | Select-Object $Props
