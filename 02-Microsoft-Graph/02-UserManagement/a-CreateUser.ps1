##USER CREATION PRACTISE

$Scopes = @("User.ReadWrite.All")

##connection
try{
if(-not(Get-MgContext)){
    Write-Host "Connecting to graph..." -ForegroundColor Cyan
    Connect-MgGraph -Scopes $Scopes -NoWelcome -ErrorAction Stop
    Write-Host "Connected successfully to organization $((Get-MgOrganization).DisplayName)" -ForegroundColor Green
}Else{
    Write-Host "You are already connected as $((Get-MgContext).Account)" -ForegroundColor Green
}
}catch{
    Write-Error "Failed to connect to account because $($_.Exception.Message)"
    return
}

####User creation
function new-lxuser{
    [cmdletbinding()]
    param(
     [parameter (Mandatory = $true)][string]$DisplayName,
     [parameter (Mandatory = $true)][string]$UserPrincipalName,
     [parameter (Mandatory = $true)][string]$MailNickname
    )
try{

    $Existinguser = Get-MgUser -Filter "UserPrincipalName eq '$UserPrincipalName'"
    if($Existinguser){
        Write-Warning "User $($DisplayName) already exist"
        return
    }

    Write-Host "Creating a user...." -ForegroundColor Cyan

    #Password
    $TempPass = "Lx" + (Get-Random -Minimum 10000 -Maximum 999999)
    $PasswordProfile = @{
        Password = $TempPass
        ForceChangePasswordNextSignIn = $true
    }
    
    $UserConfig = @{
        DisplayName = $DisplayName
        UserPrincipalName = $UserPrincipalName
        MailNickName = $MailNickname
        AccountEnabled = $true
        PasswordProfile = $PasswordProfile
    }

    $NewUser = New-MgUser @UserConfig -ErrorAction Stop
    Write-Output "Successfully created new user $($UserConfig.DisplayName)"

    [PsCustomObject]@{
        DisplayName = $DisplayName
        UserPrincipalName = $UserPrincipalName
        TemporaryPassword = $TempPass
        Status = "Active"
    }
}Catch{
    Write-Error "Failed to create user $($UserConfig.DisplayName) because $($_.Exception.Message)"
    return
}
}

####Actual User from function
$NewUserdetails = @{
    DisplayName = "Prichard Rice"
    UserPrincipalName = "prichard@loxovea.com"
    MailNickName = "prichard"
}

new-lxuser @NewUserdetails
