resource "azurerm_application_gateway" "this" {
  name                = var.agname
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = var.agsku
    tier     = var.agtier
    capacity = var.agcapacity
  }

  gateway_ip_configuration {
    name      = "gw-ipcfg"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "http"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "public"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "backend-pool"

    dynamic "backend_addresses" {
      for_each = var.backend_private_ips
      content {
        ip_address = backend_addresses.value
      }
    }
  }

  backend_http_settings {
    name     = "http-settings"
    port     = 80
    protocol = "Http"
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = "public"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule"
    rule_type                  = "Basic"
    priority                   = 100
    http_listener_name         = "listener"
    backend_address_pool_name  = "backend-pool"
    backend_http_settings_name = "http-settings"
  }
}
