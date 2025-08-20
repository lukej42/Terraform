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
    source = "./modules/network/loadbalancer"
    lbname                = var.lbname
    location            = var.location
    resource_group_name = var.resource_group_name
    publicipname = var.publicipname
    nic_ids = [
    module.azurerm_network_interface.network_interface_id,
    module.azurerm_network_interface1.network_interface_id
  ]
  }
  output "my_nat_rule_id" {
  value = module.azurerm_lb.nat_rule_id
}
module "azurerm_virtual_network" {
  source               = "./modules/network/vnet"
  virtual_network_name = var.virtual_network_name
  address_space        = var.address_space
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_prefix        = var.subnet_prefix
  subscription         = var.subscription
  location             = var.location
}
module "azurerm_network_interface" {
  source = "./modules/network/networkinterface"
  networkinterface_name = var.networkinterface_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subscription = var.subscription
  #public_ip_address_id = azurerm_lb.public_ip.this.id
  subnet_id           = module.azurerm_virtual_network.subnet_id
}
module "azurerm_network_interface1" {
  source                = "./modules/network/networkinterface"
  networkinterface_name = var.networkinterface_name1
  location              = var.location
  resource_group_name   = var.resource_group_name
  subnet_id             = module.azurerm_virtual_network.subnet_id
  subscription = var.subscription
}

module "azurerm_windows_virtual_machine" {
  source               = "./modules/compute"
  vm-name               = var.vm-name
  vm-size              = var.vm-size
  resource_group_name  = var.resource_group_name
  location             = var.location
  #subnet_id            = module.azurerm_virtual_network1.subnet_id
  network_interface_id = module.azurerm_network_interface.network_interface_id
}