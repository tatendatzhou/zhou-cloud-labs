# Creating a Virtual Machine

# Discover commands
Get-Command *VM*
Get-Help New-AzVM -Examples

# Variables
$ResourceGroupName = "RG-LAB1"
$Location = "uksouth"
$VMName = "VM-Lab-01"
$VMSize = "Standard_D2as_v5"
$Image = "MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest"

$VnetName = "vnet-lab1"
$SubnetName = "subnet-lab1"
$PublicIpName = "pip-vm-lab-01"
$NicName = "nic-vm-lab-01"

# Credentials
$Credential = Get-Credential

# Get existing VNet
$Vnet = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $ResourceGroupName

# Get Subnet
$Subnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $Vnet

# Create Public IP
$PublicIp = New-AzPublicIpAddress `
-Name $PublicIpName `
-ResourceGroupName $ResourceGroupName `
-Location $Location `
-AllocationMethod Dynamic

# Create Network Interface
$Nic = New-AzNetworkInterface `
-Name $NicName `
-ResourceGroupName $ResourceGroupName `
-Location $Location `
-SubnetId $Subnet.Id `
-PublicIpAddressId $PublicIp.Id

# Create Virtual Machine
New-AzVM `
-ResourceGroupName $ResourceGroupName `
-Location $Location `
-Name $VMName `
-NetworkInterfaceId $Nic.Id `
-Image $Image `
-Size $VMSize `
-Credential $Credential