##Creating Security Group
function new-securitygroup{
    param(
        [parameter(Mandatory = $true)]
        [string]$DisplayName,

        [parameter(Mandatory = $true)]
        [string]$MailNickName,

        [bool]$SecurityEnabled =$true,

        [bool]$MailEnabled = $false,

        [parameter(Mandatory = $true)]
        [string]$Description
    )
    try{
        Write-Host "Creating New Security Group..." -ForegroundColor Cyan

        $GroupConfig = @{
            DisplayName         = $DisplayName
            MailNickName        = $MailNickName
            MailEnabled         = $MailEnabled
            SecurityEnabled     = $SecurityEnabled
            Description         = $Description
        }
        New-MgGroup @GroupConfig -ErrorAction Stop
    }catch{
        Write-Host "Failed to create a security group" -ForegroundColor DarkRed
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

new-securitygroup