# Terraform Azure Infrastructure (Environment-Aware)

This Terraform configuration deploys Azure infrastructure (such as a Linux Web App and supporting resources), with support for multiple environments using separate variable files.

**Note:** This configuration is adapted from infrastructure I have used commercially. It has been simplified and sanitized for demonstration purposes.

---

## Project Structure
```plaintext
.
├── main.tf           # Resource definitions
├── variables.tf      # Input variables used across environments
├── dev.tfvars        # Variable values for the development environment
├── prod.tfvars       # Variable values for the production environment
└── README.md         # README file

---

## What It Does

This Terraform setup can deploy the following Azure resources (depending on what you include in `main.tf`):

- App Service Plan (Linux)
- Linux Web App
- Storage Account and Containers
- Azure Key Vault

It uses `.tfvars` files to easily switch between environments like **development** and **production**.

---

## Prerequisites

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) v1.3+
- Azure CLI (`az login`)
- Access to an Azure subscription
- An existing Resource Group (optional unless defined in Terraform)

---

## How to Use

### 1. Authenticate with Azure

```bash
az login
