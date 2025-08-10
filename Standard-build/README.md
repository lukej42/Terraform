# Azure App Service and Storage Account with Terraform

This project contains a Terraform configuration that provisions an **Azure Storage Account** (with multiple private containers) and a **Linux App Service** hosted under a shared App Service Plan.

---

## Note

**This script is a generic version of infrastructure I have deployed commercially. It has been simplified and sanitized for demonstration purposes. All sensitive details have been removed.**

---

## What It Does

- Creates a **Storage Account**
- Automatically creates 3 **private containers** using a 'for_each' loop:
  - 'subscriptionhub-database-backup'
  - 'subscriptionhub-website-backup'
  - 'subscriptionhub-data'
- Deploys an **App Service Plan** (Linux, F1 tier)
- Deploys a **Linux Web App**
- Sets a sample app setting: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE=false'

---

## Files

```plaintext
.
├── main.tf         # Terraform configuration
└── README.md       # Project documentation