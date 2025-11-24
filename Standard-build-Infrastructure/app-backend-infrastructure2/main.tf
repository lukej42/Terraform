terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "app-backend-infrastructure2"  # Replace with your desired container name
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

module "storage_account" {
  source               = "./modules/storage"
  storage_account_name = var.storage_account_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  account_tier         = var.account_tier
  account_replication_type = var.account_replication_type
}
module "azurerm_virtual_network" {
  source               = "./modules/network"
  virtual_network_name = var.virtual_network_name
  networkinterface_name = var.networkinterface_name
  address_space        = var.address_space
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_prefix        = var.subnet_prefix
  subscription         = var.subscription
  location             = var.location
  nsgname              = var.nsgname
}
#module "azurerm_network_security_group" {
#  source = "./modules/network"
#  nsgname                    = var.nsgname
#  location                   = var.location
#  resource_group_name        = var.resource_group_name
#  networkinterface_name      = var.networkinterface_name
#  address_space              = var.address_space
#  subnet_name                = var.subnet_name
#  virtual_network_name       = var.virtual_network_name
#  subnet_prefix              = var.subnet_prefix
#  subscription               = var.subscription
#}
module "azurerm_windows_virtual_machine" {
  source               = "./modules/compute"
  vm-name              = var.vm-name
  vm-size              = var.vm-size
  resource_group_name  = var.resource_group_name
  subscription         = var.subscription
  location             = var.location
  subnet_id            = module.azurerm_virtual_network.subnet_id
  network_interface_id = module.azurerm_virtual_network.network_interface_id
}

module "azurerm_key_vault" {
  source = "./modules/security"
  keyvaultname                = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  spobject_id                 = var.spobject_id
}

