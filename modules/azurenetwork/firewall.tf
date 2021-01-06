# Sets up inbound security rules for the cluster

resource "azurerm_network_security_group" "network-security-group" {
  location            = var.location
  name                = "${lower(var.project)}${lower(var.stage)}netsg"
  resource_group_name = var.resource_group
}

# allow traffic from internet to ingress
resource "azurerm_network_security_rule" "network-security-rule-inbound-shop" {
  access                      = "Allow"
  direction                   = "Inbound"
  name                        = "allow-inbound"
  network_security_group_name = azurerm_network_security_group.network-security-group.name
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = var.resource_group
  source_address_prefix       = "Internet"
  destination_address_prefix  = var.public_ip
  source_port_range           = "*"
  destination_port_ranges     = [80, 443]
}

resource "azurerm_subnet_network_security_group_association" "network-security-group-association" {
  network_security_group_id = azurerm_network_security_group.network-security-group.id
  subnet_id                 = azurerm_subnet.default-subnet.id
}