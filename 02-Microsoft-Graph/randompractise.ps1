###Adding many users in a single group using foreach
 param(
        [Parameter(Mandatory = $true)][string]$DisplayName,
        [Parameter(Mandatory = $true)][string]$MailNickName,
        [switch]$SecurityEnabled,
        [switch]$MailEnabled
    )

try{
    ###GroupCreation
    Write-Host "Creation SA Security Group" -ForegroundColor Cyan

    $GroupConfig = @{
        DisplayName = $DisplayName
        SecurityEnabled = $true
        MailNickName = $MailNickname
        MailEnabled = $false
        GroupTypes = @()
    }

    New-MgGroup @GroupConfig -ErrorAction Stop

    Write-Host "Successfully created new Security Group $DisplayName" -ForegroundColor Green
}Catch{
    Write-Error "Failed to create the new security group: $DisplayName because $($_.Exception.Message)"
    Return
}



#####Getting New GroupId
try{
 $GroupId = (Get-MgGroup -Filter "DisplayName eq '$DisplayName'").Id
}Catch{
    Write-Error $_.Exception.Message
    return
}


    
$Properties =  @("DisplayName", "UserPrincipalName", "Id", "UsageLocation")
$Users = Get-MgUser -All -Property $Properties -Filter "UsageLocation eq 'ZA'"

####Now Adding SouthAfrican Users to this new Group

try{
    foreach($User in $Users){
        Write-Host "Adding $($User.DisplayName) to the new group" -ForegroundColor Cyan
        New-MgGroupMember -GroupId $GroupId -DirectoryObjectId $User.Id -ErrorAction Stop 
    }

    Write-Host "Successfully added users in the new group" -ForegroundColor Green
}Catch{
    Write-Error "Failed to add Users in the group because $($_.Exception.Message)"
}

####Verifying Users in the new Group
Get-MgGroupMember -GroupId $GroupId | Select AdditionalProperties




###########################################################################################################
###Connection
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

###UserCreation
