output "resource_group" {
  value = azurerm_resource_group.azure-resource-group.name
}

output "location" {
  value = var.location
}

