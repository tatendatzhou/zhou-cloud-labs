# Azure Network Security Group Creation using Azure Portal

## Project

AZ-104 Lab – Network Security Groups

## Objective

The purpose of this lab is to create a Network Security Group (NSG) using the Azure Portal and examine the default security rules automatically created by Azure.

Network Security Groups are used to control inbound and outbound network traffic to Azure resources such as Virtual Machines, subnets, and network interfaces.

---

## Resource Information

Network Security Group Name
NSG-Lab-01

Resource Group
RG-LAB1

Region
UK South

Custom Rules
None configured in this lab

---

## Steps Performed in Azure Portal

### Step 1

Open the **Azure Portal**

Search for:

Network Security Groups

Click:

Create

---

### Step 2 — Basics

Subscription
Non-Production Lab

Resource Group
RG-LAB1

Network Security Group Name
NSG-Lab-01

Region
UK South

Click:

Review + Create

Then click:

Create

---

## Default Security Rules

After deployment Azure automatically creates default rules.

### Inbound Rules

AllowVnetInBound
Priority: 65000
Allows traffic within the virtual network.

AllowAzureLoadBalancerInBound
Priority: 65001
Allows traffic from Azure load balancers.

DenyAllInBound
Priority: 65500
Blocks all other inbound traffic.

---

### Outbound Rules

AllowVnetOutBound
Priority: 65000
Allows traffic within the virtual network.

AllowInternetOutBound
Priority: 65001
Allows outbound internet access.

DenyAllOutBound
Priority: 65500
Blocks any other outbound traffic.

---

## Deployment Result

Network Security Group
NSG-Lab-01

Resource Group
RG-LAB1

Location
UK South

Provisioning State
Succeeded

---

## What I Learned

During this exercise I learned:

• How to create a Network Security Group using the Azure Portal
• How Azure automatically applies default security rules
• How NSGs control inbound and outbound network traffic
• How NSGs are used to secure Azure networking resources

---

## Certification Alignment

This lab relates to the following AZ-104 objective:

Configure and manage network security groups.
