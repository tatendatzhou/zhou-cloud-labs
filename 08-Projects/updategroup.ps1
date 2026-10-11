# User Creation Using Functions with params

#Connect
Connect-MgGraph -Scopes User.ReadWrite.All -NoWelcome
Get-MgContext | Select Account

#UserCreation 
function create-myuser {
    param(
        [parameter(Mandatory =$true)]
        [string]$DisplayName,

        [parameter(Mandatory =$true)]
        [string]$UserPrincipalName,

        [parameter(Mandatory =$true)]
        [string]$MailNickName,

        [bool]$AccountEnabled = $true
    )

    try{
        ##Creating User
        Write-Host "Creating a new user..." -ForegroundColor Cyan

        $PasswordProfile = @{
            PassWord = "MyNewPass!>"
            ForceChangePasswordNextSignIn = $true
        }
        $UserConfig = @{
            DisplayName          = $DisplayName
            UserPrincipalName    = $UserPrincipalName
            MailNickName         = $MailNickName
            AccountEnabled       = $AccountEnabled
            PasswordProfile      = $PasswordProfile
        }
        New-MgUser @UserConfig -ErrorAction Stop

        Write-Host "Successfully created our new user..." -ForegroundColor Green
    }Catch{
        Write-Host "Failed to create new user" -ForegroundColor DarkRed
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

create-myuser






