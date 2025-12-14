output "subnet_id" {
  value = azurerm_subnet.network.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgateway.id
}

output "public_ip_id" {
  value = azurerm_public_ip.vm_pip.id
}
