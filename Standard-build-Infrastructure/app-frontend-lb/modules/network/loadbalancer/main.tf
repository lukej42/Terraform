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
resource "azurerm_lb_backend_address_pool" "backend" {
  name            = "lb-backend-pool"
  loadbalancer_id = azurerm_lb.lb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic1_assoc" {
  network_interface_id    = var.nic_ids[0]
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic2_assoc" {
  network_interface_id    = var.nic_ids[1]
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend.id
}