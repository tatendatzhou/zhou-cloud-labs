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

Function Connect-MyGraph {
    param(
        [parameter(Mandatory = $true)]
        [string]$TenantId,

        [parameter(Mandatory = $true)]
        [string[]]$Scopes
    )

    try{
        Write-Host "Connecting to my tenant" -ForegroundColor Cyan
        Connect-MgGraph -TenantId $TenantId -Scopes $Scopes -NoWelcome -ErrorAction Stop
        Write-Host "Successfully connected to" (Get-MgContext).Account -ForegroundColor Green
    }Catch{
        Write-Host "Failed to connect" -ForegroundColor DarkRed
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

Connect-MyGraph