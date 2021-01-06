resource "azurerm_virtual_network" "virtual-network" {
  address_space       = var.network_cidr
  dns_servers         = var.dns_servers
  location            = var.location
  name                = "${lower(var.project)}${lower(var.stage)}netvnetwork"
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "default-subnet" {
  address_prefix       = var.default_subnet_cidr
  name                 = "default"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.virtual-network.name
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.AzureActiveDirectory", "Microsoft.AzureCosmosDB", "Microsoft.ContainerRegistry", "Microsoft.EventHub", "Microsoft.KeyVault", "Microsoft.ServiceBus", "Microsoft.Web"]
}

resource "azurerm_subnet_network_security_group_association" "nsgassociation" {
  subnet_id                 = azurerm_subnet.default-subnet.id
  network_security_group_id = azurerm_network_security_group.network-security-group.id
}

#resource "azurerm_virtual_network_peering" "virtual-network-peering-${each.value["name"]}" {
#  for_each = toset(var.peerings)
#  name = "${azurerm_virtual_network.virtual-network.name}-to-${each.value["name"]}"
#  remote_virtual_network_id = each.value["resource_id"]
#  resource_group_name = var.resource_group
#  virtual_network_name = azurerm_virtual_network.virtual-network.name
#  allow_virtual_network_access = each.value["use_remote_gateways"]
#}
