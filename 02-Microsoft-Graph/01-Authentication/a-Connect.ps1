# ============================================================
# Script Name : Connect.ps1
# Description : Connects to Microsoft Graph using delegated permissions.
#
# Requirements:
# - Microsoft Graph PowerShell SDK installed
# - Internet connection
# - Valid Microsoft 365 account
#
#
# Author      : Tatenda Zhou
# ============================================================
#
#Connect to Microsoft Graph

$Scopes = @("User.ReadWrite.All", "Group.Read.All")
try{
    if(-not(Get-MgContext)){
        Write-Host "Connecting to Graph..." -ForegroundColor Cyan
        Connect-MgGraph -Scopes $Scopes -ErrorAction Stop
        Write-Host "Successfully connected to organization: $((Get-MgOrganization).DisplayName)" -ForegroundColor Green
    }Else{
        Write-Host "You are already connected as $((Get-MgContext).account)" -ForegroundColor Green
    }
}Catch{
    Write-Error "Failed to connect to you organization because: $($_.Exception.Message)"
    return 
}
