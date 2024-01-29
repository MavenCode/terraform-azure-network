output "existing_subnet" {
   value = data.azurerm_subnet.existing_aks_subnet
}

output "existing_subnet_id" {
    value = var.vnet_exists ? data.azurerm_subnet.existing_aks_subnet[0].id : null
}

output "new_subnet_id" {
    value = var.vnet_exists ? null : azurerm_subnet.aks_subnet[0].id
}