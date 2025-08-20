output "network_interface_id" {
  value = azurerm_network_interface.network.id
}
#output "network_interface_id2" {
#  value = azurerm_network_interface.network2.id
#}
output "nic_name" {
  value = var.networkinterface_name
}