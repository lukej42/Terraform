resource "azurerm_virtual_network" "network" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "network" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_network_interface" "network" {
  name                = var.networkinterface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.network.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                    = var.nsgname
  location                = var.location
  resource_group_name     = var.resource_group_name

  security_rule {
    name                       = "RDP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.name_prefix}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
    subnet_id                 = azurerm_subnet.network.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}