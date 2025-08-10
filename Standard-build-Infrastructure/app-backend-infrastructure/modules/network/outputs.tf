output "network_interface_id" {
  value = azurerm_network_interface.network.id
}
output "subnet_id" {
  value = azurerm_subnet.network.id
}
