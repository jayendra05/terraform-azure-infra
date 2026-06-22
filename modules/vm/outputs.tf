output "vm_id" {

  value = azurerm_linux_virtual_machine.this.id

}


output "vm_name" {

  value = azurerm_linux_virtual_machine.this.name

}


output "vm_private_ip" {

  value = azurerm_linux_virtual_machine.this.private_ip_address

}


output "vm_public_ip" {

  value = azurerm_linux_virtual_machine.this.public_ip_address

}


output "data_disk_id" {

  value = azurerm_managed_disk.data_disk.id

}


output "data_disk_name" {

  value = azurerm_managed_disk.data_disk.name

}