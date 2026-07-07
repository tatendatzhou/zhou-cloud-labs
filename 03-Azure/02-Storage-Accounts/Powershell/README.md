# Azure Storage Account Creation using PowerShell

## Project

AZ-104 Lab – Storage Accounts

## Objective

The goal of this lab is to learn how to create and inspect an Azure Storage Account using PowerShell instead of the Azure Portal.

This exercise focuses on understanding:

* How to discover PowerShell commands
* How to use variables
* How to create Azure resources with PowerShell
* How to inspect Azure objects and properties

---

## Commands Used

### Discovering the Command

To find commands related to storage:

Get-Command *storage*

To see how to use the storage account creation command:

Get-Help New-AzStorageAccount -Examples

---

## Script Overview

The script performs the following steps:

1. Declares variables for the storage account configuration
2. Creates the storage account
3. Retrieves the storage account object
4. Displays selected properties

---

## Variables Used

| Variable           | Description                                              |
| ------------------ | -------------------------------------------------------- |
| $ResourceGroupName | Resource group where the storage account will be created |
| $Name              | Name of the storage account                              |
| $Location          | Azure region                                             |
| $SkuName           | Storage redundancy and performance tier                  |
| $Kind              | Storage account type                                     |

---

## PowerShell Script

```
# Finding command
Get-Command *storage*
Get-Help New-AzStorageAccount -Examples

# Variables Declared
$ResourceGroupName = "RG-LAB2"
$Name = "mylabstorage02"
$Location = "uksouth"
$SkuName = "Standard_LRS"
$Kind = "StorageV2"

# Create Storage Account
New-AzStorageAccount `
-ResourceGroupName $ResourceGroupName `
-Name $Name `
-Location $Location `
-SkuName $SkuName `
-Kind $Kind

# Retrieve storage account
$Storage = Get-AzStorageAccount -Name $Name -ResourceGroupName $ResourceGroupName

# Display selected properties
$Storage | Select-Object StorageAccountName, ResourceGroupName, CreationTime, Kind | Format-Table -AutoSize
```

---

## Key PowerShell Concepts Practiced

* Command discovery with **Get-Command**
* Learning syntax using **Get-Help**
* Using **variables**
* Creating Azure resources
* Working with **PowerShell objects**
* Extracting properties using **Select-Object**

---

## Learning Outcome

After completing this lab I can:

* Discover Azure PowerShell commands
* Create a storage account using PowerShell
* Retrieve Azure resource objects
* Extract useful information from those objects

---

## Certification Alignment

This lab relates to the following AZ-104 topics:

* Manage Azure Storage Accounts
* Manage Azure Resources using PowerShell
