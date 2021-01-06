# Add a resource group

resource "azurerm_resource_group" "azure-resource-group" {
  name     = "${lower(var.project)}${lower(var.stage)}resourcegroup${lower(var.suffix)}"
  location = var.location
}

