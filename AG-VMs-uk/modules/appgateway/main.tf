resource "azurerm_application_gateway" "network" {
  name                = var.agname
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.agsku
    tier     = var.agtier
    capacity = var.agcapacity
  }

  gateway_ip_configuration {
    name      = "gw-internal"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip-config"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "backend-pool"
  }

  backend_http_settings {
    name                  = "http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name             = "frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routing-rule"
    rule_type                  = "Basic"
    http_listener_name          = "listener"
    backend_address_pool_name   = "backend-pool"
    backend_http_settings_name  = "http-setting"
    priority                   = 1
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "vm_to_ag" {
  count = length(var.vm_nic_ids)

  network_interface_id  = var.vm_nic_ids[count.index]
  ip_configuration_name = "ipconfig1"

  backend_address_pool_id = one([
    for pool in azurerm_application_gateway.network.backend_address_pool :
    pool.id if pool.name == "backend-pool"
  ])
}
