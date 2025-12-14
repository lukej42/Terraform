output "vm_nic_ids" {
  value = [for nic in azurerm_network_interface.vm_nic : nic.id]
}

output "vm_private_ips" {
  value = azurerm_network_interface.vm_nic[*].private_ip_address
}
