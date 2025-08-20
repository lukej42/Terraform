output "nat_rule_id" {
  value = azurerm_lb_nat_rule.natrule1.id
}
output "network_interface_id" {
  value = azurerm_network_interface.network.id
}
output "subnet_id" {
  value = azurerm_subnet.network.id
}
output "nic_name" {
  value = var.networkinterface_name
}
