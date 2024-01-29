data "azurerm_virtual_network" "existing_aks_vnet" {
  count                 = var.vnet_exists ? 1 : 0
  name                  = var.vnet_name
  resource_group_name   = var.resource_group_name
}

data "azurerm_subnet" "existing_aks_subnet" {
  count                 = var.vnet_exists ? 1 : 0
  name                  = var.subnet_name
  virtual_network_name  = var.vnet_name
  resource_group_name   = var.resource_group_name
}

locals {
  vnet_exists = length(data.azurerm_virtual_network.existing_aks_vnet) > 0
}

resource "azurerm_virtual_network" "aks_vnet" {
  count               = local.vnet_exists ? 0 : 1
  name                = var.vnet_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_range
}

resource "azurerm_subnet" "aks_subnet" {
  count                = local.vnet_exists ? 0 : 1
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
  address_prefixes     = var.subnet_address_range

  depends_on = [
    azurerm_virtual_network.aks_vnet
  ]
}