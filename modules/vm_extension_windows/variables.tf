variable "extension_name" {

  type = string

}

variable "vm_id" {

  type = string

}

variable "script_urls" {

  type = list(string)

}

variable "command" {

  type = string

}

variable "storage_account_name" {

  type = string

}

variable "storage_account_key" {

  type = string

  sensitive = true

}
