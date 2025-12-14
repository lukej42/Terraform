resource "azurerm_network_interface" "vm_nic" {
  count               = length(var.vmnames)
  name                = var.vmnames[count.index] != "" ? var.vmnames[count.index] : "${var.name_prefix}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  count                 = length(var.vmnames)
  name                  = var.vmnames[count.index]
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vmsize
  admin_username        = var.vmusername
  admin_password        = var.vmpassword
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]

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
