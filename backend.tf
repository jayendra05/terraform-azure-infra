terraform {

  backend "azurerm" {

    resource_group_name  = "rg-jay-01"
    storage_account_name = "storageaccountjay01"
    container_name       = "terraform-state-file"
    key                  = "dev.terraform.tfstate"

  }

}