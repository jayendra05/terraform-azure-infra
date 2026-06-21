#########################################
# Resource Groups
#########################################

module "rg_dev_ci_001" {

  source = "./modules/rg"
  resource_group_name = var.rg_dev_ci_001_name
  location = var.rg_dev_ci_001_location

}


module "rg_test_we_001" {

  source = "./modules/rg"
  resource_group_name = var.rg_test_we_001_name
  location = var.rg_test_we_001_location

}


module "rg_prod_we_001" {

  source = "./modules/rg"
  resource_group_name = var.rg_prod_we_001_name
  location = var.rg_prod_we_001_location

}


#########################################
# VNets
#########################################

module "vnet_dev_ci_001" {

  source = "./modules/vnet"
  vnet_name = var.vnet_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location = module.rg_dev_ci_001.location
  address_space = var.vnet_dev_ci_001_address_space

  depends_on = [
    module.rg_dev_ci_001
  ]

}


module "vnet_test_we_001" {

  source = "./modules/vnet"
  vnet_name = var.vnet_test_we_001_name
  resource_group_name = module.rg_test_we_001.resource_group_name
  location = module.rg_test_we_001.location
  address_space = var.vnet_test_we_001_address_space

  depends_on = [
    module.rg_test_we_001
  ]

}


module "vnet_prod_we_001" {

  source = "./modules/vnet"
  vnet_name = var.vnet_prod_we_001_name
  resource_group_name = module.rg_prod_we_001.resource_group_name
  location = module.rg_prod_we_001.location
  address_space = var.vnet_prod_we_001_address_space

  depends_on = [
    module.rg_prod_we_001
  ]

}


#########################################
# Subnets
#########################################

module "subnet_dev_ci_001" {

  source = "./modules/subnet"
  subnet_name = var.subnet_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  virtual_network_name = var.vnet_dev_ci_001_name
  address_prefixes = var.subnet_dev_ci_001_prefix

  depends_on = [
    module.vnet_dev_ci_001
  ]

}


module "subnet_test_we_001" {

  source = "./modules/subnet"
  subnet_name = var.subnet_test_we_001_name
  resource_group_name = module.rg_test_we_001.resource_group_name
  virtual_network_name = var.vnet_test_we_001_name
  address_prefixes = var.subnet_test_we_001_prefix

  depends_on = [
    module.vnet_test_we_001
  ]

}


module "subnet_prod_we_001" {

  source = "./modules/subnet"
  subnet_name = var.subnet_prod_we_001_name
  resource_group_name = module.rg_prod_we_001.resource_group_name
  virtual_network_name = var.vnet_prod_we_001_name
  address_prefixes = var.subnet_prod_we_001_prefix

  depends_on = [
    module.vnet_prod_we_001
  ]

}


#########################################
# VNET PEERING
#########################################

module "peer_dev_to_test" {

  source = "./modules/vnet_peering"
  peering_name = "peer-dev-ci-001-to-test-we-001"
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  virtual_network_name = var.vnet_dev_ci_001_name
  remote_virtual_network_id = module.vnet_test_we_001.vnet_id

  depends_on = [

    module.vnet_dev_ci_001,
    module.vnet_test_we_001

  ]

}


module "peer_test_to_dev" {

  source = "./modules/vnet_peering"
  peering_name = "peer-test-we-001-to-dev-ci-001"
  resource_group_name = module.rg_test_we_001.resource_group_name
  virtual_network_name = var.vnet_test_we_001_name
  remote_virtual_network_id = module.vnet_dev_ci_001.vnet_id

  depends_on = [

    module.vnet_dev_ci_001,
    module.vnet_test_we_001

  ]

}


#########################################
# DEV <-> PROD PEERING
#########################################

module "peer_dev_to_prod" {

  source = "./modules/vnet_peering"
  peering_name = "peer-dev-ci-001-to-prod-we-001"
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  virtual_network_name = var.vnet_dev_ci_001_name
  remote_virtual_network_id = module.vnet_prod_we_001.vnet_id

  depends_on = [

    module.vnet_dev_ci_001,
    module.vnet_prod_we_001
  ]
  

}


module "peer_prod_to_dev" {

  source = "./modules/vnet_peering"
  peering_name = "peer-prod-we-001-to-dev-ci-001"
  resource_group_name = module.rg_prod_we_001.resource_group_name
  virtual_network_name = var.vnet_prod_we_001_name
  remote_virtual_network_id = module.vnet_dev_ci_001.vnet_id

  depends_on = [

    module.vnet_dev_ci_001,
    module.vnet_prod_we_001

  ]

}