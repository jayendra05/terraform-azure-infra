variable "extension_name" {

  description = "Linux Custom Script Extension Name"

  type = string

}

variable "vm_id" {

  description = "Virtual Machine ID"

  type = string

}

variable "script_urls" {

  description = "Linux script URLs"

  type = list(string)

}

variable "command" {

  description = "Command to execute"

  type = string

}

variable "storage_account_name" {

  description = "Storage Account Name"

  type = string

}

variable "storage_account_key" {

  description = "Storage Account Key"

  type      = string
  sensitive = true

}