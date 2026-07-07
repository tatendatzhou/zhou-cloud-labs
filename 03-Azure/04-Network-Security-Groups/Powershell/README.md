# Azure Network Security Group Creation using PowerShell

## Project

AZ-104 Lab – Network Security Groups

## Objective

The objective of this lab is to create a Network Security Group (NSG) using PowerShell and inspect its properties.

This exercise demonstrates how Azure networking security resources can be deployed and managed using PowerShell automation.

---

## Command Discovery

To find the command used to create a Network Security Group:

Get-Command *NetworkSecurityGroup*

To view command examples:

Get-Help New-AzNetworkSecurityGroup -Examples

---

## Script Overview

The script performs the following actions:

1. Discover the required PowerShell command
2. Declare variables
3. Create the Network Security Group
4. Retrieve the created resource
5. Display selected properties

---

## Variables Used

| Variable           | Description                                  |
| ------------------ | -------------------------------------------- |
| $Name              | Name of the Network Security Group           |
| $Location          | Azure region                                 |
| $ResourceGroupName | Resource group where the NSG will be created |

---

## PowerShell Script

```powershell
# Creating A Network Security Group

# Find Command for NSG
Get-Command *NetworkSecurityGroup*
Get-Help New-AzNetworkSecurityGroup -Examples

# Declaring Variables
$Name = "nsg-lab-02"
$Location = "uksouth"
$ResourceGroupName = "RG-LAB1"

# Creating Network Security Group
New-AzNetworkSecurityGroup `
-ResourceGroupName $ResourceGroupName `
-Name $Name `
-Location $Location

# Storing NSG in a variable
$nsg = Get-AzNetworkSecurityGroup `
-ResourceGroupName $ResourceGroupName `
-Name $Name

# Inspect object
$nsg | Get-Member

# Checking NSG Properties
$nsg | Select-Object Name, ResourceGroupName, Location | Format-Table -AutoSize
```

---

## PowerShell Concepts Practiced

• Command discovery using **Get-Command**
• Learning syntax using **Get-Help**
• Declaring variables
• Creating Azure networking resources
• Retrieving Azure resource objects
• Inspecting object properties

---

## Learning Outcome

After completing this lab I can:

• Create a Network Security Group using PowerShell
• Retrieve Azure resources using PowerShell
• Inspect PowerShell objects and properties
• Understand the role of NSGs in Azure networking

---

## Certification Alignment

This lab relates to the following AZ-104 objective:

Configure and manage network security groups.

