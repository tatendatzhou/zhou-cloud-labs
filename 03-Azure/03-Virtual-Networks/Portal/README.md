# Azure Virtual Network Creation using Azure Portal

## Project

AZ-104 Lab – Virtual Networks

## Objective

The objective of this lab is to create an Azure Virtual Network and configure subnets using the Azure Portal.

This exercise demonstrates how networking resources are deployed manually before automating the same deployment using PowerShell.

---

## Resource Information

Virtual Network Name
vnet-lab1

Resource Group
RG-LAB1

Region
UK South

Address Space
10.0.0.0/16

---

## Subnet Configuration

Subnet 1
Name: subnet-lab1
Address Range: 10.0.1.0/24

Subnet 2
Name: subnet-lab2
Address Range: 10.0.2.0/24

---

## Steps Performed in Azure Portal

### Step 1

Open the **Azure Portal**

Search for:

Virtual Networks

Click:

Create

---

### Step 2 — Basics

Subscription
Non-Production Lab

Resource Group
RG-LAB1

Virtual Network Name
vnet-lab1

Region
UK South

Click:

Next: IP Addresses

---

### Step 3 — Address Space

Address Space

10.0.0.0/16

---

### Step 4 — Subnets

Two subnets were created:

subnet-lab1
10.0.1.0/24

subnet-lab2
10.0.2.0/24

---

### Step 5 — Deployment

Click:

Review + Create

Then click:

Create

Deployment completed successfully.

---

## Deployment Result

After deployment the Virtual Network contains:

Virtual Network
vnet-lab1

Address Space
10.0.0.0/16

Subnets

subnet-lab1 – 10.0.1.0/24
subnet-lab2 – 10.0.2.0/24

Provisioning State
Succeeded

---

## What I Learned

During this exercise I learned:

• How to create a Virtual Network using the Azure Portal
• How to configure address spaces in Azure networking
• How to create multiple subnets
• How Azure organizes networking resources inside a resource group

---

## Certification Alignment

This lab relates to the following AZ-104 objective:

Configure and manage virtual networks.

---

## Next Step

The same deployment was automated using PowerShell in the **PowerShell section of this project**.
