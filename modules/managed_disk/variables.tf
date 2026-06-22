variable "location" {

  type = string

}

variable "resource_group_name" {

  type = string

}

variable "data_disks" {

  type = list(object({

    name                 = string
    size                 = number
    lun                  = number
    storage_account_type = string

  }))

}