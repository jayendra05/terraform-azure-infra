variable "rg_dev_ci_001_name" { type = string }
variable "rg_dev_ci_001_location" { type = string }

variable "rg_test_us_001_name" { type = string }
variable "rg_test_us_001_location" { type = string }

variable "rg_prod_we_001_name" { type = string }
variable "rg_prod_we_001_location" { type = string }

variable "rg_stg_we_001_name" { type = string }
variable "rg_stg_we_001_location" { type = string }

variable "vnet_dev_ci_001_name" { type = string }
variable "vnet_dev_ci_001_address_space" {
  type = list(string)
}

variable "vnet_test_us_001_name" { type = string }
variable "vnet_test_us_001_address_space" {
  type = list(string)
}

variable "subnet_dev_ci_001_name" { type = string }
variable "subnet_dev_ci_001_prefix" {
  type = list(string)
}

variable "subnet_test_us_001_name" { type = string }
variable "subnet_test_us_001_prefix" {
  type = list(string)
}

variable "pip_dev_ci_001_name" { type = string }

variable "nic_dev_ci_001_name" { type = string }

variable "vm_dev_ci_001_name" { type = string }

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