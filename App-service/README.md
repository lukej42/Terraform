# Azure App Service with Terraform

This project contains a minimal Terraform configuration to deploy an Azure **Linux Web App** using an **App Service Plan**, suitable for development or testing environments.

**Note:** This Terraform configuration is adapted from scripts I have previously used in commercial environments. It has been simplified and generalised for demonstration purposes, with all proprietary or sensitive components removed.

---

## What It Does

- Creates an **App Service Plan** (`F1` free tier, Linux)
- Creates a **Linux Web App**
- Adds a basic app setting: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE=false'
- Uses a pre-existing resource group ('terraform-deploy')

---

## Files

```plaintext
.
├── main.tf         # Terraform configuration (this file)
└── README.md       # Project documentation