resource "azurerm_public_ip" "lb-publicip" {
  name                = var.publicipname
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}
resource "azurerm_lb" "lb" {
  name                = var.lbname
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.publicipname
    public_ip_address_id = azurerm_public_ip.lb-publicip.id
  }
}
resource "azurerm_lb_nat_rule" "natrule1" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "RDPAccess"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = var.publicipname
}
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
  name                = var.networkinterface_name1
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.network.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id           = var.public_ip_address_id
  }
}