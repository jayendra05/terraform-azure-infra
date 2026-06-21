#############################################
# RESOURCE GROUPS
#############################################

module "rg_dev_ci_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_dev_ci_001_name
  location            = var.rg_dev_ci_001_location
}

module "rg_test_us_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_test_us_001_name
  location            = var.rg_test_us_001_location
}

module "rg_prod_we_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_prod_we_001_name
  location            = var.rg_prod_we_001_location
}

module "rg_stg_we_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_stg_we_001_name
  location            = var.rg_stg_we_001_location
}

#############################################
# VNET
#############################################

module "vnet_dev_ci_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location            = module.rg_dev_ci_001.location
  address_space       = var.vnet_dev_ci_001_address_space
}

module "vnet_test_us_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_test_us_001_name
  resource_group_name = module.rg_test_us_001.resource_group_name
  location            = module.rg_test_us_001.location
  address_space       = var.vnet_test_us_001_address_space
}

#############################################
# SUBNET
#############################################

module "subnet_dev_ci_001" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_dev_ci_001_name
  resource_group_name  = module.rg_dev_ci_001.resource_group_name
  virtual_network_name = module.vnet_dev_ci_001.vnet_name
  address_prefixes     = var.subnet_dev_ci_001_prefix
}

module "subnet_test_us_001" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_test_us_001_name
  resource_group_name  = module.rg_test_us_001.resource_group_name
  virtual_network_name = module.vnet_test_us_001.vnet_name
  address_prefixes     = var.subnet_test_us_001_prefix
}

#############################################
# VNET PEERING
#############################################

module "dev_to_test_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-dev-to-test"
  resource_group_name       = module.rg_dev_ci_001.resource_group_name
  virtual_network_name      = module.vnet_dev_ci_001.vnet_name
  remote_virtual_network_id = module.vnet_test_us_001.vnet_id
}

module "test_to_dev_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-test-to-dev"
  resource_group_name       = module.rg_test_us_001.resource_group_name
  virtual_network_name      = module.vnet_test_us_001.vnet_name
  remote_virtual_network_id = module.vnet_dev_ci_001.vnet_id
}

#############################################
# PUBLIC IP
#############################################

module "pip_dev_ci_001" {

  source = "./modules/public_ip"

  public_ip_name      = var.pip_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location            = module.rg_dev_ci_001.location
}

#############################################
# NIC
#############################################

module "nic_dev_ci_001" {

  source = "./modules/nic"

  nic_name           = var.nic_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location            = module.rg_dev_ci_001.location
  subnet_id           = module.subnet_dev_ci_001.subnet_id
  public_ip_id        = module.pip_dev_ci_001.public_ip_id
}

#############################################
# VM
#############################################

module "vm_dev_ci_001" {

  source = "./modules/vm"

  vm_name             = var.vm_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location            = module.rg_dev_ci_001.location

  vm_size        = var.vm_size
  nic_id         = module.nic_dev_ci_001.nic_id

  admin_username = var.admin_username
  admin_password = var.admin_password
}