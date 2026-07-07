# In this script I am going to create a Virtual Network, subnet and check its properties

# Finding command
Get-Command *Virtualnetwork*
Get-Help New-AzVirtualNetwork -Examples

# Declaring Variables and Subnet Configuring
$ResourceGroupName = "RG-LAB1"
$Location = "uksouth"
$frontendSubnet = New-AzVirtualNetworkSubnetConfig -Name "frontendSubnet" -AddressPrefix "10.0.1.0/24"
$backendSubnet = New-AzVirtualNetworkSubnetConfig -Name "backendSubnet" -AddressPrefix "10.0.2.0/24"
$vnetname = "vnet-lab2"

# Virtual Network Creation With 2 subnets
New-AzVirtualNetwork -Name $vnetname `
 -ResourceGroupName $ResourceGroupName `
 -Location $Location `
 -AddressPrefix "10.0.0.0/16" `
 -Subnet $frontendSubnet,$backendSubnet

 # Retrieve Virtual Network
 $VNet = Get-AzVirtualNetwork -Name $vnetname -ResourceGroupName $ResourceGroupName

 # Display Virtual Network
 Get-AzVirtualNetwork | Get-Member
 $VNet | Select-Object Name, Location, ResourceGroupName, AddressSpace | Format-Table -AutoSize
