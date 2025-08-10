terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.72.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
} 

# resource "azurerm_resource_group" "rg" {
#  name     = "rg-appservice-tf"
#  location = "UK South"
#}

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