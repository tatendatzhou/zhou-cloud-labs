# In this script I am going to create a storage account and check its properties

# Finding command
Get-Command *storage*
Get-Help New-AzStorageAccount -Examples

# Variables Declared
$ResourceGroupName = "RG-LAB2"
$Name = "mylabstorage02"
$Location = "uksouth"
$SkuName = "Standard_LRS"
$Kind = "StorageV2"

# The Account Creation
New-AzStorageAccount `
-ResourceGroupName $ResourceGroupName `
-Name $Name `
-Location $Location `
-SkuName $SkuName `
-Kind $Kind

# Retrieve the Storage Account
$Storage = Get-AzStorageAccount -Name $Name -ResourceGroupName $ResourceGroupName

# Check some properties
$Storage | Select-Object StorageAccountName, ResourceGroupName, CreationTime, Kind | Format-Table -AutoSize