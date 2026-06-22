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

  for_each = {

    for disk in var.data_disks :

    disk.name => disk

  }


  name = each.value.name

  location = var.location

  resource_group_name = var.resource_group_name

  storage_account_type = "Standard_LRS"

  create_option = "Empty"

  disk_size_gb = each.value.size

}



resource "azurerm_virtual_machine_data_disk_attachment" "attach" {

  for_each = azurerm_managed_disk.data_disk


  managed_disk_id = each.value.id

  virtual_machine_id = azurerm_linux_virtual_machine.this.id


  lun = index(

    keys(azurerm_managed_disk.data_disk),

    each.key

  )


  caching = "ReadWrite"

}