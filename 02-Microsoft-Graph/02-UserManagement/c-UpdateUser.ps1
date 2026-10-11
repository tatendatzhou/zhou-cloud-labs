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
##Updating multiple accounts  at once
$Props = 'DisplayName', 'UserPrincipalName', 'Department', 'JobTitle', 'UsageLocation'
$Users = Get-MgUser -All -Property $Props -Filter "UsageLocation eq 'ZW'" |
Select-Object $Props

foreach($User in $Users){
    try{
        Write-Host "Updating Users Location" -ForegroundColor Cyan
        Update-MgUser -UserId $User.UserPrincipalName -UsageLocation 'ZA' -ErrorAction sto
        Write-Host "Successufly updated" $User.DisplayName -ForegroundColor Green
    }Catch{
        Write-Host "Failed to update Users" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor DarkYellow
    }
}

#.....................................................................................................#
##Updating many properties single user
try{
    Write-Host "Udating a single user's parameters" -ForegroundColor Cyan

    ###Get the user id
    $Props = 'DisplayName', 'UserPrincipalName', 'FirstName', 'Surname', 'Department', 'JobTitle', 'UsageLocation'
    $UserId = (Get-MgUser -Property $Props -Filter "DisplayName eq 'Precious Kelly' ").UserPrincipalName

    ###Param Configuration
    $ParamsConfig = @{
    UserId        =  $UserId
    GivenName     = "Precious"
    Surname       = "Kelly"
    Department    = "Consultant"
    JobTitle      = "Lead Consultant"
    UsageLocation = "GB"
   }

   ###Updating the User
   Update-MgUser @ParamsConfig -ErrorAction Stop
   Write-Host "Updated successfully" $UserId.DisplayName -ForegroundColor Green

}catch{
    Write-Host "Failed to update" $UserId.DisplayName -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor DarkYellow
}