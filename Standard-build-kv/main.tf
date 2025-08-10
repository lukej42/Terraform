terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = var.subscription
  } 

# Resource Group
#resource "azurerm_resource_group" "rg" {
#  name     = "rg-storage-demo"
#  location = "UK South"
#}

resource "azurerm_storage_account" "storage" {
  name                     = var.storagename
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

# List of containers to create
locals {
  containers = ["subscriptionhub-database-backup", "subscriptionhub-website-backup", "subscriptionhub-data"]
}

# Create each container using a loop
resource "azurerm_storage_container" "containers" {
  for_each              = toset(local.containers)
  name                  = each.key
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

resource "azurerm_service_plan" "asp" {
  name                = var.appserviceplanname
  location            = var.location
  resource_group_name = var.resource_group_name

  os_type   = var.ostype           
  sku_name  = var.sku             

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = var.webappname
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = azurerm_service_plan.asp.id

  site_config {
    always_on = false
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

resource "azurerm_key_vault" "example" {
  name                        = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.spobject_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}