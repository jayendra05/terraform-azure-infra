resource "azurerm_virtual_machine_data_disk_attachment" "this" {

  for_each = var.managed_disks

  managed_disk_id = each.value.id

  virtual_machine_id = var.virtual_machine_id

  lun = each.value.lun

  caching = "ReadWrite"

}