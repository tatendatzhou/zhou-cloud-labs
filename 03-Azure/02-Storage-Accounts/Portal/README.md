# Azure Storage Account Creation using Azure Portal

## Project

AZ-104 Lab – Storage Accounts

## Objective

The goal of this lab is to create an Azure Storage Account using the Azure Portal and understand the configuration options available when deploying storage resources.

This exercise focuses on understanding the graphical deployment process before automating the same task using PowerShell.

---

## Steps Performed in Azure Portal

1. Open **Azure Portal**

2. Search for:

Storage Accounts

3. Click:

Create

4. Configure the following settings

Subscription
Non-Production Lab

Resource Group
RG-LAB1

Storage Account Name
mylabstorage01

Region
UK South

Performance
Standard

Redundancy
Locally Redundant Storage (LRS)

5. Click:

Review + Create

6. Click:

Create

---

## Deployment Result

After deployment the following properties were confirmed:

Storage Account Name
mylabstorage01

Resource Group
RG-LAB1

Region
UK South

Performance Tier
Standard

Replication
LRS (Locally Redundant Storage)

Kind
StorageV2

Provisioning State
Succeeded

---

## What I Learned

During this exercise I learned:

• How to deploy a storage account using the Azure Portal
• The basic configuration options for Azure Storage
• The difference between performance tiers and redundancy models
• How Azure organizes storage resources within a resource group

---

## Certification Alignment

This lab supports the following AZ-104 objective:

Manage Azure Storage Accounts

---

## Next Step

The same storage account deployment will be automated using **PowerShell** to understand infrastructure automation and scripting.
