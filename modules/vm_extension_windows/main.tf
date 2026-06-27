resource "azurerm_virtual_machine_extension" "this" {

  name = var.extension_name

  virtual_machine_id = var.vm_id

  publisher = "Microsoft.Compute"

  type = "CustomScriptExtension"

  type_handler_version = "1.10"

  settings = jsonencode({

    fileUris = var.script_urls

  })

  protected_settings = jsonencode({

    commandToExecute = var.command

    storageAccountName = var.storage_account_name

    storageAccountKey = var.storage_account_key

  })

}
