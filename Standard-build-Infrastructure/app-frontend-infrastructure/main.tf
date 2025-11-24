terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "app-frontend-infrastructure"  # Replace with your desired container name
    key = "terraform.tfstate"  # Optional: Specify the filename within the container (defaults to 'terraform.tfstate')
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.81.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription
  }
module "azurerm_service_plan" {
  source = "./modules/service_plan"
  aspname                = var.aspname
  asplocation            = var.asplocation
  rsg = var.rsg
  aspos             = var.aspos            
  aspsku            = var.aspsku
  subscription = var.subscription              
}
module "compute" {
  source = "./modules/compute"
  appname             = var.appname
  asplocation         = var.asplocation
  rsg = var.rsg
  subscription = var.subscription
  service_plan_id = module.azurerm_service_plan.service_plan_id
}
module "storage_account" {
  source               = "./modules/storage"
  storage_account_name = var.storage_account_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  account_tier         = var.account_tier
  account_replication_type = var.account_replication_type
}