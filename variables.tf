############################
# Resource Groups
############################

variable "rg_dev_name" {
  type = string
}

variable "rg_dev_location" {
  type = string
}

variable "rg_prod_name" {
  type = string
}

variable "rg_prod_location" {
  type = string
}

variable "rg_staging_name" {
  type = string
}

variable "rg_staging_location" {
  type = string
}

variable "rg_test_us_01_name" {
  type = string
}

variable "rg_test_us_01_location" {
  type = string
}


############################
# VNets
############################

variable "vnet_dev_001_name" {
  type = string
}

variable "address_dev_001_space" {
  type = list(string)
}

variable "vnet_test_us_01_name" {
  type = string
}

variable "address_test_us_01_space" {
  type = list(string)
}


############################
# Subnets
############################

variable "subnet_dev_name" {
  type = string
}

variable "subnet_dev_prefix" {
  type = list(string)
}

variable "subnet_test_name" {
  type = string
}

variable "subnet_test_prefix" {
  type = list(string)
}


############################
# Public IP
############################

variable "public_ip_dev_name" {
  type = string
}


############################
# NIC
############################

variable "nic_dev_name" {
  type = string
}


############################
# Virtual Machine
############################

variable "vm_dev_name" {
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