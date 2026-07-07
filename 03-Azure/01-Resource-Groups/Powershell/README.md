# Project 1 — Azure Resource Groups (PowerShell)

## Objective

Create and inspect Azure Resource Groups using Azure PowerShell.

This demonstrates how administrative tasks performed in the Azure Portal can also be automated using PowerShell.

---

## Steps Performed

1. Connected to Azure
2. Selected the correct subscription
3. Created a Resource Group using PowerShell
4. Retrieved the Resource Group information
5. Stored the Resource Group in a variable
6. Displayed selected properties

---

## PowerShell Script

```powershell
# Connect to Azure
Connect-AzAccount
Get-AzSubscription
Set-AzContext -SubscriptionName "Non-Production Lab"

# Create Resource Group
New-AzResourceGroup -Name "RG-LAB2" -Location "uksouth"

# Store Resource Group in variable
$RG = Get-AzResourceGroup -Name "RG-LAB2"

# Display selected properties
$RG | Select-Object ResourceGroupName, Location, ProvisioningState