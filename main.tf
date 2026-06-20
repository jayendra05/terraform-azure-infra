module "rg_dev" {
  source              = "./modules/rg"
  resource_group_name = var.rg_dev_name
  location            = var.rg_dev_location
}

module "rg_prod" {
  source              = "./modules/rg"
  resource_group_name = var.rg_prod_name
  location            = var.rg_prod_location
}

module "rg_staging" {
  source              = "./modules/rg"
  resource_group_name = var.rg_staging_name
  location            = var.rg_staging_location
}


module "vnet_dev_001" {

  source              = "./modules/vnet"
  vnet_name           = var.vnet_dev_001
  location            = var.rg_dev_location
  resource_group_name = var.rg_dev_name
  address_space       = var.address_dev_001_space

}