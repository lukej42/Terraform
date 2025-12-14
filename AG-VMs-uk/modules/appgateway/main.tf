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
    name = "frontend_port_name"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip-config"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "backend-address-pool"
  }

  backend_http_settings {
    name                  = "http_setting_name"
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "listener_name"
    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name             = "frontend_port_name"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "request_routing_rule_name"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "listener_name"
    backend_address_pool_name  = "backend-address-pool"
    backend_http_settings_name = "http_setting_name"
  }
}