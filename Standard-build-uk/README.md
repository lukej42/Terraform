# Azure Web App & Storage Infrastructure with Terraform

This project contains a modular, environment-aware Terraform configuration that provisions the following Azure resources:

- A **Storage Account** with multiple containers
- A **Linux App Service** hosted on an App Service Plan
- Support for multiple environments via separate '*.tfvars' files

**Note:** This configuration is adapted from commercial infrastructure deployments. All sensitive details have been removed for demonstration purposes.

---

## Folder Structure
```plaintext
.
├── main.tf           # Main Terraform configuration
├── variables.tf      # Input variable declarations
├── dev.tfvars        # Development environment variables
├── prod.tfvars       # Production environment variables
└── README.md         # Project documentation

---

## What It Deploys

- **Storage Account** with secure settings
  - 'subscriptionhub-database-backup'
  - 'subscriptionhub-website-backup'
  - 'subscriptionhub-data'
- **App Service Plan** ('F1', 'B1', etc.) for Linux
- **Linux Web App** with basic app settings

All resources are created in a region and resource group defined via variables, allowing environment flexibility.

---

## Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) 'v1.3.0+'
- Azure CLI ('az login')
- Access to an existing Azure Resource Group
- Valid Azure subscription ID

---

## Usage

### 1. Authenticate with Azure

```bash
az login
