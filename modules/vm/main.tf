resource "azurerm_linux_virtual_machine" "this" {

  name = var.vm_name

  resource_group_name = var.resource_group_name

  location = var.location

  size = var.vm_size


  admin_username = var.admin_username

  admin_password = var.admin_password

  disable_password_authentication = false


  network_interface_ids = [

    var.nic_id

  ]


  os_disk {

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }


  source_image_reference {

    publisher = "Canonical"

    offer = "0001-com-ubuntu-server-jammy"

    sku = "22_04-lts"

    version = "latest"

  }

}



resource "azurerm_managed_disk" "data_disk" {

  name = var.data_disk_name

  location = var.location

  resource_group_name = var.resource_group_name

  storage_account_type = "Standard_LRS"

  create_option = "Empty"

  disk_size_gb = var.data_disk_size

}



resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {

  managed_disk_id = azurerm_managed_disk.data_disk.id

  virtual_machine_id = azurerm_linux_virtual_machine.this.id

  lun = 0

  caching = "ReadWrite"

}