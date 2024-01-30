output "subnet_address" {
    value = var.vnet_exists ? data.azurerm_subnet.existing_aks_subnet[0].address_prefixes[0] : azurerm_subnet.aks_subnet[0].address_prefixes[0]
}

output "subnet_id" {
    value = var.vnet_exists ? data.azurerm_subnet.existing_aks_subnet[0].id : azurerm_subnet.aks_subnet[0].id
}