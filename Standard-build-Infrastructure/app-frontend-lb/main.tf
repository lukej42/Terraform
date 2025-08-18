terraform {
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
  module "azurerm_lb" {
    source = "./modules/network"
    lbname                = var.lbname
    location            = var.location
    resource_group_name = var.resource_group_name
    publicipname = var.publicipname
  }
  output "my_nat_rule_id" {
  value = module.azurerm_lb.nat_rule_id
}