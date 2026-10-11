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

## Script 1 — Get-LxUser

function Get-LxUser{
    [cmdletbinding()]
    param(
        [parameter(Mandatory = $true)][string]$Department
    )

#_____________________________________________________________________________________#
###Function Variables
$Scopes = @("User.Read.All")
$Properties = @("DisplayName", "Id", "UserPrincipalName", "Department")
#______________________________________________________________________________________#
###Connection
try{
    if(-not(Get-MgContext)){
        Write-Host "Connecting to Graph..." -ForegroundColor Cyan
        Connect-MgGraph -Scopes $Scopes -NoWelcome -ErrorAction Stop
        Write-Host "Connected to: $((Get-MgOrganization).DisplayName)" -ForegroundColor Green
    }else{
        Write-Host "You are already connected as: $((Get-MgContext).Account)" -ForegroundColor Green
    }
}Catch{
    Write-Error "Failed to connect to Graph because: $($_.Exception.Message)"
    return
}
#________________________________________________________________________________________#
###Getting Users for a specific department
try{
    Write-Host "Fetching deparment users" -ForegroundColor Cyan
    $DepartmentUsers = Get-MgUser -All -Property $Properties  -Filter "Department eq '$Department'" -ErrorAction Stop

    Write-Output "We have found $($DepartmentUsers.Count) user/s in the tenant in the department $Department"

    $results = foreach($User in $DepartmentUsers){
        [PsCustomObject]@{
        DisplayName =  $User.DisplayName
        UserPrincipalName = $User.UserPrincipalName
        UserId = $User.Id
        Department = $User.Department
    }
    }
    $results

}Catch{
    Write-Error "Failed to get users because $($_.Exception.Message)"
    return
}
}

Get-LxUser -Department "Sales Department"
