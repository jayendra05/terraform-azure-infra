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

module "rg_prod_ci_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_prod_ci_001_name
  location            = var.rg_prod_ci_001_location
}

module "rg_stg_we_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_stg_we_001_name
  location            = var.rg_stg_we_001_location
}

module "rg_stg_ci_001" {
  source = "./modules/rg"

  resource_group_name = var.rg_stg_ci_001_name
  location            = var.rg_stg_ci_001_location
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

module "vnet_stg_we_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_stg_we_001_name
  resource_group_name = module.rg_stg_we_001.resource_group_name
  location            = module.rg_stg_we_001.location
  address_space       = var.vnet_stg_we_001_address_space
}

module "vnet_stg_ci_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_stg_ci_001_name
  resource_group_name = module.rg_stg_ci_001.resource_group_name
  location            = module.rg_stg_ci_001.location
  address_space       = var.vnet_stg_ci_001_address_space
}

module "vnet_prod_ci_001" {

  source = "./modules/vnet"

  vnet_name           = var.vnet_prod_ci_001_name
  resource_group_name = module.rg_prod_ci_001.resource_group_name
  location            = module.rg_prod_ci_001.location
  address_space       = var.vnet_prod_ci_001_address_space
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

module "subnet_stg_ci_001" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_stg_ci_001_name
  resource_group_name  = module.rg_stg_ci_001.resource_group_name
  virtual_network_name = module.vnet_stg_ci_001.vnet_name
  address_prefixes     = var.subnet_stg_ci_001_prefix
}

module "subnet_prod_ci_001" {

  source = "./modules/subnet"

  subnet_name          = var.subnet_prod_ci_001_name
  resource_group_name  = module.rg_prod_ci_001.resource_group_name
  virtual_network_name = module.vnet_prod_ci_001.vnet_name
  address_prefixes     = var.subnet_prod_ci_001_prefix
}


#############################################
# NSG
#############################################

module "nsg_dev_ci_001" {

  source = "./modules/nsg"

  nsg_name            = var.nsg_dev_ci_001_name
  resource_group_name = module.rg_dev_ci_001.resource_group_name
  location            = module.rg_dev_ci_001.location
}


#############################################
# EXTRA NSG RULE ONLY FOR DEV
#############################################

resource "azurerm_network_security_rule" "allow_8080_dev_ci_001" {

  name = "Allow-8080"

  priority = 130

  direction = "Inbound"

  access = "Allow"

  protocol = "Tcp"

  source_port_range = "*"

  destination_port_range = "8080"

  source_address_prefix = "*"

  destination_address_prefix = "*"

  resource_group_name = module.rg_dev_ci_001.resource_group_name

  network_security_group_name = module.nsg_dev_ci_001.nsg_name
}

#############################################
# NSG ASSOCIATION
#############################################

module "nsg_assoc_dev_ci_001" {

  source = "./modules/nsg_association"

  subnet_id = module.subnet_dev_ci_001.subnet_id

  nsg_id = module.nsg_dev_ci_001.nsg_id
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



module "dev_to_prod_ci_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-dev-to-prod-ci"
  resource_group_name       = module.rg_dev_ci_001.resource_group_name
  virtual_network_name      = module.vnet_dev_ci_001.vnet_name
  remote_virtual_network_id = module.vnet_prod_ci_001.vnet_id
}

module "prod_to_dev_ci_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-prod-to-dev-ci"
  resource_group_name       = module.rg_prod_ci_001.resource_group_name
  virtual_network_name      = module.vnet_prod_ci_001.vnet_name
  remote_virtual_network_id = module.vnet_dev_ci_001.vnet_id
}

module "stg_ci_to_stg_we_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-stg-ci-to-stg-we"
  resource_group_name       = module.rg_stg_ci_001.resource_group_name
  virtual_network_name      = module.vnet_stg_ci_001.vnet_name
  remote_virtual_network_id = module.vnet_stg_we_001.vnet_id
}

module "stg_we_to_stg_ci_peering" {

  source = "./modules/vnet_peering"

  peering_name              = "peer-stg-we-to-stg-ci"
  resource_group_name       = module.rg_stg_we_001.resource_group_name
  virtual_network_name      = module.vnet_stg_we_001.vnet_name
  remote_virtual_network_id = module.vnet_stg_ci_001.vnet_id
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

  nic_name            = var.nic_dev_ci_001_name
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

  vm_size = var.vm_size
  nic_id  = module.nic_dev_ci_001.nic_id

  admin_username = var.admin_username
  admin_password = var.admin_password
}