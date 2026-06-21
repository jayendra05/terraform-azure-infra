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


module "rg_test_01" {
  source              = "./modules/rg"
  resource_group_name = var.rg_test_01_name
  location            = var.rg_test_01_location
}


module "vnet_dev_001" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_dev_001_name
  resource_group_name = module.rg_dev.resource_group_name
  location            = module.rg_dev.location
  address_space       = var.address_dev_001_space
  depends_on = [
    module.rg_dev
  ]
}

module "vnet_test_001" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_test_01_name
  resource_group_name = module.rg_test_01.resource_group_name
  location            = module.rg_test_01.location
  address_space       = var.address_test_01_space
  depends_on = [
    module.rg_test_01
  ]
}