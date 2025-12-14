output "vm_private_ip" {
  value = azurerm_network_interface.vm_nic.ip_configuration[0].private_ip_address
}
