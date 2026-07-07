#Creating A Network Security Group
#Find Command for NSG
Get-Command *NetworkSecurityGroup*
Get-Help New-AzNetworkSecurityGroup -Examples

#Declaring Variables
$Name                    = "nsg-lab-02"
$Location                = "uksouth"
$ResourceGroupName       = "RG-LAB1"

#Creating Network Security Group (No Rules set in this script)
New-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName `
                           -Name $Name `
                           -Location $Location


#Storing NSG in a variable
$nsg = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName -Name $Name

#Inspect Objects
$nsg | Get-Member

#Checking NSG Properties
$nsg | Select-Object Name, ResourceGroupName, Location | Format-Table -AutoSize

