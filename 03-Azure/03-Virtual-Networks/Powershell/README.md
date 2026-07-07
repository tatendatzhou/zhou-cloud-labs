# Azure Virtual Network Creation using PowerShell

## Project

AZ-104 Lab – Virtual Networks

## Objective

The objective of this lab is to create an Azure Virtual Network and subnets using PowerShell.
This exercise helps understand how Azure networking resources are deployed and managed through automation instead of the Azure Portal.

The script demonstrates command discovery, subnet configuration, virtual network creation, and inspection of resource properties.

---

## Command Discovery

To find networking related commands:

Get-Command *VirtualNetwork*

To view usage examples:

Get-Help New-AzVirtualNetwork -Examples

---

## Lab Architecture

Virtual Network Name
vnet-lab2

Address Space
10.0.0.0/16

Subnets

frontendSubnet
10.0.1.0/24

backendSubnet
10.0.2.0/24

Region
UK South

Resource Group
RG-LAB1

---

## Script Overview

The PowerShell script performs the following steps:

1. Discover the required PowerShell command
2. Declare variables
3. Create subnet configurations
4. Deploy the Virtual Network
5. Retrieve the Virtual Network object
6. Inspect object properties
7. Display key Virtual Network information

---

## PowerShell Script

```powershell
# In this script I am going to create a Virtual Network, subnet and check its properties

# Finding command
Get-Command *VirtualNetwork*
Get-Help New-AzVirtualNetwork -Examples

# Declaring Variables
$ResourceGroupName = "RG-LAB1"
$Location = "uksouth"
$vnetname = "vnet-lab2"

# Subnet Configuration
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name "frontendSubnet" -AddressPrefix "10.0.1.0/24"
$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name "backendSubnet" -AddressPrefix "10.0.2.0/24"

# Virtual Network Creation With 2 subnets
New-AzVirtualNetwork -Name $vnetname `
 -ResourceGroupName $ResourceGroupName `
 -Location $Location `
 -AddressPrefix "10.0.0.0/16" `
 -Subnet $frontendSubnet,$backendSubnet

# Retrieve Virtual Network
$VNet = Get-AzVirtualNetwork -Name $vnetname -ResourceGroupName $ResourceGroupName

# Inspect object properties
$VNet | Get-Member

# Display key properties
$VNet | Select-Object Name, Location, ResourceGroupName, AddressSpace | Format-Table -AutoSize
```

---

## PowerShell Concepts Practiced

• Command discovery using **Get-Command**
• Learning syntax using **Get-Help**
• Declaring variables
• Creating Azure networking resources
• Working with PowerShell objects
• Extracting object properties with **Select-Object**

---

## Learning Outcome

After completing this lab I can:

• Create a Virtual Network using PowerShell
• Configure multiple subnets
• Retrieve Azure resources with PowerShell
• Inspect resource properties and objects

---

## Certification Alignment

This exercise relates to the following AZ-104 exam topic:

Configure and manage virtual networks.

---

## Next Step

The same deployment can also be performed using the Azure Portal for comparison between manual configuration and PowerShell automation.
