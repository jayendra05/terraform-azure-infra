#############################################
# RESOURCE GROUP VARIABLES
#############################################

variable "rg_dev_ci_001_name" {
  type = string
}

variable "rg_dev_ci_001_location" {
  type = string
}

variable "rg_test_us_001_name" {
  type = string
}

variable "rg_test_us_001_location" {
  type = string
}

variable "rg_prod_we_001_name" {
  type = string
}

variable "rg_prod_we_001_location" {
  type = string
}

variable "rg_prod_ci_001_name" {
  type = string
}

variable "rg_prod_ci_001_location" {
  type = string
}


variable "rg_stg_we_001_name" {
  type = string
}

variable "rg_stg_we_001_location" {
  type = string
}

variable "rg_stg_ci_001_name" {
  type = string
}

variable "rg_stg_ci_001_location" {
  type = string
}

#############################################
# VNET VARIABLES
#############################################

variable "vnet_dev_ci_001_name" {
  type = string
}

variable "vnet_dev_ci_001_address_space" {
  type = list(string)
}

variable "vnet_test_us_001_name" {
  type = string
}

variable "vnet_test_us_001_address_space" {
  type = list(string)
}

variable "vnet_stg_we_001_name" {
  type = string
}

variable "vnet_stg_we_001_address_space" {
  type = list(string)
}

variable "vnet_stg_ci_001_name" {
  type = string
}

variable "vnet_stg_ci_001_address_space" {
  type = list(string)
}

variable "vnet_prod_ci_001_name" {
  type = string
}

variable "vnet_prod_ci_001_address_space" {
  type = list(string)
}


#############################################
# SUBNET VARIABLES
#############################################

variable "subnet_dev_ci_001_name" {
  type = string
}

variable "subnet_dev_ci_001_prefix" {
  type = list(string)
}

variable "subnet_test_us_001_name" {
  type = string
}

variable "subnet_test_us_001_prefix" {
  type = list(string)
}

variable "subnet_prod_ci_001_name" {
  type = string
}

variable "subnet_prod_ci_001_prefix" {
  type = list(string)
}

variable "subnet_stg_ci_001_name" {
  type = string
}

variable "subnet_stg_ci_001_prefix" {
  type = list(string)
}

#############################################
# NSG VARIABLES
#############################################

variable "nsg_dev_ci_001_name" {
  type = string
}


#############################################
# LOAD BALANCER VARIABLES
#############################################

variable "lb_dev_ci_001_name" {
  type = string
}


#############################################
# NIC VARIABLES
#############################################

variable "nic_dev_ci_001_name" {
  type = string
}

variable "nic_dev_ci_002_name" {
  type = string
}


#############################################
# VM VARIABLES
#############################################

variable "vm_dev_ci_001_name" {
  type = string
}

variable "vm_dev_ci_002_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

#############################################
# DATA DISK
#############################################

variable "data_disks" {

  type = list(object({

    name = string

    size = number

  }))

  default = []

}

variable "data_disks_dev_ci_002" {

  type = list(object({

    name = string

    size = number

  }))

  default = []

}

#############################################
# Storage ACCOUNT
#############################################

variable "storage_dev_ci_001_name" {

  type = string

}
