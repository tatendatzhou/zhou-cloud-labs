#Connecting AZ Account, Getting all available subscriptions and setting the subscription we want to work with
Connect-AzAccount
Get-AzSubscription
Set-AzContext -SubscriptionName "Non-Production Lab"

#PROJECT 1
#Creating a Resource Group in Powershell
New-AzResourceGroup -Name "RG-LAB2" `
-Location "Uksouth"

#Storing Resource Group in a variable
$RG = Get-AzResourceGroup -ResourceGroupName "RG-LAB2"

#HeckingSpecial Properties of the RG
$RG | Select-Object ResourceGroupName, Location, ProvisioningState
