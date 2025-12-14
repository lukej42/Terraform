terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "storage-account"  # Replace with your desired container name
    key = "terraform.tfstate"  # Optional: Specify the filename within the container (defaults to 'terraform.tfstate')
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription
  } 

data "azurerm_storage_account" "statefile" {
  name                = "terraformsflg"
  resource_group_name = "terraform-deploy"
}

data "azuread_service_principal" "sp" {
  for_each     = toset(var.sp_names)
  display_name = each.value
}

data "azuread_group" "storage_readers" {
  display_name = "storage"
}

module "sp_reader" {
  for_each    = data.azuread_service_principal.sp
  source      = "./modules/role_assignment"
  principal_id = each.value.object_id
  scope        = data.azurerm_storage_account.statefile.id
  role         = var.sp_roles[each.key]
}

module "group_reader" {
  source       = "./modules/role_assignment"
  principal_id = data.azuread_group.storage_readers.object_id
  scope        = data.azurerm_storage_account.statefile.id
  role         = "Reader"
}