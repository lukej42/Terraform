# Terraform Azure Infrastructure Projects

This repository contains a collection of five Terraform projects used to deploy Azure infrastructure components. These projects are modular, reusable and structured for clarity across environments (e.g., dev, prod). Some configurations were originally developed for commercial use and have since been made generic for demonstration and learning purposes.

> This repository excludes '.terraform/' directories and Terraform state files. Any provider binaries or sensitive information from previous commercial usage have been removed or generalized.

---

## 📁 Project Structure

```plaintext
.
├── App-service/               # Deploys a Linux App Service
│   ├── main.tf
│   ├── variables.tf
│   ├── dev.tfvars
│   └── prod.tfvars
│
├── Storage-Account/          # Deploys a storage account with containers
│   └── main.tf
│
├── Standard-build/           # Combined App Service and Storage
│   ├── main.tf
│   ├── variables.tf
│   ├── dev.tfvars
│   └── prod.tfvars
│
├── Standard-build-kv/        # Sanitized commercial build
│   └── main.tf
│
├── Standard-build-uk/        # UK region-specific variant
│   └── main.tf
│
└── README.md

---

## Project Descriptions

### App-service
Deploys:
- Azure Linux App Service
- App Service Plan (Linux)
- Environment-specific configuration ('dev.tfvars', 'prod.tfvars')

➡Location: 'App-service/'

---

### Storage-Account
Deploys:
- Azure Storage Account (Standard_LRS)
- Three private containers via loop
- Uses hardcoded configuration (for demo)

Location: 'Storage-Account/'

---

### Standard-build
Deploys:
- Linux App Service
- App Service Plan
- Storage Account with containers
- Parameterized with 'variables.tf' and '*.tfvars'

Location: 'Standard-build/'

---

### Standard-build-kv
- Legacy commercial build (generic version)
- Deploys App Service and Storage Account
- Hardcoded values for simplicity

Location: 'Standard-build-kv/'

---

### Standard-build-uk
- Region-specific deployment ('uksouth')
- Useful for UK-based testing and data compliance

Location: 'Standard-build-uk/'

---

## Prerequisites

- [Terraform ≥ 1.3.0](https://developer.hashicorp.com/terraform/downloads)
- Azure CLI logged in to the correct subscription
- Permissions to deploy resources in Azure

---

## How to Use

Choose a project folder (e.g. 'Standard-build-kv/') and run:

```bash
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
