output "vm_id" {

  value = azurerm_linux_virtual_machine.this.id

}

output "vm_name" {

  value = azurerm_linux_virtual_machine.this.name

}

output "vm_size" {

  value = azurerm_linux_virtual_machine.this.size

}

output "vm_location" {

  value = azurerm_linux_virtual_machine.this.location

}

output "computer_name" {

  value = azurerm_linux_virtual_machine.this.computer_name

}

output "admin_username" {

  value = azurerm_linux_virtual_machine.this.admin_username

}

output "network_interface_ids" {

  value = azurerm_linux_virtual_machine.this.network_interface_ids

}