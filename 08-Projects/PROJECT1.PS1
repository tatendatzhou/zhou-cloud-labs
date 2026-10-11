Function Update-Groups{

    Write-Host "Updating groups..." -Foregroundcolor Cyan
    <#
.SYNOPSIS
    This script 

.DESCRIPTION
    A more detailed explanation of the function's purpose.

.PARAMETER DisplayName
    Explains what the DisplayName parameter is used for.

.EXAMPLE
    create-myuser -DisplayName "Jane Doe" -UserPrincipalName "jane@loxovea.com" -MailNickName "jane"
    Explains what happens when you run this example command.
#>
    param(
        [parameter(Mandatory = $true)]
        [string]$OldGroupName,

        [parameter(Mandatory = $true)]
        [string]$NewGroupName
    )
    
} 




Connect-MgGraph -TenantId '51251454-b7a4-4d8f-a607-865e8ab7fa30'

Function Updating-MyGroup{

    param(
    [parameter(Mandatory = $true)]
    [String]$OldGroupName,

    [parameter(Mandatory = $true)]
    [string]$NewGroupName
    )
    Write-Host "Updating my group name" -ForegroundColor Cyan

    Try{
        
        Write-Host "Currently updating the new group displayname" -ForegroundColor DarkYellow

        Update-MgGroup -GroupId (Get-MgGroup -Filter "DisplayName eq '$OldGroupName'").Id `
        -DisplayName $NewGroupName -ErrorAction Stop

    }Catch{
        Write-Host "Failed to update the group" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }Finally{
        Write-Host "Script done" -ForegroundColor Green
    }
}

