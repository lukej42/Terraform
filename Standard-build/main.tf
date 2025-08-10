terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "525c7c1f-f5e9-4bf4-8d7a-5b7a06889a12"
  } 

# Resource Group
#resource "azurerm_resource_group" "rg" {
#  name     = "rg-storage-demo"
#  location = "UK South"
#}

resource "azurerm_storage_account" "storage" {
  name                     = "lgstsubscriptionhub" 
  resource_group_name      = "terraform-deploy"
  location                 = "uksouth"
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
  name                = "asp-tf"
  location            = "uksouth"
  resource_group_name = "terraform-deploy"

  os_type   = "Linux"            
  sku_name  = "F1"               

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "lg-webapp-dev"
  location            = "uksouth"
  resource_group_name = "terraform-deploy"
  service_plan_id = azurerm_service_plan.asp.id

  site_config {
    always_on = false
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}