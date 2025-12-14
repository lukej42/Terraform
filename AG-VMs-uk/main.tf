terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "ag-vms-uk"  # Replace with your desired container name
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

module "network" {
  source               = "./modules/network"
  virtual_network_name = var.virtual_network_name
  subscription         = var.subscription
  address_space        = var.address_space
  resource_group_name  = var.resource_group_name
  subnet_name          = var.subnet_name
  subnet_prefix        = var.subnet_prefix
  location             = var.location
  nsgname              = var.nsgname
  name_prefix          = var.name_prefix
}

module "compute" {
  source              = "./modules/compute"
  vmnames             = ["dev-vm1", "dev-vm2"]
  vmsize              = var.vmsize
  vmusername          = var.vmusername
  vmpassword          = var.vmpassword
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  name_prefix         = var.name_prefix
}

module "appgateway" {
  source              = "./modules/appgateway"
  agname              = var.agname
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.appgw_subnet_id
  public_ip_id        = module.network.public_ip_id
  agsku               = var.agsku
  agtier              = var.agtier
  agcapacity          = var.agcapacity
  vm_nic_ids          = module.compute.vm_nic_ids
}

