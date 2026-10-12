function Get-LxUser{
    <#
    .SYNOPSIS
    Retrieves users from Microsoft Graph, optionally filtered by department.

    .DESCRIPTION
    Queries the connected Microsoft Graph tenant and returns user accounts.
    If a Department is provided, only users from that department are returned.
    If no Department is provided, all users are returned.

    The function requires an active Graph connection. If not connected,
    it attempts to connect using the User.Read.All scope.

    .PARAMETER Department
    Optional. The exact name of the department to filter by.
    If omitted, users from all departments are returned.

    .PARAMETER Property
    Optional. An array of user properties to retrieve from Graph.
    Defaults to DisplayName, UserPrincipalName, Id, and Department.
    
    .EXAMPLE
    Get-LxUser
    Returns all users in the tenant with the default properties.

    .EXAMPLE
    Get-LxUser -Department "Sales Department"
    Returns only users in the Sales Department.

    .EXAMPLE
    Get-LxUser -Department "Finance" -Property "DisplayName", "UserPrincipalName"
    Returns Finance users with only DisplayName and UserPrincipalName.
    
    .OUTPUTS
    PSCustomObject with the following properties:
    DisplayName, UserPrincipalName, UserId, Department.

    .NOTES
    Author: Tatenda Zhou
    Requires: Microsoft.Graph.Users module
    Scope:    User.Read.All
    #>

    [cmdletbinding()]
    param(
        [string]$Department,
        [string[]]$Property = @("DisplayName", "UserPrincipalName", "Id", "Department")
    )
#_____________________________________________________________________________________#
###Scope Variable
$Scopes = @("User.Read.All")
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

#Getting Users 
try{
    Write-Host "Fetching department users" -ForegroundColor Cyan
if ($Department) {
    $DepartmentUsers = Get-MgUser -All -Property $Property -Filter "Department eq '$Department'" -ErrorAction Stop
}
else {
    $DepartmentUsers = Get-MgUser -All -Property $Property -ErrorAction Stop
}
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
