# Azure VM Deployment (Portal)

## Objective
Deploy a Windows Server Virtual Machine using the Azure Portal to understand the core components required for a VM in Azure.

---

## Resource Details

Resource Group: RG-LAB1  
Region: UK South  
Virtual Machine Name: VM-Lab-01  
Operating System: Windows Server 2022 Datacenter  
VM Size: Standard_D2als_v7 (2 vCPUs, 4 GB RAM)  
Virtual Network: vnet-lab1  
Subnet: subnet-lab1  
Public IP: Enabled  

---

## Steps Performed

1. Navigate to Azure Portal
2. Select **Virtual Machines**
3. Click **Create → Azure Virtual Machine**

### Basics
Subscription: Non-Production Lab  
Resource Group: RG-LAB1  
VM Name: VM-Lab-01  
Region: UK South  
Image: Windows Server 2022 Datacenter  
Size: Standard_D2als_v7  

Authentication Type: Username / Password  

---

### Networking
Virtual Network: vnet-lab1  
Subnet: subnet-lab1  
Public IP: Created automatically  

---

### Review + Create
1. Review configuration
2. Click **Create**
3. Wait for deployment to complete

---

## Result

A Windows Server Virtual Machine was successfully deployed with:

- Public IP address
- Network Interface
- OS Disk
- Virtual Network connection

---

## Verification

Navigate to:

Virtual Machines → VM-Lab-01

Confirm:

Status: Running  
Public IP assigned  
Connected to vnet-lab1 / subnet-lab1