resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm-name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm-size
  admin_username      = "luke"
  admin_password      = "Minoandruby42!!!"
  network_interface_ids = [var.network_interface_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
