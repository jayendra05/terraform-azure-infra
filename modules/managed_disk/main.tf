resource "azurerm_managed_disk" "this" {

  for_each = {

    for disk in var.data_disks :

    disk.name => disk

  }

  name = each.value.name

  location = var.location

  resource_group_name = var.resource_group_name

  storage_account_type = each.value.storage_account_type

  create_option = "Empty"

  disk_size_gb = each.value.size

}