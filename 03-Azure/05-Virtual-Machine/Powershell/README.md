# Azure VM Deployment (PowerShell)

## Objective
Deploy a Windows Server Virtual Machine using Azure PowerShell.

---

## Commands Used

Discover VM commands:

Get-Command *VM*

View VM creation examples:

Get-Help New-AzVM -Examples

---

## Variables

$ResourceGroupName = "RG-LAB1"
$Location = "uksouth"
$VMName = "VM-Lab-01"
$Image = "MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest"
$VMSize = "Standard_D2as_v5"

---

## Create Credentials

$Credential = Get-Credential

---

## Create Virtual Machine

New-AzVM `
-ResourceGroupName $ResourceGroupName `
-Location $Location `
-Name $VMName `
-Image $Image `
-Size $VMSize `
-Credential $Credential

---

## Outcome

Azure automatically creates the following resources:

Virtual Machine  
Network Interface  
Public IP Address  
OS Disk  
Virtual Network (if not specified)

---

## Verification

Run the following command:

Get-AzVM -ResourceGroupName RG-LAB1

Confirm the VM state and configuration.