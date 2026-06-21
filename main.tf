#########################################
# Resource Groups
#########################################

module "rg_dev" {
  source = "./modules/rg"

  resource_group_name = var.rg_dev_name
  location            = var.rg_dev_location
}

module "rg_prod" {
  source = "./modules/rg"

  resource_group_name = var.rg_prod_name
  location            = var.rg_prod_location
}

module "rg_staging" {
  source = "./modules/rg"

  resource_group_name = var.rg_staging_name
  location            = var.rg_staging_location
}

module "rg_test_us_01" {
  source = "./modules/rg"

  resource_group_name = var.rg_test_us_01_name
  location            = var.rg_test_us_01_location
}


#########################################
# VNETS
#########################################

module "vnet_dev_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_dev_001_name
  resource_group_name = module.rg_dev.resource_group_name
  location            = module.rg_dev.location
  address_space       = var.address_dev_001_space

  depends_on = [
    module.rg_dev
  ]
}


module "vnet_test_us_01" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_test_us_01_name
  resource_group_name = module.rg_test_us_01.resource_group_name
  location            = module.rg_test_us_01.location
  address_space       = var.address_test_us_01_space

  depends_on = [
    module.rg_test_us_01
  ]
}


#########################################
# SUBNETS
#########################################

module "subnet_dev" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_dev_name
  resource_group_name  = module.rg_dev.resource_group_name
  virtual_network_name = var.vnet_dev_001_name
  address_prefixes     = var.subnet_dev_prefix

  depends_on = [
    module.vnet_dev_001
  ]
}


module "subnet_test" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_test_name
  resource_group_name  = module.rg_test_us_01.resource_group_name
  virtual_network_name = var.vnet_test_us_01_name
  address_prefixes     = var.subnet_test_prefix

  depends_on = [
    module.vnet_test_us_01
  ]
}


#########################################
# VNET PEERING
#########################################

module "dev_to_test_peering" {

  source = "./modules/vnet_peering"

  peering_name = "dev-to-test"

  resource_group_name = module.rg_dev.resource_group_name

  virtual_network_name = var.vnet_dev_001_name

  remote_virtual_network_id = module.vnet_test_us_01.vnet_id

  depends_on = [

    module.vnet_dev_001,

    module.vnet_test_us_01

  ]

}


module "test_to_dev_peering" {

  source = "./modules/vnet_peering"

  peering_name = "test-to-dev"

  resource_group_name = module.rg_test_us_01.resource_group_name

  virtual_network_name = var.vnet_test_us_01_name

  remote_virtual_network_id = module.vnet_dev_001.vnet_id

  depends_on = [

    module.vnet_dev_001,

    module.vnet_test_us_01

  ]

}