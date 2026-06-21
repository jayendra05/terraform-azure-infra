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
  vnet_name           = var.vnet_dev_001_name
  resource_group_name = module.rg_dev.resource_group_name
  location            = module.rg_dev.location
  address_space       = var.address_dev_001_space
  
  depends_on = [module.rg_dev]
}

module "subnet_dev" {

  source = "./modules/subnet"
  subnet_name = var.subnet_dev_name
  resource_group_name = module.rg_dev.resource_group_name
  virtual_network_name = var.vnet_dev_001_name
  address_prefixes = var.subnet_dev_prefix

  depends_on = [module.vnet_dev_001]

}

module "rg_test_us_01" {
  source              = "./modules/rg"
  resource_group_name = var.rg_test_us_01_name
  location            = var.rg_test_us_01_location
}

module "vnet_test_us_01" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_test_us_01_name
  resource_group_name = module.rg_test_us_01.resource_group_name
  location            = module.rg_test_us_01.location
  address_space       = var.address_test_us_01_space

  depends_on = [module.rg_test_us_01]
}

module "subnet_test" {

  source = "./modules/subnet"
  subnet_name = var.subnet_test_name
  resource_group_name = module.vnet_test_us_01.resource_group_name
  virtual_network_name = var.vnet_test_us_01_name
  address_prefixes = var.subnet_test_prefix

  depends_on = [module.vnet_test_us_01]

}