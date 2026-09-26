# ============================================================
# Script Name : a-CreateUser.ps1
# Description : Creates a single user in Microsoft Graph.
# Author      : Tatenda Zhou
# ============================================================

#Password Profile
$PasswordProfile = @{
    Password                      = ''
    ForceChangePasswordNextSignIn = $true
}
#User parameters
$UserConfig = @{
    DisplayName         =  "Precious Kelly"
    UserPrincipalName   =  "preciousk@loxovea.com"
    MailNickName        =  "preciousk"
    AccountEnabled      =  $true
    PasswordProfile     =  $PasswordProfile
}

#Creating User
try{
    Write-Host "Creating a new user in Microsoft Graph" -ForegroundColor Cyan
    $NewUser = New-MgUser @UserConfig -ErrorAction Stop
    Write-Host "Successfuly created user: " $($NewUser.DisplayName) -ForegroundColor Green
}Catch{
    Write-Host "Failed to create a user" -ForegroundColor DarkRed
    Write-Host $_.Exception.Message -ForegroundColor Red
}

