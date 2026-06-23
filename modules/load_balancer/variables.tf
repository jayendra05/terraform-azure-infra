variable "lb_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "lb_rules" {
  type = list(object({
    name = string
    port = number
  }))
}
