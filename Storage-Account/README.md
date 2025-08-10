# Azure Storage Account with Containers using Terraform

This Terraform configuration deploys an **Azure Storage Account** and automatically creates multiple **private blob containers** using a loop.

**Note:** This script is based on infrastructure I have previously deployed commercially. It has been simplified and sanitized for demonstration purposes.

---

## File Contents

This repository contains a **single Terraform file**:

└── main.tf       # All logic is contained here

---

## What It Does

- Creates an Azure **Storage Account**
- Defines a list of **blob containers**
- Uses 'for_each' to loop through the list and deploy each container
- Containers are set to **private access**
- TLS version enforcement ('TLS1_2') for enhanced security

---

## Resources Created

| Resource Type              | Description                          |
|----------------------------|--------------------------------------|
| Storage Account            | 'lgstsubscriptionhub'                |
| Storage Container (x3)     | 'subscriptionhub-database-backup', 'subscriptionhub-website-backup' 'subscriptionhub-data' |

---

## Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) v1.3 or newer
- Azure CLI installed and authenticated ('az login')
- An existing Azure Resource Group named 'terraform-deploy' in the 'UK South' region
- Permission to create storage accounts in your Azure subscription

---

## Usage

### 1. Login to Azure

```bash
az login