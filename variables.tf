variable "resource_group_name" {}

variable "resource_group_location" {}

variable "vnet_name" {}

variable "subnet_name" {}

variable "vnet_address_range" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "subnet_address_range" {
  description = "The address prefixes for the subnet"
  type        = list(string)
}

variable "vnet_exists" {}