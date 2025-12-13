output "network_interface_id" {
  value = azurerm_network_interface.network.id
}
output "subnet_id" {
  value = azurerm_subnet.network.id
}
output "nic_name" {
  value = var.networkinterface_name
}
output "public_ip_id" {
  value = azurerm_public_ip.vm_pip.id
}
output "public_ip_address" {
  value = azurerm_public_ip.vm_pip.ip_address
}