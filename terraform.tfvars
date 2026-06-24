#############################################
# RESOURCE GROUP VALUES
#############################################

rg_dev_ci_001_name     = "rg-dev-ci-001"
rg_dev_ci_001_location = "Central India"

rg_test_us_001_name     = "rg-test-us-001"
rg_test_us_001_location = "East US"

rg_prod_we_001_name     = "rg-prod-we-001"
rg_prod_we_001_location = "West Europe"

rg_prod_ci_001_name     = "rg-prod-ci-001"
rg_prod_ci_001_location = "Central India"

rg_stg_we_001_name     = "rg-stg-we-001"
rg_stg_we_001_location = "West Europe"

rg_stg_ci_001_name     = "rg-stg-ci-001"
rg_stg_ci_001_location = "Central India"


#############################################
# VNET VALUES
#############################################

vnet_dev_ci_001_name = "vnet-dev-ci-001"

vnet_dev_ci_001_address_space = [
  "10.0.0.0/16"
]


vnet_test_us_001_name = "vnet-test-us-001"

vnet_test_us_001_address_space = [
  "192.168.0.0/16"
]


vnet_stg_we_001_name = "vnet-stg-we-001"

vnet_stg_we_001_address_space = [
  "192.164.0.0/24"
]

vnet_stg_ci_001_name = "vnet-stg-ci-001"

vnet_stg_ci_001_address_space = [
  "192.164.1.0/24"
]

vnet_prod_ci_001_name = "vnet-prod-ci-001"

vnet_prod_ci_001_address_space = [
  "192.62.1.0/24"
]


#############################################
# SUBNET VALUES
#############################################

subnet_dev_ci_001_name = "subnet-dev-ci-001"

subnet_dev_ci_001_prefix = [
  "10.0.1.0/24"
]


subnet_test_us_001_name = "subnet-test-us-001"

subnet_test_us_001_prefix = [
  "192.168.1.0/24"
]

subnet_prod_ci_001_name = "subnet-prod-ci-001"

subnet_prod_ci_001_prefix = [
  "192.62.1.0/27"
]

subnet_stg_we_001_name = "subnet-stg-we-001"

subnet_stg_we_001_prefix = [
  "192.164.0.0/27"
]

subnet_stg_ci_001_name = "subnet-stg-ci-001"

subnet_stg_ci_001_prefix = [
  "192.164.1.0/27"
]


#############################################
# NSG VALUES
#############################################

nsg_dev_ci_001_name = "nsg-dev-ci-001"


#############################################
# LOAD BALANCER VALUES
#############################################

lb_dev_ci_001_name = "lb-dev-ci-001"


#############################################
# NIC VALUES
#############################################

nic_dev_ci_001_name = "nic-dev-ci-001"

nic_dev_ci_002_name = "nic-dev-ci-002"


#############################################
# VM VALUES
#############################################

vm_dev_ci_001_name = "vm-dev-ci-001"

vm_dev_ci_002_name = "vm-dev-ci-002"

vm_size = "Standard_B2ats_v2"

admin_username = "azureuser"

admin_password = "Password@123456"


#############################################
# DATA DISK
#############################################


data_disks = [

  {
    name = "disk-dev-001-data-disk-1"
    size = 8
  },


]

data_disks_dev_ci_002 = [

  {
    name = "disk-dev-002-data-disk-1"
    size = 4
  },

  {
    name = "disk-dev-002-data-disk-2"
    size = 4
  },

]

#############################################
# STORAGE ACCOUNT
#############################################



storage_dev_ci_001_name = "stjaydevci001"
storage_dev_ci_002_name = "stjaydevci002"