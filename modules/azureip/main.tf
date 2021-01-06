# Azure IP reservations

resource "azurerm_public_ip" "public-ip" {
  name                = "${lower(var.project)}${lower(var.stage)}ippublic${var.suffix}"
  allocation_method   = "Static"
  location            = var.location
  resource_group_name = var.resource_group
  sku = "Standard"
}

