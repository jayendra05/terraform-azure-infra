#############################################
# VM ID
#############################################

output "vm_id" {

  value = azurerm_linux_virtual_machine.this.id

}


#############################################
# VM Name
#############################################

output "vm_name" {

  value = azurerm_linux_virtual_machine.this.name

}


#############################################
# VM Size
#############################################

output "vm_size" {

  value = azurerm_linux_virtual_machine.this.size

}


#############################################
# VM Location
#############################################

output "vm_location" {

  value = azurerm_linux_virtual_machine.this.location

}


#############################################
# Network Interface ID
#############################################

output "network_interface_ids" {

  value = azurerm_linux_virtual_machine.this.network_interface_ids

}


#############################################
# Computer Name
#############################################

output "computer_name" {

  value = azurerm_linux_virtual_machine.this.computer_name

}


#############################################
# Admin Username
#############################################

output "admin_username" {

  value = azurerm_linux_virtual_machine.this.admin_username

}


#############################################
# OS Disk ID
#############################################

output "os_disk_id" {

  value = azurerm_linux_virtual_machine.this.os_disk_id

}
