# ============================================================
# Script Name : CreateUser.ps1
# Description : Creates a new Microsoft Entra ID user account.
#
# Requirements:
# - Connected to Microsoft Graph
# - User.ReadWrite.All permission
# - Password must meet Microsoft Entra ID complexity requirements
#
# Author      : Tatenda Zhou
# ============================================================

#PasswordProfile
$PasswordProfile = @{
    Password = 'XCkediawedisgns@24'
    ForceChangePasswordNextSignIn = $True
}
#User Details
$User1 = New-MgUser `
-DisplayName 'Jerry Stones' `
-UserPrincipalName 'js@mabhozaeng.com' `
-MailNickName 'Jerry' `
-UsageLocation 'ZA' `
-AccountEnabled `
-PasswordProfile $PasswordProfile

# Display the newly created user
$User1