
output "subnet_id" {
  value = azurerm_subnet.network.id
}
output "public_ip_id" {
  value = azurerm_public_ip.vm_pip.id
}
output "public_ip_address" {
  value = azurerm_public_ip.vm_pip.ip_address
}
output "appgateway_subnet_id" {
  value = azurerm_subnet.appgateway.id
}
