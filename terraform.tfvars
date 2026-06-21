############################
# Resource Groups
############################

rg_dev_name     = "rg-dev-001"
rg_dev_location = "Central India"

rg_prod_name     = "rg-prod-001"
rg_prod_location = "West Europe"

rg_staging_name     = "rg-stg-001"
rg_staging_location = "West Europe"

rg_test_us_01_name     = "rg-test-us-01"
rg_test_us_01_location = "East US"


############################
# VNets
############################

vnet_dev_001_name = "vnet-dev-001"

address_dev_001_space = [
  "10.0.0.0/16"
]

vnet_test_us_01_name = "vnet-test-us-01"

address_test_us_01_space = [
  "192.168.0.0/16"
]


############################
# Subnets
############################

subnet_dev_name = "subnet-dev"

subnet_dev_prefix = [
  "10.0.1.0/24"
]

subnet_test_name = "subnet-test"

subnet_test_prefix = [
  "192.168.1.0/24"
]


############################
# Public IP
############################

public_ip_dev_name = "pip-dev-001"


############################
# NIC
############################

nic_dev_name = "nic-dev-001"


############################
# Virtual Machine
############################

vm_dev_name = "vm-dev-001"

vm_size = "Standard_B1s"

admin_username = "azureuser"

admin_password = "Password@123456"