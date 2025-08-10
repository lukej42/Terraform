# Backend Infrastructure Terraform

This folder contains Terraform code to provision the backend infrastructure resources in Azure.

## Contents

- Virtual Networks
- Subnets
- Network Interfaces
- Windows/Linux Virtual Machines
- Storage Accounts and Containers
- Other backend-specific resources

## Prerequisites

- [Terraform CLI](https://www.terraform.io/downloads.html) installed (v1.0+ recommended)
- Azure CLI installed and logged in (`az login`)
- Access to an Azure subscription with sufficient permissions
- Backend storage configured for Terraform state (optional but recommended)

## Setup

1. Initialize Terraform:
   ```bash
   terraform init
   terraform plan -var-file=environments/prod/terraform.tfvars
   terraform apply -var-file=environments/prod/terraform.tfvars
